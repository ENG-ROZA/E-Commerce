import 'package:e_commerce/data/models/dependancy_injection/dependancy_injection.dart';
import 'package:e_commerce/ui/screens/auth/login/login.dart';
import 'package:e_commerce/ui/screens/auth/signup/singup_viewmodel.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/dialog_util.dart';
import 'package:e_commerce/ui/widgets/custom_button.dart';
import 'package:e_commerce/ui/widgets/custom_textfield.dart';
import 'package:e_commerce/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "SignUpScreen";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SingupViewmodel singupViewmodel = getIt();
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: singupViewmodel,
      listener: (context, state) {
        if (state is BaseloadingState) {
          showLoading(context);
        } else if (state is BaseErrorState) {
          hideLoading(context);
          showError(context, Constants.defaultErrorMessage);
        }  else if (state is BaseSuccessState) {
          hideLoading(context);
          Navigator.pushNamed(context, LoginScreen.routeName);
        } 
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: singupViewmodel.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/routelogo.png"),
                    const SizedBox(
                      height: 5,
                    ),
                    FormLabel(Label: "Full Name"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: "Name",
                      type: TextInputType.name,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Name';
                        }

                        return null;
                      },
                      controller: singupViewmodel.nameController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormLabel(Label: "Phone Number"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Phone',
                      controller: singupViewmodel.phoneController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Phone ';
                        }
                        if (text.length < 11) {
                          return 'Password should be at least 11 number.';
                        }
                        return null;
                      },
                      type: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormLabel(Label: "Email"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: "Email",
                      type: TextInputType.emailAddress,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Email';
                        }
                        var emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);

                        if (!emailValid) {
                          return 'Email format is not valid';
                        }

                        return null;
                      },
                      controller: singupViewmodel.emailController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormLabel(Label: "Password"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: singupViewmodel.passwordController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Your Password ';
                        }
                        if (text.length < 6) {
                          return 'Password should be at least 6 chars.';
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FormLabel(Label: "Confirm Password"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: singupViewmodel.rePasswController,
                      validator: (text1) {
                        if (text1 == null || text1.trim().isEmpty) {
                          return 'Please Confirm Your Password ';
                        }

                        if (singupViewmodel.passwordController.text != text1) {
                          return "Password hasn't match";
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    CustomButton(
                        title: "Sing up",
                        onPressed: () {
                          singupViewmodel.singUp();
                        }),
                    const SizedBox(
                      height: 25,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
