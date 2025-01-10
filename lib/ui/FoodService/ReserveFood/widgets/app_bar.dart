import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../theme.dart';
import '../../../../utils/responsiveLayout.dart';

class ReserveFoodSmallScreenAppBar {
  // final date_piker_onTap;
  // final self_service_selecter_onTap;
  // final date_lable;
  // final self_service_lable;
  final BuildContext context;
  const ReserveFoodSmallScreenAppBar(this.context);

  AppBar build({Function()? date_piker_onTap, Function()? self_service_selecter_onTap,  String self_service_lable="", required String date_lable,}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final bool rotated = MediaQuery.of(context).size.height < width;
    bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;

    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.2,
        mediumScreen_size: width * 0.3,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.23,
        context: context
    ).get_width_size();
    double h1_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.05,
        smallScreen_size: width * 0.085,
        min_size: width * 0.12,
        max_size: width * 0.03,
        context: context
    ).get_width_size();
    double b_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.05,
        min_size: width * 0.1,
        max_size: width * 0.02,
        context: context
    ).get_width_size();
    double item_width  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.55,
        mediumScreen_size: width * 0.55,
        smallScreen_size: width * 0.55,
        min_size: width * 0.55,
        max_size: width * 0.55,
        context: context
    ).get_width_size();
    // double padding_bottom = ResponsiveSizeWidget(
    //     largeScreen_size: height * 0.01,
    //     mediumScreen_size: height * 0.01,
    //     smallScreen_size: height * 0.01,
    //     min_size: height * 0.01,
    //     max_size: height * 0.01,
    //     context: context
    // ).get_height_size();
    double button_height  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.06,
        mediumScreen_size: width * 0.06,
        smallScreen_size: width * 0.1,
        min_size: width * 0.11,
        max_size: width * 0.04,
        context: context
    ).get_width_size();
    double button_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.3,
        mediumScreen_size: width * 0.38,
        smallScreen_size: width * 0.35,
        min_size: width * 0.25,
        max_size: width * 0.3,
        context: context
    ).get_width_size();
    double app_bar_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.22,
        mediumScreen_size: height * 0.23,
        smallScreen_size: height * 0.28,
        min_size: height * 0.23,
        max_size: height * 0.22,
        context: context
    ).get_height_size();
    return AppBar(
      toolbarOpacity: 1,
      // color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 5, left: 15, bottom: 10),
              child: Text(
                "رزرو غذا",
                style: TextStyle(
                  // color: Colors.grey[500],
                  fontSize: b_text_size ,
                  fontFamily: 'Sahel',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "وعده های روز : ",
                    style: TextStyle(
                      // color: Theme.of(context).colorScheme.secondary,
                      fontSize: b_text_size  * 0.7,
                      fontFamily: 'Sahel',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Card(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.145),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.transparent,
                    child: SizedBox(
                      height: app_bar_height * 0.23,
                      width: item_width,
                      child: InkWell(
                        // hoverColor: Colors.white70,
                        enableFeedback: true,
                        onTap: date_piker_onTap,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              date_lable.toPersianDigit() ?? "",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: b_text_size * 0.7,
                                fontFamily: 'Sahel',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                LineariconsFree.calendar_full,
                                color: Theme.of(context).colorScheme.secondary,
                                size: b_text_size,

                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Text(
                //   '',
                //   style: TextStyle(
                //     color: Theme.of(context).colorScheme.secondary,
                //     fontSize: MediaQuery.of(context).size.height/7,
                //     fontFamily: 'decotype-thuluth-ii',
                //     fontWeight: FontWeight.w300,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    "سلف : ",
                    style: TextStyle(
                      // color: Theme.of(context).colorScheme.secondary,
                      fontSize: b_text_size  * 0.7,
                      fontFamily: 'Sahel',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Card(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.145),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.transparent,
                    child: SizedBox(
                      height: app_bar_height * 0.22,
                      width: item_width,
                      child: self_service_lable == "" ?
                          const Center(child: CircularProgressIndicator(),)
                          :
                      InkWell(
                        // hoverColor: Colors.white70,
                        enableFeedback: true,
                        onTap: self_service_selecter_onTap,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              self_service_lable ?? "",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize:b_text_size * 0.7,
                                fontFamily: 'Sahel',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                LineariconsFree.store,
                                color: Theme.of(context).colorScheme.secondary,
                                size: b_text_size,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [

      ],
      toolbarHeight: app_bar_height,
      // backgroundColor: Colors.white,
      shadowColor: Theme.of(context).shadowColor,

      leading: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 5),
          child: IconButton(
            icon: Icon(
              LineariconsFree.chevron_right,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ),
      ),
    );
  }
}


class ReserveFoodLargeScreenAppBar {
  // final date_piker_onTap;
  // final self_service_selecter_onTap;
  // final date_lable;
  // final self_service_lable;
  final BuildContext context;
  const ReserveFoodLargeScreenAppBar(this.context);

  AppBar build({Function()? date_piker_onTap, Function()? self_service_selecter_onTap,  String self_service_lable="", required String date_lable,}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final bool rotated = MediaQuery.of(context).size.height < width;

    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.2,
        mediumScreen_size: width * 0.3,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.23,
        context: context
    ).get_width_size();
    double h1_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.05,
        smallScreen_size: width * 0.085,
        min_size: width * 0.12,
        max_size: width * 0.03,
        context: context
    ).get_width_size();
    double b_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.02,
        mediumScreen_size: width * 0.02,
        smallScreen_size: width * 0.04,
        min_size: width * 0.1,
        max_size: width * 0.02,
        context: context
    ).get_width_size();
    double item_width  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.55,
        mediumScreen_size: width * 0.55,
        smallScreen_size: width * 0.55,
        min_size: width * 0.55,
        max_size: width * 0.55,
        context: context
    ).get_width_size();
    // double padding_bottom = ResponsiveSizeWidget(
    //     largeScreen_size: height * 0.01,
    //     mediumScreen_size: height * 0.01,
    //     smallScreen_size: height * 0.01,
    //     min_size: height * 0.01,
    //     max_size: height * 0.01,
    //     context: context
    // ).get_height_size();
    double button_height  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.06,
        mediumScreen_size: width * 0.06,
        smallScreen_size: width * 0.1,
        min_size: width * 0.11,
        max_size: width * 0.04,
        context: context
    ).get_width_size();
    double button_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.3,
        mediumScreen_size: width * 0.38,
        smallScreen_size: width * 0.35,
        min_size: width * 0.25,
        max_size: width * 0.3,
        context: context
    ).get_width_size();
    double app_bar_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.29,
        mediumScreen_size: height * 0.32,
        smallScreen_size: height * 0.22,
        min_size: height * 0.22,
        max_size: height * 0.25,
        context: context
    ).get_height_size();
    return AppBar(
      toolbarOpacity: 1,
      // color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 10, left: 15),
          //     child: Text(
          //       "رزرو غذا",
          //       style: TextStyle(
          //         // color: Colors.grey[500],
          //         fontSize: b_text_size,
          //         // fontFamily: 'decotype-thuluth-ii',
          //         fontWeight: FontWeight.w900,
          //       ),
          //     ),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "وعده های روز : ",
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          fontSize: b_text_size  * 0.7,
                          fontFamily: 'Sahel',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Card(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.145),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.transparent,
                        child: SizedBox(
                          height: app_bar_height * 0.203,
                          width: item_width / 2,
                          child: InkWell(
                            // hoverColor: Colors.white70,
                            enableFeedback: true,
                            onTap: date_piker_onTap,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  date_lable.toPersianDigit() ?? "",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontSize: b_text_size * 0.7,
                                    fontFamily: 'Sahel',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    LineariconsFree.calendar_full,
                                    color: Theme.of(context).colorScheme.secondary,
                                    size: b_text_size,

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Text(
                    //   '',
                    //   style: TextStyle(
                    //     color: Theme.of(context).colorScheme.secondary,
                    //     fontSize: MediaQuery.of(context).size.height/7,
                    //     fontFamily: 'decotype-thuluth-ii',
                    //     fontWeight: FontWeight.w300,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "سلف : ",
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          fontSize: b_text_size  * 0.7,
                          fontFamily: 'Sahel',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Card(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.145),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        shadowColor: Colors.transparent,
                        child: SizedBox(
                          height: app_bar_height * 0.203,
                          width: item_width /2,
                          child: self_service_lable == "" ?
                          const Center(child: CircularProgressIndicator(),)
                              :
                          InkWell(
                            // hoverColor: Colors.white70,
                            enableFeedback: true,
                            onTap: self_service_selecter_onTap,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  self_service_lable ?? "",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontSize:b_text_size * 0.7,
                                    fontFamily: 'Sahel',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(
                                    LineariconsFree.store,
                                    color: Theme.of(context).colorScheme.secondary,
                                    size: b_text_size,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [

      ],
      toolbarHeight: app_bar_height * 0.7,
      // backgroundColor: Colors.white,
      shadowColor: Theme.of(context).shadowColor,
      title: Padding(
        padding: EdgeInsets.only(top: 10, left: 15),
        child: Text(
          "رزرو غذا",
          style: TextStyle(
            // color: Colors.grey[500],
            fontSize: b_text_size,
            // fontFamily: 'decotype-thuluth-ii',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      leading: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 5),
          child: IconButton(
            icon: Icon(LineariconsFree.chevron_right,),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ),
      ),
    );
  }
}

