import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  String title;
  Function function;
  Color color;
  Color textColor;
  CustomButton({
    Key key,
    this.title,
    this.function,
    this.color,
    this.textColor,
    this.isLoading = false,
  }) : super(key: key);
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      height: isPortrait == true ? size.height * 0.06 : size.height * 0.1,
      width: size.width * 0.9,
      margin: EdgeInsets.only(
          right: size.width * 0.004,
          left: size.width * 0.004,
          top: size.height * 0.03),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: primaryColor, width: 1),
      ),
      child: TextButton(
        child: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            title,
            style: GoogleFonts.tajawal(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        onPressed: () => isLoading ? () {} : function(),
      ),
    );
  }
}
