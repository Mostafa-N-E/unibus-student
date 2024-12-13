import 'package:flutter/material.dart';
import '../../../../data/meal_food.dart';
import '../../../../ui/FoodService/TransferFood/screens/large.dart';
import '../../../../ui/FoodService/TransferFood/screens/small.dart';
import '../../../utils/responsiveLayout.dart';

class TransferFoodScreen extends StatelessWidget {
  final MealFoodEntity meal_food;
  final Function() notifyParent;

  const TransferFoodScreen({Key? key, required this.meal_food, required this.notifyParent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
    double app_bar_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.1,
        mediumScreen_size: height * 0.1,
        smallScreen_size: height * 0.1,
        min_size: height * 0.1,
        max_size: height * 0.1,
        context: context
    ).get_height_size();
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

    return ResponsiveLayout(
      largeScreen: LargeTransferFoodPage(notifyParent: notifyParent, meal_food: meal_food, ),
      // smallScreen: SmallFoodPage(),
      smallScreen: SmallTransferFoodPage(notifyParent: notifyParent, meal_food: meal_food, ),
    );
  }
}


