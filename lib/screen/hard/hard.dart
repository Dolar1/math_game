import 'package:flutter/material.dart';
import 'package:jayaho/screen/hard/showfactor.dart';

class Hard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select A Number"),
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (
            BuildContext context,
            int index,
          ) =>
              SizedBox(height: 5),
          itemCount: 10,
          itemBuilder: (context, index) {
            int toShow = index + 11;
            return Card(
              elevation: 2,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Showfactor(
                      number: toShow,
                    ),
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.adjust,
                    color: Colors.blue,
                  ),
                  title: Text(
                    toShow.toString(),
                  ),
                  trailing: Stack(
                    children: [
                      Positioned(
                        left: 6,
                        child: Icon(
                          Icons.chevron_right,
                          color: Colors.blue,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
