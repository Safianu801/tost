import 'package:flutter/material.dart';

class MessageSpace extends StatefulWidget {
  final controller;

  const MessageSpace({super.key, this.controller});

  @override
  State<MessageSpace> createState() => _MessageSpaceState();
}

class _MessageSpaceState extends State<MessageSpace> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextFormField(
          obscureText: false,
          controller: widget.controller,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFEBEBEB)),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: "Your message",
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w300),
            suffixIcon: Icon(Icons.gif, color: Colors.grey,),
            contentPadding: const EdgeInsets.all(14),
          ),
        )
      ],
    );
  }
}
