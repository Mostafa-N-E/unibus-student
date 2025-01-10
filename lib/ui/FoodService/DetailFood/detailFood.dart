import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../data/meal_food.dart';
import '../../../ui/FoodService/DetailFood/screens/large.dart';
import '../../../ui/FoodService/DetailFood/screens/small.dart';
import '../../../utils/responsiveLayout.dart';
import '../../widgets/fast_cached_image.dart';

class DetailFood extends StatefulWidget {
  MealFoodEntity meal_food;
  DetailFood({
    Key? key,
    required this.meal_food
  }) : super(key: key);

  @override
  DetailFoodState createState() => DetailFoodState();
}

class DetailFoodState extends State<DetailFood> {
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

    return  ResponsiveLayout(
      largeScreen: DetailFoodLargePage(meal_food: widget.meal_food,),
      // smallScreen: SmallFoodPage(),
      smallScreen: DetailFoodSmallPage(meal_food: widget.meal_food,),
    );
  }




}
