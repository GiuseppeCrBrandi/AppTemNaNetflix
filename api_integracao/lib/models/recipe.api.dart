import 'dart:convert';
import 'package:api_integracao/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('unogs-unogs-v1.p.rapidapi.com', '/search/titles',
        {"limit": "30000", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "ponhaAquiSuaChaveNova",
      "x-rapidapi-host": "unogs-unogs-v1.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}