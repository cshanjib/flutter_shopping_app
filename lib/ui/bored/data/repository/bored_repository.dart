import 'package:flutter_shopping_app/ui/bored/data/provider/bored_api_provider.dart';
import 'package:flutter_shopping_app/ui/bored/data/model/bored_entry.dart';
import 'package:injectable/injectable.dart';

@singleton
class BoredRepository {
  final BoaredApiProvider apiProvider;

  BoredRepository(this.apiProvider);

  Future<BoredEntry> handleGetBoredEntry() async {
    return await apiProvider.getBoredEntry();
  }
}
