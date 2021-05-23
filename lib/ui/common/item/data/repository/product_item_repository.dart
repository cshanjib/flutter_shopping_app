import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/common/item/data/model/product_item.dart';
import 'package:flutter_shopping_app/ui/common/item/data/provider/product_item_provider.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductItemRepository {
  final ProductItemProvider _provider;

  const ProductItemRepository({@Named("mock") ProductItemProvider provider})
      : _provider = provider;

  Future<ProductItemPaged> getProductList(int page,
      {ITEM_TYPE type, int perPage}) async {
    return type == ITEM_TYPE.featured
        ? _provider.getFeaturedProducts(page, perPage: perPage)
        : type == ITEM_TYPE.topSelling
            ? _provider.getTopSellingProducts(page, perPage: perPage)
            : type == ITEM_TYPE.trending
                ? _provider.getTrendingProducts(page, perPage: perPage)
                : Future.value(null);
  }

  Future<ProductItem> getProductDetail(int id) async {
    return await _provider.getProductInfo(id);
  }
}
