import 'dart:convert';

import 'package:flutter/foundation.dart';

class AppleRecipeSearchResults {
  String name;
  int totalResults;
  int totalResultsVariants;
  String type;
  List results;

  AppleRecipeSearchResults.obj({
    required this.name,
    required this.totalResults,
    required this.totalResultsVariants,
    required this.type,
    required this.results,
  });

  AppleRecipeSearchResults copyWith({
    String? name,
    int? totalResults,
    int? totalResultsVariants,
    String? type,
    List<Map<String, dynamic>>? results,
  }) {
    return AppleRecipeSearchResults.obj(
      name: name ?? this.name,
      totalResults: totalResults ?? this.totalResults,
      totalResultsVariants: totalResultsVariants ?? this.totalResultsVariants,
      type: type ?? this.type,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'totalResults': totalResults,
      'totalResultsVariants': totalResultsVariants,
      'type': type,
      'results': results,
    };
  }

  factory AppleRecipeSearchResults.fromMap(Map<String, dynamic> map) {
    return AppleRecipeSearchResults.obj(
        name: map['name'] as String,
        totalResults: map['totalResults'] as int,
        totalResultsVariants: map['totalResultsVariants'] ?? 0,
        type: map['type'] as String,
        results: map['results']);
  }

  String toJson() => json.encode(toMap());

  factory AppleRecipeSearchResults.fromJson(String source) =>
      AppleRecipeSearchResults.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppleRecipeSearchResults(name: $name, totalResults: $totalResults, totalResultsVariants: $totalResultsVariants, type: $type, results: $results)';
  }

  @override
  bool operator ==(covariant AppleRecipeSearchResults other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.totalResults == totalResults &&
        other.totalResultsVariants == totalResultsVariants &&
        other.type == type &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        totalResults.hashCode ^
        totalResultsVariants.hashCode ^
        type.hashCode ^
        results.hashCode;
  }
}
