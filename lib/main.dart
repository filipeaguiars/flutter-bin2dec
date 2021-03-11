import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  RegExp _notZeroOrOne = RegExp(r'[^01]');

  TextEditingController _controllerBin = TextEditingController();
  TextEditingController _controllerDec = TextEditingController();

  String _infoText = "Insert a number to convert";


  void _resetFields(){
    _controllerBin.text = "";
    setState(() {
      _infoText = "Insert a number to convert";
    });
  }

  void _dec2bin() {
    setState(() {
     if (_controllerDec.text.isEmpty){
       _infoText = "Por favor, digite um numero";
     }else {
       int dec = int.tryParse(_controllerDec.text, radix: 10);
       String bin2 = dec.toRadixString(2);
       print(dec);
       _infoText = " '${_controllerDec.text}' in binary is $bin2";
     }
    });
  }

  void _bin2dec(){
    setState(() {
      if(_controllerBin.text.indexOf(_notZeroOrOne) != -1)  {
        _infoText = "O valor deve conter apenas 0 e 1";
    }else if(_controllerBin.text.isEmpty) {
        _infoText = "Please, insert a number! Only 1's and 0's will be accepted.";
      }else {
        int bin = int.parse(_controllerBin.text, radix: 2);
        _infoText = " '${_controllerBin.text}' in decimal is $bin";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Converter"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.all(10),
                child: Text("$_infoText",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _controllerBin,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintText: "Insert a binary to convert",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue[200], width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue[500],
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _bin2dec,
                    child: Text("Convert"),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _controllerDec,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    hintText: "Insert a binary to convert",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlue[200], width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue[500],
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:10, bottom: 10),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _dec2bin,
                    child: Text("Convert"),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
