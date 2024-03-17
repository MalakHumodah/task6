import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/core/shared/widgets/custom_text_style.dart';
import 'package:task6/features/home/presentation/bloc/home_bloc.dart';
import '../../../../core/shared/widgets/custom_icon_button.dart';
import '../../data/models/product_model.dart';
import '../bloc/home_event.dart';

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
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                productModel.image ?? '',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              productModel.name ?? '',
              style: customTextStyle(
                  size: 17, color: Theme.of(context).primaryColorDark),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: CustomIconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              context.read<HomeBloc>().add(AddToCart(product: productModel));
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
