// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../ui/common/item/bloc/product_item_cubit.dart' as _i5;
import '../ui/common/item/data/model/product_item.dart' as _i6;
import '../ui/common/item/data/provider/product_item_provider.dart' as _i4;
import '../ui/common/item/data/repository/product_item_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ProductItemRepository>(() => _i3.ProductItemRepository(
      provider: get<_i4.ProductItemProvider>(instanceName: 'mock')));
  gh.factoryParam<_i5.ProductItemCubit, _i6.ProductItem, dynamic>((product,
          _) =>
      _i5.ProductItemCubit(get<_i3.ProductItemRepository>(), product: product));
  gh.singleton<_i4.ProductItemProvider>(_i4.MockProductItemProvider(),
      instanceName: 'mock');
  gh.singleton<_i4.ProductItemProvider>(_i4.RealProductItemProvider());
  return get;
}
