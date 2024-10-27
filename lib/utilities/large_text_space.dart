import 'package:flutter/material.dart';

class LargeTextSpace extends StatefulWidget {
  final controller;
  final String hintText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final bool obscureText;
  final keyboardType;
  final Function(String)? onChange;
  final String? initialView;
  const LargeTextSpace({super.key, this.controller, required this.hintText, this.prefixIcon, this.suffixIcon, required this.obscureText, this.keyboardType, this.onChange, this.initialView});

  @override
  State<LargeTextSpace> createState() => _LargeTextSpaceState();
}

class _LargeTextSpaceState extends State<LargeTextSpace> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      initialValue: widget.initialView,
      onChanged: widget.onChange,
      maxLines: 10,
      controller: widget.controller, style: const TextStyle(fontSize: 15),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.redAccent,
              width: 3
            ),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 3),
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
