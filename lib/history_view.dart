import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Stack Widget Example"),
          ),
          body: Center(
            child: Column(
              children: [
                //Custom Paint
                Container(
                  child: Stack(
                    children: [
                      Opacity(opacity: 0.5,
                      child: ClipPath(
                        clipper:WaveClipper(),
                        child: Container(
                          color: Colors.red,
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                         //A Custom Function for Custom Paint
                      ),),
                      ClipPath(
                        clipper:WaveClipper(),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("CUSTOM PAINT CLASS", style: TextStyle(fontSize: 18.0),),
                          color: Colors.red,
                          height: MediaQuery.of(context).size.height * 0.36,
                        ),
                        //A Custom Function for Custom Paint
                      )
                    ],
                  ),
                ),

                //Stack
                Stack(
                  overflow: Overflow.visible,
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    // Max Size Widget
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: 400,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'Top Widget: Green',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.25,
                      right: 10,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: 150,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Middle Widget',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);

    var firstStart = Offset(size.width/5, size.height);
    var firstEnd = Offset(size.width/2.25, size.height - 50.0);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);


    var secondStart=Offset(size.width -(size.width / 3.25), size.height -105);
    var secondEnd = Offset(size.width, size.height - 10.0);
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}