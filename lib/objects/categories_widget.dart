import 'package:flutter/material.dart';

import '../uri_helper.dart';
import 'category.dart';
import 'plus_button.dart';

class Categories extends StatefulWidget {
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> _categories = [];
  final _categoryController = TextEditingController();

  List<Widget> get categories {
    return _categories.map((category) {
      return Category(category, onRemove: () {
        setState(() {
          _categories.removeWhere((value) => value == category);
        });
      });
    }).toList();
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                PlusButton(onTap: () {
                  addCategory();
                }),
              ],
            ),
          ),
          Row(children: this.categories)
          //...this.categories,
        ],
      ),
    );
  }

  void addCategory() {
    // Don't allow duplicate categories to be entered
    if (_categories.contains(_categoryController.text.toUpperCase().trim())) {
      // Notify the user the category has already been added
      final snackBar =
          SnackBar(content: Text("That category has already been added"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        _categories.add(_categoryController.text.toUpperCase().trim());

        UriHelper.updateCategories(_categories);
      });
    }
  }
}
