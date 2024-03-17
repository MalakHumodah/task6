import 'package:task6/features/home/data/models/product_model.dart';

abstract class CartEvent {}

class GetCartProducts extends CartEvent {}

class RemoveProduct extends CartEvent {
  final ProductModel productModel;

  RemoveProduct({required this.productModel});
}
