import 'dart:math';

import 'package:flutter_shopping_app/data/models/paginate.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';
import 'package:injectable/injectable.dart';

abstract class ProductItemProvider {
  Future<ProductItemPaged> getTrendingProducts(int page, {perPage});

  Future<ProductItemPaged> getFeaturedProducts(int page, {perPage});

  Future<ProductItemPaged> getTopSellingProducts(int page, {perPage});

  Future<ProductItem> getProductInfo(int id);
}

@Named("mock")
@Singleton(as: ProductItemProvider)
class MockProductItemProvider implements ProductItemProvider {
  const MockProductItemProvider();

  @override
  Future<ProductItemPaged> getTrendingProducts(int page, {perPage}) async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final List _data = MockUtil.getAllItems()["data"];
    final _filtered =
        _data.where((d) => d['trending'] != null && d['trending']).toList();
    final int _perPage = perPage ?? Paginate.DEFAULT_ITEM_PER_PAGE;
    final int _offset = (page - 1) * _perPage;
    final int _totalSize = (_filtered.length / _perPage).ceil();

    return Future.value(ProductItemPaged(
        page: page,
        data: _filtered
            .sublist(_offset, min(_offset + _perPage, _filtered.length))
            ?.map((e) => ProductItem.fromJson(e))
            ?.toList(),
        hasNext: page < _totalSize,
        hasPrev: page > 1,
        dataCount: _filtered.length,
        totalPages: _totalSize));
  }

  @override
  Future<ProductItemPaged> getFeaturedProducts(int page, {perPage}) async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final List _data = MockUtil.getAllItems()["data"];
    final _filtered =
        _data.where((d) => d['featured'] != null && d['featured']).toList();
    final int _perPage = perPage ?? Paginate.DEFAULT_ITEM_PER_PAGE;
    final int _offset = (page - 1) * _perPage;
    final int _totalSize = (_filtered.length / _perPage).ceil();

    return Future.value(ProductItemPaged(
        page: page,
        data: _filtered
            .sublist(_offset, min(_offset + _perPage, _filtered.length))
            ?.map((e) => ProductItem.fromJson(e))
            ?.toList(),
        hasNext: page < _totalSize,
        hasPrev: page > 1,
        dataCount: _filtered.length,
        totalPages: _totalSize));
  }

  @override
  Future<ProductItemPaged> getTopSellingProducts(int page, {perPage}) async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final List _data = MockUtil.getAllItems()["data"];
    final _filtered =
        _data.where((d) => d['selling'] != null && d['selling']).toList();
    final int _perPage = perPage ?? Paginate.DEFAULT_ITEM_PER_PAGE;
    final int _offset = (page - 1) * _perPage;
    final int _totalSize = (_filtered.length / _perPage).ceil();

    return Future.value(ProductItemPaged(
        page: page,
        data: _filtered
            .sublist(_offset, min(_offset + _perPage, _filtered.length))
            ?.map((e) => ProductItem.fromJson(e))
            ?.toList(),
        hasNext: page < _totalSize,
        hasPrev: page > 1,
        dataCount: _filtered.length,
        totalPages: _totalSize));
  }

  @override
  Future<ProductItem> getProductInfo(int id) async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    final List _data = MockUtil.getAllItems()['data'];
    final Map _item = _data.firstWhere(
        (el) => el["id"] != null && int.tryParse("${el["id"]}") == id,
        orElse: () => null);
    if (_item == null) throw Exception("Item not found.");
    return ProductItem.fromJson(_item);
  }
}

@Singleton(as: ProductItemProvider)
class RealProductItemProvider implements ProductItemProvider {
  const RealProductItemProvider();

  @override
  Future<ProductItem> getProductInfo(int id) {
    // TODO: implement getProductInfo
    throw UnimplementedError();
  }

  @override
  Future<ProductItemPaged> getFeaturedProducts(int page, {perPage}) {
    // TODO: implement getFeaturedProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductItemPaged> getTopSellingProducts(int page, {perPage}) {
    // TODO: implement getTopSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<ProductItemPaged> getTrendingProducts(int page, {perPage}) {
    // TODO: implement getTrendingProducts
    throw UnimplementedError();
  }
}
