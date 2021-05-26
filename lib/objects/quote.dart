import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  final String quote;
  final String author;

  Quote(this.quote, this.author);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(this.quote,
              style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
          SizedBox(height: 30),
          Text("- ${this.author}"),
        ],
      ),
    );
  }
}
