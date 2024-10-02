// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String hintText;
  bool isPassword;
  TextEditingController controller;
  TextInputType type;
  String? Function(String?)? validator;
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.type,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
       
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 25,horizontal: 14),
          
       border: OutlineInputBorder(
       
         borderRadius: BorderRadius.circular(15),
         
       ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        fillColor: AppColors.whiteColor,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium
        ),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.blackColor
        ),
        controller: controller,
        validator: validator,
        obscureText: isPassword,
        keyboardType: type,
        
    );
  }
}
