// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatefulWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.maxLinesForLess = 3,
    this.maxLinesForMore = 10,
    this.width,
    this.height,
  }) : super(key: key);

  final String text;
  final int maxLinesForLess;
  final int maxLinesForMore;
  final double? width;
  final double? height;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: GoogleFonts.montserrat(fontSize: 14),
          maxLines:
              isExpanded ? widget.maxLinesForMore : widget.maxLinesForLess,
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? "Nascondi" : "Continua",
            style: GoogleFonts.montserrat(color: Color(0xFF800812)),
          ),
        ),
      ],
    );
  }
}
