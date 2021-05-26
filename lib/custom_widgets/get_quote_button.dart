import 'package:flutter/material.dart';

class GetQuoteButton extends StatelessWidget {
  final Function()? onTap;

  GetQuoteButton({this.onTap});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/new_quote.png", width: 18),
            SizedBox(width: 10),
            Text("New Quote",
                style: TextStyle(fontSize: 14, color: Colors.white),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
