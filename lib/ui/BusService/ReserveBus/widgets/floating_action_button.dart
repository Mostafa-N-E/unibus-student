

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

import '../../../../utils/responsiveLayout.dart';

class ReserveFoodScreenFloatingActionButton{
  final BuildContext context;
  const ReserveFoodScreenFloatingActionButton(this.context);

  Widget build({Function()? next_button_onTap, Function()? back_button_onTap}){
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
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
    return Padding(
      padding: EdgeInsets.only(bottom: 0 , right: 35 ),
      child: Card(
        // color:  Theme.of(context).colorScheme.secondary.withOpacity(0.17) ,
        // shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        // margin: EdgeInsets.fromLTRB(7, 7, 7, 10),
        child: Container(
          // margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
          height: height * 0.065,
          decoration: BoxDecoration(
            // color: isDarkMode ? Colors.black87 : Colors.white,
            //   color: Color(0xF5F5F5),
              boxShadow: [
                //if(isDarkMode)
                BoxShadow(
                  // color: Theme.of(context).colorScheme.primary,
                  color: Colors.white.withOpacity(0.19),
                  // offset: Offset(0, 10),
                  // blurRadius: 0,
                  // spreadRadius: 0, // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10)
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: back_button_onTap,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        LineariconsFree.chevron_right,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),

                    Text(
                      " روز قبل",
                      style: TextStyle(
                        // color: Theme.of(context).colorScheme.secondary,
                        fontSize: b_text_size * 0.7,
                        fontFamily: 'Sahel',
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                  ],
                ),
              ),
              InkWell(
                onTap: next_button_onTap,
                child: Row(
                  children: [
                    Text(
                      " روز بعد",
                      style: TextStyle(
                        // color: Theme.of(context).colorScheme.secondary,
                        fontSize: b_text_size * 0.7,
                        fontFamily: 'Sahel',
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        LineariconsFree.chevron_left,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}