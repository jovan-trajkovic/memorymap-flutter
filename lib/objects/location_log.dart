class LocationLog {
  final String logName;
  final String description;
  final DateTime addDate;
  final double rating;
  final double latitude;
  final double longitude;

  const LocationLog({
    required this.logName,
    required this.description,
    required this.addDate,
    required this.rating,
    this.latitude = 0,
    this.longitude = 0,
  });
}
