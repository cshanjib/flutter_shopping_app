// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/token/auth_token_cubit.dart' as _i3;
import '../data/provider/user_provider.dart' as _i18;
import '../data/repository/user_repository.dart' as _i9;
import '../ui/auth/login/bloc/login_cubit.dart' as _i8;
import '../ui/bored/bloc/bored_cubit.dart' as _i4;
import '../ui/bored/data/provider/bored_api_provider.dart' as _i14;
import '../ui/bored/data/repository/bored_repository.dart' as _i5;
import '../ui/carousel/bloc/carousel_cubit.dart' as _i6;
import '../ui/carousel/data/provider/carousel_provider.dart' as _i15;
import '../ui/carousel/data/repository/carousel_repository.dart' as _i7;
import '../ui/category/bloc/product_category_cubit.dart' as _i10;
import '../ui/category/data/provider/product_category_provider.dart' as _i16;
import '../ui/category/data/repository/product_category_repository.dart'
    as _i11;
import '../ui/item/bloc/product_item_cubit.dart' as _i12;
import '../ui/item/data/provider/product_item_provider.dart' as _i17;
import '../ui/item/data/repository/product_item_repository.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthTokenCubit>(() => _i3.AuthTokenCubit());
  gh.factory<_i4.BoredCubit>(() => _i4.BoredCubit(get<_i5.BoredRepository>()));
  gh.factory<_i6.CarouselCubit>(
      () => _i6.CarouselCubit(get<_i7.CarouselRepository>()));
  gh.factoryParam<_i8.LoginCubit, _i3.AuthTokenCubit, dynamic>(
      (authTokenCubit, _) => _i8.LoginCubit(
          repository: get<_i9.UserRepository>(),
          authTokenCubit: authTokenCubit));
  gh.factory<_i10.ProductCategoryCubit>(
      () => _i10.ProductCategoryCubit(get<_i11.ProductCategoryRepository>()));
  gh.factory<_i12.ProductItemCubit>(
      () => _i12.ProductItemCubit(get<_i13.ProductItemRepository>()));
  gh.singleton<_i14.BoaredApiProvider>(_i14.BoaredRealApiProvider());
  gh.singleton<_i14.BoaredApiProvider>(_i14.BoaredMockApiProvider(),
      instanceName: 'mock');
  gh.singleton<_i5.BoredRepository>(
      _i5.BoredRepository(get<_i14.BoaredApiProvider>()));
  gh.singleton<_i15.CarouselProvider>(_i15.MockCarouselProvider(),
      instanceName: 'mock');
  gh.singleton<_i15.CarouselProvider>(_i15.RealCarouselProvider());
  gh.singleton<_i7.CarouselRepository>(
      _i7.CarouselRepository(get<_i15.CarouselProvider>(instanceName: 'mock')));
  gh.singleton<_i16.ProductCategoryProvider>(_i16.MockCategoryItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i16.ProductCategoryProvider>(_i16.RealProductItemProvider());
  gh.singleton<_i11.ProductCategoryRepository>(_i11.ProductCategoryRepository(
      get<_i16.ProductCategoryProvider>(instanceName: 'mock')));
  gh.singleton<_i17.ProductItemProvider>(_i17.MockProductItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i17.ProductItemProvider>(_i17.RealProductItemProvider());
  gh.singleton<_i13.ProductItemRepository>(_i13.ProductItemRepository(
      get<_i17.ProductItemProvider>(instanceName: 'mock')));
  gh.singleton<_i18.UserProvider>(_i18.MockUserProvider(),
      instanceName: 'mock');
  gh.singleton<_i18.UserProvider>(_i18.RealUserProvider());
  gh.singleton<_i9.UserRepository>(_i9.UserRepository(
      provider: get<_i18.UserProvider>(instanceName: 'mock')));
  return get;
}
