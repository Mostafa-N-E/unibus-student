import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../data/meal_food.dart';
import '../../../../common/http_client.dart';
import '../../../../utils/responsiveLayout.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;


  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}

class MealFoodChart extends StatefulWidget {
  MealFoodEntity meal_food;
  MealFoodChart({
    Key? key,
    required this.meal_food
  }) : super(key: key);

  @override
  MealFoodChartState createState() => MealFoodChartState();
}

class MealFoodChartState extends State<MealFoodChart> {
  int touchedIndex = -1;
  // Map profile_data = Hive.box('cache').get('profile_data');

  @override
  Widget build(BuildContext context) {
    double main_width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width = main_width;
    // final bool rotated = MediaQuery.of(context).size.height < main_width;
    width = main_width * 1;
    // double main_width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    // double width = main_width;
    // final bool rotated = MediaQuery.of(context).size.height < main_width;
    // width = main_width * 0.85;

    double chart_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.15,
        mediumScreen_size: width * 0.15,
        smallScreen_size: width * 0.22,
        min_size: width * 0.22,
        max_size: width * 0.12,
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
        largeScreen_size: height * 0.3,
        mediumScreen_size: height * 0.25,
        smallScreen_size: height * 0.25,
        min_size: height * 0.25,
        max_size: height * 0.3,
        context: context
    ).get_width_size();

    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          Center(
              child: Text(widget.meal_food.food.name as String,
                style: TextStyle(
                  // color: isDarkMode
                  //     ? Colors.white
                  //     : Colors.white,
                  color: Colors.grey[700],
                  //Theme.of(context).colorScheme.secondary,
                  fontSize: h1_text_size * 0.9,
                  fontFamily: 'Sahel',
                  fontWeight: FontWeight.w900,
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20,right: 7, left: 7),
                child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       right: width * 0.1),
                      //   child: Icon(
                      //     LineariconsFree.store,
                      //     size: width * 0.1,
                      //     color: Colors.grey[600],
                      //   ),
                      // ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 0),
                          child: Text("سلف"+" "+widget.meal_food.self_service.name as String,
                            style: TextStyle(
                              // color: isDarkMode
                              //     ? Colors.white
                              //     : Colors.white,
                              color: Colors.grey[700],
                              //Theme.of(context).colorScheme.secondary,
                              fontSize: b_text_size * 0.9,
                              fontFamily: 'Sahel',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                      ),

                    ]
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      right: 10),
                  child: Text(
                    widget.meal_food.date,
                    style: TextStyle(
                      // color: isDarkMode
                      //     ? Colors.white
                      //     : Colors.white,
                      color: Colors.grey[500],
                      //Theme.of(context).colorScheme.secondary,
                      fontSize: b_text_size * 0.9,
                      // fontFamily: 'decotype-thuluth-ii',
                      fontWeight: FontWeight.w700,
                    ),
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20,right: 7, left: 7),
                child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       right: width * 0.1),
                      //   child: Icon(
                      //     LineariconsFree.store,
                      //     size: width * 0.1,
                      //     color: Colors.grey[600],
                      //   ),
                      // ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 0),
                          child: Text("تعداد افرادی که غذا را صرف کرده اند",
                            style: TextStyle(
                              // color: isDarkMode
                              //     ? Colors.white
                              //     : Colors.white,
                              color: Colors.grey[800],
                              //Theme.of(context).colorScheme.secondary,
                              fontSize: b_text_size * 0.7,
                              // fontFamily: 'decotype-thuluth-ii',
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      ),

                    ]
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      right: 10),
                  child: Text(
                    widget.meal_food.users_ate.length.toString(),
                    style: TextStyle(
                      // color: isDarkMode
                      //     ? Colors.white
                      //     : Colors.white,
                      color: Colors.grey[500],
                      //Theme.of(context).colorScheme.secondary,
                      fontSize: b_text_size * 0.9,
                      // fontFamily: 'decotype-thuluth-ii',
                      fontWeight: FontWeight.w700,
                    ),
                  )
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20,right: 7, left: 7),
              child: Text(
                widget.meal_food.has_reserve(global_userInfo.id) == false ?
                "شما این در این وعده رزرو نداشته اید" :
                widget.meal_food.get_reaction(global_userInfo.id) == -1 ?
                "شما در این وعده بازخوردی نداشته اید" :
                widget.meal_food.user_vote == 0 ?
                "شما این وعده را پسندیده اید" :
                widget.meal_food.user_vote == 1 ?
                "نظر شما برای این وعده میانه بوده" :
                "شما این وعده را نپسنذیذه اید" ,
                style: TextStyle(
                  // color: isDarkMode
                  //     ? Colors.white
                  //     : Colors.white,
                  color: widget.meal_food.get_reaction(global_userInfo.id) == 2 ?
                  Color(0xffcc3300):
                  widget.meal_food.user_vote == 0 ?
                  Colors.green://Color(0xff006600):
                  widget.meal_food.user_vote == 1 ?
                  Color(0xfff8b250)  :
                  Colors.grey[800] ,
                  //Theme.of(context).colorScheme.secondary,
                  fontSize: b_text_size * 0.9,
                  // fontFamily: 'decotype-thuluth-ii',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 5,
                  centerSpaceRadius: chart_width,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Indicator(
                color: Color(0xff006600),
                text: 'پسندیده اند',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: 'میانه',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xffcc3300),
                text: 'نپسندیده اند',
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff999999),
                text: 'بدون رای',
                isSquare: true,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff006600),
            value: widget.meal_food.like.length.toDouble() as double,
            title: (100*(widget.meal_food.like.length/widget.meal_food.users_ate.length)).toString() + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: widget.meal_food.refused.length.toDouble() as double,
            title: (100*(widget.meal_food.refused.length/widget.meal_food.users_ate.length)).toString() + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffcc3300),
            value: widget.meal_food.dislike.length.toDouble() as double,
            title: (100*(widget.meal_food.dislike.length/widget.meal_food.users_ate.length)).toString() + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff999999),
            value: (widget.meal_food.users_ate.length-(widget.meal_food.like.length+widget.meal_food.refused.length+widget.meal_food.dislike.length)).toDouble() as double,
            title: (100*((widget.meal_food.users_ate.length-(widget.meal_food.like.length+widget.meal_food.refused.length+widget.meal_food.dislike.length))/widget.meal_food.users_ate.length)).toString() + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}



