


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../data/activity_report.dart';
import '../../../../../utils/responsiveLayout.dart';

class FoodActivityList extends StatelessWidget{
  final List<FoodSystemUserActivityEntity> activities;
  const FoodActivityList({required this.activities});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double h1_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.025,
        mediumScreen_size: width * 0.03,
        smallScreen_size: width * 0.07,
        min_size: width * 0.08,
        max_size: width * 0.025,
        context: context
    ).get_width_size();
    double b_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.015,
        mediumScreen_size: width * 0.015,
        smallScreen_size: width * 0.05,
        min_size: width * 0.1,
        max_size: width * 0.013,
        context: context
    ).get_width_size();

    Map<int, Widget> icon_activity = {
      0: Icon(
        LineariconsFree.dinner,
        // color: Colors.black87,
      ),
      1: Icon(
        LineariconsFree.checkmark_cicle,
        color: Colors.green,
      ),
      2: Icon(
        LineariconsFree.checkmark_cicle,
        // color: Colors.black87,
      ),
      4: Icon(
        LineariconsFree.cart,
        color: Colors.green,
      ),
      5: Icon(
        LineariconsFree.cross_circle,
        color: Colors.red,
      ),
      6: Icon(
        LineariconsFree.cross_circle,
        // color: Colors.black87,
      ),
      7: Icon(
        LineariconsFree.redo,
        // color: Colors.black87,
      ),
      8: Icon(
        LineariconsFree.upload,
        color: Colors.green,
      ),
      9: Icon(
        LineariconsFree.exit_up,
        // color: Colors.black87,
      ),
      10: Icon(
        LineariconsFree.mustache,
        // color: Colors.black87,
      ),
      11: Icon(
        LineariconsFree.sync_icon,
        // color: Colors.black87,
      ),
      12: Icon(
        LineariconsFree.thumbs_up,
        // color: Colors.black87,
      ),
      13: Icon(
        LineariconsFree.thumbs_down,
        // color: Colors.black87,
      ),
      14: Icon(
        LineariconsFree.cross_circle,
        // color: Colors.black87,
      ),

    };
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: ListView.builder(
        padding: EdgeInsets.only(
            bottom: ResponsiveSizeWidget(
                largeScreen_size: height * 0.2,
                mediumScreen_size: height * 0.27,
                smallScreen_size: height * 0.25,
                min_size: height * 0.2,
                max_size: height * 0.2,
                context: context
            ).get_height_size()
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: activities!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Builder(builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: icon_activity[activities[index].activity_type_int],
                    // backgroundImage: NetworkImage(
                    //     getPictureOfUser(comments[index].userId),
                    //     headers: tokenWithHeader),
                  ),
                  title: SizedBox(
                    width: 300,
                    child: Text(
                      "${activities[index].activity_type}",
                      style: TextStyle(
                          fontFamily: "Sahel",
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${
                            Jalali(
                                int.parse(activities[index].date.split("-")[0]),
                                int.parse(activities[index].date.split("-")[1]),
                                int.parse(activities[index].date.split("-")[2])
                            )
                                .formatFullDate().toPersianDigit()
                        } - ${activities[index].time.substring(0, 8).toPersianDigit()}",
                        style: TextStyle(
                            fontFamily: "Sahel",
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  // trailing: CircleAvatar(
                  //   backgroundColor: Colors.grey.shade200,
                  //   // child:
                  //   // Icon(
                  //   //   LineariconsFree.dinner,
                  //   //   color: Colors.black87,
                  //   // ),
                  //   // backgroundImage: NetworkImage(
                  //   //     getPictureOfUser(comments[index].userId),
                  //   //     headers: tokenWithHeader),
                  // ),
                );
              });
            }),
          );
        },
      ),
    );
  }
}

