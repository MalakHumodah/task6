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
    var bloc = context.read<HomeBloc>().state;
    return ListView.builder(
      itemBuilder: (context, index) {
        return bloc.showProductsOptions == ShowProductsOptions.cards
            ? CardView(productModel: bloc.products[index])
            : MenuView(productModel: bloc.products[index]);
      },
      shrinkWrap: true,
      itemCount: bloc.products.length,
    );
  }
}