class LargePageMealFoodChart extends StatefulWidget {
  MealFoodEntity meal_food;
  LargePageMealFoodChart({
    Key? key,
    required this.meal_food
  }) : super(key: key);

  @override
  LargePageMealFoodChartState createState() => LargePageMealFoodChartState();
}

class LargePageMealFoodChartState extends State<LargePageMealFoodChart> {
  int touchedIndex = -1;
  // Map profile_data = Hive.box('cache').get('profile_data');

  @override
  Widget build(BuildContext context) {
    double main_width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double width = main_width;
    // final bool rotated = MediaQuery.of(context).size.height < main_width;
    width = main_width * 1;
    // double main_width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    // double width = main_width;
    // final bool rotated = MediaQuery.of(context).size.height < main_width;
    // width = main_width * 0.85;

    double chart_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.15,
        mediumScreen_size: width * 0.15,
        smallScreen_size: width * 0.22,
        min_size: width * 0.22,
        max_size: width * 0.12,
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
        largeScreen_size: height * 0.3,
        mediumScreen_size: height * 0.25,
        smallScreen_size: height * 0.25,
        min_size: height * 0.25,
        max_size: height * 0.3,
        context: context
    ).get_width_size();

    return AspectRatio(
      aspectRatio: 1.3,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text(widget.meal_food.food.name as String,
              style: TextStyle(
                // color: isDarkMode
                //     ? Colors.white
                //     : Colors.white,
                color: Colors.grey[700],
                //Theme.of(context).colorScheme.secondary,
                fontSize: h1_text_size * 0.9,
                fontFamily: 'Sahel',
                fontWeight: FontWeight.w900,
              ),
            ),

          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(
                    right: 10),
                child: Text(
                  "${
                      Jalali(
                          int.parse(widget.meal_food.date.split("-")[0]),
                          int.parse(widget.meal_food.date.split("-")[1]),
                          int.parse(widget.meal_food.date.split("-")[2])
                      )
                          .formatFullDate().toPersianDigit()
                  }",
                  style: TextStyle(
                    // color: isDarkMode
                    //     ? Colors.white
                    //     : Colors.white,
                    color: Colors.grey[500],
                    //Theme.of(context).colorScheme.secondary,
                    fontSize: b_text_size * 0.9,
                    // fontFamily: 'decotype-thuluth-ii',
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 20,right: 7, left: 7),
              child: Text("سلف"+" "+widget.meal_food.self_service.name as String,
                style: TextStyle(
                  // color: isDarkMode
                  //     ? Colors.white
                  //     : Colors.white,
                  color: Colors.grey[700],
                  //Theme.of(context).colorScheme.secondary,
                  fontSize: b_text_size * 0.9,
                  fontFamily: 'Sahel',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20,right: 7, left: 7),
              child: Text(
                widget.meal_food.has_reserve(global_userInfo.id) == false ?
                "شما این در این وعده رزرو نداشته اید" :
                widget.meal_food.get_reaction(global_userInfo.id) == -1 ?
                "شما در این وعده بازخوردی نداشته اید" :
                widget.meal_food.user_vote == 0 ?
                "شما این وعده را پسندیده اید" :
                widget.meal_food.user_vote == 1 ?
                "نظر شما برای این وعده میانه بوده" :
                "شما این وعده را نپسنذیذه اید" ,
                style: TextStyle(
                  // color: isDarkMode
                  //     ? Colors.white
                  //     : Colors.white,
                  color: widget.meal_food.get_reaction(global_userInfo.id) == 2 ?
                  Color(0xffcc3300):
                  widget.meal_food.user_vote == 0 ?
                  Colors.green://Color(0xff006600):
                  widget.meal_food.user_vote == 1 ?
                  Color(0xfff8b250)  :
                  Colors.grey[800] ,
                  //Theme.of(context).colorScheme.secondary,
                  fontSize: b_text_size * 0.9,
                  // fontFamily: 'decotype-thuluth-ii',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 5,
                      centerSpaceRadius: chart_width,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff006600),
                  text: 'پسندیده اند',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'میانه',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xffcc3300),
                  text: 'نپسندیده اند',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xff999999),
                  text: 'بدون رای',
                  isSquare: true,
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //
                //   ],
                // ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0, right: 10
                        ),
                        child: Text(
                          widget.meal_food.users_ate.length.toString().toPersianDigit(),
                          style: TextStyle(
                            // color: isDarkMode
                            //     ? Colors.white
                            //     : Colors.white,
                            color: Colors.grey[500],
                            //Theme.of(context).colorScheme.secondary,
                            fontSize: b_text_size * 0.9,
                            // fontFamily: 'decotype-thuluth-ii',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0,right: 7, left: 7),
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       right: width * 0.1),
                            //   child: Icon(
                            //     LineariconsFree.store,
                            //     size: width * 0.1,
                            //     color: Colors.grey[600],
                            //   ),
                            // ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 0),
                                child: Text("تعداد افرادی که غذا را صرف کرده اند",
                                  style: TextStyle(
                                    // color: isDarkMode
                                    //     ? Colors.white
                                    //     : Colors.white,
                                    color: Colors.grey[800],
                                    //Theme.of(context).colorScheme.secondary,
                                    fontSize: b_text_size * 0.7,
                                    // fontFamily: 'decotype-thuluth-ii',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                            ),

                          ]
                      ),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0, right: 10
                        ),
                        child: Text(
                          widget.meal_food.like.length.toString().toPersianDigit(),
                          style: TextStyle(
                            // color: isDarkMode
                            //     ? Colors.white
                            //     : Colors.white,
                            color: Colors.grey[500],
                            //Theme.of(context).colorScheme.secondary,
                            fontSize: b_text_size * 0.9,
                            // fontFamily: 'decotype-thuluth-ii',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0,right: 7, left: 7),
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       right: width * 0.1),
                            //   child: Icon(
                            //     LineariconsFree.store,
                            //     size: width * 0.1,
                            //     color: Colors.grey[600],
                            //   ),
                            // ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 0),
                                child: Text("تعداد افرادی که غذا را پسندیده اند",
                                  style: TextStyle(
                                    // color: isDarkMode
                                    //     ? Colors.white
                                    //     : Colors.white,
                                    color: Colors.grey[800],
                                    //Theme.of(context).colorScheme.secondary,
                                    fontSize: b_text_size * 0.7,
                                    // fontFamily: 'decotype-thuluth-ii',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                            ),

                          ]
                      ),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0, right: 10
                        ),
                        child: Text(
                          widget.meal_food.refused.length.toString().toPersianDigit(),
                          style: TextStyle(
                            // color: isDarkMode
                            //     ? Colors.white
                            //     : Colors.white,
                            color: Colors.grey[500],
                            //Theme.of(context).colorScheme.secondary,
                            fontSize: b_text_size * 0.9,
                            // fontFamily: 'decotype-thuluth-ii',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0,right: 7, left: 7),
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       right: width * 0.1),
                            //   child: Icon(
                            //     LineariconsFree.store,
                            //     size: width * 0.1,
                            //     color: Colors.grey[600],
                            //   ),
                            // ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 0),
                                child: Text("تعداد افرادی که غذا را میانه رای داده اند",
                                  style: TextStyle(
                                    // color: isDarkMode
                                    //     ? Colors.white
                                    //     : Colors.white,
                                    color: Colors.grey[800],
                                    //Theme.of(context).colorScheme.secondary,
                                    fontSize: b_text_size * 0.7,
                                    // fontFamily: 'decotype-thuluth-ii',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                            ),

                          ]
                      ),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0, right: 10
                        ),
                        child: Text(
                          widget.meal_food.dislike.length.toString().toPersianDigit(),
                          style: TextStyle(
                            // color: isDarkMode
                            //     ? Colors.white
                            //     : Colors.white,
                            color: Colors.grey[500],
                            //Theme.of(context).colorScheme.secondary,
                            fontSize: b_text_size * 0.9,
                            // fontFamily: 'decotype-thuluth-ii',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0,right: 7, left: 7),
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       right: width * 0.1),
                            //   child: Icon(
                            //     LineariconsFree.store,
                            //     size: width * 0.1,
                            //     color: Colors.grey[600],
                            //   ),
                            // ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 0),
                                child: Text("تعداد افرادی که غذا را نپسندیده اند",
                                  style: TextStyle(
                                    // color: isDarkMode
                                    //     ? Colors.white
                                    //     : Colors.white,
                                    color: Colors.grey[800],
                                    //Theme.of(context).colorScheme.secondary,
                                    fontSize: b_text_size * 0.7,
                                    // fontFamily: 'decotype-thuluth-ii',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                            ),

                          ]
                      ),
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0, right: 10
                        ),
                        child: Text(
                          (widget.meal_food.users_ate.length-widget.meal_food.user_vote).toString().toPersianDigit(),
                          style: TextStyle(
                            // color: isDarkMode
                            //     ? Colors.white
                            //     : Colors.white,
                            color: Colors.grey[500],
                            //Theme.of(context).colorScheme.secondary,
                            fontSize: b_text_size * 0.9,
                            // fontFamily: 'decotype-thuluth-ii',
                            fontWeight: FontWeight.w700,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0,right: 7, left: 7),
                      child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       right: width * 0.1),
                            //   child: Icon(
                            //     LineariconsFree.store,
                            //     size: width * 0.1,
                            //     color: Colors.grey[600],
                            //   ),
                            // ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 0),
                                child: Text("تعداد افرادی که رای نداده اند",
                                  style: TextStyle(
                                    // color: isDarkMode
                                    //     ? Colors.white
                                    //     : Colors.white,
                                    color: Colors.grey[800],
                                    //Theme.of(context).colorScheme.secondary,
                                    fontSize: b_text_size * 0.7,
                                    // fontFamily: 'decotype-thuluth-ii',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                            ),

                          ]
                      ),
                    ),

                  ],
                ),


              ],
            ),

          )
          // SizedBox(
          //   width: width * 0.18,
          //   child: Stack(
          //     children: [
          //
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   width: width * 0.3,
          // ),



          // const SizedBox(
          //   height: 18,
          // ),
          //
          // const SizedBox(
          //   width: 28,
          // ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff006600),
            value: widget.meal_food.like.length.toDouble() as double,
            title: (100*(widget.meal_food.like.length/widget.meal_food.users_ate.length)).toString() + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: widget.meal_food.refused.length.toDouble() as double,
            title: (100*(widget.meal_food.refused.length/widget.meal_food.users_ate.length)).toString() + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xffcc3300),
            value: widget.meal_food.dislike.length.toDouble() as double,
            title: (100*(widget.meal_food.dislike.length/widget.meal_food.users_ate.length)).toString() + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff999999),
            value: (widget.meal_food.users_ate.length-widget.meal_food.user_vote).toDouble() as double,
            title: (100*((widget.meal_food.users_ate.length-widget.meal_food.user_vote)/widget.meal_food.users_ate.length)).toString() + "%",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}