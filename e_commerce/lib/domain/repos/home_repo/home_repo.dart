import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/faliures.dart';
import 'package:e_commerce/data/models/response/category_dm.dart';
import 'package:e_commerce/data/models/response/product_dm.dart';

abstract class HomeRepo {
  Future<Either<Faliure,List<CategoryDM>>>getCategories();
  Future<Either<Faliure,List<ProductDM>>>getProducts();
}