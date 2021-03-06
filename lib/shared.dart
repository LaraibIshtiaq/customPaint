import 'package:flutter/material.dart';

//For Gesture Buttons
class CustomButton extends StatelessWidget {
  CustomButton({Key? key,required this.image,required this.ontap, this.height, this.width}) : super(key: key);
  final AssetImage image;
  final VoidCallback ontap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ontap,
      child: Image(
        height: height ?? 30,
        width: width ?? 30,
        image: image,
      ),
    );
  }
}

//For Circular Avatar (PROFILE PICTURE OF USER)
class CustomImage extends StatelessWidget {
  final AssetImage image;
  CustomImage({Key? key,required this.image,required this.ontap, this.height, this.width}) : super(key: key);
  final VoidCallback ontap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Image(
          height: height ?? 35,
          width: width ?? 20,
          image: image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

//For Menu Buttons (4 BUTTONS ON MENU SCREEN)
class MenuButton extends StatelessWidget{
  MenuButton({Key? key, required this.image, this.height, this.width, required this.menuLabel, required this.dx, required this.dy, required this.ontap}) : super(key:key);
  final String image;
  final String menuLabel;
  final double dx;
  final double dy;
  final double? height;
  final double? width;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 5.0,
              offset: Offset(dx, dy),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Image(
                image: AssetImage(image),
                height: height!*0.08,
                width:width!*0.08,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(child: Text(menuLabel)),
          ],
        ),
      ),
    );
  }
}

//For BACK/NAV Buttons (POP SCREEN)
class LeadingBackButton extends StatelessWidget {
  LeadingBackButton({Key? key,required this.image,required this.ontap}) : super(key: key);
  final AssetImage image;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.width * 1/20,
        child: Image(image: image,),
        backgroundColor: Colors.white,
      ),
    );
  }
}


class PrimaryButton extends StatelessWidget {
  final Text text;
  final VoidCallback ontap;
  final Color? color;
  final double? borderRadius;

  PrimaryButton({Key? key, required this.text,  required this.ontap, this.color, this.borderRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color ?? Color(0xff1152FD)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              side: BorderSide(color: color ?? Color(0xff1152FD),width: 0.5)
          ),
        ),
      ),
      child: text,
      onPressed: ontap,
    );
  }
}