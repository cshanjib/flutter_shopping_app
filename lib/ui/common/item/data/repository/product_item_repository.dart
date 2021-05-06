import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/common/item/data/provider/product_item_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductItemRepository {
  final ProductItemProvider _provider;

  const ProductItemRepository({@Named("mock") ProductItemProvider provider})
      : _provider = provider;

  Future<List<ProductItem>> getProductList({ITEM_TYPE type}) async {
    return type == ITEM_TYPE.featured
        ? _provider.getFeaturedProducts()
        : type == ITEM_TYPE.topSelling
            ? _provider.getTopSellingProducts()
            : type == ITEM_TYPE.trending
                ? _provider.getTrendingProducts()
                : Future.value(null);
  }
}
