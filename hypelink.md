```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:url_launcher/url_launcher.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example_app',
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ParsedText(
              alignment: TextAlign.start,
              text:
                  "sddasfdasfaf https://regex101.com/r/UPmLBl/1 https://www.google.com/maps/place/Ocean+Park+Building,+1+%C4%90%C3%A0o+Duy+Anh,+Ph%C6%B0%C6%A1ng+Mai,+%C4%90%E1%BB%91ng+%C4%90a,+H%C3%A0+N%E1%BB%99i,+Vi%E1%BB%87t+Nam/@21.0070889,105.8381186,17z/data=!3m1!4b1!4m5!3m4!1s0x3135ac7818f13cb3:0x91fda0d22d1680d8!8m2!3d21.0070889!4d105.8403073?hl=vi-VN  ádfasdfasdf",
              parse: <MatchText>[
                // MatchText(
                //     type: ParsedType.EMAIL,
                //     style: TextStyle(
                //       color: Colors.red,
                //       fontSize: 24,
                //     ),
                //     onTap: (url) {
                //       launch("mailto:" + url);
                //     }),
                MatchText(
                    type: ParsedType.CUSTOM,
                    pattern:
                    r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+',
                    regexOptions: RegexOptions(
                      multiLine: true,
                      dotAll: true
                    ),
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                    ),
                    onTap: (url) async {
                      var a = await canLaunch(url);

                      if (a) {
                        launch(url);
                      }
                    }),
                // MatchText(
                //     type: ParsedType.PHONE,
                //     style: TextStyle(
                //       color: Colors.purple,
                //       fontSize: 24,
                //     ),
                //     onTap: (url) {
                //       launch("tel:" + url);
                //     }),
                // MatchText(
                //     pattern: r"\[(@[^:]+):([^\]]+)\]",
                //     style: TextStyle(
                //       color: Colors.green,
                //       fontSize: 24,
                //     ),
                //     renderText: ({String str, String pattern}) {
                //       Map<String, String> map = Map<String, String>();
                //       RegExp customRegExp = RegExp(pattern);
                //       Match match = customRegExp.firstMatch(str);
                //       map['display'] = match.group(1);
                //       map['value'] = match.group(2);
                //       return map;
                //     },
                //     onTap: (url) {
                //       showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           // return object of type Dialog
                //           return AlertDialog(
                //             title: new Text("Mentions clicked"),
                //             content: new Text("$url clicked."),
                //             actions: <Widget>[
                //               // usually buttons at the bottom of the dialog
                //               new FlatButton(
                //                 child: new Text("Close"),
                //                 onPressed: () {},
                //               ),
                //             ],
                //           );
                //         },
                //       );
                //     }),
                // MatchText(
                //     pattern: r"\B#+([\w]+)\b",
                //     style: TextStyle(
                //       color: Colors.pink,
                //       fontSize: 24,
                //     ),
                //     onTap: (url) async {
                //       showDialog(
                //         context: context,
                //         builder: (BuildContext context) {
                //           // return object of type Dialog
                //           return AlertDialog(
                //             title: new Text("Hashtag clicked"),
                //             content: new Text("$url clicked."),
                //             actions: <Widget>[
                //               // usually buttons at the bottom of the dialog
                //               new FlatButton(
                //                 child: new Text("Close"),
                //                 onPressed: () {},
                //               ),
                //             ],
                //           );
                //         },
                //       );
                //     }),
                // MatchText(
                //     pattern: r"lon",
                //     style: TextStyle(
                //       color: Colors.pink,
                //       fontSize: 24,
                //     ),
                //     onTap: (url) async {})
              ],
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}```
