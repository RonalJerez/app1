import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButtom extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double height;
  final double width;

  const AppButtom({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.height = 50,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(
            20,
          )),
        ),
      ),
    );
  }
}
