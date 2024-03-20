import 'package:equatable/equatable.dart';
import '../../../home/data/models/product_model.dart';

enum CartStatus { initial, loading, success }

class CartState extends Equatable {
  final CartStatus cartStatus;
  final List<ProductModel> cartProducts;

  const CartState({
    this.cartProducts = const [],
    this.cartStatus = CartStatus.initial,
  });

  CartState copyWith({
    List<ProductModel>? cartProducts,
    CartStatus? cartStatus,
  }) {
    return CartState(
      cartProducts: cartProducts ?? this.cartProducts,
      cartStatus: cartStatus ?? this.cartStatus,
    );
  }

  @override
  List<Object?> get props => [
        cartProducts,
        cartStatus,
      ];
}
