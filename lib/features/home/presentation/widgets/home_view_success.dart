import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:task6/features/cart/presentation/bloc/cart_state.dart';
import 'package:task6/features/home/presentation/bloc/home_bloc.dart';
import 'package:task6/features/home/presentation/widgets/show_products.dart';
import '../../../../core/shared/widgets/custom_text_style.dart';
import '../../../cart/presentation/views/cart_screen.dart';
import 'custom_segmented_button.dart';

class HomeViewSuccess extends StatelessWidget {
  const HomeViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
          builder: (BuildContext context, state) {
        return FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartScreen()));
          },
          child: Badge(
            label: Text(state.cartProducts.length.toString()),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
            ),
          ),
        );
      }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Products',
                    style: customTextStyle(
                      size: 25,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  CustomSegmentedButton(
                    showProductsOptions:
                        context.read<HomeBloc>().state.showProductsOptions,
                  ),
                ],
              ),
              Expanded(child: ShowProducts()),
            ],
          ),
        ),
      ),
    );
  }
}
