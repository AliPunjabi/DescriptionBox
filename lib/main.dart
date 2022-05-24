// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Main());
  }
}

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Color mycolor = Colors.black;
  bool bold = false;

  bool italic = false;

  bool underline = false;

  bool align = false;

  bool centerAlign = false;

  bool leftAlign = false;

  bool rightAlign = false;

  bool color = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description Box"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 170,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  textAlign: align
                      ? TextAlign.justify
                      : centerAlign
                          ? TextAlign.center
                          : leftAlign
                              ? TextAlign.left
                              : rightAlign
                                  ? TextAlign.right
                                  : TextAlign.start,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    errorStyle: TextStyle(color: Colors.red),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  maxLines: 6,
                  style: TextStyle(
                    decoration: underline ? TextDecoration.underline : null,
                    fontSize: 16,
                    color: mycolor,
                    fontWeight: bold ? FontWeight.bold : null,
                    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    color: Color.fromARGB(255, 203, 197, 197),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                bold = bold ? false : true;
                              });
                            },
                            child: Icon(Icons.format_bold)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                italic = italic ? false : true;
                              });
                            },
                            child: Icon(Icons.format_italic)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                underline = underline ? false : true;
                              });
                            },
                            child: Icon(Icons.format_underline)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                align = align ? false : true;
                                centerAlign = false;
                                leftAlign = false;
                                rightAlign = false;
                              });
                            },
                            child: Icon(Icons.menu)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                centerAlign = centerAlign ? false : true;
                                align = false;
                                leftAlign = false;
                                rightAlign = false;
                              });
                            },
                            child: Icon(Icons.filter_list)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                leftAlign = leftAlign ? false : true;
                                align = false;
                                centerAlign = false;
                                rightAlign = false;
                              });
                            },
                            child: Icon(Icons.sort)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                rightAlign = rightAlign ? false : true;
                                align = false;
                                centerAlign = false;
                                leftAlign = false;
                              });
                            },
                            child: Icon(Icons.segment)),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Pick a color!'),
                                      content: SingleChildScrollView(
                                        child: BlockPicker(
                                          pickerColor: mycolor, //default color
                                          onColorChanged: (Color color) {
                                            //on color picked
                                            setState(() {
                                              mycolor = color;
                                            });
                                          },
                                        ),
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text('DONE'),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(); //dismiss the color picker
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.format_color_fill))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
