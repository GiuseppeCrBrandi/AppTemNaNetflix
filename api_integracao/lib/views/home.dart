import 'package:flutter/material.dart';
import 'package:api_integracao/models/recipe.api.dart';
import 'package:api_integracao/models/recipe.dart';
import 'package:api_integracao/views/widgets/recipe_card.dart';
import 'package:api_integracao/models/StringCasingExtension.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  List<Recipe> duplicateItems;
  var items = List<Recipe>();
  bool _isLoading = true;

  @override
  void initState() {

    void initState() {

    }
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    //pare neste trecho
    //
    //
    ////////////
    _recipes = await RecipeApi.getRecipe();
    items.addAll(_recipes);
    duplicateItems.addAll(_recipes);

    setState(() {
      _isLoading = false;
    });
  }



  void filterSearchResults(String query) {

    List<Recipe> dummySearchList = List<Recipe>();
    dummySearchList.addAll(_recipes);
    if(query.isNotEmpty) {
      List<Recipe> dummyListData = List<Recipe>();
      dummySearchList.forEach((item) {
        if(item.title.contains(query)){
        dummyListData.add(item);


        }

      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }







  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("App: Tem na Netflix?"),
      ),
      body: Container(

        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  value= value.toTitleCase();
                  filterSearchResults(value);
                },
            //    controller: editingController,
                decoration: InputDecoration(
                    labelText: "Pesquisar Filme (nome em inglês)",
                    hintText: "Pesquisar Filme",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                                  title: items[index].title,
                                   year: items[index].year,
                                  rating: items[index].runtime );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }





























}