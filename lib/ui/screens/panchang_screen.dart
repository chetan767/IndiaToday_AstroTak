import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:india_today/logic/bloc/panchang/panchang_bloc.dart';
import 'package:india_today/my_flutter_app_icons.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sizer/sizer.dart';
import 'package:india_today/logic/bloc/location_state.dart';
import 'package:india_today/logic/repository.dart';

class PanchangScreen extends StatelessWidget {
  DateTime currentDate = DateTime.now();
  SuggestionsBoxController suggestionsBoxController =
      SuggestionsBoxController();
  final TextEditingController typeAheadController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2023));
    if (pickedDate != null && pickedDate != currentDate) {
      context.read<PanchangBloc>().add(PanchangGetTime(time: pickedDate));
      String place_id = context.read<PanchangBloc>().state.place_id;
      if (place_id != "") {
        context.read<PanchangBloc>().add(PanchangShow(place_id: place_id));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 8.0.h,
          right: 4.0.w,
          child: FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {},
            child: Icon(Icons.menu),
          ),
        ),
        SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              try {
                suggestionsBoxController.close();
              } catch (e) {}
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 15.0.sp,
                        ),
                        SizedBox(
                          width: 2.0.w,
                        ),
                        Text(
                          "Daily Panchang",
                          style: TextStyle(
                              fontSize: 14.0.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Container(
                      child: Text(
                        "India is a country known for its festival but knowing the exact dates can sometimes be diificult. To ensure you do not miss out on the critical dates we bring you the daily panachang",
                        style:
                            TextStyle(color: Colors.black54, fontSize: 9.0.sp),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Container(
                      color: Color.fromRGBO(255, 241, 232, 1),
                      height: 18.0.h,
                      padding: EdgeInsets.only(left: 5.0.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 22.0.w,
                                  child: Text(
                                    "Date:",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(fontSize: 12.0.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 4.0.w,
                                ),
                                Container(
                                  color: Colors.white,
                                  width: 60.0.w,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.0.h, horizontal: 2.0.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          Jiffy(context
                                                  .watch<PanchangBloc>()
                                                  .state
                                                  .time)
                                              .format("do MMMM, yyyy"),
                                          style: TextStyle(fontSize: 12.0.sp),
                                        ),
                                      ),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 22.0.w,
                                child: Text(
                                  "Location :",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontSize: 12.0.sp),
                                ),
                              ),
                              SizedBox(
                                width: 4.0.w,
                              ),
                              Container(
                                  color: Colors.white,
                                  width: 60.0.w,
                                  // padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: TypeAheadField<LocationData>(
                                      suggestionsBoxController:
                                          suggestionsBoxController,
                                      textFieldConfiguration:
                                          TextFieldConfiguration(
                                              controller: typeAheadController,
                                              decoration: InputDecoration(
                                                  hintText: "location",
                                                  border: InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 2.0.w,
                                                          vertical: 12),
                                                  suffixIcon: InkWell(
                                                    onTap: () {
                                                      suggestionsBoxController
                                                          .close();
                                                    },
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 1.5.w),
                                                        child: const Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.black,
                                                        )),
                                                  ))),
                                      suggestionsCallback: (pattern) async {
                                        return await PanchangLocationRespository
                                            .getData(pattern);
                                      },
                                      suggestionsBoxVerticalOffset: 10,
                                      suggestionsBoxDecoration:
                                          const SuggestionsBoxDecoration(
                                              color: Colors.white),
                                      hideOnError: true,
                                      hideOnLoading: true,
                                      itemBuilder: (context, suggestion) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          color: Colors.white,
                                          child: Text(
                                            suggestion.placeName,
                                            style: TextStyle(
                                              fontSize: 11.0.sp,
                                            ),
                                          ),
                                        );
                                      },
                                      onSuggestionSelected: (suggestion) {
                                        print(suggestion);
                                        typeAheadController.text =
                                            suggestion.placeName;
                                        context.read<PanchangBloc>().add(
                                            PanchangShow(
                                                place_id: suggestion.placeId));
                                      },
                                    ),
                                  )
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Container(
                                  //       child: Text(
                                  //         "Delhi, India",
                                  //         style: TextStyle(fontSize: 12.0.sp),
                                  //       ),
                                  //     ),
                                  //     Icon(Icons.arrow_drop_down)
                                  //   ],
                                  // ),

                                  )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 1.0.h),
                    BlocBuilder<PanchangBloc, PanchangState>(
                      builder: (context, state) {
                        if (state.data == null) {
                          return Container();
                        }
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                height: 5.0.h,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    CustomTime(
                                      title: "Sunrise",
                                      time: context
                                          .watch<PanchangBloc>()
                                          .state
                                          .data!
                                          .moonrise,
                                      iconData: CupertinoIcons.sunrise,
                                    ),
                                    const VerticalDivider(
                                      color: Colors.black87,
                                    ),
                                    CustomTime(
                                      title: "Sunset",
                                      time: context
                                          .watch<PanchangBloc>()
                                          .state
                                          .data!
                                          .sunset,
                                      iconData: CupertinoIcons.sunset,
                                    ),
                                    const VerticalDivider(
                                      color: Colors.black87,
                                    ),
                                    CustomTime(
                                      title: "Moonrise",
                                      time: context
                                          .watch<PanchangBloc>()
                                          .state
                                          .data!
                                          .moonrise,
                                      iconData:
                                          MyFlutterApp.icons8_moonrise_100,
                                    ),
                                    const VerticalDivider(
                                      color: Colors.black87,
                                    ),
                                    CustomTime(
                                      title: "Moonset",
                                      time: context
                                          .watch<PanchangBloc>()
                                          .state
                                          .data!
                                          .moonset,
                                      iconData: MyFlutterApp.icons8_moonset_100,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(
                                      "Tithi",
                                      style: TextStyle(
                                          fontSize: 14.0.sp,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Tithi Number",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .tithi
                                    .details
                                    .tithi_number
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Tithi Name",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .tithi
                                    .details
                                    .tithi_name
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Special",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .tithi
                                    .details
                                    .special
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Summary",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .tithi
                                    .details
                                    .summary
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Diety",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .tithi
                                    .details
                                    .deity
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "End Time",
                                datavalue: Jiffy({
                                  "hour": context
                                      .watch<PanchangBloc>()
                                      .state
                                      .data!
                                      .tithi
                                      .end_time
                                      .hour,
                                  "minute": context
                                      .watch<PanchangBloc>()
                                      .state
                                      .data!
                                      .tithi
                                      .end_time
                                      .minute,
                                  "seconds": context
                                      .watch<PanchangBloc>()
                                      .state
                                      .data!
                                      .tithi
                                      .end_time
                                      .second
                                }).format("h [hr] mm [min] ss [sec] "),
                              ),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Text(
                                      "Nakshatra",
                                      style: TextStyle(
                                          fontSize: 14.0.sp,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Nakshatra Number",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .nakshatra
                                    .details
                                    .nak_number
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Nakshatra Name",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .nakshatra
                                    .details
                                    .nak_name
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Ruler",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .nakshatra
                                    .details
                                    .ruler
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Diety",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .nakshatra
                                    .details
                                    .deity
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "Summary",
                                datavalue: context
                                    .watch<PanchangBloc>()
                                    .state
                                    .data!
                                    .nakshatra
                                    .details
                                    .summary
                                    .toString(),
                              ),
                              SizedBox(
                                height: 1.0.h,
                              ),
                              CustomData(
                                datakey: "End Time",
                                datavalue: Jiffy({
                                  "hour": context
                                      .watch<PanchangBloc>()
                                      .state
                                      .data!
                                      .nakshatra
                                      .end_time
                                      .hour,
                                  "minute": context
                                      .watch<PanchangBloc>()
                                      .state
                                      .data!
                                      .nakshatra
                                      .end_time
                                      .minute,
                                  "seconds": context
                                      .watch<PanchangBloc>()
                                      .state
                                      .data!
                                      .nakshatra
                                      .end_time
                                      .second
                                }).format("h [hr] mm [min] ss [sec] "),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

class CustomData extends StatelessWidget {
  final String datakey;
  final String datavalue;

  CustomData({required this.datakey, required this.datavalue});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 35.0.w,
          child: Text(
            datakey + ":",
            style: TextStyle(fontSize: 11.0.sp, color: Colors.black54),
          ),
        ),
        SizedBox(
          width: 4.0.w,
        ),
        Container(
          width: 52.0.w,
          child: Text(
            datavalue,
            style: TextStyle(fontSize: 11.0.sp, color: Colors.black54),
          ),
        )
      ],
    );
  }
}

class CustomTime extends StatelessWidget {
  final IconData iconData;
  final title;
  final time;
  CustomTime({required this.iconData, required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0.w),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              iconData,
              size: 8.0.w,
              color: Color.fromRGBO(92, 111, 192, 1),
            ),
            SizedBox(
              width: 2.0.w,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Color.fromRGBO(92, 111, 192, 1),
                      fontSize: 10.0.sp),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 10.0.sp),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
