// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/token/auth_token_cubit.dart' as _i3;
import '../data/provider/user_provider.dart' as _i7;
import '../data/repository/user_repository.dart' as _i6;
import '../ui/auth/login/bloc/login_cubit.dart' as _i9;
import '../ui/common/item/bloc/product_item_cubit.dart' as _i10;
import '../ui/common/item/data/model/product_item.dart' as _i11;
import '../ui/common/item/data/provider/product_item_provider.dart' as _i5;
import '../ui/common/item/data/repository/product_item_repository.dart' as _i4;
import '../ui/common/item/detail/bloc/item_detail_cubit.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthTokenCubit>(() => _i3.AuthTokenCubit());
  gh.factory<_i4.ProductItemRepository>(() => _i4.ProductItemRepository(
      provider: get<_i5.ProductItemProvider>(instanceName: 'mock')));
  gh.factory<_i6.UserRepository>(() => _i6.UserRepository(
      provider: get<_i7.UserProvider>(instanceName: 'mock')));
  gh.factory<_i8.ItemDetailCubit>(
      () => _i8.ItemDetailCubit(get<_i4.ProductItemRepository>()));
  gh.factoryParam<_i9.LoginCubit, _i3.AuthTokenCubit, dynamic>(
      (authTokenCubit, _) => _i9.LoginCubit(
          userRepository: get<_i6.UserRepository>(),
          authTokenCubit: authTokenCubit));
  gh.factoryParam<_i10.ProductItemCubit, _i11.ProductItem, dynamic>(
      (product, _) => _i10.ProductItemCubit(get<_i4.ProductItemRepository>(),
          product: product));
  gh.singleton<_i5.ProductItemProvider>(_i5.MockProductItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i5.ProductItemProvider>(_i5.RealProductItemProvider());
  gh.singleton<_i7.UserProvider>(_i7.MockUserProvider(), instanceName: 'mock');
  return get;
}
