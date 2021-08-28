
import 'package:flutter_shopping_app/ui/bored/data/provider/bored_api_provider.dart';


main() async{
  var url1 = "https://official-joke-api.appspot.com/jokes/ten";
  var url2 = "https://api.zippopotam.us/us/90210";
  var url3 = "https://api.spotify.com/v1/albums";
  var url4 = "https://www.boredapi.com/api/activity";
  var url5 = "https://randomuser.me/api/";

  var _uri = Uri.parse(url3);

  await _testUrl(_uri);
}

_testUrl(Uri uri) async {
  print("Testing Http");
  BoaredApiProvider _apiProvider = BoaredRealApiProvider();

  print(await _apiProvider.getBoredEntry());
}


