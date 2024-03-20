import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
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
    on<AddProduct>(_addProduct);

    add(GetCartProducts());
  }

  FutureOr<FutureOr> _getCartProduct(
      GetCartProducts event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartStatus: CartStatus.loading));
    List<ProductModel> productList = [];

    List<String>? data = Prefs.getStringList(cartProductsKey);

    if (data != null) {
      for (var item in data) {
        productList.add(ProductModel.fromJson(json.decode(item)));
      }

      emit(
        state.copyWith(
          cartProducts: productList,
          cartStatus: CartStatus.success,
        ),
      );
    }
  }

  FutureOr<void> _removeProduct(
      RemoveProduct event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartStatus: CartStatus.loading));

    List<ProductModel> newList = [];
    newList.addAll(state.cartProducts);
    newList.remove(event.productModel);

    List<String>? encodedData = [];

    for (var item in newList) {
      encodedData.add(json.encode(item));
    }

    var isRemoved = await Prefs.setStringList(cartProductsKey, encodedData);

    if (isRemoved) {
      emit(state.copyWith(
        cartProducts: newList,
        cartStatus: CartStatus.success,
      ));
      scaffoldGlobalKey.currentState!
          .showSnackBar(SnackBar(content: Text('The product is removed')));
    }
  }

  FutureOr<void> _addProduct(
    AddProduct event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(cartStatus: CartStatus.loading));
    List<ProductModel> newList = [];
    List<String>? encodedData = [];
    newList.addAll(state.cartProducts);
    newList.add(event.productModel);

    for (var item in newList) {
      encodedData.add(json.encode(item));
    }

    var result = await Prefs.setStringList(cartProductsKey, encodedData);
    if (result) {
      emit(state.copyWith(
        cartProducts: newList,
        cartStatus: CartStatus.success,
      ));
      scaffoldGlobalKey.currentState!.showSnackBar(
          SnackBar(content: Text('The Product is Added to Cart')));
    }
  }
}
