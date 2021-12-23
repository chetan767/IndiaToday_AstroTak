import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:india_today/logic/bloc/astrologer/astrologer_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  GroupController? controller;
  GroupController? controller2;

  @override
  void initState() {
    controller = GroupController(
        isMultipleSelection: true,
        initSelectedItem: context.read<AstrologerBloc>().state.lang_values);

    controller2 = GroupController(
        isMultipleSelection: true,
        initSelectedItem: context.read<AstrologerBloc>().state.skill_values);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Color.fromRGBO(236, 237, 240, 1),
            padding: EdgeInsets.all(10),
            child: Text(
              "Filter by language",
              style: TextStyle(color: Colors.black, fontSize: 12.0.sp),
            ),
          ),
          SizedBox(
            height: 1.0.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SimpleGroupedChips<Language>(
              controller: controller!,
              values: Constants.lang_values,
              itemTitle: Constants.lang_values.map((e) => e.name).toList(),
              chipGroupStyle: ChipGroupStyle.minimize(
                backgroundColorItem: Color.fromRGBO(236, 237, 240, 1),
                selectedIcon: null,
                selectedColorItem: Colors.orange,
                itemTitleStyle:
                    TextStyle(fontSize: 12.0.sp, color: Colors.white),
              ),
              onItemSelected: (values) {
                List<Language> list = values as List<Language>;
                print(list);
                context
                    .read<AstrologerBloc>()
                    .add(AstrologerFilterLang(lang: list));
              },
            ),
          ),
          SizedBox(
            height: 1.0.h,
          ),
          Container(
            width: double.infinity,
            color: Color.fromRGBO(236, 237, 240, 1),
            padding: EdgeInsets.all(10),
            child: Text(
              "Filter by Skills",
              style: TextStyle(color: Colors.black, fontSize: 12.0.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SimpleGroupedChips<Skill>(
              controller: controller2!,
              values: Constants.skill_values,
              itemTitle: Constants.skill_values.map((e) => e.name).toList(),
              chipGroupStyle: ChipGroupStyle.minimize(
                backgroundColorItem: Color.fromRGBO(236, 237, 240, 1),
                selectedIcon: null,
                selectedColorItem: Colors.orange,
                itemTitleStyle:
                    TextStyle(fontSize: 12.0.sp, color: Colors.white),
              ),
              onItemSelected: (values) {
                List<Skill> list = values as List<Skill>;
                print(list);
                context
                    .read<AstrologerBloc>()
                    .add(AstrologerFilterSkill(skills: list));
              },
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  context.read<AstrologerBloc>().add(AstrologerFilterBy());
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30.0.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Apply",
                    style: TextStyle(fontSize: 12.0.sp, color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
