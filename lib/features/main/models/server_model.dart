class ServerModel {
  const ServerModel({
    required this.serverName,
    required this.uptime,
    required this.region,
    required this.cores,
    required this.memory,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.continent,
    this.status = 'Online',
    this.count = 0,
  });

  final String serverName;
  final double uptime;
  final String region;
  final String continent;
  final int cores;
  final int memory; // Memory in GB
  final String country;
  final double latitude;
  final double longitude;
  final String status;
  final int count;

  static ServerModel empty() => const ServerModel(
        serverName: '',
        uptime: 0,
        region: '',
        cores: 0,
        memory: 0,
        country: '',
        latitude: 0,
        longitude: 0,
        continent: '',
      );
}
