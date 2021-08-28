import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/ui/category/bloc/product_category_cubit.dart';
import 'package:flutter_shopping_app/ui/category/category_loader_card.dart';
import 'package:flutter_shopping_app/ui/category/categoryi_item_card.dart';
import 'package:get_it/get_it.dart';

class CategoryList extends StatelessWidget {
  final double topMargin;
  CategoryList({Key key, this.topMargin: 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin),
      child: _wrapWithBloc((context, state) {
        return state.hasNoData
            ? EmptyCard()
            : SizedBox(
                height: 60,
                child: ListView.builder(
                  itemBuilder: (context, index) => index >= state.size
                      ? CategoryLoaderCard(
                          errMsg: state.error,
                          retry: () => _retry(context),
                        )
                      : CategoryItemCard(item: state.items[index]),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.items.length +
                      (state.hasError
                          ? 1
                          : !state.init
                              ? 4
                              : state.loading
                                  ? 2
                                  : 0),
                ));
      }),
    );
  }

  _retry(BuildContext context) {
    context.read<ProductCategoryCubit>().loadCategories();
  }

  Widget _wrapWithBloc(
      Function(BuildContext context, ProductCategoryState state) callback) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<ProductCategoryCubit>()..loadCategories(),
      child: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
        builder: (context, state) => callback(context, state),
      ),
    );
  }
}
