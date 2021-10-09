class Geo {
  final String lat;
  final String lng;

  Geo({
    this.lat = "",
    this.lng = "",
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json['lat'],
    lng: json['lng'],
  );

  Map<String, dynamic> toJson() => {
    'lat': this.lat,
    'lng': this.lng,
  };
}