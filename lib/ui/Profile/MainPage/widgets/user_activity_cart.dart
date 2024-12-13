

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../data/activity_report.dart';

import '../../../../utils/responsiveLayout.dart';

class UserActivityCard extends StatefulWidget {
  UserActivityEntity user_activity;
  int type;
  UserActivityCard({
    Key? key,
    required this.user_activity,
    required this.type
  }) : super(key: key);

  @override
  _UserActivityCardState createState() => _UserActivityCardState();
}

class _UserActivityCardState extends State<UserActivityCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool rotated = MediaQuery.of(context).size.height < screenWidth;
    // bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;


    double main_width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width = main_width;
    // final bool rotated = MediaQuery.of(context).size.height < main_width;
    // width = main_width * 0.85;

    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.2,
        mediumScreen_size: width * 0.3,
        smallScreen_size: width * 0.39,
        min_size: width * 0.7,
        max_size: width * 0.17,
        context: context
    ).get_width_size();
    double h1_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.05,
        smallScreen_size: width * 0.07,
        min_size: width * 0.12,
        max_size: width * 0.03,
        context: context
    ).get_width_size();
    double b_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.04,
        min_size: width * 0.1,
        max_size: width * 0.02,
        context: context
    ).get_width_size();

    double icon_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.06,
        smallScreen_size: width * 0.1,
        min_size: width * 0.1,
        max_size: width * 0.02,
        context: context
    ).get_width_size();

    double padding = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.1,
        min_size: width * 0.1,
        max_size: width * 0.025,
        context: context
    ).get_width_size();

    double container_height = ResponsiveSizeWidget(
        largeScreen_size: height * 0.08,
        mediumScreen_size: height * 0.08,
        smallScreen_size: height * 0.08,
        min_size: height * 0.08,
        max_size: height * 0.08,
        context: context
    ).get_width_size();


    return Container(
      height: container_height ,
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    LineariconsFree.earth
                  )
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.user_activity.date as String,
                            style: TextStyle(
                              // color: isDarkMode
                              //     ? Colors.white
                              //     : Colors.white,
                              color: Colors.grey[500],
                              //Theme.of(context).colorScheme.secondary,
                              fontSize: b_text_size,
                              // fontFamily: 'decotype-thuluth-ii',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(" - "),
                          Text(widget.user_activity.time as String,
                            style: TextStyle(
                              // color: isDarkMode
                              //     ? Colors.white
                              //     : Colors.white,
                              color: Colors.grey[400],
                              //Theme.of(context).colorScheme.secondary,
                              fontSize: b_text_size,
                              // fontFamily: 'decotype-thuluth-ii',
                              fontWeight: FontWeight.w900,
                            ),
                          )

                        ],
                      ),
                      Text(widget.user_activity.created as String,
                        style: TextStyle(
                          //Theme.of(context).colorScheme.secondary,
                        color: Colors.grey[700],
                          // fontSize: widget.meal_food.food.name.length < 11 ?
                          // h1_text_size * 1 :
                          // widget.meal_food.food.name.length < 15 ?
                          // h1_text_size * 0.7 :
                          // widget.meal_food.food.name.length < 20 ?
                          // b_text_size * 1 :
                          // b_text_size * 0.7,
                          fontSize: b_text_size,
                          // fontFamily: 'decotype-thuluth-ii',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Align(
            //   alignment:
            //   Alignment.topRight,
            //   child: Row(
            //     mainAxisSize:
            //     MainAxisSize.min,
            //     children: [
            //       // ProfileTileTrailingMenu(),
            //       PopupMenuButton(
            //         icon: Icon(
            //           Icons.more_vert_rounded,
            //           color: Theme.of(context).iconTheme.color,
            //         ),
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(15.0),
            //           ),
            //         ),
            //         itemBuilder: (context) => [
            //           PopupMenuItem(
            //             value: 0,
            //             child: Row(
            //               children: [
            //                 const Icon(
            //                   Icons.more_horiz_outlined,
            //                 ),
            //                 const SizedBox(
            //                   width: 10.0,
            //                 ),
            //                 Text(
            //                   // AppLocalizations.of(
            //                   //   context,
            //                   // )!
            //                   //     .remove,
            //                     "جزیات بیشتر"
            //                 ),
            //               ],
            //             ),
            //           ),
            //           PopupMenuItem(
            //             value: 1,
            //             child: Row(
            //               children: [
            //                 const Icon(
            //                   Icons.bar_chart_rounded,
            //                 ),
            //                 const SizedBox(
            //                   width: 10.0,
            //                 ),
            //                 Text(
            //                   // AppLocalizations.of(
            //                   //   context,
            //                   // )!
            //                   //     .remove,
            //                     "دیدن آخرین نظرسنجی این غذا"
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //         onSelected: (int? value) {
            //           if (value == 0) {
            //             Navigator.of(context).push(
            //                 MaterialPageRoute(
            //                   builder: (BuildContext context) => new DetailFood(meal_food: widget.meal_food,),
            //                 )
            //             );
            //           }
            //           if (value == 1) {
            //             // Navigator.push(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //         builder: (context) => MealFoodChart()
            //             //     )
            //             // );
            //             showDialog(
            //               context: context,
            //               builder: (BuildContext context) {
            //                 return const Center(
            //                   child: CircularProgressIndicator(),
            //                 );
            //               },
            //             );
            //             MealFood_API().result_feedback({
            //               "meal_food_id": widget.meal_food.id,
            //               "is_last_record": true
            //             }).then((fetch_data) {
            //               print(fetch_data);
            //               if(fetch_data['status'] == true){
            //                 setState(() {
            //                   // item_data = fetch_data;
            //                   Navigator.pop(
            //                       context);
            //                   showDialog(
            //                     context: context,
            //                     builder: (
            //                         BuildContext context) {
            //                       // print("-----------------------------------------object");
            //                       // print(result);
            //                       return AlertDialog(
            //                           shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                               BorderRadius
            //                                   .circular(
            //                                   30)),
            //                           // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
            //                           //   title: Text("اطلاعات تگ :"),
            //                           content: Container(
            //                             // decoration: BoxDecoration(
            //                             //     borderRadius: BorderRadius.circular(30)
            //                             // ),
            //                             height: height * 0.65,
            //                             // color: data!['status'] as bool ? Colors.green : Colors.red,
            //                             child: MealFoodChart(meal_food: meal_food_builder(fetch_data['data'])),
            //                           )
            //                       );
            //                     },
            //                   );
            //
            //                 });
            //               }else{
            //                 setState(() {
            //                   // item_data = fetch_data;
            //                   Navigator.pop(
            //                       context);
            //                   showDialog(
            //                     context: context,
            //                     builder: (
            //                         BuildContext context) {
            //                       // print("-----------------------------------------object");
            //                       // print(result);
            //                       return AlertDialog(
            //                           shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                               BorderRadius
            //                                   .circular(
            //                                   30)),
            //                           // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
            //                           //   title: Text("اطلاعات تگ :"),
            //                           content: Container(
            //                             // decoration: BoxDecoration(
            //                             //     borderRadius: BorderRadius.circular(30)
            //                             // ),
            //                             height: height * 0.5,
            //                             // color: data!['status'] as bool ? Colors.green : Colors.red,
            //                             child: Column(
            //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                               children: [
            //                                 // Text('${value["nfca"]["identifier"]}'),
            //                                 Icon(LineariconsFree.cross,
            //                                   color:Colors.redAccent.shade100,
            //                                   size: 170,
            //                                 ),
            //                                 Padding(
            //                                   padding: EdgeInsets.only(top: 10) ,
            //                                   child: Text(
            //                                     fetch_data!['message'],
            //                                     textAlign: TextAlign.center,
            //                                     style: TextStyle(
            //                                       color:Colors.grey[500],
            //                                       // fontSize: 20
            //                                     ),
            //                                   ),
            //                                 ),
            //
            //                               ],
            //                             ),
            //                           ));
            //                     },
            //                   );
            //
            //                 });
            //               }
            //
            //             });
            //
            //           }
            //         },
            //       )
            //     ],
            //   ),
            // ),

          ],

        ),
      ),
    );
  }
}