import 'package:flutter/material.dart';
import 'package:reponsive_widgets/history_view.dart';
import 'package:reponsive_widgets/page2.dart';
import 'package:reponsive_widgets/page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight);
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => MyPageTwo(title: "Page 2")));
                        },
                        child: Container(
                          child: const Text("Row 1 Container 1"),
                            height: height*0.25,
                            width: size.width/2,
                            color: Colors.lime),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) =>
                              MyPageThree(title: "Page 3")),);
                        },
                        child: Container(
                            child: const Text("BlueTaxiApp"),
                            height: height*0.25,
                            width: size.width/2,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: height*0.05, vertical: height*0.05),
                    child: Container(
                      color: Colors.brown,
                      child: Center(child:
                      Align(
                        alignment: Alignment.center,
                          child: Text("Reponsive Widget", style: TextStyle(fontSize: 34.0,),))),
                    ),
                  ),
                  height: height*0.50,
                  width: size.width,
                  color: Colors.blue,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>  MyStackWidget()));
                        },
                        child: Container(
                            child: const Text("Custom Paint Class"),
                            height: height*0.25,
                            width: size.width/2,
                            color: Colors.lime),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          child: const Text("Row 2 Container 2"),
                          height: height*0.25,
                          width: size.width/2,
                          color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
