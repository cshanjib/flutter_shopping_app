import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/item/data/provider/product_item_provider.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductItemRepository {
  final ProductItemProvider _provider;

  ProductItemRepository(@Named('mock') this._provider);

  Future<List<ProductItem>> getProductList(ITEM_TYPE type) async {
    return type == ITEM_TYPE.featured
        ? _provider.getFeaturedProducts()
        : type == ITEM_TYPE.topSelling
            ? _provider.getTopSellingProducts()
            : type == ITEM_TYPE.trending
                ? _provider.getTrendingProducts()
                : [];
  }
}
