import 'package:equatable/equatable.dart';

import '../../../home/data/models/product_model.dart';

class CartState extends Equatable {
  final List<ProductModel> cartProducts;

  const CartState({this.cartProducts = const []});

  CartState copyWith({List<ProductModel>? cartProducts}) {
    return CartState(
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }

  @override
  List<Object?> get props => [cartProducts];
}
