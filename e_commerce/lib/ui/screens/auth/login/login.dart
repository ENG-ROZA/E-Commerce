// ignore_for_file: prefer_const_constructors
import 'package:e_commerce/data/models/dependancy_injection/dependancy_injection.dart';
import 'package:e_commerce/ui/screens/auth/login/login_viewmodel.dart';
import 'package:e_commerce/ui/screens/auth/signup/signup.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/dialog_util.dart';
import 'package:e_commerce/ui/widgets/custom_button.dart';
import 'package:e_commerce/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/custom_textfield.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: loginViewModel,
      listener: (context, state) {
        if (state is BaseloadingState) {
          showLoading(context);
        } else if (state is BaseErrorState) {
          hideLoading(context);
          showError(context, Constants.defaultErrorMessage);
        } else if (state is BaseSuccessState) {
          hideLoading(context);
          Navigator.pushNamed(context, MainScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Form(
              key: loginViewModel.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset("assets/images/routelogo.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Welcome Back To Route",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 24, color: AppColors.whiteColor),
                        )),
                    Text("Please sign in with your email",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: AppColors.whiteColor),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    FormLabel(Label: "Email"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: "Email",
                      type: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Email';
                        }
                        var emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);

                        if (!emailValid) {
                          return 'Email format is not valid';
                        }

                        return null;
                      },
                      controller: loginViewModel.emailController,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    FormLabel(Label: "Password"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: loginViewModel.passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Password ';
                        }
                        if (text.length < 6) {
                          return 'Password should be at least 6 chars.';
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 56,
                    ),
                    CustomButton(
                        title: "Login",
                        onPressed: () {
                          loginViewModel.login();
                        }),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.poppins(
                              color: AppColors.whiteColor, fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, SignupScreen.routeName);
                          },
                          child: Text(
                            " Create account",
                            style: GoogleFonts.poppins(
                                color: AppColors.whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
