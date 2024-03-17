import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/home/data/models/product_model.dart';
import 'package:task6/features/home/presentation/bloc/home_event.dart';
import 'package:task6/features/home/presentation/bloc/home_state.dart';
import 'package:task6/services/shared_service.dart';

import '../../../../core/constants/keys.dart';
import '../../../../core/constants/list_of_images.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetData>(_getData);
    on<ChangeWidgetsView>(_changeWidgetsView);
    on<AddToCart>(_addToCart);

    add(GetData());
  }

  FutureOr<void> _getData(GetData event, Emitter<HomeState> emit) {
    List<ProductModel> products = [];
    for (int i = 0; i < listOfImages.length; i++) {
      products
          .add(ProductModel(image: listOfImages[i], name: 'Product${i + 1}'));
    }
    emit(state.copyWith(products: products));
  }

  FutureOr<void> _changeWidgetsView(
      ChangeWidgetsView event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      showProductsOptions: event.options,
    ));
  }

  FutureOr<void> _addToCart(AddToCart event, Emitter<HomeState> emit) async{
    List<String>? data = [];
    List<String>? encodedData = [];
    List<ProductModel> productList = [];
    data = Prefs.getStringList(cartProductsKey);
    if (data != null) {
      for (var item in data) {
        productList.add(ProductModel.fromJson(json.decode(item)));
      }
    }
    productList.add(event.product);
    // String encodeModel = json.encode(event.product);
    for (var item in productList) {
      encodedData.add(json.encode(item));
    }
    var result = await Prefs.setStringList(cartProductsKey, encodedData);
    log('setStringList : $result');
  }
}
