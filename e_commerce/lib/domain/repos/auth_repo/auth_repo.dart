import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/faliures.dart';
import 'package:e_commerce/data/models/request/register_request_body.dart';

abstract class AuthRepo {
  Future<Either<Faliure, bool>> login(String email, String password);
  Future<Either<Faliure, bool>> signUp(RegisterRequestBody input);
}
