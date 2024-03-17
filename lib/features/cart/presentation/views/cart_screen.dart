import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:task6/features/cart/presentation/bloc/cart_state.dart';

import '../bloc/cart_events.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<CartBloc>();
    bloc.add(GetCartProducts());
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: bloc.state.cartProducts.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(bloc.state.cartProducts[index].name ?? ''),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
