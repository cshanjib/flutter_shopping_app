import 'package:flutter_shopping_app/injectable/config.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
final getIt = GetIt.instance;
@injectableInit
GetIt configureDependencies() => $initGetIt(getIt);