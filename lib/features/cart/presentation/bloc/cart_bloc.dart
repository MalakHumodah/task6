import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/cart/presentation/bloc/cart_events.dart';
import 'package:task6/features/cart/presentation/bloc/cart_state.dart';
import 'package:task6/services/shared_service.dart';

import '../../../../core/constants/keys.dart';
import '../../../home/data/models/product_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<GetCartProducts>(_getCartProduct);
    on<RemoveProduct>(_removeProduct);
    // add(GetCartProducts());
  }

  FutureOr<FutureOr> _getCartProduct(
      GetCartProducts event, Emitter<CartState> emit) async {
    List<String>? data = [];
    List<ProductModel> productList = [];

    data = Prefs.getStringList(cartProductsKey);
    log('data :$data');
    if (data != null) {
      for (var item in data) {
        productList.add(ProductModel.fromJson(json.decode(item)));
      }
      emit(state.copyWith(cartProducts: productList));
    }
  }

  FutureOr<void> _removeProduct(
      RemoveProduct event, Emitter<CartState> emit) async {
    List<ProductModel> newList = [];
    newList.addAll(state.cartProducts);
    newList.remove(event.productModel);
    List<String>? encodedData = [];

    for (var item in newList) {
      encodedData.add(json.encode(item));
    }

    var result = await Prefs.setStringList(cartProductsKey, encodedData);
    log('RemoveProduct : $result');
  }
}
