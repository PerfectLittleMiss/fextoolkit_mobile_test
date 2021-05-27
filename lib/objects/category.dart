import 'package:fextoolkit_mobile_test/styles.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String categoryName;
  final double _fontSize = 14;
  final Function()? onRemove;

  Category(this.categoryName, {this.onRemove});

  Widget build(BuildContext context) {
    return Container(
      color: Styles.primaryColor,
      margin: EdgeInsets.only(top: 10, right: 10),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            this.categoryName,
            style: TextStyle(color: Colors.white, fontSize: _fontSize),
          ),
          SizedBox(width: 15),
          InkWell(
            onTap: this.onRemove,
            child: Image.asset("images/remove.png", width: 14),
          ),
        ],
      ),
    );
  }
}
