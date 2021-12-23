import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:india_today/constants.dart';
import 'package:india_today/logic/bloc/astrologer/astrologer_bloc.dart';
import 'package:india_today/ui/widgets/custom_popupmenu.dart';
import 'package:india_today/ui/widgets/filter_dialog.dart';
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
                      context
                          .read<AstrologerBloc>()
                          .add(AstologerShowSearch(show: true));
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

            if (list.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
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
