import 'dart:convert';

import 'package:http/http.dart' as http;

class StarterTask {
  const StarterTask({
    required this.id,
    required this.title,
    required this.status,
  });

  final String id;
  final String title;
  final String status;

  factory StarterTask.fromJson(Map<String, Object?> json) => switch (json) {
    {
      'id': final String id,
      'title': final String title,
      'status': final String status,
    } =>
      StarterTask(id: id, title: title, status: status),
    _ => throw const FormatException('Invalid task'),
  };
}

class RemoteOnlyRepository {
  RemoteOnlyRepository(this._client, this._baseUrl);

  final http.Client _client;
  final Uri _baseUrl;
  String? _token;

  Future<void> login(String email, String password) async {
    final response = await _client.post(
      _baseUrl.replace(path: '/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode != 200) {
      throw Exception('No se pudo entrar');
    }
    final body = jsonDecode(response.body) as Map<String, Object?>;
    _token = body['token'] as String;
  }

  Future<List<StarterTask>> loadTasks() async {
    final token = _token;
    if (token == null) {
      throw Exception('No hay sesión');
    }
    final response = await _client.get(
      _baseUrl.replace(path: '/tasks'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode != 200) {
      throw Exception('No se pudieron cargar datos');
    }
    final body = jsonDecode(response.body) as Map<String, Object?>;
    final items = body['items'] as List<Object?>;
    return items
        .map(
          (item) => StarterTask.fromJson(
            (item as Map<Object?, Object?>).cast<String, Object?>(),
          ),
        )
        .toList(growable: false);
  }
}

