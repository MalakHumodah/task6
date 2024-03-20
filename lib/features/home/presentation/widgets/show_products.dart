import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/home/presentation/bloc/home_bloc.dart';
import 'package:task6/features/home/presentation/bloc/home_state.dart';
import 'package:task6/features/home/presentation/widgets/cards_view.dart';
import 'package:task6/features/home/presentation/widgets/menu_view.dart';

class ShowProducts extends StatelessWidget {
  const ShowProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return state.showProductsOptions == ShowProductsOptions.cards
              ? CardView(productModel: state.products[index])
              : MenuView(productModel: state.products[index]);
        },
        shrinkWrap: true,
        itemCount: state.products.length,
      );
    });
  }
}
