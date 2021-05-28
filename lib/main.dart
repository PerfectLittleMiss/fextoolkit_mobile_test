import 'dart:convert';
import 'package:fextoolkit_mobile_test/styles.dart';
import 'package:fextoolkit_mobile_test/uri_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'objects/categories_widget.dart';
import 'objects/get_quote_button.dart';
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
        primarySwatch: Styles.materialColor,
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
          backgroundColor: Styles.primaryColor,
        ),
        body: GestureDetector(
          onTap: () {
            WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
          },
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 30, left: 10, right: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Categories(),
                    SizedBox(height: MediaQuery.of(context).size.height * .05),
                    this.quote != ""
                        ? Quote(this.quote, this.author)
                        : SizedBox(),
                  ],
                ),
                GetQuoteButton(onTap: () async {
                  final resp = await http.get(Uri.parse(UriHelper.getUri()));

                  //print(UriHelper.getUri());

                  final Map<String, dynamic> json = jsonDecode(resp.body);

                  setState(() {
                    if (json['statusCode'] == 404) {
                      this.quote = json['statusMessage'];
                      this.author = "Quotable";
                    } else {
                      this.quote = json['content'];
                      this.author = json['author'];
                    }
                    WidgetsBinding.instance?.focusManager.primaryFocus
                        ?.unfocus();
                  });
                }),
              ],
            ),
          ),
        ));
  }
}
