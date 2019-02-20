import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
   title: 'Simple interest calculator',
   home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double si;
  String value;

  TextEditingController _p;
  TextEditingController _t;
  TextEditingController _r;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _p =TextEditingController();
    _r =TextEditingController();
    _t =TextEditingController();
  }

      void calculate(){
    if (_p.text.isNotEmpty && _t.text.isNotEmpty && _r.text.isNotEmpty) {
      double _principle=double.parse(_p.text);
      double _time=double.parse(_t.text);
      double _rate=double.parse(_r.text);
      si=_principle * _rate * _time /100;
      setState(() {
        value=si.toString();
      });
    }
    else{
     value="invalid"; 
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple interest calculator')
      ),
      body: Container(
        padding: EdgeInsets.all(10.1),
        child:Center(
          child: Column(
            children: <Widget>[
              Text('Simple interest calculator', style:TextStyle(fontSize: 20.2, fontWeight: FontWeight.bold),),
              TextField(
                 controller: _p,
                 decoration: InputDecoration(
                   hintText: "Enter pinciple",
                   labelText: 'Enter Principle',
                   icon: Icon(Icons.attach_money),
                 ),
                 keyboardType: TextInputType.numberWithOptions(),
              ),
              TextField(
                 controller: _t,
                 decoration: InputDecoration(
                   hintText: "Enter timeler ",
                   labelText: 'Time',
                   icon: Icon(Icons.timelapse),
                 ),
                 keyboardType: TextInputType.numberWithOptions(),
              ),
              TextField(
                 controller: _r,
                 decoration: InputDecoration(
                   hintText: "Enter rate",
                   labelText: 'Rate',
                   icon: Icon(Icons.rate_review),
                 ),
                 keyboardType: TextInputType.numberWithOptions(),
              ),
              Padding(padding: EdgeInsets.all(12.5),),
              RaisedButton(onPressed: calculate,child: Text('calculate'),),
               Text('Simple interest is $value', style:TextStyle(fontSize: 20.2, fontWeight: FontWeight.bold),),
            ],
          ),
        ) ,
      ),
      );
  }
}