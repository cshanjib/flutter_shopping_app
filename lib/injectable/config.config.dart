// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../ui/bored/bloc/bored_cubit.dart' as _i3;
import '../ui/bored/data/provider/bored_api_provider.dart' as _i7;
import '../ui/bored/data/repository/bored_repository.dart' as _i4;
import '../ui/item/bloc/product_item_cubit.dart' as _i5;
import '../ui/item/data/provider/product_item_provider.dart' as _i8;
import '../ui/item/data/repository/product_item_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BoredCubit>(() => _i3.BoredCubit(get<_i4.BoredRepository>()));
  gh.factory<_i5.ProductItemCubit>(
      () => _i5.ProductItemCubit(get<_i6.ProductItemRepository>()));
  gh.singleton<_i7.BoaredApiProvider>(_i7.BoaredRealApiProvider());
  gh.singleton<_i7.BoaredApiProvider>(_i7.BoaredMockApiProvider(),
      instanceName: 'mock');
  gh.singleton<_i4.BoredRepository>(
      _i4.BoredRepository(get<_i7.BoaredApiProvider>()));
  gh.singleton<_i8.ProductItemProvider>(_i8.MockProductItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i8.ProductItemProvider>(_i8.RealProductItemProvider());
  gh.singleton<_i6.ProductItemRepository>(_i6.ProductItemRepository(
      get<_i8.ProductItemProvider>(instanceName: 'mock')));
  return get;
}
