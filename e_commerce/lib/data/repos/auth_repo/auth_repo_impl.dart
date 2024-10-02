// ignore_for_file: annotate_overrides, prefer_const_constructors

import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/faliures.dart';
import 'package:e_commerce/data/models/request/register_request_body.dart';
import 'package:e_commerce/data/models/response/auth_response.dart';
import 'package:e_commerce/data/shared_preferences/shared_preferences.dart';
import 'package:e_commerce/domain/repos/auth_repo/auth_repo.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  Connectivity connectivity;
  SharedPref sharedPref;

  AuthRepoImpl(this.connectivity, this.sharedPref);

  Future<Either<Faliure, bool>> login(String email, String password) async {
    ConnectivityResult connectivityResult =
        (await (connectivity.checkConnectivity())) as ConnectivityResult;

    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      try {
        Uri url =
            Uri.https(" https://ecommerce.routemisr.com", "api/v1/auth/signin");

        Response serverResponse =
            await post(url, body: {"email": email, "password": password});
        AuthResponse authResponse =
            AuthResponse.fromJson(jsonDecode(serverResponse.body));
        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          sharedPref.saveUser(authResponse.user!);
          sharedPref.saveToken(authResponse.token!);

          return Right(true);
        } else {
          return left(Faliure(authResponse.message ?? "Something Went Wrong"));
        }
      } catch (_) {
        return Left(Faliure(Constants.defaultErrorMessage));
      }
    } else {
      return left(NetworkFailure(
          "Please check your internet connection and try again"));
    }
  }

  @override
  Future<Either<Faliure, bool>> signUp(RegisterRequestBody body) async {
    ConnectivityResult connectivityResult =
        (await (connectivity.checkConnectivity())) as ConnectivityResult;

    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      try {
        Uri url =
            Uri.https(" https://ecommerce.routemisr.com", "api/v1/auth/signup");

        Response serverResponse = await post(url, body: body.toJson());
        AuthResponse authResponse =
            AuthResponse.fromJson(jsonDecode(serverResponse.body));
        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          sharedPref.saveUser(authResponse.user!);
          sharedPref.saveToken(authResponse.token!);
          return Right(true);
        } else {
          return left(
              Faliure(authResponse.message ?? Constants.defaultErrorMessage));
        }
      } catch (_) {
        return Left(Faliure(Constants.defaultErrorMessage));
      }
    } else {
      return left(NetworkFailure(Constants.internetErrorMessage));
    }
  }
}
