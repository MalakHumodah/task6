import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/core/shared/widgets/custom_text_style.dart';
import 'package:task6/features/cart/presentation/views/cart_screen.dart';
import 'package:task6/features/home/presentation/bloc/home_bloc.dart';
import 'package:task6/features/home/presentation/bloc/home_state.dart';
import '../../../../core/shared/widgets/custom_icon_button.dart';
import '../bloc/home_event.dart';
import '../widgets/show_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              children: [
                CustomIconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                ),
                Row(
                  children: [
                    Text(
                      'All Products',
                      style: customTextStyle(
                        size: 25,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomSegmentedButton(
                      showProductsOptions: state.showProductsOptions,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ShowProducts(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CustomSegmentedButton extends StatelessWidget {
  final ShowProductsOptions showProductsOptions;

  const CustomSegmentedButton({
    super.key,
    required this.showProductsOptions,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ShowProductsOptions>(
      segments: <ButtonSegment<ShowProductsOptions>>[
        buttonSegment(
          option: ShowProductsOptions.menu,
          icon: Icon(Icons.view_agenda_outlined),
        ),
        buttonSegment(
          option: ShowProductsOptions.cards,
          icon: Icon(Icons.grid_view),
        ),
      ],
      selected: <ShowProductsOptions>{showProductsOptions},
      onSelectionChanged: (newSelection) {
        context.read<HomeBloc>().add(ChangeWidgetsView(
              options: newSelection.single,
            ));
        //change option from bloc
      },
    );
  }
}

ButtonSegment<ShowProductsOptions> buttonSegment({
  required ShowProductsOptions option,
  required Icon icon,
}) {
  return ButtonSegment<ShowProductsOptions>(
    value: option,
    icon: icon,
  );
}
