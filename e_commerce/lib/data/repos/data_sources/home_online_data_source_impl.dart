import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/faliures.dart';
import 'package:e_commerce/data/models/response/categories_response.dart';
import 'package:e_commerce/data/models/response/category_dm.dart';
import 'package:e_commerce/data/models/response/product_dm.dart';
import 'package:e_commerce/data/models/response/product_response.dart';
import 'package:e_commerce/domain/repos/home_repo/home_data_sources/home_online_data_source.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeOnlineDataSourceImpl extends HomeOnlineDataSource {
  @override
  Future<Either<Faliure, List<CategoryDM>>> getCategories() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.categoryEndPoint);
      Response serverResponse = await get(url);
      var myResponse =
          CategoriesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          myResponse.data?.isNotEmpty == true) {
        return Right(myResponse.data!);
      } else {
        return Left(
            Faliure(myResponse.message ?? Constants.defaultErrorMessage));
      }
    } catch (error, stackTrace) {
      print("Handiling Exception : ${error} ,stackTrace : $stackTrace");
      return Left(Faliure(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Faliure, List<ProductDM>>> getProducts() async {
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.productEndPoint);
      Response serverResponse = await get(url);
      var myResponse =
          ProductsResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          myResponse.data?.isEmpty == true) {
        return Right(myResponse.data!);
      } else {
        return Left(
            Faliure(myResponse.message ?? Constants.defaultErrorMessage));
      }
    } catch (error, stackTrace) {
      print("Handiling Exception : ${error} ,stackTrace : $stackTrace");
      return Left(Faliure(Constants.defaultErrorMessage));
    }
  }
}
