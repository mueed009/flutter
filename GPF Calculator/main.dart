import 'package:flutter/material.dart';
import 'og1calculation.dart';
import 'contactus.dart';


void main() => runApp(MaterialApp(
      home: firstpage(),
      theme: ThemeData.dark(),
    ));

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'pgf Calculator App',
          ),
          centerTitle: true,
        ),
        drawer: contactus(),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 500,
                child: FlatButton(
                  color: Colors.black87,
                  child: const Text(
                    'OG1',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => og1()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 500,
                child: FlatButton(
                  color: Colors.black87,
                  child: const Text(
                    'OG2',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 500,
                child: FlatButton(
                  color: Colors.black87,
                  child: const Text(
                    'OG3',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
