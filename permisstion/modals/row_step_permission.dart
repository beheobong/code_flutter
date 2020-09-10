import 'package:flutter/material.dart';
import 'package:schooly/themes/styles.dart';

class RowStep extends StatelessWidget {
  final String icon;
  final String title;

  RowStep({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
      child:  Row(
        children: <Widget>[
           Padding(
              padding: EdgeInsets.only(right: 15),
              child:  Container(
                width: 35,
                height: 35,
                decoration:  BoxDecoration(
                  image:  DecorationImage(
                    image:  AssetImage(icon),
                    fit: BoxFit.contain,
                  ),
                ),
              )),
           Flexible(
              child:  Text(title,
                  style: SCHStyles.copyStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700)))
        ],
      ),
    );
  }
}
