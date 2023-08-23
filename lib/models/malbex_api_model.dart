// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Malbex {
  String text;
  List pairings;
  Malbex({
    required this.text,
    required this.pairings,
  });

  Malbex copyWith({
    String? text,
    List? pairings,
  }) {
    return Malbex(
      text: text ?? this.text,
      pairings: pairings ?? this.pairings,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'pairings': pairings,
    };
  }

  factory Malbex.fromMap(Map<String, dynamic> map) {
    return Malbex(text: map['text'] as String, pairings: map['pairings']);
  }

  String toJson() => json.encode(toMap());

  factory Malbex.fromJson(String source) =>
      Malbex.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Malbex(text: $text, pairings: $pairings)';

  @override
  bool operator ==(covariant Malbex other) {
    if (identical(this, other)) return true;

    return other.text == text && listEquals(other.pairings, pairings);
  }

  @override
  int get hashCode => text.hashCode ^ pairings.hashCode;
}
