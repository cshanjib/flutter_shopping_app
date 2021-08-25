import 'package:flutter_shopping_app/data/provider/dio_api_provider.dart';
import 'package:flutter_shopping_app/ui/bored/data/model/bored_entry.dart';
import 'package:injectable/injectable.dart';

abstract class BoaredApiProvider {
  Future<BoredEntry> getBoredEntry();
}

@Singleton(as: BoaredApiProvider)
class BoaredRealApiProvider extends DioApiProvider
    implements BoaredApiProvider {
  Future<BoredEntry> getBoredEntry() async {
    print("From real api call");
    final _response = await get("https://www.boredapi.com/api/activity");
    return BoredEntry.fromJson(_response.data);
  }
}

@Named("mock")
@Singleton(as: BoaredApiProvider)
class BoaredMockApiProvider implements BoaredApiProvider {
  Future<BoredEntry> getBoredEntry() async {
    //add some daylay to get the feel of api call
    print("From Mock call");
    await Future.delayed(Duration(seconds: 2));
    final _response = {
      "activity": "Shred old documents you don't need anymore",
      "type": "busywork",
      "participants": 1,
      "price": 0,
      "link": "",
      "key": "2430066",
      "accessibility": 0
    };
    return BoredEntry.fromJson(_response);
  }
}
