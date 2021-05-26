import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'custom_widgets/get_quote_button.dart';
import 'custom_widgets/plus_button.dart';
import 'objects/category.dart';
import 'objects/quote.dart';

void main() {
  runApp(QuoteApp());
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetQuote(),
    );
  }
}

class GetQuote extends StatefulWidget {
  _GetQuote createState() => _GetQuote();
}

class _GetQuote extends State<GetQuote> {
  String quote = "";
  String author = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get a Quote'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, bottom: 30, left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Categories(),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
                this.quote != "" ? Quote(this.quote, this.author) : SizedBox(),
              ],
            ),
            GetQuoteButton(onTap: () async {
              final resp = await http.get(Uri.parse(
                  "https://api.quotable.io/random?tag=learning,motivation"));

              final Map<String, dynamic> json = jsonDecode(resp.body);

              setState(() {
                this.quote = json['content'];
                this.author = json['author'];
              });
            }),
          ],
        ),
      ),
    );
  }
}

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
                  setState(() {
                    _categories.add(_categoryController.text);
                  });
                }),
              ],
            ),
          ),
          ...this.categories,
        ],
      ),
    );
  }
}
