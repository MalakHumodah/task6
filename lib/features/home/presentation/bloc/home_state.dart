import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';

enum ShowProductsOptions { menu, cards }

class HomeState extends Equatable {
  final List<ProductModel> products;
  final ShowProductsOptions showProductsOptions;

  const HomeState({
    this.products = const [],
    this.showProductsOptions = ShowProductsOptions.menu,
  });

  HomeState copyWith({
    List<ProductModel>? products,
    ShowProductsOptions? showProductsOptions,
  }) {
    return HomeState(
      products: products ?? this.products,
      showProductsOptions: showProductsOptions ?? this.showProductsOptions,
    );
  }

  @override
  List<Object?> get props => [products,showProductsOptions];
}
