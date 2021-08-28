import 'package:flutter_shopping_app/ui/category/data/models/category_item.dart';
import 'package:flutter_shopping_app/ui/category/data/provider/product_category_provider.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductCategoryRepository {
  final ProductCategoryProvider _provider;

  ProductCategoryRepository(@Named('mock') this._provider);

  Future<List<CategoryItem>> getCategoryList() async {
    return _provider.getCategories();
  }
}
