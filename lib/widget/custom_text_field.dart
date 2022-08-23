

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfeild extends StatelessWidget {
  String label;

  TextEditingController controller;
  Icon icon;
  bool isHidden;
  Function fun;
  Function fun2;
  IconButton icon2;
  final Function(String e) fun3;

  final bool isReadOnly;
  final TextInputType textInputType;
  CustomTextfeild(
      {Key key,
      this.label,
      this.fun,
      this.fun2,
      this.controller,
      this.isReadOnly = false,
      this.textInputType = TextInputType.text,
      this.icon,
      this.icon2,
      @required this.fun3,
      this.isHidden = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.025,
        ),
        Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 240, 241),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextFormField(
              onChanged: (String v) => fun3(v) ,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  suffixIcon: icon2,
                  focusColor: Colors.white,
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 18,
                  ),
                  hintText: label),
              style: GoogleFonts.tajawal(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              obscureText: isHidden,
              keyboardType: textInputType,
              controller: controller,
              validator: (String v) => fun(v),
              onSaved: (String v) => fun2(v),
            ),
          ),
        ),
      ],
    );
  }
}