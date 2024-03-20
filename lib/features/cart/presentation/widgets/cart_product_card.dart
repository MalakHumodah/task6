import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/cached_image.dart';
import '../../../../core/shared/widgets/custom_icon_button.dart';
import '../../../../core/shared/widgets/custom_text_style.dart';
import '../../../home/data/models/product_model.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_events.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel productModel;

  const CartProductCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CachedImage(
                width: double.maxFinite,
                imageUrl: productModel.image ?? '',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productModel.name ?? '',
                    style: customTextStyle(
                      size: 20,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  CustomIconButton(
                    icon: Icon(Icons.remove_shopping_cart_outlined),
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(RemoveProduct(productModel: productModel));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
