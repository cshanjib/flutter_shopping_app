import 'package:flutter_shopping_app/injectable/config.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.I;

@InjectableInit()
GetIt configureDependencies() => $initGetIt(getIt);
