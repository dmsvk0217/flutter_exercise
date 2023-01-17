import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final controller;
  final hint;
  final funValidator;
  CustomTextFormField(
      {required this.controller,
      required this.hint,
      required this.funValidator});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.funValidator,
        obscureText: widget.hint == "Password" ? true : false,
        decoration: InputDecoration(
          hintText: "Enter ${widget.hint}",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
