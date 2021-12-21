import 'package:flutter/material.dart';

class MyPageTwo extends StatefulWidget {
  const MyPageTwo({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyPageTwo> createState() => _MyPageTwoState();
}

class _MyPageTwoState extends State<MyPageTwo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;// - (MediaQuery.of(context).padding.top + kToolbarHeight);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.title),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width/2,
          color: Colors.lime,
          child: Row(
            children: [
              Expanded(
                child: TextButton(child: Text("Show Draggable Scrollable sheet"),
                  onPressed: () {
                  
                  },),
              ),
              Expanded(
                child: TextButton(child: Text("Show Modal Bottom Sheet"),
                onPressed: () {
                  showModalBottomSheet(context: context, builder: (BuildContext context) {
                    return Container(color: Colors.blue,);
                  });
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}