//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "Lab Final",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = false;
  late List pwrdList = [];
  String? usrSC;
  String? securityCode;
  @override
  Widget build(BuildContext context) {
    String? desc;
    String? pwrd;

    void showPwrdResult() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Password"),
              content: Container(
                child: Column(
                  children: [
                    TextField(
                      onChanged: (val2) {
                        desc = val2;
                      },
                      decoration: InputDecoration(
                          labelText: "Description",
                          hintText: "Enter Description"),
                    ),
                    TextField(
                      onChanged: (val3) {
                        pwrd = val3;
                      },
                      decoration: InputDecoration(
                          labelText: "Password", hintText: "Enter Password"),
                    ),
                  ],
                ),
              ),
              contentTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              actions: [
                TextButton(
                    onPressed: () {
                      print(desc);
                      print(pwrd);
                      pwrdList.add(pwrd);
                      print(pwrdList);
                      Navigator.pop(context);
                    },
                    child: Text("Submit"))
              ],
            );
          });
    }

    void showScResult() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Security Code"),
              content: TextField(
                onChanged: (val) {
                  securityCode = val;
                },
                decoration: InputDecoration(
                    labelText: "Security Code",
                    hintText: "Enter Security Code"),
              ),
              contentTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              actions: [
                TextButton(
                    onPressed: () {
                      print(securityCode);
                      Navigator.pop(context);
                    },
                    child: Text("Next"))
              ],
            );
          });
    }

    void showCodeDemand() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Security Code"),
              content: TextField(
                onChanged: (val4) {
                  usrSC = val4;
                },
                decoration: InputDecoration(
                    labelText: "Security Code",
                    hintText: "Enter your Security Code"),
              ),
              contentTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              actions: [
                TextButton(
                    onPressed: () {
                      if (usrSC == securityCode) {
                        setState(() {
                          flag = true;
                        });
                      } else {
                        setState(() {
                          flag = false;
                        });
                      }
                      print("This is userSc $securityCode");
                      Navigator.pop(context);
                    },
                    child: Text("Show"))
              ],
            );
          });
    }

    Widget showList() {
      return ListView.builder(
        itemCount: pwrdList.length,
        itemBuilder: (context, int index) {
          return Text("${pwrdList[index]}");
        },
      );
    }

    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: () {
                  showScResult();
                },
                child: Text("Add Security Code"),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: () {
                  showPwrdResult();
                },
                child: Text("Add Password"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    showCodeDemand();
                  });
                  print("This is flag $flag");
                },
                child: Text("Show List"),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Lab Final"),
      ),
      body: SafeArea(
          child: Container(
              color: Colors.yellow,
              height: 500,
              width: 500,
              child:
                  (flag == true) ? showList() : CircularProgressIndicator())),
    );
  }
}
