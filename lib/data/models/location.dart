class Location {
  final double lat;
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });
}

class UserLoc {
  final String name;
  final String email;
  final Location location;
  UserLoc({
    required this.name,
    required this.email,
    required this.location,
  });
}
