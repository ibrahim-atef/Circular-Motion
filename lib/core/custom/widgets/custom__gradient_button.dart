 import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final Function() onPressed;
  final Widget text;
  final double width;
   final double? h;
   List<Color> colors;


  CustomGradientButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.colors,
     this.h,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height:h==null? height * .06:h==0?null:h,
        width: width,
        decoration: BoxDecoration(


          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,

          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
