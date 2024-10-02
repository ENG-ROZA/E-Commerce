// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    
    builder: (context) {
      return AlertDialog(
        actions: const [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Loading...",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
                Spacer(),
                CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showError(BuildContext context, String defaultErrorMessage) {
  showDialog(
      context: context,
      builder: (_) {
   return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const[
                  Icon(
                    Icons.info,
                    color: AppColors.primaryColor, 
                    size: 30,
                  ),
                   SizedBox(width: 10),
                  Text(
                    "Error",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                Constants.defaultErrorMessage,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
      }

