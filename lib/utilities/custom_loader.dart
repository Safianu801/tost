import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoaderOverlay extends StatefulWidget {
  const CustomLoaderOverlay({super.key});

  @override
  State<CustomLoaderOverlay> createState() => _CustomLoaderOverlayState();
}

class _CustomLoaderOverlayState extends State<CustomLoaderOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String _loadingText = "";
  bool _isLoading = true;
  final String _helloText = "please wait...";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: _helloText.length.toDouble())
        .animate(_controller)
      ..addListener(() {
        setState(() {
          _loadingText = _helloText.substring(0, _animation.value.toInt());
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (_isLoading)
        // Container(
        //   color: Colors.black.withOpacity(0.5), // Overlay color
        //   child: const Center(
        //     child: CupertinoActivityIndicator(color: Colors.white,),
        //   )
        // ),
          Material(
            color: Colors.transparent,
            child: Container(
              color: Colors.black.withOpacity(0.5), // Overlay color
              child: Center(
                child: SizedBox(
                  height: 30,
                  child: Text(
                    _loadingText,
                    style: const TextStyle(fontSize: 18, color: Colors.white), // Loader text style
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
