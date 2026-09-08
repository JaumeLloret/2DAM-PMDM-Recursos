class MobileProfile {
  const MobileProfile({
    required this.name,
    required this.minimumApi,
    required this.memoryGb,
    required this.meteredNetwork,
  });

  final String name;
  final int minimumApi;
  final int memoryGb;
  final bool meteredNetwork;
}


