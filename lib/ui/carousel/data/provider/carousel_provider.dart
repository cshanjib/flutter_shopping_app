import 'package:flutter_shopping_app/util/mock_util.dart';
import 'package:injectable/injectable.dart';

abstract class CarouselProvider {
  Future<List<String>> getBanners();
}

@Named('mock')
@Singleton(as: CarouselProvider)
class MockCarouselProvider implements CarouselProvider {
  @override
  Future<List<String>> getBanners() async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value(MockUtil.getBanners());
  }
}

@Singleton(as: CarouselProvider)
class RealCarouselProvider implements CarouselProvider {
  @override
  Future<List<String>> getBanners() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
