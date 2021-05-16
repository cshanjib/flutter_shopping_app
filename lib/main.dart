import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/injectable/config.dart';
import 'package:flutter_shopping_app/helper/responsive_helper.dart';
import 'package:flutter_shopping_app/ui/common/custom_drawer.dart';
import 'package:flutter_shopping_app/ui/common/item/detail/item_detail.dart';
import 'package:flutter_shopping_app/ui/dashboard/dashboard.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // load user stored data if any
  await PrefUtil.loadUserAuthData();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthTokenCubit>(
          create: (context) => GetIt.I.get<AuthTokenCubit>()..init(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Shopping App Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return MaterialPageRoute(
                builder: (context) => Dashboard(), settings: settings);
          }
          var uri = Uri.parse(settings.name);
          if (uri.pathSegments.length == 2 &&
              uri.pathSegments.first == 'items') {
            int id = int.tryParse(uri.pathSegments[1]);
            return MaterialPageRoute(
                builder: (context) => ItemDetail(
                      settings.arguments,
                      id: id,
                    ),
                settings: settings);
          }

          return MaterialPageRoute(builder: (context) => Text("404"));
        },

        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        //set up bot toast
        theme: ThemeData(
          primarySwatch: ThemeWhite,
        ),
      ),
    );
  }
}
