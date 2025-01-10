import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../data/meal_food.dart';
import '../../../../common/http_client.dart';
import '../../../../data/source/food_data_source.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/fast_cached_image.dart';
import '../../../widgets/snackbar.dart';
import '../widgets/modal_result_feedbacks.dart';

class DetailFoodSmallPage extends StatefulWidget {
  MealFoodEntity meal_food;
  DetailFoodSmallPage({
    Key? key,
    required this.meal_food
  }) : super(key: key);

  @override
  DetailFoodSmallPageState createState() => DetailFoodSmallPageState();
}

class DetailFoodSmallPageState extends State<DetailFoodSmallPage> {
  int touchedIndex = -1;
  // Map profile_data = Hive.box('cache').get('profile_data');

  build_action(BuildContext context, void Function()? on_tap, String image_path, String title) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: InkWell(
          onTap: on_tap,
          child: Container(
              height: height * 0.15,
              width: width * 0.22,
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
                            height: height * 0.07,
                            width: height * 0.07,
                            child: fast_cached_image_builder(
                                main_image_url: image_path, placeholder_image_path: 'assets/images/food.png', width: width, height: height
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

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                top: -100,
                child: Container(
                  decoration: BoxDecoration(),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                    elevation: 2,
                    color: Colors.white,
                    child: fast_cached_image_builder(
                        main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', opacity: 0.45, width: image_width, height: image_width
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200),
                child: Container(
                    height:  height -300,
                    width: width,
                    child: Material(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      elevation: 110,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.11 ),
                              child: Center(
                                  child: Text(widget.meal_food.food.name as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey[700],
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: widget.meal_food.food.name.length < 11 ?
                                      width * 0.109 :
                                      widget.meal_food.food.name.length < 15 ?
                                      width * 0.099 :
                                      widget.meal_food.food.name.length < 20 ?
                                      width * 0.08 :
                                      width * 0.04,
                                      // fontFamily: 'decotype-thuluth-ii',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.02 ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  _buildIconText(
                                    // Icons.star_outlined,
                                    LineariconsFree.star_1,
                                    Colors.amber,
                                    widget.meal_food.food.score.toString(),
                                  ),
                                  SizedBox(width: width * 0.1,),
                                  _buildIconText(
                                    Icons.local_fire_department_outlined,
                                    Colors.redAccent,
                                    widget.meal_food.food.calories.toString() + " کالری",
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10, top: height * 0.03),
                                child: Text(
                                  "مواد تشکیل دهنده",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: "decotype-thuluth-ii",
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Container(
                                      height: height  * 0.2,
                                      width: double.infinity,
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
                                    color: Colors.grey.shade500,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: "decotype-thuluth-ii",
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
                ),
              ),
              Positioned(
                top: 60,
                right: (width - (width * 0.53))/2,

                child: SizedBox(
                  height: width * 0.55,
                  width: width * 0.55,
                  child: fast_cached_image_builder(
                      main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', opacity: 1, width: image_width, height: image_width
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15),
                  child: Icon(
                    LineariconsFree.chevron_right,
                    size: h1_text_size * 0.75
                  ),
                ),
              ),
              Positioned(
                  right: width -120,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isDismissible: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return ResultFeedbacksWidget(notifyParent: (){}, meal_food: widget.meal_food);
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 18),
                          child: Icon(
                            LineariconsFree.pie_chart,
                            size: h1_text_size * 0.75,
                            // size: 20
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (widget.meal_food.food.like.contains(global_userInfo.id)){
                            setState(() {
                              widget.meal_food.food.like.remove(global_userInfo.id);
                              Food_API().remove_favorite(
                                  {
                                    "food_id":widget.meal_food.id
                                  }
                              ).then((fetch_data) {
                                ShowSnackBar().showSnackBar(
                                  context,
                                  "با موفقیت لیست علاقه مندی تان تغییر داده شد",
                                  duration: const Duration(seconds: 1),
                                  noAction: false,
                                );
                              });
                            });
                          }else{
                            setState(() {
                              widget.meal_food.food.like.add(global_userInfo.id);
                              Food_API().add_favorite(
                                  {
                                    "food_id":widget.meal_food.id
                                  }
                              ).then((fetch_data) {
                                ShowSnackBar().showSnackBar(
                                  context,
                                  "با موفقیت لیست علاقه مندی تان تغییر داده شد",
                                  duration: const Duration(seconds: 1),
                                  noAction: false,
                                );
                              });
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, right: 18),
                          child: widget.meal_food.food.like.contains(global_userInfo.id)
                              ?
                          Icon(
                            Icons
                                .favorite_rounded,
                            color: Colors.red,
                            size: h1_text_size * 0.75,
                          )
                              :
                          Icon(
                            LineariconsFree.heart_1,
                            // LineariconsFree.heart_1,
                            color: Colors.black87,
                            size: h1_text_size * 0.75,//isDarkMode ? Colors.black87 : Colors.white,
                          ),
                        ),
                      ),

                    ],
                  )
              )
            ],
          ),
        ],
      ),

    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                top: -100,
                child: Container(
                  decoration: BoxDecoration(),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                    elevation: 2,
                    color: Colors.white,
                    child: Container(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: fast_cached_image_builder(
                            main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', opacity: 0.45, width: image_width, height: image_width
                        ),
                      ),
                    ),


