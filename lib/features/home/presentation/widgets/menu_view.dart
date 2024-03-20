import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/core/shared/widgets/cached_image.dart';
import 'package:task6/core/shared/widgets/custom_text_style.dart';
import 'package:task6/features/cart/presentation/bloc/cart_events.dart';
import 'package:task6/features/cart/presentation/bloc/cart_state.dart';
import '../../../../core/shared/widgets/custom_icon_button.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../data/models/product_model.dart';

class MenuView extends StatelessWidget {
  final ProductModel productModel;

  const MenuView({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedImage(
                    height: 100,
                    width: 150,
                    imageUrl: productModel.image ?? '',
                  ),
                ),
                Text(
                  productModel.name ?? '',
                  style: customTextStyle(
                      size: 17, color: Theme.of(context).primaryColorDark),
                ),
              ],
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                bool itemIsAdded = false;
                try {
                  state.cartProducts.firstWhere((element) => element == productModel);
                  itemIsAdded = true;
                } catch (e) {
                  itemIsAdded = false;
                }
                if (itemIsAdded) {
                  return CustomIconButton(
                      icon: Icon(
                        Icons.remove_shopping_cart_outlined,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        productModel.isAdded = false;
                        context
                            .read<CartBloc>()
                            .add(RemoveProduct(productModel: productModel));
                      });
                } else {
                  return CustomIconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        productModel.isAdded = false;
                        context
                            .read<CartBloc>()
                            .add(AddProduct(productModel: productModel));
                      });
                }
              },
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

