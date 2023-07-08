class NurseModel {
  String? name;
  String? locations;
  String? about;
  dynamic days;
  dynamic image;
  double? rating;
  List<dynamic>? reserveNurses;
  String? id;

  NurseModel({
    this.name,
    this.locations,
    this.about,
    this.days,
    this.image,
    this.rating,
    this.reserveNurses,
    this.id,
  });

  factory NurseModel.fromJson(Map<String, dynamic> json) => NurseModel(
        name: json['Name'] as String?,
        locations: json['Locations'] as String?,
        about: json['About'] as String?,
        days: json['Days'] as dynamic,
        image: json['Image'] as dynamic,
        rating: json['Rating'] as double?,
        reserveNurses: json['ReserveNurses'] as List<dynamic>?,
        id: json['Id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Locations': locations,
        'About': about,
        'Days': days,
        'Image': image,
        'Rating': rating,
        'ReserveNurses': reserveNurses,
        'Id': id,
      };
}
