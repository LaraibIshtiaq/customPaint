import 'package:flutter/material.dart';
import 'package:reponsive_widgets/history_view.dart';
import 'package:reponsive_widgets/page2.dart';
import 'package:reponsive_widgets/shared.dart';

import 'MyProfileView.dart';

class MyPageThree extends StatefulWidget {
  const MyPageThree({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyPageThree> createState() => _MyPageThreeState();
}

class _MyPageThreeState extends State<MyPageThree> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
            children: [
              CustomButton(
                  image: AssetImage("assets/icons/arrow.png"),
                  ontap: () {
                    Navigator.pop(context);
                  }),
              Container(height: height*0.5/20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(70),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        )),
                    child: CustomImage(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>MyProfileView()));},
                      image: const AssetImage("assets/images/user.png"),
                      height: height * 1 / 8,
                      width: width * 1 / 6,
                    ),
                  ),
                  const Text(
                    "Laraib",
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Laraib@gmail.com",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey.withOpacity(0.9),
                    ),
                  )
                ],
              ),
              Container(height: height*0.5/20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: (MediaQuery.of(context).size.height)*0.5/20, vertical: (MediaQuery.of(context).size.width)*0.5/20),
                child: GridView.count(
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    MenuButton(menuLabel: 'Ride History',
                      image: 'assets/images/ride_history.png',
                      dy: 3.0, dx: 3.0,
                      ontap: () async {
                      await Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>  MyPageTwo(title: '',)));
                    },
                    height: height,
                        width: width,),
                    MenuButton(menuLabel: 'Payment', image: 'assets/images/ic_payment.png', dy: 3.0, dx: -3.0,
                      ontap: () async {
                        await Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  MyStackWidget()));
                      },
                        height: height,
                        width: width),

                    MenuButton(menuLabel: 'Support', image: 'assets/images/ic_promo.png', dy: -3.0, dx: 4.0,
                      ontap: () async {
                        await Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  MyPageTwo(title: '',)));
                      },
                        height: height,
                        width: width),
                    MenuButton(menuLabel: 'Maintenance', image: 'assets/images/ic_payment.png', dy: -3.0, dx: -4.0,
                      ontap: () async {
                        await Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  MyPageTwo(title: '',)));
                      },
                        height: height,
                        width: width),
                  ],
                ),
              ),
              Container(height: height*0.5/20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(width * 1 / 3),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                    )),
                child: CustomImage(
                  ontap: () {},
                  image: AssetImage("assets/icons/cross.png"),
                ),
              ),
            ],
        ),
          ),
      ),
    ));
  }
}