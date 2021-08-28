// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../ui/bored/bloc/bored_cubit.dart' as _i3;
import '../ui/bored/data/provider/bored_api_provider.dart' as _i11;
import '../ui/bored/data/repository/bored_repository.dart' as _i4;
import '../ui/carousel/bloc/carousel_cubit.dart' as _i5;
import '../ui/carousel/data/provider/carousel_provider.dart' as _i12;
import '../ui/carousel/data/repository/carousel_repository.dart' as _i6;
import '../ui/category/bloc/product_category_cubit.dart' as _i7;
import '../ui/category/data/provider/product_category_provider.dart' as _i13;
import '../ui/category/data/repository/product_category_repository.dart' as _i8;
import '../ui/item/bloc/product_item_cubit.dart' as _i9;
import '../ui/item/data/provider/product_item_provider.dart' as _i14;
import '../ui/item/data/repository/product_item_repository.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BoredCubit>(() => _i3.BoredCubit(get<_i4.BoredRepository>()));
  gh.factory<_i5.CarouselCubit>(
      () => _i5.CarouselCubit(get<_i6.CarouselRepository>()));
  gh.factory<_i7.ProductCategoryCubit>(
      () => _i7.ProductCategoryCubit(get<_i8.ProductCategoryRepository>()));
  gh.factory<_i9.ProductItemCubit>(
      () => _i9.ProductItemCubit(get<_i10.ProductItemRepository>()));
  gh.singleton<_i11.BoaredApiProvider>(_i11.BoaredRealApiProvider());
  gh.singleton<_i11.BoaredApiProvider>(_i11.BoaredMockApiProvider(),
      instanceName: 'mock');
  gh.singleton<_i4.BoredRepository>(
      _i4.BoredRepository(get<_i11.BoaredApiProvider>()));
  gh.singleton<_i12.CarouselProvider>(_i12.MockCarouselProvider(),
      instanceName: 'mock');
  gh.singleton<_i12.CarouselProvider>(_i12.RealCarouselProvider());
  gh.singleton<_i6.CarouselRepository>(
      _i6.CarouselRepository(get<_i12.CarouselProvider>(instanceName: 'mock')));
  gh.singleton<_i13.ProductCategoryProvider>(_i13.MockCategoryItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i13.ProductCategoryProvider>(_i13.RealProductItemProvider());
  gh.singleton<_i8.ProductCategoryRepository>(_i8.ProductCategoryRepository(
      get<_i13.ProductCategoryProvider>(instanceName: 'mock')));
  gh.singleton<_i14.ProductItemProvider>(_i14.MockProductItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i14.ProductItemProvider>(_i14.RealProductItemProvider());
  gh.singleton<_i10.ProductItemRepository>(_i10.ProductItemRepository(
      get<_i14.ProductItemProvider>(instanceName: 'mock')));
  return get;
}
