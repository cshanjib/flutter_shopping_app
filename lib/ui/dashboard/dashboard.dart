import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/constant/enum.dart';
import 'package:flutter_shopping_app/ui/category/category_list.dart';
import 'package:flutter_shopping_app/ui/common/base/app_wrapper.dart';
import 'package:flutter_shopping_app/ui/common/carousel/custom_carousel.dart';
import 'package:flutter_shopping_app/ui/common/custom_drawer.dart';
import 'package:flutter_shopping_app/ui/common/form/custom_text_field.dart';
import 'package:flutter_shopping_app/ui/common/item/item_list.dart';
import 'package:flutter_shopping_app/ui/dashboard/user_info.dart';
import 'package:flutter_shopping_app/util/dialog_util.dart';
import 'package:flutter_shopping_app/util/pref_util.dart';

class DashboardLocation extends BeamLocation {
  DashboardLocation({BeamState state}) : super(state);

  @override
  List<String> get pathBlueprints => ['/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('home'),
        title: 'Home',
        child: Dashboard(),
      )
    ];
  }
}

class Dashboard extends StatelessWidget {
  _goToCart(BuildContext context) {
    // ask user to login if they are not already
    if (PrefUtil.isUserLoggedIn()) {
      context.beamToNamed('/cart');
    } else {
      DialogUtil.openLoginPopup(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Shopping App"),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => _goToCart(context))
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: AppWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserInfo(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: CustomTextField(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  placeholder: 'Search ...',
                ),
              ),
              CategoryList(),
              CustomCarousel(),
              ItemList(
                ITEM_TYPE.trending,
                title: "Trending",
              ),
              ItemList(
                ITEM_TYPE.featured,
                title: "Featured",
              ),
              ItemList(
                ITEM_TYPE.topSelling,
                title: "Top Selling",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
