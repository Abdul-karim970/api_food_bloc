// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AppleRecipeResults {
  String? image;
  String? name;
  String? link;
  List? dataPoints;
  int? id;
  String? type;
  String? content;
  AppleRecipeResults({
    required this.image,
    required this.name,
    required this.link,
    required this.dataPoints,
    required this.id,
    required this.type,
    required this.content,
  });

  AppleRecipeResults copyWith({
    String? image,
    String? name,
    String? link,
    List? dataPoints,
    int? id,
    String? type,
    String? content,
  }) {
    return AppleRecipeResults(
      image: image ?? this.image,
      name: name ?? this.name,
      link: link ?? this.link,
      dataPoints: dataPoints ?? this.dataPoints,
      id: id ?? this.id,
      type: type ?? this.type,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
      'link': link,
      'dataPoints': dataPoints,
      'id': id,
      'type': type,
      'content': content,
    };
  }

  factory AppleRecipeResults.fromMap(Map<String, dynamic> map) {
    return AppleRecipeResults(
      image: map['image'],
      name: map['name'],
      link: map['link'],
      dataPoints: map['dataPoints'],
      id: map['id'],
      type: map['type'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppleRecipeResults.fromJson(String source) =>
      AppleRecipeResults.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppleRecipeResults(image: $image, name: $name, link: $link, dataPoints: $dataPoints, id: $id, type: $type, content: $content)';
  }

  @override
  bool operator ==(covariant AppleRecipeResults other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.name == name &&
        other.link == link &&
        listEquals(other.dataPoints, dataPoints) &&
        other.id == id &&
        other.type == type &&
        other.content == content;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        name.hashCode ^
        link.hashCode ^
        dataPoints.hashCode ^
        id.hashCode ^
        type.hashCode ^
        content.hashCode;
  }
}
