class NurseModel {
  String? name;
  String? locations;
  String? about;
  List? days;
  dynamic image;
  double? rating;
  String? id;

  NurseModel({
    this.name,
    this.locations,
    this.about,
    this.days,
    this.image,
    this.rating,
    this.id,
  });

  factory NurseModel.fromJson(Map<String, dynamic> json) => NurseModel(
        name: json['Name'] as String?,
        locations: json['Locations'] as String?,
        about: json['About'] as String?,
        days: json['Days'] == null ? [] : json['Days'].toString().split(","),
        image: json['Image'] as dynamic,
        rating: json['Rating'] as double?,
        id: json['Id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Locations': locations,
        'About': about,
        'Days': days,
        'Image': image,
        'Rating': rating,
        'Id': id,
      };
}
