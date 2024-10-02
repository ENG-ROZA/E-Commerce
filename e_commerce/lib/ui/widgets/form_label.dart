import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FormLabel extends StatelessWidget {
  String Label;
  FormLabel({required this.Label});

  @override
  Widget build(BuildContext context) {
    return Text(Label,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(fontSize: 16, color: AppColors.whiteColor),
        ));
  }
}
