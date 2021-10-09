class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json['name'],
    catchPhrase: json['catchPhrase'],
    bs: json['bs'],
  );

}