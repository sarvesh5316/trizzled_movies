import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final double size;

  const ModifiedText({Key? key, required this.text, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.breeSerif(color: Colors.white, fontSize: size));
  }
}
