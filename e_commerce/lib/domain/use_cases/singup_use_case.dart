import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/faliures.dart';
import 'package:e_commerce/data/models/request/register_request_body.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class SingupUseCase {
  AuthRepo repo;
  SingupUseCase(this.repo);

  Future<Either<Faliure, bool>> execute(RegisterRequestBody body) {
    return repo.signUp(body);
  }
}
