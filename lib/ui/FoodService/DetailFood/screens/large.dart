import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../data/meal_food.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/fast_cached_image.dart';

class DetailFoodLargePage extends StatefulWidget {
  MealFoodEntity meal_food;
  DetailFoodLargePage({
    Key? key,
    required this.meal_food
  }) : super(key: key);

  @override
  DetailFoodLargePageState createState() => DetailFoodLargePageState();
}

class DetailFoodLargePageState extends State<DetailFoodLargePage> {
  int touchedIndex = -1;
  // Map profile_data = Hive.box('cache').get('profile_data');



  @override
  Widget build(BuildContext context) {
    double main_width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width = main_width;
    // final bool rotated = MediaQuery.of(context).size.height < main_width;
    // width = main_width * 0.85;
    double container_margin  = ResponsiveSizeWidget(
        largeScreen_size: MediaQuery.of(context).size.width * 0.07,
        mediumScreen_size: MediaQuery.of(context).size.width * 0,
        smallScreen_size: MediaQuery.of(context).size.width * 0,
        min_size: MediaQuery.of(context).size.width * 0,
        max_size: MediaQuery.of(context).size.width * 0.07,
        context: context
    ).get_width_size();
    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.18,
        mediumScreen_size: width * 0.3,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.19,
        context: context
    ).get_width_size();
    double h1_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.026,
        mediumScreen_size: width * 0.05,
        smallScreen_size: width * 0.085,
        min_size: width * 0.12,
        max_size: width * 0.023,
        context: context
    ).get_width_size();
    double b_text_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.021,
        mediumScreen_size: width * 0.03,
        smallScreen_size: width * 0.05,
        min_size: width * 0.1,
        max_size: width * 0.018,
        context: context
    ).get_width_size();
    double box_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.6,
        mediumScreen_size: height * 0.7,
        smallScreen_size: height * 0.9,
        min_size: height * 0.9,
        max_size: height * 0.57,
        context: context
    ).get_height_size();

    _buildIconText(IconData icon, Color color, String text) {
      return Row(
        children: [
          Text(
            text.toPersianDigit(),
            style: TextStyle(
                fontSize:b_text_size,
                fontFamily: "Sahel"
            ),
          ),
          SizedBox(width: 8,),
          Icon(
            icon,
            color: color,
            size: h1_text_size,
          ),

        ],
      );
    }

    build_action(BuildContext context, void Function()? on_tap, String image_path, String title) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;
      return Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(image_width * 0.22),
          ),
          child: InkWell(
            onTap: on_tap,
            child: Container(
                height: image_width * 0.47,
                width: image_width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  // border: Border.all(color: Colors.grey[300] as Color),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(right: 0, top: 10, bottom: 0),
                          child: SizedBox(
                              height: image_width * 0.25,
                              width: image_width * 0.25,
                              child: fast_cached_image_builder(
                                  main_image_url: image_path, placeholder_image_path: 'assets/images/food.png', width: image_width * 0.2, height: image_width * 0.2
                              )
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.only(right: 0, top: 7, bottom: 10),
                          child: Text(
                            title,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 13,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        // flexibleSpace: FlexibleSpaceBar(
        //   background: Stack(
        //     // mainAxisAlignment: MainAxisAlignment.center,
        //     // crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Align(
        //         alignment: Alignment.center,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Text(
        //                   money_format.format(userInfo.credit_amount).toString().toPersianDigit(), //int.parse(userInfo.credit_amount)
        //                   style: TextStyle(
        //                     fontSize: h1_text_size,
        //                     color: Colors.white,
        //                     fontWeight: FontWeight.w900,
        //                     fontFamily: "Sahel",
        //
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: EdgeInsets.only(right: 10),
        //                   child: Text(
        //                     "ریال",
        //                     style: TextStyle(
        //                       color: Colors.white70,
        //                       fontWeight: FontWeight.w600,
        //                       fontSize: h1_text_size * 0.7,
        //                       fontFamily: "Sahel",
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             Text(
        //               "موجودی",
        //               style: TextStyle(
        //                   color: Colors.white70,
        //                   fontFamily: "Sahel",
        //                   fontSize: b_text_size
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //
        //       Align(
        //         alignment: Alignment.bottomCenter,
        //         child: Padding(
        //           padding: EdgeInsets.only(bottom: padding * 0.3),
        //           child: Card(
        //             color: Colors.white.withOpacity(0.5),
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10.0),
        //             ),
        //             // shadowColor: Colors.transparent,
        //             child: SizedBox(
        //               height: button_height,
        //               width: button_width ,
        //               child: InkWell(
        //                 // hoverColor: Colors.white70,
        //                 enableFeedback: true,
        //                 onTap: () {
        //                   // Navigator.push(
        //                   //     context,
        //                   //     MaterialPageRoute(
        //                   //         builder: (context) => ReserveStatusPage()
        //                   //     )
        //                   // );
        //                 },
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Text(
        //                       "افزایش اعتبار",
        //                       style: TextStyle(
        //                         color: Colors.white70,
        //                         fontSize:b_text_size,
        //                         // fontFamily: 'decotype-thuluth-ii',
        //                         fontWeight: FontWeight.w800,
        //                       ),
        //                     ),
        //                     SizedBox(width: 10),
        //                     Padding(
        //                       padding: EdgeInsets.only(left: 5),
        //                       child: Icon(
        //                         Icons.add,
        //                         color: Colors.white70,
        //                         // color: Theme.of(context).colorScheme.secondary,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       // Container(
        //       //   // height: 90,
        //       //   padding: EdgeInsets.symmetric(horizontal: 20),
        //       //   child: InkWell(
        //       //     onTap: () {},
        //       //     child: Icon(
        //       //       Icons.account_circle,
        //       //       color: Colors.white,
        //       //     ),
        //       //   ),
        //       // ),
        //
        //     ],
        //   ),
        //   expandedTitleScale: 1,
        //   centerTitle: true,
        // ),
        actions: [
          Container(
            // height: 90,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {},
              child: Icon(
                LineariconsFree.heart_1,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            // height: 90,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {},
              child: Icon(
                LineariconsFree.pie_chart,
                color: Colors.black87,
              ),
            ),
          ),
        ],
        leading: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 10, right: 5),
            child: IconButton(
              icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: Column(
                  children: [
                    SizedBox(
                        height: image_width,
                        width: image_width,
                        child: fast_cached_image_builder(
                            main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20 ),
                      child: Center(
                          child: Text(widget.meal_food.food.name as String,
                            style: TextStyle(
                              // color: Colors.grey[700],
                              //Theme.of(context).colorScheme.secondary,
                              fontSize: widget.meal_food.food.name.length < 11 ?
                              h1_text_size * 0.9 :
                              widget.meal_food.food.name.length < 15 ?
                              h1_text_size * 0.8 :
                              widget.meal_food.food.name.length < 20 ?
                              b_text_size * 1.08 :
                              b_text_size * 1.04,
                              fontFamily: 'Sahel',
                              // fontWeight: FontWeight.w900,
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10 ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [
                          _buildIconText(
                            // Icons.star_outlined,
                            LineariconsFree.star_1,
                            Colors.amber,
                            widget.meal_food.food.score.toString(),
                          ),
                          // SizedBox(width: width * 0.1,),
                          _buildIconText(
                            Icons.local_fire_department_outlined,
                            Colors.redAccent,
                            widget.meal_food.food.calories.toString() + " کالری",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Divider(
              //     color: Colors.black
              // ),
              SizedBox(
                height: box_height,//- (container_margin * 2.5),
                width: width * 0.5,
                child: Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, top: height * 0.03),
                          child: Text(
                            "مواد تشکیل دهنده",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: b_text_size * 0.7,
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Sahel",
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Container(
                                height: image_width * 0.8,
                                width: width * 0.5,
                                child: ListView(
                                  // shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  children: [
                                    for(var i in widget.meal_food.food.ingredienta)
                                      build_action(
                                        context,
                                            () {},
                                        i.image,
                                        i.name,
                                      ),

                                  ],
                                )
                            ),
                          ),


                        ],
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, top: height * 0.03),
                          child: Text(
                            "درباره",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: b_text_size * 0.7,
                              // fontWeight: FontWeight.bold,
                              // fontFamily: "Sahel",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.03),
                        child: Text(
                          widget.meal_food.food.about.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "decotype-thuluth-ii",
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          )
      ),
      // Row(
      //   children: [
      //     Column(
      //       children: [
      //         SizedBox(
      //             height: image_width,
      //             width: image_width,
      //             child: fast_cached_image_builder(
      //                 main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
      //             )
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(top: height * 0.11 ),
      //           child: Center(
      //               child: Text(widget.meal_food.food.name as String,
      //                 style: TextStyle(
      //                   // color: isDarkMode
      //                   //     ? Colors.white
      //                   //     : Colors.white,
      //                   color: Colors.grey[700],
      //                   //Theme.of(context).colorScheme.secondary,
      //                   fontSize: widget.meal_food.food.name.length < 11 ?
      //                   h1_text_size * 0.9 :
      //                   widget.meal_food.food.name.length < 15 ?
      //                   h1_text_size * 0.8 :
      //                   widget.meal_food.food.name.length < 20 ?
      //                   b_text_size * 1.08 :
      //                   b_text_size * 1.04,
      //                   // fontFamily: 'decotype-thuluth-ii',
      //                   fontWeight: FontWeight.w900,
      //                 ),
      //               )
      //           ),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(top: height * 0.02 ),
      //           child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment:MainAxisAlignment.center,
      //             children: [
      //               _buildIconText(
      //                 // Icons.star_outlined,
      //                 LineariconsFree.star_1,
      //                 Colors.amber,
      //                 widget.meal_food.food.score.toString(),
      //               ),
      //               // SizedBox(width: width * 0.1,),
      //               _buildIconText(
      //                 Icons.local_fire_department_outlined,
      //                 Colors.redAccent,
      //                 widget.meal_food.food.calories.toString() + " کالری",
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //     Column(
      //       children: [
      //         Align(
      //           alignment: Alignment.centerRight,
      //           child: Padding(
      //             padding: EdgeInsets.only(right: 10, top: height * 0.03),
      //             child: Text(
      //               "مواد تشکیل دهنده",
      //               textAlign: TextAlign.start,
      //               style: TextStyle(
      //                 color: Colors.grey.shade500,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //                 // fontFamily: "decotype-thuluth-ii",
      //               ),
      //             ),
      //           ),
      //         ),
      //         Column(
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.only(top: 0),
      //               child: Container(
      //                   height: height  * 0.2,
      //                   width: double.infinity,
      //                   child: ListView(
      //                     // shrinkWrap: true,
      //                     physics: const BouncingScrollPhysics(),
      //                     scrollDirection: Axis.horizontal,
      //                     padding: const EdgeInsets.symmetric(horizontal: 5),
      //                     children: [
      //                       for(var i in widget.meal_food.food.ingredienta)
      //                         build_action(
      //                           context,
      //                               () {},
      //                           i.image,
      //                           i.name,
      //                         ),
      //
      //                     ],
      //                   )
      //               ),
      //             ),
      //
      //
      //           ],
      //         ),
      //
      //         Align(
      //           alignment: Alignment.centerRight,
      //           child: Padding(
      //             padding: EdgeInsets.only(right: 10, top: height * 0.03),
      //             child: Text(
      //               "درباره",
      //               textAlign: TextAlign.start,
      //               style: TextStyle(
      //                 color: Colors.grey.shade500,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //                 // fontFamily: "decotype-thuluth-ii",
      //               ),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(top: height * 0.03),
      //           child: Text(
      //             widget.meal_food.food.about.toString(),
      //             textAlign: TextAlign.start,
      //             style: TextStyle(
      //               color: Colors.grey.shade800,
      //               fontSize: 15,
      //               fontWeight: FontWeight.bold,
      //               // fontFamily: "decotype-thuluth-ii",
      //             ),
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //   ],
      // ),

    );
  }




}