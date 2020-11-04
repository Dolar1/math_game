import 'package:flutter/material.dart';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';

class Showfactor extends StatefulWidget {
  final number;
  Showfactor({Key key, this.number}) : super(key: key);
  @override
  _ShowfactorState createState() => _ShowfactorState();
}

class _ShowfactorState extends State<Showfactor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Easy Mode"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 75),
            Center(
              child: Container(
                child: Text(
                  "Choose Non Multiple Of ${widget.number.toString()}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            ShowNumbers(number: widget.number),
          ],
        ),
      ),
    );
  }
}

class ShowNumbers extends StatefulWidget {
  final int number;
  ShowNumbers({Key key, this.number}) : super(key: key);

  @override
  _ShowNumbersState createState() => _ShowNumbersState();
}

class _ShowNumbersState extends State<ShowNumbers> {
  int random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    int a = random(1, 5);
    int b = random(5, 10);
    int c = random(10, 15);
    int nonFact = random(3, 15) * widget.number + 1;

    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(
          width: 3.0,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      );
    }

    TextStyle myStyle() {
      return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
    }

    Widget myWidget(int no) {
      return InkWell(
        onTap: () {
          if (no % widget.number != 0) {
            setState(() {
              count += 1;
            });
            if (count == 10) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Hurrah..! You won',
                desc: 'Tap On New Number To Get More Challanges',
                btnOkOnPress: () {
                  Navigator.of(context).pop();
                },
              )..show();
            }
          } else {
            return AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Oops..! You Lost',
              desc: 'Start the Game again',
              btnCancelOnPress: () {
                Navigator.of(context).pop();
              },
              // btnOkOnPress: () {},
            )..show();
          }
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: myBoxDecoration(),
          child: Center(
            child: Text(
              no.toString(),
              style: myStyle(),
            ),
          ),
        ),
      );
    }

    print(count);
    return Container(
      child: Column(
        children: [
          if (nonFact % 2 == 0) myWidget(nonFact),
          SizedBox(height: 10),
          myWidget(a * widget.number),
          SizedBox(height: 10),
          myWidget(b * widget.number),
          SizedBox(height: 10),
          myWidget(c * widget.number),
          SizedBox(height: 10),
          if (nonFact % 2 != 0) myWidget(nonFact),
          SizedBox(height: 90),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: null,
                child: Text(
                  "$count",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
