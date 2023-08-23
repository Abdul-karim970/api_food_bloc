// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Recipes {
  int id;
  String title;
  String image;
  String imageType;
  Recipes({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  Recipes copyWith({
    int? id,
    String? title,
    String? image,
    String? imageType,
  }) {
    return Recipes(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      imageType: imageType ?? this.imageType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'image': image,
      'imageType': imageType,
    };
  }

  factory Recipes.fromMap(Map<String, dynamic> map) {
    return Recipes(
      id: map['id'] as int,
      title: map['title'] as String,
      image: map['image'] as String,
      imageType: map['imageType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipes.fromJson(String source) =>
      Recipes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Recipes(id: $id, title: $title, image: $image, imageType: $imageType)';
  }

  @override
  bool operator ==(covariant Recipes other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.image == image &&
        other.imageType == imageType;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ image.hashCode ^ imageType.hashCode;
  }
}
