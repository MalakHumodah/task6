import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

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
