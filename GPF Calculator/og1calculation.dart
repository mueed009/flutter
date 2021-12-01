import 'package:flutter/material.dart';

class og1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String date = "";

  DateTime initialselectedDate = DateTime.now();

  DateTime finalselectedDate = DateTime.now();
  int difference=0;
  double damount=0;
  void differenceInDays(){
    setState(() {
      difference=finalselectedDate.difference(initialselectedDate).inDays;

    });
  }

  void printvalue(){

    Text("entered value is: $damount");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Datepicker"),
      ),
      body: Column(
        children: [

          SizedBox(height: 70,),

          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20),
                child: ElevatedButton(
                 
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text("Initial Date"),
                ),
              ),
              const SizedBox(width: 50,),
              Text(
                  "${initialselectedDate.day}/${initialselectedDate.month}/${initialselectedDate.year}"),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _selectDate2(context);
                  },
                  child: const Text("Final Date"),
                ),
              ),
              
              const SizedBox(width: 50,),
              Text(
              "${finalselectedDate.day}/${finalselectedDate.month}/${finalselectedDate.year}"),
            ],
          ),
          SizedBox(height: 40,),
          Text("Select sDeducted Amount"),
  Slider(
                value: damount,
                min: 0,
                max: 10000,
                divisions: 100,
                label: damount.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    damount = value as double;
                  });
                },
              ),
          SizedBox(height: 50,),
           RaisedButton(
                child: const Text('Calculate Difference',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),),
                color: Colors.red,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                onPressed: () {
                differenceInDays();
             
                },
              ),
              Text("difference in days is : $difference"),
             
              
          
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: initialselectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != initialselectedDate) {
      setState(() {
        initialselectedDate = selected;
      });
    }
  }

  _selectDate2(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: finalselectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != finalselectedDate) {
      setState(() {
        finalselectedDate = selected;
      });
    }
  }
}
