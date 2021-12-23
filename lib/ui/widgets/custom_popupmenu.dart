import 'package:flutter/material.dart';
import 'package:india_today/logic/bloc/astrologer/astrologer_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.0.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sort By",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              SizedBox(
                height: 1.0.h,
              ),
              Divider(
                color: Colors.black87,
              ),
            ],
          ),
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          groupValue: context.watch<AstrologerBloc>().state.sorting_value,
          value: "ELH",
          title: Text("Experience- low to high"),
          onChanged: (v) {
            if (v != null) {
              context
                  .read<AstrologerBloc>()
                  .add(SortExplowtohigh(toggle: true));
            } else {
              context
                  .read<AstrologerBloc>()
                  .add(SortExplowtohigh(toggle: false));
            }
          },
          toggleable: true,
        ),
        RadioListTile(
          contentPadding: EdgeInsets.all(0),
          groupValue: context.watch<AstrologerBloc>().state.sorting_value,
          value: "EHL",
          title: Text("Experience- high to low"),
          onChanged: (v) {
            if (v != null) {
              context
                  .read<AstrologerBloc>()
                  .add(SortExphightolow(toggle: true));
            } else {
              context
                  .read<AstrologerBloc>()
                  .add(SortExphightolow(toggle: false));
            }
          },
          toggleable: true,
        ),
        RadioListTile(
          contentPadding: EdgeInsets.all(0),
          groupValue: context.watch<AstrologerBloc>().state.sorting_value,
          value: "PLH",
          title: Text("Price- low to high"),
          onChanged: (v) {
            if (v != null) {
              context.read<AstrologerBloc>().add(Pricelowtohigh(toggle: true));
            } else {
              context.read<AstrologerBloc>().add(Pricelowtohigh(toggle: false));
            }
          },
          toggleable: true,
        ),
        RadioListTile(
          contentPadding: EdgeInsets.all(0),
          groupValue: context.watch<AstrologerBloc>().state.sorting_value,
          value: "PHL",
          title: Text("Price- high to low"),
          onChanged: (v) {
            if (v != null) {
              context.read<AstrologerBloc>().add(Pricehightolow(toggle: true));
            } else {
              context.read<AstrologerBloc>().add(Pricehightolow(toggle: false));
            }
          },
          toggleable: true,
        ),
      ],
    );
  }
}
