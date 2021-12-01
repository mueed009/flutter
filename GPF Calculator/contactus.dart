//import 'main.dart';

import 'package:flutter/material.dart';
//import 'package:quizapp/question.dart';

class contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Contact Us")),
      ),
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              
              child: Text(
                "Drop us a line",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "we'd love to hear from you",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),
            const Expanded(
              child: TextField(
                
                decoration: InputDecoration(
                  labelText: "Comment",
                ),
              ),
            ),
             Expanded(
               
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      color: Colors.blue,
                      child: const Text(
                        'Send',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                       
                      },
                    ),
                  ),
                ),
            
          ],
        ),
      ),
    );
  }
}
