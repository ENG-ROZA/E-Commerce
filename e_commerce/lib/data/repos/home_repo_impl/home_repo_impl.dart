import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/models/faliures.dart';
import 'package:e_commerce/data/models/response/category_dm.dart';
import 'package:e_commerce/data/models/response/product_dm.dart';
import 'package:e_commerce/domain/repos/home_repo/home_data_sources/home_online_data_source.dart';
import 'package:e_commerce/domain/repos/home_repo/home_repo.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/extentions.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeRepoImpl extends HomeRepo {
  Connectivity connectivity;
  HomeOnlineDataSource homeOnlineDataSource;
  HomeRepoImpl(this.connectivity, this.homeOnlineDataSource);
  @override
  Future<Either<Faliure, List<CategoryDM>>> getCategories() async {
    if (await connectivity.isInternetConnected()) {
      return homeOnlineDataSource.getCategories();
    } else {
      return Left(Faliure(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Faliure, List<ProductDM>>> getProducts() async {
    if (await connectivity.isInternetConnected()) {
      return homeOnlineDataSource.getProducts();
    }else {
       return Left(Faliure(Constants.internetErrorMessage));
    }
  }
}
