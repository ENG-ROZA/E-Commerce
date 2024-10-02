import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/use_cases/singup_use_case.dart';
import 'package:e_commerce/ui/utils/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../data/models/request/register_request_body.dart';
@injectable
class SingupViewmodel extends Cubit {
  SingupUseCase singupUseCase;
  SingupViewmodel(this.singupUseCase) : super(BaseInitialState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController rePasswController = TextEditingController();

  singUp() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseloadingState());

    try {
      Either<String, bool> eitherResponse = await singupUseCase.execute(
          RegisterRequestBody(
              email: emailController.text,
              name: nameController.text,
              password: passwordController.text,
              rePassword: rePasswController.text,
              phone: phoneController.text)) as Either<String, bool>;
      eitherResponse.fold((error) => emit(BaseErrorState(error)),
          (r) => emit(BaseSuccessState()));
    } catch (e) {
      
      emit(BaseErrorState(e.toString()));
    }
  }
}
