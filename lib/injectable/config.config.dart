// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../ui/bored/bloc/bored_cubit.dart' as _i3;
import '../ui/bored/data/provider/bored_api_provider.dart' as _i9;
import '../ui/bored/data/repository/bored_repository.dart' as _i4;
import '../ui/category/bloc/product_category_cubit.dart' as _i5;
import '../ui/category/data/provider/product_category_provider.dart' as _i10;
import '../ui/category/data/repository/product_category_repository.dart' as _i6;
import '../ui/item/bloc/product_item_cubit.dart' as _i7;
import '../ui/item/data/provider/product_item_provider.dart' as _i11;
import '../ui/item/data/repository/product_item_repository.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BoredCubit>(() => _i3.BoredCubit(get<_i4.BoredRepository>()));
  gh.factory<_i5.ProductCategoryCubit>(
      () => _i5.ProductCategoryCubit(get<_i6.ProductCategoryRepository>()));
  gh.factory<_i7.ProductItemCubit>(
      () => _i7.ProductItemCubit(get<_i8.ProductItemRepository>()));
  gh.singleton<_i9.BoaredApiProvider>(_i9.BoaredRealApiProvider());
  gh.singleton<_i9.BoaredApiProvider>(_i9.BoaredMockApiProvider(),
      instanceName: 'mock');
  gh.singleton<_i4.BoredRepository>(
      _i4.BoredRepository(get<_i9.BoaredApiProvider>()));
  gh.singleton<_i10.ProductCategoryProvider>(_i10.MockCategoryItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i10.ProductCategoryProvider>(_i10.RealProductItemProvider());
  gh.singleton<_i6.ProductCategoryRepository>(_i6.ProductCategoryRepository(
      get<_i10.ProductCategoryProvider>(instanceName: 'mock')));
  gh.singleton<_i11.ProductItemProvider>(_i11.MockProductItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i11.ProductItemProvider>(_i11.RealProductItemProvider());
  gh.singleton<_i8.ProductItemRepository>(_i8.ProductItemRepository(
      get<_i11.ProductItemProvider>(instanceName: 'mock')));
  return get;
}
