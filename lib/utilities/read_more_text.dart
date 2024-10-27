import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String longText;
  final int maxLength;
  const ReadMoreText({Key? key, required this.longText, this.maxLength = 100}) : super(key: key);

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isLongText = widget.longText.length > widget.maxLength;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded ? widget.longText : widget.longText.substring(0, isLongText ? widget.maxLength : widget.longText.length),
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        if (isLongText) // Only show "Read more" button if the text is longer than the maximum length
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'Read less' : 'Read more',
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ),
      ],
    );
  }
}
