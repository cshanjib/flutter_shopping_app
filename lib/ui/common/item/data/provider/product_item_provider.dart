import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';
import 'package:injectable/injectable.dart';

abstract class ProductItemProvider {
  Future<List<ProductItem>> getTrendingProducts();

  Future<List<ProductItem>> getTopSellingProducts();

  Future<List<ProductItem>> getFeaturedProducts();
}

@Named("mock")
@Singleton(as: ProductItemProvider)
class MockProductItemProvider implements ProductItemProvider {
  const MockProductItemProvider();

  @override
  Future<List<ProductItem>> getTrendingProducts() async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final Map _data = MockUtil.getTrendingItems();
    return Future.value(
        (_data['data'] as List)?.map((e) => ProductItem.fromJson(e))?.toList());
  }

  @override
  Future<List<ProductItem>> getFeaturedProducts() async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final Map _data = MockUtil.getFeaturedItems();
    return Future.value(
        (_data['data'] as List)?.map((e) => ProductItem.fromJson(e))?.toList());
  }

  @override
  Future<List<ProductItem>> getTopSellingProducts() async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final Map _data = MockUtil.getTopSellingItems();
    return Future.value(
        (_data['data'] as List)?.map((e) => ProductItem.fromJson(e))?.toList());
  }
}

@Singleton(as: ProductItemProvider)
class RealProductItemProvider implements ProductItemProvider {
  const RealProductItemProvider();

  @override
  Future<List<ProductItem>> getTrendingProducts() async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final Map _data = MockUtil.getTrendingItems();
    return Future.value(
        (_data['data'] as List)?.map((e) => ProductItem.fromJson(e))?.toList());
  }

  @override
  Future<List<ProductItem>> getFeaturedProducts() async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final Map _data = MockUtil.getFeaturedItems();
    return Future.value(
        (_data['data'] as List)?.map((e) => ProductItem.fromJson(e))?.toList());
  }

  @override
  Future<List<ProductItem>> getTopSellingProducts() async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final Map _data = MockUtil.getTopSellingItems();
    return Future.value(
        (_data['data'] as List)?.map((e) => ProductItem.fromJson(e))?.toList());
  }
}