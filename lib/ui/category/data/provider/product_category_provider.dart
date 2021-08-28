import 'package:flutter_shopping_app/ui/category/data/models/category_item.dart';
import 'package:flutter_shopping_app/util/mock_util.dart';
import 'package:injectable/injectable.dart';

abstract class ProductCategoryProvider {
  Future<List<CategoryItem>> getCategories();
}

@Named('mock')
@Singleton(as: ProductCategoryProvider)
class MockCategoryItemProvider implements ProductCategoryProvider {
  @override
  Future<List<CategoryItem>> getCategories() async {
    await Future.delayed(Duration(seconds: 4));
    final _data = MockUtil.getCategories();
    return _data.map((entry) => CategoryItem.fromJson(entry)).toList();
  }
}

@Singleton(as: ProductCategoryProvider)
class RealProductItemProvider implements ProductCategoryProvider {
  @override
  Future<List<CategoryItem>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
