import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Function validator;
  final TextInputType textInputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? inputColor;
  int maxLines;
  bool enabled;

  CustomTextFromField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.hintText,
    required this.textInputType,
    this.prefixIcon,
    this.inputColor,
    required this.suffixIcon,
    this.maxLines = 1,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.start, // Align text to start
      cursorColor: Colors.grey,
      enabled: enabled,
      style: TextStyle(
        color: inputColor ?? Colors.black.withOpacity(0.8),
         fontSize: 16,
      ),
      keyboardType: textInputType,
      validator: (value) => validator(value),
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10.0), // Padding for the prefix icon
          child: prefixIcon,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10.0), // Padding for the suffix icon
          child: suffixIcon,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
           color: Colors.grey.withOpacity(0.8),
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white, // White background as shown in the image
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5), width: 1), // Light border color
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.8), width: 1.5), // Slightly darker on focus
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
