import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/core/shared/widgets/custom_icon_button.dart';
import 'package:task6/core/shared/widgets/custom_text_style.dart';

import '../../data/models/product_model.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class CardView extends StatelessWidget {
  final ProductModel productModel;

  const CardView({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: double.maxFinite,
                child: Image.network(
                  productModel.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    productModel.name ?? '',
                    style: customTextStyle(
                      size: 20,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  CustomIconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(AddToCart(product: productModel));
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