                    // child: FlutterMap(
                    //   options: MapOptions(
                    //     zoom: 13.0,
                    //     center: LatLng(35.669072277037294, 51.359724811369084),
                    //   ),
                    //   layers: [
                    //     TileLayerOptions(
                    //         urlTemplate:
                    //         'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    //         subdomains: ['a', 'b', 'c']),
                    //   ],
                    // ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200),
                child: Container(
                    height: MediaQuery.of(context).size.height-200,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      elevation: 110,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.11 ),
                              child: Center(
                                  child: Text(widget.meal_food.food.name as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey[700],
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: widget.meal_food.food.name.length < 11 ?
                                      h1_text_size * 0.9 :
                                      widget.meal_food.food.name.length < 15 ?
                                      h1_text_size * 0.8 :
                                      widget.meal_food.food.name.length < 20 ?
                                      b_text_size * 1.08 :
                                      b_text_size * 1.04,
                                      // fontFamily: 'decotype-thuluth-ii',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.02 ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  _buildIconText(
                                    // Icons.star_outlined,
                                    LineariconsFree.star_1,
                                    Colors.amber,
                                    widget.meal_food.food.score.toString(),
                                  ),
                                  SizedBox(width: width * 0.1,),
                                  _buildIconText(
                                    Icons.local_fire_department_outlined,
                                    Colors.redAccent,
                                    widget.meal_food.food.calories.toString() + " کالری",
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 10, top: height * 0.03),
                                child: Text(
                                  "مواد تشکیل دهنده",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: "decotype-thuluth-ii",
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Container(
                                      height: height  * 0.2,
                                      width: double.infinity,
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
                                    color: Colors.grey.shade500,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: "decotype-thuluth-ii",
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
                ),
              ),
              Positioned(
                top: 60,
                right: (width - (container_margin * 2.2))/2,

                child: SizedBox(
                    height: image_width,
                    width: image_width,
                    child: fast_cached_image_builder(
                        main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
                    )
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0, right: 28),
                  child: Icon(
                    Icons.arrow_back_ios,
                    // size: 20
                  ),
                ),
              ),
              Positioned(
                  right: width -120,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          // showModalBottomSheet(
                          //   isDismissible: true,
                          //   backgroundColor: Colors.transparent,
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return ResultFeedbacksWidget(notifyParent: (){}, meal_food: widget.meal_food);
                          //   },
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0, right: 18),
                          child: Icon(
                            Icons.bar_chart_rounded,
                            size: width * 0.08,
                            // size: 20
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // if (widget.meal_food.food.like.contains(profile_data['id'])){
                          //   setState(() {
                          //     widget.meal_food.food.like.remove(profile_data['id']);
                          //     Food_API().remove_favorite(
                          //         {
                          //           "food_id":widget.meal_food.id
                          //         }
                          //     ).then((fetch_data) {
                          //       ShowSnackBar().showSnackBar(
                          //         context,
                          //         "با موفقیت لیست علاقه مندی تان تغییر داده شد",
                          //         duration: const Duration(seconds: 1),
                          //         noAction: false,
                          //       );
                          //     });
                          //   });
                          // }else{
                          //   setState(() {
                          //     widget.meal_food.food.like.add(profile_data['id']);
                          //     Food_API().add_favorite(
                          //         {
                          //           "food_id":widget.meal_food.id
                          //         }
                          //     ).then((fetch_data) {
                          //       ShowSnackBar().showSnackBar(
                          //         context,
                          //         "با موفقیت لیست علاقه مندی تان تغییر داده شد",
                          //         duration: const Duration(seconds: 1),
                          //         noAction: false,
                          //       );
                          //     });
                          //   });
                          // }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0, right: 18),
                          child: widget.meal_food.food.like.contains(global_userInfo.id)
                              ?
                          Icon(
                            Icons
                                .favorite_rounded,
                            color: Colors.red,
                            size: width * 0.08,
                          )
                              :
                          Icon(
                            Icons.favorite_border_rounded,
                            // LineariconsFree.heart_1,
                            color: Colors.black87,
                            size: width * 0.08,//isDarkMode ? Colors.black87 : Colors.white,
                          ),
                        ),
                      ),

                    ],
                  )
              )
            ],
          ),
        ],
      ),

    );
  }

  _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize:MediaQuery.of(context).size.width * 0.04,
          ),
        ),
        SizedBox(width: 8,),
        Icon(
          icon,
          color: color,
          size: MediaQuery.of(context).size.width * 0.07,
        ),

      ],
    );
  }


}