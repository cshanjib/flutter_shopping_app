import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
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
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        //set up bot toast
        theme: ThemeData(
          primarySwatch: ThemeWhite,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Dashboard(),
          appBar: AppBar(
            centerTitle: false,
            title: Text("Shopping App"),
            elevation: 0,
          ),
          drawer: CustomDrawer(),
        ),
      ),
    );
  }
}
