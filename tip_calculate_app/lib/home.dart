import 'package:flutter/material.dart';
import 'secondscreen.dart';

class Tipcalculator extends StatefulWidget {
  @override
  _TipcalculatorState createState() => _TipcalculatorState();
}

class _TipcalculatorState extends State<Tipcalculator> {
  String _tipPercent ;
  String _billAmount ;
  String _totalBill ;

  final billCon = new TextEditingController();


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
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
              width: 160,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0)

              ),


              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Bill Amount"),
                    TextFormField(
                      controller: billCon,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.black45),
                      decoration: InputDecoration(

                        hintText: "   Enter Bill Amount ",
                        prefixText: "₹ ",

                        prefixIcon: Icon(Icons.payments_outlined)
                      ),





                    )
                  ],
                ),
              ),
              
            ),


            Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: ElevatedButton(
              child: Text('Next', style: TextStyle(
                color: Colors.black
              ),
              ),


                onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=>secondscreen(value: _billAmount)));
                setState(() {
                  _billAmount = billCon.text;
                });
                },
                



              ),


            )
          ],
        ),


      ) ,


    );
  }
}






