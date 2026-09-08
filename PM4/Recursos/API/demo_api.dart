import 'dart:convert';
import 'dart:io';

const _demoToken = 'DEMO-TOKEN-PM4';
final _tasks = <Map<String, Object?>>[
  {
    'id': 'DEMO-1',
    'title': 'Revisar contraste',
    'status': 'doing',
    'note': 'Comprobar texto ampliado',
  },
  {
    'id': 'DEMO-2',
    'title': 'Preparar checkpoint',
    'status': 'todo',
    'note': null,
  },
  {
    'id': 'DEMO-3',
    'title': 'Cerrar evidencia',
    'status': 'done',
    'note': 'Sanea los logs',
  },
];

Future<void> main(List<String> args) async {
  final config = _ServerConfig.parse(args);
  final server = await HttpServer.bind(config.address, config.port);
  stdout.writeln(
    'PM4_DEMO_API_READY http://${config.address.address}:${server.port}',
  );
  ProcessSignal.sigint.watch().listen((_) async {
    await server.close(force: true);
    exit(0);
  });
  await for (final request in server) {
    await _handle(request);
  }
}

Future<void> _handle(HttpRequest request) async {
  request.response.headers.set('X-Demo-Request-Id', 'DEMO-REQ-PM4');
  final method = request.method;
  final segments = request.uri.pathSegments;

  if (method == 'GET' && request.uri.path == '/health') {
    return _json(request, 200, {
      'status': 'ok',
      'service': 'PM4-DEMO-API',
      'version': 1,
    });
  }

  if (method == 'POST' && request.uri.path == '/auth/login') {
    try {
      final body = await _bodyMap(request);
      if (body['email'] == 'demo@aulaflow.local' &&
          body['password'] == 'DEMO-pass') {
        return await _json(request, 200, {
          'token': _demoToken,
          'displayName': 'DEMO Student',
        });
      }
    } on FormatException {
      return _json(request, 400, {'error': 'invalid_json'});
    }
    return _json(request, 401, {'error': 'invalid_credentials'});
  }

  if (segments.isNotEmpty && segments.first == 'tasks') {
    if (!_authorized(request) ||
        request.uri.queryParameters['scenario'] == 'unauthorized') {
      return _json(request, 401, {'error': 'invalid_session'});
    }

    if (method == 'GET' && segments.length == 1) {
      final scenario = request.uri.queryParameters['scenario'];
      if (scenario == 'slow') {
        await Future<void>.delayed(const Duration(milliseconds: 1200));
      }
      if (scenario == 'server-error') {
        return _json(request, 500, {'error': 'controlled_failure'});
      }
      if (scenario == 'invalid-json') {
        request.response
          ..statusCode = 200
          ..headers.contentType = ContentType.json
          ..write('{not valid json');
        await request.response.close();
        return;
      }
      final items = scenario == 'empty' ? <Object?>[] : _tasks;
      return _json(request, 200, {'items': items});
    }

    if (segments.length >= 2) {
      final id = segments[1];
      final index = _tasks.indexWhere((task) => task['id'] == id);
      if (index < 0) {
        return _json(request, 404, {'error': 'task_not_found', 'id': id});
      }
      if (method == 'GET' && segments.length == 2) {
        return _json(request, 200, {'item': _tasks[index]});
      }
      if (method == 'PATCH' &&
          segments.length == 3 &&
          segments[2] == 'toggle') {
        final current = _tasks[index]['status'];
        _tasks[index]['status'] = current == 'done' ? 'todo' : 'done';
        return _json(request, 200, {'item': _tasks[index]});
      }
    }
  }

  return _json(request, 404, {'error': 'route_not_found'});
}

bool _authorized(HttpRequest request) =>
    request.headers.value(HttpHeaders.authorizationHeader) ==
    'Bearer $_demoToken';

Future<Map<String, Object?>> _bodyMap(HttpRequest request) async {
  final text = await utf8.decoder.bind(request).join();
  final decoded = jsonDecode(text);
  if (decoded is! Map<String, Object?>) {
    throw const FormatException('Expected a JSON object');
  }
  return decoded;
}

Future<void> _json(HttpRequest request, int status, Object body) async {
  request.response
    ..statusCode = status
    ..headers.contentType = ContentType.json
    ..write(jsonEncode(body));
  await request.response.close();
}

class _ServerConfig {
  const _ServerConfig(this.address, this.port);

  final InternetAddress address;
  final int port;

  static _ServerConfig parse(List<String> args) {
    var host = '127.0.0.1';
    var port = 8080;
    for (final arg in args) {
      if (arg.startsWith('--host=')) host = arg.substring(7);
      if (arg.startsWith('--port=')) {
        port = int.tryParse(arg.substring(7)) ?? -1;
      }
    }
    if (port < 1024 || port > 65535) {
      throw const FormatException('Use --port between 1024 and 65535');
    }
    return _ServerConfig(InternetAddress(host), port);
  }
}

