import 'package:fextoolkit_mobile_test/styles.dart';
import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  final Function()? onTap;

  PlusButton({this.onTap});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Styles.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Align(
          child: Text(
            "+",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
