import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/bloc/token/auth_token_cubit.dart';
import 'package:flutter_shopping_app/constant/color.dart';
import 'package:flutter_shopping_app/injectable/config.dart';
import 'package:flutter_shopping_app/ui/common/custom_drawer.dart';
import 'package:flutter_shopping_app/ui/dashboard/dashboard.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefUtil.loadUserAuthData();
  configureDependencies();
  SystemChrome.setEnabledSystemUIOverlays([
     SystemUiOverlay.bottom, //This line is used for showing the bottom bar
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I.get<AuthTokenCubit>()..update(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          primarySwatch: ThemeWhite,
        ),
        home: Scaffold(
          body: Dashboard(),
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text("Shopping App"),
            centerTitle: false,
          ),
        ),
      ),
    );
  }
}
