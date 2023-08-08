import 'package:flutter/material.dart';

import '../../constants/constant_methods.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.hintText,
    this.hintStyle,
    this.isObscureText = false,
    required this.controller,
    this.validation,
    required this.prefixIcon,
    this.keyboardType,
    this.suffixIcon,
    required this.onChange,
    this.onSaved,
  }) : super(key: key);
  final String hintText;
  String? hintStyle;
  bool isObscureText;
  final TextEditingController controller;
  Function? validation;
  Icon prefixIcon;
  IconButton? suffixIcon;
  TextInputType? keyboardType;
  Function onChange;
  Function? onSaved;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscureText,
      validator: (value) => widget.validation!(value),
      onSaved: (value) => widget.onSaved!(value),
      onChanged: (value) => widget.onChange(value),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontFamily: "JF-Flat"),
          focusedBorder: buildBorder(color: Colors.cyanAccent),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          fillColor: Colors.white.withOpacity(0.3),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
