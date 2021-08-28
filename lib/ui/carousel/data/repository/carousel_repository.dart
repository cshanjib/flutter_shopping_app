import 'package:flutter_shopping_app/ui/carousel/data/provider/carousel_provider.dart';
import 'package:injectable/injectable.dart';

@singleton
class CarouselRepository {
  final CarouselProvider _provider;

  CarouselRepository(@Named('mock') this._provider);

  Future<List<String>> getBannerList() async {
    return await _provider.getBanners();
  }
}
