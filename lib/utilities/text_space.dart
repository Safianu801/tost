import 'package:flutter/material.dart';

class TextSpace extends StatefulWidget {
  final controller;
  final String hintText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool obscureText;
  final keyboardType;
  final Function(String)? onChange;
  final String? initialView;
  const TextSpace({
    super.key,
    required this.obscureText,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    this.keyboardType,
    this.onChange,
    this.initialView,
  });

  @override
  State<TextSpace> createState() => _TextSpaceState();
}

class _TextSpaceState extends State<TextSpace> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      initialValue: widget.initialView,
      onChanged: widget.onChange,
      controller: widget.controller, style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color(0xFFEBEBEB)
            ),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w300
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding: const EdgeInsets.all(14),
      ),
    );
  }
}