class SystemActivityList extends StatelessWidget{
  final List<SystemUserActivityEntity> activities;
  const SystemActivityList({required this.activities});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Map<int, Widget> icon_activity = {
      0: Icon(
        LineariconsFree.laptop_phone,
        // color: Colors.black87,
      ),
      1: Icon(
        LineariconsFree.enter,
        color: Colors.green,
      ),
      2: Icon(
        LineariconsFree.exit,
        // color: Colors.black87,
      ),
      4: Icon(
        LineariconsFree.checkmark_cicle,
        color: Colors.green,
      ),
      5: Icon(
        LineariconsFree.cross_circle,
        color: Colors.red,
      ),

    };

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: ListView.builder(
        padding: EdgeInsets.only(
            bottom: ResponsiveSizeWidget(
                largeScreen_size: height * 0.2,
                mediumScreen_size: height * 0.27,
                smallScreen_size: height * 0.25,
                min_size: height * 0.2,
                max_size: height * 0.2,
                context: context
            ).get_height_size()
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: activities!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Builder(builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: icon_activity[activities[index].activity_type_int]
                    // backgroundImage: NetworkImage(
                    //     getPictureOfUser(comments[index].userId),
                    //     headers: tokenWithHeader),
                  ),
                  title: SizedBox(
                    width: 300,
                    child: Text(
                      "${activities[index].activity_type}",
                      style: TextStyle(
                          fontFamily: "Sahel",
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${
                            Jalali(
                                int.parse(activities[index].date.split("-")[0]),
                                int.parse(activities[index].date.split("-")[1]),
                                int.parse(activities[index].date.split("-")[2])
                            )
                                .formatFullDate().toPersianDigit()
                        } - ${activities[index].time.substring(0, 8).toPersianDigit()}",
                        style: TextStyle(
                            fontFamily: "Sahel",
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                );
              });
            }),
          );
        },
      ),
    );
  }
}

class BusActivityList extends StatelessWidget{
  final List<BusSystemUserActivityEntity> activities;
  const BusActivityList({required this.activities});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: ListView.builder(
        padding: EdgeInsets.only(
            bottom: ResponsiveSizeWidget(
                largeScreen_size: height * 0.2,
                mediumScreen_size: height * 0.27,
                smallScreen_size: height * 0.25,
                min_size: height * 0.2,
                max_size: height * 0.2,
                context: context
            ).get_height_size()
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: activities!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Builder(builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      LineariconsFree.bus,
                      // color: Colors.black87,
                    ),
                    // backgroundImage: NetworkImage(
                    //     getPictureOfUser(comments[index].userId),
                    //     headers: tokenWithHeader),
                  ),
                  title: SizedBox(
                    width: 300,
                    child: Text(
                      "${activities[index].activity_type}",
                      style: TextStyle(
                          fontFamily: "Sahel",
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${
                            Jalali(
                                int.parse(activities[index].date.split("-")[0]),
                                int.parse(activities[index].date.split("-")[1]),
                                int.parse(activities[index].date.split("-")[2])
                            )
                                .formatFullDate().toPersianDigit()
                        } - ${activities[index].time.toPersianDigit()}",
                        style: TextStyle(
                            fontFamily: "Sahel",
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  // trailing: CircleAvatar(
                  //   backgroundColor: Colors.grey.shade200,
                  //   child:Text(
                  //     "${activities[index].}",
                  //     style: TextStyle(
                  //         fontFamily: "Sahel",
                  //         fontWeight: FontWeight.w600
                  //     ),
                  //   ),
                    // Icon(
                    //   LineariconsFree.dinner,
                    //   color: Colors.black87,
                    // ),
                    // backgroundImage: NetworkImage(
                    //     getPictureOfUser(comments[index].userId),
                    //     headers: tokenWithHeader),
                  // ),
                );
              });
            }),
          );
        },
      ),
    );
  }
}

class FinancialActivityList extends StatelessWidget{
  final List<FinancialUserActivityEntity> activities;
  const FinancialActivityList({required this.activities});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: ListView.builder(
        padding: EdgeInsets.only(
            bottom: ResponsiveSizeWidget(
                largeScreen_size: height * 0.2,
                mediumScreen_size: height * 0.27,
                smallScreen_size: height * 0.25,
                min_size: height * 0.2,
                max_size: height * 0.2,
                context: context
            ).get_height_size()
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: activities!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Builder(builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      LineariconsFree.diamond_1,
                      // color: Colors.black87,
                    ),
                    // backgroundImage: NetworkImage(
                    //     getPictureOfUser(comments[index].userId),
                    //     headers: tokenWithHeader),
                  ),
                  title: SizedBox(
                    width: 300,
                    child: Text(
                      "${activities[index].activity_type}",
                      style: TextStyle(
                          fontFamily: "Sahel",
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${
                            Jalali(
                                int.parse(activities[index].date.split("-")[0]),
                                int.parse(activities[index].date.split("-")[1]),
                                int.parse(activities[index].date.split("-")[2])
                            )
                                .formatFullDate().toPersianDigit()
                        } - ${activities[index].time.substring(0, 8).toPersianDigit()}",
                        style: TextStyle(
                            fontFamily: "Sahel",
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                );
              });
            }),
          );
        },
      ),
    );
  }
}