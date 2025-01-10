import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../data/auth_info.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/gradient_container.dart';
import '../../CardManagement/cardManagement.dart';
import '../../Payment/pyment.dart';

class ProfileScreenAppBar {
  // final date_piker_onTap;
  // final self_service_selecter_onTap;
  // final date_lable;
  // final self_service_lable;
  final BuildContext context;
  const ProfileScreenAppBar(this.context);

  SliverAppBar build(UserInfo userInfo, Function()? refresh_onTap) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final bool rotated = MediaQuery.of(context).size.height < width;
    double app_bar_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.3,
        mediumScreen_size: height * 0.36,
        smallScreen_size: height * 0.32,
        min_size: height * 0.3,
        max_size: height * 0.3,
        context: context
    ).get_height_size();
    double button_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.049,
        mediumScreen_size: height * 0.05,
        smallScreen_size: height * 0.06,
        min_size: height * 0.065,
        max_size: height * 0.043,
        context: context
    ).get_height_size();
    double button_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.45,
        mediumScreen_size: width * 0.78,
        smallScreen_size: width * 0.8,
        min_size: width * 0.5,
        max_size: width * 0.5,
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

    double padding = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.06,
        min_size: width * 0.1,
        max_size: width * 0.025,
        context: context
    ).get_width_size();

    final money_format = new NumberFormat("#,##0", "en_US");

    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      centerTitle: true,
      expandedHeight: app_bar_height ,
      flexibleSpace: FlexibleSpaceBar(
        background: GradientContainer(
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: InkWell(
                            onTap: refresh_onTap,
                            child: Card(
                              color: Theme.of(context).colorScheme.secondary.withOpacity(0.11),
                              shadowColor: Colors.black87.withOpacity(0.002),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(55.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(7),
                                child: Icon(
                                  LineariconsFree.sync_icon,
                                  size: b_text_size,
                                  color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          money_format.format(userInfo.credit_amount).toString().toPersianDigit(), //int.parse(userInfo.credit_amount)
                          style: TextStyle(
                            fontSize: h1_text_size,
                            // color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Sahel",

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            "ریال",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: h1_text_size * 0.7,
                              fontFamily: "Sahel",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "موجودی",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Sahel",
                          fontSize: b_text_size
                      ),
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: padding * 0.6),
                  child: Card(shadowColor: Colors.black87.withOpacity(0.01),
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // shadowColor: Colors.transparent,
                    child: SizedBox(
                      height: button_height,
                      width: button_width ,
                      child: InkWell(
                        // hoverColor: Colors.white70,
                        enableFeedback: true,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                    notifyParent: refresh_onTap
                                  )
                              )
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "افزایش اعتبار",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize:b_text_size /2 ,
                                // fontFamily: 'decotype-thuluth-ii',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.secondary,
                                // color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   // height: 90,
              //   padding: EdgeInsets.symmetric(horizontal: 20),
              //   child: InkWell(
              //     onTap: () {},
              //     child: Icon(
              //       Icons.account_circle,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
        expandedTitleScale: 1,
        centerTitle: true,
      ),
      // actions: rotated ? [
      //     Container(
      //       // height: 90,
      //       padding: EdgeInsets.symmetric(horizontal: 15),
      //       child: InkWell(
      //         onTap: () {},
      //         child: Icon(
      //           LineariconsFree.alarm,
      //           color: Colors.black87,
      //         ),
      //       ),
      //     ),
      //     Container(
      //       // height: 90,
      //       padding: EdgeInsets.symmetric(horizontal: 15),
      //       child: InkWell(
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(
      //                 builder: (BuildContext context) => CardManagementScreen(),
      //               )
      //           );
      //         },
      //         child: Icon(
      //           CupertinoIcons.creditcard,
      //           color: Colors.black87,
      //         ),
      //       ),
      //     ),
      // ] : []
    );

  }
}
