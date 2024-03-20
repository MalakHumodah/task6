import 'home_state.dart';

abstract class HomeEvent {}

class GetData extends HomeEvent {}

class ChangeWidgetsView extends HomeEvent {
  final ShowProductsOptions options;

  ChangeWidgetsView({required this.options});
}

