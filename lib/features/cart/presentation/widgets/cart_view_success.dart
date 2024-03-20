import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/core/shared/widgets/custom_text_style.dart';
import 'package:task6/features/cart/presentation/bloc/cart_state.dart';
import '../bloc/cart_bloc.dart';
import 'cart_product_card.dart';

class CartViewSuccess extends StatelessWidget {
  const CartViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildUi(context),
    );
  }

  Widget _buildUi(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => Visibility(
        visible: state.cartProducts.isNotEmpty,
        replacement: Center(
          child: Text(
            'The cart is Empty',
            style: customTextStyle(size: 30),
          ),
        ),
        child: ListView.builder(
          itemCount: state.cartProducts.length,
          itemBuilder: (context, index) {
            return CartProductCard(
              productModel: state.cartProducts[index],
            );
          },
        ),
      ),
    );
  }
}
