import '../../data/models/product_model.dart';
import 'home_state.dart';

abstract class HomeEvent {}

class GetData extends HomeEvent {}

class ChangeWidgetsView extends HomeEvent {
  final ShowProductsOptions options;

  ChangeWidgetsView({required this.options});
}

class AddToCart extends HomeEvent {
  final ProductModel product;

  AddToCart({required this.product});
}
