// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../domain/repos/auth_repo/auth_repo.dart' as _i890;
import '../../../domain/use_cases/login_use_case.dart' as _i798;
import '../../../domain/use_cases/singup_use_case.dart' as _i482;
import '../../../ui/screens/auth/login/login_viewmodel.dart' as _i712;
import '../../../ui/screens/auth/signup/singup_viewmodel.dart' as _i212;
import '../../repos/auth_repo/auth_repo_impl.dart' as _i778;
import '../../shared_preferences/shared_preferences.dart' as _i604;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i895.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i604.SharedPref>(() => _i604.SharedPref());
    gh.factory<_i890.AuthRepo>(() => _i778.AuthRepoImpl(
          gh<_i895.Connectivity>(),
          gh<_i604.SharedPref>(),
        ));
    gh.factory<_i798.LoginUseCase>(
        () => _i798.LoginUseCase(gh<_i890.AuthRepo>()));
    gh.factory<_i482.SingupUseCase>(
        () => _i482.SingupUseCase(gh<_i890.AuthRepo>()));
    gh.factory<_i712.LoginViewModel>(
        () => _i712.LoginViewModel(gh<_i798.LoginUseCase>()));
    gh.factory<_i212.SingupViewmodel>(
        () => _i212.SingupViewmodel(gh<_i482.SingupUseCase>()));
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
