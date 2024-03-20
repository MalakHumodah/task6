import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/home/data/models/product_model.dart';
import 'package:task6/features/home/presentation/bloc/home_event.dart';
import 'package:task6/features/home/presentation/bloc/home_state.dart';
import '../../../../core/constants/keys.dart';
import '../../../../core/constants/list_of_images.dart';
import '../../../../services/shared_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetData>(_getData);
    on<ChangeWidgetsView>(_changeWidgetsView);
    add(GetData());
  }

  FutureOr<void> _getData(GetData event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    List<ProductModel> productList = [];
    List<ProductModel> sharedList = [];

    List<String>? data = Prefs.getStringList(cartProductsKey);
    if (data != null) {
      for (var item in data) {
        sharedList.add(ProductModel.fromJson(json.decode(item)));
      }
    }

    for (int i = 0; i < listOfImages.length; i++) {
      productList.add(ProductModel(
        image: listOfImages[i],
        name: 'Product${i + 1}',
      ));
    }

    // for (int i = 0; i < productList.length; i++) {
    //   for (var item in sharedList) {
    //     if (item.name == productList[i].name) {
    //       productList[i].isAdded = item.isAdded;
    //     }
    //   }
    // }



    emit(state.copyWith(
      products: productList,
      homeStatus: HomeStatus.success,
    ));
  }

  FutureOr<void> _changeWidgetsView(
      ChangeWidgetsView event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        showProductsOptions: event.options,
      ),
    );
  }
}
