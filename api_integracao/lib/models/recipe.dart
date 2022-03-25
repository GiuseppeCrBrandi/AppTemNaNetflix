import 'package:flutter/material.dart';

class Recipe {
  final String title;
  final String runtime;
  final String year;

  Recipe({this.title, this.runtime, this.year});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        title: json['title'] as String,
        runtime: json['runtime'] as String,
        year: json['year'] as String);
  }











  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {title: $title, runtime: $runtime, year: $year}';
  }

}