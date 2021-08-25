import 'package:flutter_shopping_app/ui/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';
import 'package:injectable/injectable.dart';

abstract class ProductItemProvider {
  Future<List<ProductItem>> getTrendingProducts();

  Future<List<ProductItem>> getTopSellingProducts();

  Future<List<ProductItem>> getFeaturedProducts();
}

@Named('mock')
@Singleton(as: ProductItemProvider)
class MockProductItemProvider implements ProductItemProvider {
  @override
  Future<List<ProductItem>> getTrendingProducts() async {
    await Future.delayed(Duration(seconds: 4));
    final _data = MockUtil.getAllProducts();
    final List _filtered =
        (_data['data'] as List).where((entry) => entry['trending']).toList();
    return _filtered.map((entry) => ProductItem.fromJson(entry)).toList();
  }

  @override
  Future<List<ProductItem>> getFeaturedProducts() async {
    await Future.delayed(Duration(seconds: 4));
    final _data = MockUtil.getAllProducts();
    final List _filtered =
        (_data['data'] as List).where((entry) => entry['featured']).toList();
    return _filtered.map((entry) => ProductItem.fromJson(entry)).toList();
  }

  @override
  Future<List<ProductItem>> getTopSellingProducts() async {
    await Future.delayed(Duration(seconds: 4));
    final _data = MockUtil.getAllProducts();
    final List _filtered =
        (_data['data'] as List).where((entry) => entry['selling']).toList();
    return _filtered.map((entry) => ProductItem.fromJson(entry)).toList();
  }
}

@Singleton(as: ProductItemProvider)
class RealProductItemProvider implements ProductItemProvider {
  @override
  Future<List<ProductItem>> getTrendingProducts() {
    // TODO: implement getTrendingProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductItem>> getFeaturedProducts() {
    // TODO: implement getFeaturedProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductItem>> getTopSellingProducts() {
    // TODO: implement getTopSellingProducts
    throw UnimplementedError();
  }
}
