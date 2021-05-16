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

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Shopping App"),
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: AppWrapper(
          child: Column(
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
