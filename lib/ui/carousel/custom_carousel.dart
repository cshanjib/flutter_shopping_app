import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_app/ui/carousel/bloc/carousel_cubit.dart';
import 'package:flutter_shopping_app/ui/carousel/carousel_loader_card.dart';
import 'package:get_it/get_it.dart';

class CustomCarousel extends StatelessWidget {
  final double topMargin;
  CustomCarousel({Key key, this.topMargin: 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin),
      child: _wrapWithBloc((context, state) {
        return CarouselSlider.builder(
            itemCount: state.size +
                (state.hasError || state.loading || state.hasNoData ? 1 : 0),
            itemBuilder: (context, index, i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: index >= state.size
                      ? CarouselLoaderCard(
                          errMsg: state.error,
                          retry: () => _retry(context),
                          isEmpty: state.hasNoData,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            state.items[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                ),
            options: CarouselOptions(
                autoPlay:
                    (!state.hasError && !state.loading && !state.hasNoData),
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                autoPlayInterval: Duration(seconds: 20),
                aspectRatio: 3,
                viewportFraction: 1));
      }),
    );
  }

  Widget _wrapWithBloc(
      Function(BuildContext context, CarouselState state) callback) {
    return BlocProvider(
      create: (context) => GetIt.I.get<CarouselCubit>()..loadBanners(),
      child: BlocBuilder<CarouselCubit, CarouselState>(
        builder: (context, state) => callback(context, state),
      ),
    );
  }

  _retry(BuildContext context) {
    context.read<CarouselCubit>().loadBanners();
  }
}
