import 'package:equatable/equatable.dart';
import '../../data/models/product_model.dart';

enum ShowProductsOptions { menu, cards }

enum HomeStatus { initial, loading, success }

class HomeState extends Equatable {
  final HomeStatus homeStatus;
  final List<ProductModel> products;
  final ShowProductsOptions showProductsOptions;

  const HomeState({
    this.products = const [],
    this.showProductsOptions = ShowProductsOptions.menu,
    this.homeStatus = HomeStatus.initial,
  });

  HomeState copyWith({
    List<ProductModel>? products,
    ShowProductsOptions? showProductsOptions,
    HomeStatus? homeStatus,
  }) {
    return HomeState(
      products: products ?? this.products,
      showProductsOptions: showProductsOptions ?? this.showProductsOptions,
      homeStatus: homeStatus ?? this.homeStatus,
    );
  }

  @override
  List<Object?> get props => [
        products,
        showProductsOptions,
        homeStatus,
      ];
}
