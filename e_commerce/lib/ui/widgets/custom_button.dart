// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title;
  Function()? onPressed;
  CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            padding: EdgeInsets.symmetric(vertical: 22),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      
          ),
          onPressed: onPressed,
          child: Text(title, style: GoogleFonts.poppins(color: AppColors.primaryColor,fontSize: 16,fontWeight: FontWeight.bold))),
    );
  }
}
