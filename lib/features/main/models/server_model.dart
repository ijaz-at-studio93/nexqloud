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
    this.status = 'Online',
  });

  final String serverName;
  final double uptime;
  final String region;
  final int cores;
  final int memory; // Memory in GB
  final String country;
  final double latitude;
  final double longitude;
  final String status;
}
