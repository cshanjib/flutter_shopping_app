import 'package:beamer/beamer.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/injectable/config.dart';
import 'package:flutter_shopping_app/ui/cart/cart.dart';
import 'package:flutter_shopping_app/ui/common/item/detail/item_detail.dart';
import 'package:flutter_shopping_app/ui/dashboard/dashboard.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // load user stored data if any
  await PrefUtil.loadUserAuthData();
  Beamer.setPathUrlStrategy();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
      navigatorObservers: [BotToastNavigatorObserver()],
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [
          DashboardLocation(),
          ItemDetailLocation(),
          UserCartLocation()
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthTokenCubit>(
          create: (context) => GetIt.I.get<AuthTokenCubit>()..init(),
          lazy: false,
        )
      ],
      child: MaterialApp.router(
        title: 'Shopping App Demo',
        debugShowCheckedModeBanner: false,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: routerDelegate),
        builder: BotToastInit(),
        routerDelegate: routerDelegate,
        theme: ThemeData(
          primarySwatch: ThemeWhite,
        ),
      ),
    );
  }
}
