import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class secondscreen extends StatefulWidget {
  final String value;

  secondscreen({Key key, this.value}) : super(key: key);

  @override
  _secondscreenState createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {
  String _tipPercent;
  final tipCon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(21.0),
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  width: 160,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Bill Amount", textAlign: TextAlign.center),
                      Text("₹ ${widget.value}"),
                    ],
                  ),
                ),
                Container(
                    height: 170,
                    width: 160,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Tip %", textAlign: TextAlign.center),
                        TextFormField(
                          controller: tipCon,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          style: TextStyle(color: Colors.black45),
                          decoration: InputDecoration(
                              hintText: "Enter Tip %  ",
                              prefixIcon:
                                  Icon(Icons.account_balance_wallet_outlined)),
                        )
                      ],
                    )),
                Container(
                  child: ElevatedButton(
                    child: Text("Calculate Total Bill"),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog("");
                          });

                      setState(() {
                        _tipPercent = tipCon.text;
                      });
                    },
                  ),
                ),
              ],
            )
        )
    );
  }
}

// Dialog

class CustomDialog extends StatelessWidget {
  final title;
  CustomDialog(this.title);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(

      alignment: Alignment.center,
      height: 500,
      color: Colors.deepOrange,
      child: ListView(
        padding: EdgeInsets.all(21.0),
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("Bill Amount"), Text(" ₹ ")],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("Tip %"), Text(" ₹ ")],
              )),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("Total Bill"), Text(" ₹ ")],
              ))
        ],
      ),
    ));
  }
}
