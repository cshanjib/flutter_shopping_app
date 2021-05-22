import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/ui/common/base/app_wrapper.dart';
import 'package:flutter_shopping_app/ui/common/custom_drawer.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';

class UserCartLocation extends BeamLocation {
  UserCartLocation({BeamState state}) : super(state);

  @override
  List<String> get pathBlueprints => ['/cart'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('cart'),
        title: 'User Cart',
        child: UserCart(),
      )
    ];
  }

  @override
  List<BeamGuard> get guards => [
        // allow user to navigate to cart page only if they are logged in
        BeamGuard(
            pathBlueprints: ['/cart'],
            check: (context, location) => PrefUtil.isUserLoggedIn(),
            beamToNamed: "/"),
      ];
}

class UserCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white60,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: false,
            title: Text("User Cart"),
            elevation: 0,
          ),
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
            child: AppWrapper(
              child: Column(
                children: [Text("This is the cart page.")],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
