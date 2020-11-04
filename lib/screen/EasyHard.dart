import 'package:flutter/material.dart';
import 'package:jayaho/screen/easy/easy.dart';
import 'package:jayaho/screen/hard/hard.dart';

class EasyHard extends StatefulWidget {
  @override
  _EasyHardState createState() => _EasyHardState();
}

class _EasyHardState extends State<EasyHard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
          title: Text("Instructions"),
          content: Column(
            children: [
              Text("1.You have to choose a number you want to play with.\n"),
              Text(
                  "2.Four numbers will be displayed out of which one wil not be the multiple of selected number.\n"),
              Text(
                  "3.If you find that number,you will proceed to the next stage.\n"),
              Text(
                  "4.In case,you make it to the 10 (Easy) & 15 (Hard) consecutive right attempts,you win else you loose.\n"),
            ],
          ),
          actions: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: RaisedButton(
                color: Colors.black,
                elevation: 5,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Proceed",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // FlatButton(
            //   child: Text("OK"),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Easy()),
                    ),
                    child: Text("Easy"),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hard()),
                    ),
                    child: Text("Hard"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
