// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CarModel {
  String name;
  String image;
  String description;
  String type;
  double ratings;
  double time;
  int topSpeed;
  String startPrice;
  CarModel({
    required this.name,
    required this.image,
    required this.description,
    required this.type,
    required this.ratings,
    required this.time,
    required this.topSpeed,
    required this.startPrice,
  });

  CarModel copyWith({
    String? name,
    String? image,
    String? description,
    String? type,
    double? ratings,
    double? time,
    int? topSpeed,
    String? startPrice,
  }) {
    return CarModel(
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      type: type ?? this.type,
      ratings: ratings ?? this.ratings,
      time: time ?? this.time,
      topSpeed: topSpeed ?? this.topSpeed,
      startPrice: startPrice ?? this.startPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'description': description,
      'type': type,
      'ratings': ratings,
      'time': time,
      'topSpeed': topSpeed,
      'startPrice': startPrice,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      type: map['type'] as String,
      ratings: map['ratings'] as double,
      time: map['time'] as double,
      topSpeed: map['topSpeed'] as int,
      startPrice: map['startPrice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CarModel(name: $name, image: $image, description: $description, type: $type, ratings: $ratings, time: $time, topSpeed: $topSpeed, startPrice: $startPrice)';
  }

  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.description == description &&
        other.type == type &&
        other.ratings == ratings &&
        other.time == time &&
        other.topSpeed == topSpeed &&
        other.startPrice == startPrice;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        description.hashCode ^
        type.hashCode ^
        ratings.hashCode ^
        time.hashCode ^
        topSpeed.hashCode ^
        startPrice.hashCode;
  }
}
