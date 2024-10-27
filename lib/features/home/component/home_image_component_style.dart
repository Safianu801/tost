import 'package:flutter/material.dart';

class HomeImageComponentStyle extends StatefulWidget {
  final String image;
  const HomeImageComponentStyle({super.key, required this.image});

  @override
  State<HomeImageComponentStyle> createState() => _HomeImageComponentStyleState();
}

class _HomeImageComponentStyleState extends State<HomeImageComponentStyle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 5),
      child: Container(
        height: 200,
        width: 100,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Image.asset("assets/images/${widget.image}", fit: BoxFit.cover,),
      ),
    );
  }
}
