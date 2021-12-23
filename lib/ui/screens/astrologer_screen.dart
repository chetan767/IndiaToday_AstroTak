import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:india_today/const.dart';
import 'package:india_today/logic/bloc/astrologer/astrologer_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AstrologerScreen extends StatelessWidget {
  static String screen = "/";
  const AstrologerScreen({Key? key}) : super(key: key);

  void show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        builder: (context) {
          return FilterDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.0.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 4.0.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Talk to an Astrologer",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0.sp),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print("start");

                      context
                          .read<AstrologerBloc>()
                          .add(AstologerShowSearch(show: true));
                      print("done");
                    },
                    child: Image.asset(
                      "assets/search.png",
                      width: 5.0.w,
                    ),
                  ),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  InkWell(
                    onTap: () {
                      show(context);
                    },
                    child: Image.asset(
                      "assets/filter.png",
                      width: 5.0.w,
                    ),
                  ),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  CustomPopupMenu(
                    barrierColor: Colors.transparent,
                    showArrow: false,
                    child: Container(
                      child: Image.asset(
                        'assets/sort.png',
                        width: 5.0.w,
                      ),
                    ),
                    pressType: PressType.singleClick,
                    menuBuilder: () => ClipRRect(
                      child: Container(
                        width: 30.0.h,
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Card(child: CustomPopUpMenu()),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 2.0.h,
        ),
        if (context.watch<AstrologerBloc>().state.showSearch == true)
          Container(
            color: Color.fromRGBO(250, 250, 250, 1),
            margin: EdgeInsets.symmetric(horizontal: 2.0.w),
            child: Card(
              elevation: 1,
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromRGBO(250, 250, 250, 1),
                    filled: true,
                    hintText: "Search Astrologer",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.orange,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        print("xyz");

                        context
                            .read<AstrologerBloc>()
                            .add(AstologerShowSearch(show: false));
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.orange,
                      ),
                    )),
                onChanged: (val) {
                  context
                      .read<AstrologerBloc>()
                      .add(AstrologerFilterList(text: val));
                },
              ),
            ),
          ),
        Flexible(
          child: Builder(builder: (context) {
            List<Data> list =
                context.watch<AstrologerBloc>().state.filteredData;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.0.w, vertical: 1.0.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 25.0.w,
                            child: Image.network(
                              list[index].images.medium.imageUrl,
                            ),
                          ),
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 66.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            list[index].firstName +
                                                " " +
                                                list[index].lastName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11.0.sp),
                                          ),
                                          Container(
                                              child: Text(
                                            list[index].experience.toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.language,
                                                color: Colors.orange,
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Container(
                                                width: 50.0.w,
                                                child: Text(
                                                  list[index]
                                                      .skills
                                                      .toString()
                                                      .replaceFirst('[', '')
                                                      .replaceFirst(']', ''),
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10.0.sp,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.language,
                                                color: Colors.orange,
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Text(
                                                list[index]
                                                    .languages
                                                    .toString()
                                                    .replaceFirst('[', '')
                                                    .replaceFirst(']', ''),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10.0.sp),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.language,
                                                color: Colors.orange,
                                              ),
                                              SizedBox(
                                                width: 2.0.w,
                                              ),
                                              Text(
                                                "\$" +
                                                    list[index]
                                                        .additionalPerMinuteCharges
                                                        .toString() +
                                                    "/ Min",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10.0.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.0.h,
                                    ),
                                    Card(
                                      child: Container(
                                        width: 45.0.w,
                                        height: 5.0.h,
                                        color: Colors.orange,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.phone,
                                              size: 18.0.sp,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Talk on Call",
                                              style: TextStyle(
                                                fontSize: 12.0.sp,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }
}

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
            if (v != null)
              context
                  .read<AstrologerBloc>()
                  .add(SortExplowtohigh(toggle: true));
            else
              context
                  .read<AstrologerBloc>()
                  .add(SortExplowtohigh(toggle: false));
          },
          toggleable: true,
        ),
        RadioListTile(
          contentPadding: EdgeInsets.all(0),
          groupValue: context.watch<AstrologerBloc>().state.sorting_value,
          value: "EHL",
          title: Text("Experience- high to low"),
          onChanged: (v) {
            if (v != null)
              context
                  .read<AstrologerBloc>()
                  .add(SortExphightolow(toggle: true));
            else
              context
                  .read<AstrologerBloc>()
                  .add(SortExphightolow(toggle: false));
          },
          toggleable: true,
        ),
        RadioListTile(
          contentPadding: EdgeInsets.all(0),
          groupValue: context.watch<AstrologerBloc>().state.sorting_value,
          value: "PLH",
          title: Text("Price- low to high"),
          onChanged: (v) {
            if (v != null)
              context.read<AstrologerBloc>().add(Pricelowtohigh(toggle: true));
            else
              context.read<AstrologerBloc>().add(Pricelowtohigh(toggle: false));
          },
          toggleable: true,
        ),
        RadioListTile(
          contentPadding: EdgeInsets.all(0),
          groupValue: context.watch<AstrologerBloc>().state.sorting_value,
          value: "PHL",
          title: Text("Price- high to low"),
          onChanged: (v) {
            if (v != null)
              context.read<AstrologerBloc>().add(Pricehightolow(toggle: true));
            else
              context.read<AstrologerBloc>().add(Pricehightolow(toggle: false));
          },
          toggleable: true,
        ),
      ],
    );
  }
}

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
