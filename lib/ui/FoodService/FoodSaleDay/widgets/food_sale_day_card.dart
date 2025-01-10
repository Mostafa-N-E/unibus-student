import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../common/http_client.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/source/food_data_source.dart';
import '../../../../data/source/meal_food_data_source.dart';
import '../../../../ui/widgets/snackbar.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../../data/repo/meal_food_repository.dart';
import '../../../widgets/progress_indicator.dart';
import '../../DetailFood/detailFood.dart';
import '../../../widgets/fast_cached_image.dart';
import 'meal_food_chart.dart';

final mealFoodRepository = MealFoodRepository(MealFoodRemoteDataSource(httpClient) as IMealFoodDataSource);


class FoodSaleDayCard extends StatefulWidget {
  MealFoodEntity meal_food;
  FoodSaleDayCard({
    Key? key,
    required this.meal_food,
  }) : super(key: key);

  @override
  _FoodSaleDayCardState createState() => _FoodSaleDayCardState();
}

class _FoodSaleDayCardState extends State<FoodSaleDayCard> {
  // Map profile_data = Hive.box('cache').get('profile_data');
  bool has_reserve = false;
  bool has_additional_sell = false;
  Map item_data = {};
  bool item_fetched = true;
  bool fetched = false;
  Map data = {};


  Future<void> _refresh() async{
    // setState((){fetched = false; status = false;} );
    await get_data();
    setState((){
      has_reserve = widget.meal_food.has_reserve(global_userInfo.id);
      has_additional_sell = widget.meal_food.has_additional_sell(global_userInfo.id);
    });
    setState((){} );
  }

  get_data() async {
    // setState(() {
    //   fetched = false;
    // });
    // Turn().turns(
    //     {
    //       "date":'${date.year}-${date.month}-${date.day}'
    //     }
    // ).then((fetch_data) {
    //   Hive.box('cache').put('turn_cache_list', fetch_data['turns']);
    //   setState(() {
    //     // title = widget.data['weekday'] as int;
    //     data = fetch_data;
    //     turns = fetch_data['turns'];
    //     turn_cache_list = fetch_data['turns'];
    //
    //     fetched = true;
    //   });
    // });
    // data = await Turn().get_turns_weekly(1);
  }

  @override
  void initState() {
    print("|||||||||||||||||||||||||||||||||||||||||||");

    // print(profile_data);
    setState((){
      has_reserve = widget.meal_food.has_reserve(global_userInfo.id);
      has_additional_sell = widget.meal_food.has_additional_sell(global_userInfo.id);
    });
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
        mediumScreen_size: width * 0.23,
        smallScreen_size: width * 0.3,
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
        largeScreen_size: height * 0.3,
        mediumScreen_size: height * 0.265,
        smallScreen_size: height * 0.23,
        min_size: height * 0.25,
        max_size: height * 0.3,
        context: context
    ).get_width_size();


    return Container(
      height: container_height,
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
                  child: SizedBox(
                    height: image_width,
                    width: image_width,
                    child: Stack(
                        children: [
                          fast_cached_image_builder(
                              main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', width: image_width * 0.8, height: image_width * 0.8
                          ),
                          Positioned(
                            // top: (width * 0.33),
                              right: (image_width * 0.98),

                              child: InkWell(
                                onTap: () {
                                  if (widget.meal_food.food.like.contains(global_userInfo.id)){
                                    setState(() {
                                      widget.meal_food.food.like.remove(global_userInfo.id);
                                      Food_API().remove_favorite(
                                          {
                                            "food_id":widget.meal_food.food.id
                                          }
                                      ).then((fetch_data) {
                                        ShowSnackBar().showSnackBar(
                                            context,
                                            "با موفقیت لیست علاقه مندی تان تغییر داده شد",
                                            duration: const Duration(seconds: 2),
                                            noAction: false,
                                            background_color: Colors.green.shade400
                                        );
                                      });
                                    });
                                  }else{
                                    setState(() {
                                      widget.meal_food.food.like.add(global_userInfo.id);
                                      Food_API().add_favorite(
                                          {
                                            "food_id":widget.meal_food.food.id
                                          }
                                      ).then((fetch_data) {
                                        ShowSnackBar().showSnackBar(
                                            context,
                                            "با موفقیت لیست علاقه مندی تان تغییر داده شد",
                                            duration: const Duration(seconds: 2),
                                            noAction: false,
                                            background_color: Colors.green.shade400
                                        );
                                      });
                                    });
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  shadowColor: Colors.transparent,
                                  child: widget.meal_food.food.like.contains(global_userInfo.id)?
                                  Padding(
                                    padding: EdgeInsets.all(7),
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: icon_size,
                                    ),
                                  )
                                      :
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      LineariconsFree.heart_1,
                                      color: Colors.black87,
                                      size: icon_size * 0.8,
                                    ),
                                  ),

                                  // widget.meal_food.like.contains(profile_data['id'])
                                  //     ?
                                  // Icon(
                                  //   Icons
                                  //       .favorite_rounded,
                                  //   color: Colors.red,
                                  //   size: width * 0.08,
                                  // )
                                  //     :
                                  // Icon(
                                  //   Icons.favorite_border_rounded,
                                  //   // LineariconsFree.heart_1,
                                  //   color: Colors.black87,
                                  //   size: width * 0.08,//isDarkMode ? Colors.black87 : Colors.white,
                                  // ),
                                ),
                              )
                          ),

                        ]
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: (MediaQuery.of(context).size.height) /2,
                    // width: (MediaQuery.of(context).size.width) /2,
                    decoration: BoxDecoration(
                      // color: Theme.of(context)
                      //     .colorScheme
                      //     .secondary
                      //     .withOpacity(0.17),
                      borderRadius: BorderRadius.circular(35.0),
                      // border: Border.all(width: 1,
                      //     color: Theme.of(context).colorScheme.secondary as Color),
                      // borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.meal_food.base.name as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey[500],
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: b_text_size,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(" - "),
                                  Text(widget.meal_food.food.type as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey[400],
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: b_text_size,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )

                                ],
                              ),
                              Center(
                                  child: Text(widget.meal_food.food.name as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey[700],
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: widget.meal_food.food.name.length < 11 ?
                                      h1_text_size * 1 :
                                      widget.meal_food.food.name.length < 15 ?
                                      h1_text_size * 0.7 :
                                      widget.meal_food.food.name.length < 20 ?
                                      b_text_size * 1 :
                                      b_text_size * 0.7,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Sahel',
                                    ),
                                  )
                              ),
                              Container(
                                // height: (MediaQuery.of(context).size.height) /2,
                                // width: (MediaQuery.of(context).size.width) /2,
                                decoration: BoxDecoration(
                                  // color: Theme.of(context)
                                  //     .colorScheme
                                  //     .secondary
                                  //     .withOpacity(0.17),
                                  borderRadius: BorderRadius.circular(35.0),
                                  // border: Border.all(width: 1,
                                  //     color: Theme.of(context).colorScheme.secondary as Color),
                                  // borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0, left: 5, right: 5),
                                  child: widget.meal_food.enable_main_reserve ?
                                  Container(
                                      height: container_height * 0.15,
                                      // width: MediaQuery.of(context).size.width / 1.1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        // border: Border.all(
                                        //     color: Theme.of(context)
                                        //         .colorScheme
                                        //         .secondary
                                        //         .withOpacity(1) as Color),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              // left: 12.0,
                                              //   right: 12,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                                "هزینه:",
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontFamily: "Sahel",
                                                  fontSize: b_text_size * 0.8,
                                                  // letterSpacing: 1,
                                                  // fontWeight:
                                                  //     FontWeight
                                                  //         .bold
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0,
                                                right: 5,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                                widget.meal_food.food.cost_main_reserved.toString(),
                                                style: TextStyle(
                                                  color: Theme.of(
                                                      context)
                                                      .colorScheme
                                                      .secondary
                                                      .withOpacity(1),
                                                  fontFamily: "Digital",
                                                  fontSize: b_text_size,
                                                  // letterSpacing: 1,
                                                  // fontWeight:
                                                  //     FontWeight
                                                  //         .bold
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0,
                                                right: 0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                                "تومان",
                                                style: TextStyle(
                                                  color: Theme.of(
                                                      context)
                                                      .colorScheme
                                                      .secondary
                                                      .withOpacity(1),
                                                  fontFamily: "Digital",
                                                  fontSize: b_text_size * 0.7,
                                                  // letterSpacing: 1,
                                                  // fontWeight:
                                                  //     FontWeight
                                                  //         .bold
                                                )
                                            ),
                                          ),
                                        ],
                                      )
                                  )
                                      : Padding(padding: EdgeInsets.all(0)),
                                ),
                                // width: double.infinity,
                                // height: double.infinity,
                              ),
                            ],
                          ),


                          has_reserve ?
                          Padding(
                            padding: EdgeInsets.only(bottom: 7),
                            child: Container(
                                height: container_height * 0.19,
                                width: width * 0.82,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  // border: Border.all(width: 0.15,
                                  //     color: Theme.of(context).colorScheme.secondary as Color),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       right: 10, top: 0),
                                    //   child: Icon(has_reserve?
                                    //   LineariconsFree.checkmark_cicle
                                    //       :LineariconsFree.cross_circle,
                                    //     color: has_reserve
                                    //         ?
                                    //     Colors.greenAccent
                                    //         :
                                    //     Colors.red,
                                    //     size: width * 0.1,
                                    //   ),
                                    // ),
                                    // SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0),
                                      child: Text(has_reserve?
                                      'شما رزرو دارید':
                                      'شما رزرو ندارید',
                                        style: TextStyle(
                                            color: has_reserve
                                                ?
                                            Colors.green
                                                :
                                            Colors.red,
                                            fontSize: b_text_size * 0.65,
                                            letterSpacing: 1,
                                            fontWeight:
                                            FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0),
                                      child: Text(
                                        '(امکان تغییر نیست)',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: b_text_size * 0.5,
                                            letterSpacing: 1,
                                            fontWeight:
                                            FontWeight.normal),
                                      ),
                                    )
                                  ],
                                )),
                          )
                          :
                          InkWell(
                              child: Container(
                                // decoration:  BoxDecoration(
                                //   boxShadow: [
                                //     BoxShadow(
                                //       color: Colors.grey.shade300,
                                //       blurRadius: 10.0,
                                //     ),
                                //   ],
                                // ),
                                  child: Card(
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                                    // ),
                                      child: SizedBox(
                                          width: double.infinity,
                                          height: container_height * 0.12,
                                          child: Center(
                                            child: has_additional_sell ?
                                            Text(
                                              'قبلا خریده اید',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'Sahel',
                                                  fontSize: b_text_size  * 0.7
                                              ),
                                            )
                                            // Icon(
                                            //   LineariconsFree.cross_circle,
                                            //   color: Colors.red,
                                            //   size: width * 0.1,
                                            // )
                                                :
                                            Text(
                                              'خرید',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontFamily: 'Sahel',
                                                  fontSize: b_text_size  * 0.7
                                              ),
                                            ),
                                            // Icon(
                                            //   LineariconsFree.checkmark_cicle,
                                            //   color: Colors.green,
                                            //   size: width * 0.1,
                                            // ),,
                                          )
                                      )
                                  )
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Center(
                                      child: CustomProgressIndicator(),
                                    );
                                  },
                                );
                                if(has_additional_sell){

                                }else{
                                  mealFoodRepository.buy_meal_food({
                                    "meal_food_id": widget.meal_food.id,
                                  }).then((fetch_data) {
                                    print(fetch_data);
                                    setState(() {
                                      item_data = fetch_data;
                                      item_fetched = true;
                                      widget.meal_food.reserved.add(global_userInfo.id);
                                      // item['reserved'].remove(item['id']);
                                      Navigator.of(context,rootNavigator:true).pop();
                                      showDialog(
                                        context: context,
                                        builder: (
                                            BuildContext context) {
                                          // print("-----------------------------------------object");
                                          // print(result);
                                          return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      30)),
                                              // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                              //   title: Text("اطلاعات تگ :"),
                                              content: Container(
                                                // decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.circular(30)
                                                // ),
                                                height: MediaQuery
                                                    .of(
                                                    context)
                                                    .size
                                                    .height * 0.3,
                                                // color: data!['status'] as bool ? Colors.green : Colors.red,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    // Text('${value["nfca"]["identifier"]}'),
                                                    Icon(
                                                      item_data!['status'] as bool
                                                          ? LineariconsFree
                                                          .checkmark_cicle
                                                          : LineariconsFree
                                                          .cross_circle,
                                                      color: item_data!['status']
                                                      as bool
                                                          ? Colors
                                                          .green
                                                          : Colors
                                                          .red,
                                                      size: 170,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 10) ,
                                                      child: Text(
                                                        item_data!['message'],
                                                        style: TextStyle(
                                                          color: item_data!['status']
                                                          as bool
                                                              ? Colors
                                                              .green
                                                              : Colors
                                                              .red,
                                                          // fontSize: 20
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ));
                                          ;
                                        },
                                      );
                                      _refresh();

                                    });
                                  });
                                  setState((){});
                                }
                              }
                          )
                          ,

                        ],
                      ),
                    ),
                    // width: double.infinity,
                    // height: double.infinity,
                  ),
                ),
              ],
            ),

            Align(
              alignment:
              Alignment.topRight,
              child: Row(
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  // ProfileTileTrailingMenu(),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: Theme.of(context).iconTheme.color,
                      // size: b_text_size,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.more_horiz_outlined,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              // AppLocalizations.of(
                              //   context,
                              // )!
                              //     .remove,
                                "جزیات بیشتر"
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bar_chart_rounded,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              // AppLocalizations.of(
                              //   context,
                              // )!
                              //     .remove,
                                "دیدن آخرین نظرسنجی این غذا"
                            ),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (int? value) {
                      if (value == 0) {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => new DetailFood(meal_food: widget.meal_food,),
                            )
                        );
                      }
                      if (value == 1) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MealFoodChart()
                        //     )
                        // );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: CustomProgressIndicator(),
                            );
                          },
                        );
                        MealFood_API().result_feedback({
                          "meal_food_id": widget.meal_food.id,
                          "is_last_record": true
                        }).then((fetch_data) {
                          print(fetch_data);
                          if(fetch_data['status'] == true){
                            setState(() {
                              // item_data = fetch_data;
                              Navigator.of(context, rootNavigator: true).pop();
                              showDialog(
                                context: context,
                                builder: (
                                    BuildContext context) {
                                  // print("-----------------------------------------object");
                                  // print(result);
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              30)),
                                      // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                      //   title: Text("اطلاعات تگ :"),
                                      content: Container(
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(30)
                                        // ),
                                        height: height * 0.65,
                                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                                        child: MealFoodChart(meal_food: meal_food_builder(fetch_data['data'])),
                                      )
                                  );
                                },
                              );

                            });
                          }else{
                            setState(() {
                              // item_data = fetch_data;
                              Navigator.of(context, rootNavigator: true).pop();

                              showDialog(
                                context: context,
                                builder: (
                                    BuildContext context) {
                                  // print("-----------------------------------------object");
                                  // print(result);
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              30)),
                                      // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                      //   title: Text("اطلاعات تگ :"),
                                      content: Container(
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(30)
                                        // ),
                                        height: height * 0.5,
                                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            // Text('${value["nfca"]["identifier"]}'),
                                            Icon(LineariconsFree.cross,
                                              color:Colors.redAccent.shade100,
                                              size: 170,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10) ,
                                              child: Text(
                                                fetch_data!['message'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color:Colors.grey[500],
                                                  // fontSize: 20
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ));
                                },
                              );

                            });
                          }

                        });

                      }
                    },
                  )
                ],
              ),
            ),

          ],

        ),
      ),
    );
  }
}


class LargePageFoodSaleDayCard extends StatefulWidget {
  MealFoodEntity meal_food;
  LargePageFoodSaleDayCard({
    Key? key,
    required this.meal_food
  }) : super(key: key);

  @override
  _LargePageFoodSaleDayCardState createState() => _LargePageFoodSaleDayCardState();
}

class _LargePageFoodSaleDayCardState extends State<LargePageFoodSaleDayCard> {
  // Map profile_data = Hive.box('cache').get('profile_data');
  bool has_reserve = false;
  bool has_additional_sell = false;
  Map item_data = {};
  bool item_fetched = true;
  bool fetched = false;
  Map data = {};

  @override
  void initState() {
    print("|||||||||||||||||||||||||||||||||||||||||||");

    print(global_userInfo.id);
    setState((){
      has_reserve = widget.meal_food.has_reserve(global_userInfo.id);
      has_additional_sell = widget.meal_food.has_additional_sell(global_userInfo.id);
    });
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
        largeScreen_size: width * 0.1,
        mediumScreen_size: width * 0.086,
        smallScreen_size: width * 0.39,
        min_size: width * 0.7,
        max_size: width * 0.1,
        context: context
    ).get_width_size();
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
    double borderRadius = ResponsiveSizeWidget(
        largeScreen_size: 20,
        mediumScreen_size: 13,
        smallScreen_size: 20,
        min_size: 11,
        max_size: 22,
        context: context
    ).get_custom_size();

    double container_height = ResponsiveSizeWidget(
        largeScreen_size: height * 0.2,
        mediumScreen_size: height * 0.22,
        smallScreen_size: height * 0.25,
        min_size: height * 0.25,
        max_size: height * 0.2,
        context: context
    ).get_height_size();
    double container_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.26,
        mediumScreen_size: width * 0.32,
        smallScreen_size: width * 0.9,
        min_size: width * 0.9,
        max_size: width * 0.26,
        context: context
    ).get_width_size();


    return Container(
      height: container_height,
      width: container_width,
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
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: image_width,
                    width: image_width,
                    child: Stack(
                        children: [
                          fast_cached_image_builder(
                              main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', width: image_width * 0.8, height: image_width * 0.8
                          ),
                          Positioned(
                            // top: (width * 0.33),
                              right: (image_width * 0.95),

                              child: InkWell(
                                onTap: () {
                                  if (widget.meal_food.food.like.contains(global_userInfo.id)){
                                    setState(() {
                                      widget.meal_food.food.like.remove(global_userInfo.id);
                                      Food_API().remove_favorite(
                                          {
                                            "food_id":widget.meal_food.food.id
                                          }
                                      ).then((fetch_data) {
                                        ShowSnackBar().showSnackBar(
                                            context,
                                            "با موفقیت لیست علاقه مندی تان تغییر داده شد",
                                            duration: const Duration(seconds: 2),
                                            noAction: false,
                                            background_color: Colors.green.shade400
                                        );
                                      });
                                    });
                                  }else{
                                    setState(() {
                                      widget.meal_food.food.like.add(global_userInfo.id);
                                      Food_API().add_favorite(
                                          {
                                            "food_id":widget.meal_food.food.id
                                          }
                                      ).then((fetch_data) {
                                        ShowSnackBar().showSnackBar(
                                            context,
                                            "با موفقیت لیست علاقه مندی تان تغییر داده شد",
                                            duration: const Duration(seconds: 2),
                                            noAction: false,
                                            background_color: Colors.green.shade400
                                        );
                                      });
                                    });
                                  }
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                  ),
                                  shadowColor: Colors.transparent,
                                  child: widget.meal_food.food.like.contains(global_userInfo.id)?
                                  Padding(
                                    padding: EdgeInsets.all(7),
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: icon_size,
                                    ),
                                  )
                                      :
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      LineariconsFree.heart_1,
                                      color: Colors.black87,
                                      size: icon_size * 0.8,
                                    ),
                                  ),

                                  // widget.meal_food.like.contains(profile_data['id'])
                                  //     ?
                                  // Icon(
                                  //   Icons
                                  //       .favorite_rounded,
                                  //   color: Colors.red,
                                  //   size: width * 0.08,
                                  // )
                                  //     :
                                  // Icon(
                                  //   Icons.favorite_border_rounded,
                                  //   // LineariconsFree.heart_1,
                                  //   color: Colors.black87,
                                  //   size: width * 0.08,//isDarkMode ? Colors.black87 : Colors.white,
                                  // ),
                                ),
                              )
                          ),

                        ]
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: (MediaQuery.of(context).size.height) /2,
                    // width: (MediaQuery.of(context).size.width) /2,
                    decoration: BoxDecoration(
                      // color: Theme.of(context)
                      //     .colorScheme
                      //     .secondary
                      //     .withOpacity(0.17),
                      borderRadius: BorderRadius.circular(35.0),
                      // border: Border.all(width: 1,
                      //     color: Theme.of(context).colorScheme.secondary as Color),
                      // borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.meal_food.base.name as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey[500],
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: b_text_size * 0.6,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Text(" - "),
                                  Text(widget.meal_food.food.type as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey[400],
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: b_text_size * 0.6,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )

                                ],
                              ),
                              Center(
                                  child: Text(widget.meal_food.food.name as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey[700],
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: widget.meal_food.food.name.length < 11 ?
                                      h1_text_size * 0.6 :
                                      widget.meal_food.food.name.length < 15 ?
                                      b_text_size * 1 :
                                      widget.meal_food.food.name.length < 20 ?
                                      b_text_size * 0.8 :
                                      b_text_size * 0.7,
                                      // fontFamily: 'decotype-thuluth-ii',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )
                              ),
                              Container(
                                // height: (MediaQuery.of(context).size.height) /2,
                                // width: (MediaQuery.of(context).size.width) /2,
                                decoration: BoxDecoration(
                                  // color: Theme.of(context)
                                  //     .colorScheme
                                  //     .secondary
                                  //     .withOpacity(0.17),
                                  borderRadius: BorderRadius.circular(35.0),
                                  // border: Border.all(width: 1,
                                  //     color: Theme.of(context).colorScheme.secondary as Color),
                                  // borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 0.0, left: 5, right: 5),
                                  child: widget.meal_food.enable_main_reserve ?
                                  Container(
                                      height: container_height * 0.15,
                                      // width: MediaQuery.of(context).size.width / 1.1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        // border: Border.all(
                                        //     color: Theme.of(context)
                                        //         .colorScheme
                                        //         .secondary
                                        //         .withOpacity(1) as Color),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              // left: 12.0,
                                              //   right: 12,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                                "هزینه:",
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontFamily: "Sahel",
                                                  fontSize: b_text_size * 0.8,
                                                  // letterSpacing: 1,
                                                  // fontWeight:
                                                  //     FontWeight
                                                  //         .bold
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0,
                                                right: 5,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                                widget.meal_food.food.cost_main_reserved.toString(),
                                                style: TextStyle(
                                                  color: Theme.of(
                                                      context)
                                                      .colorScheme
                                                      .secondary
                                                      .withOpacity(1),
                                                  fontFamily: "Digital",
                                                  fontSize: b_text_size,
                                                  // letterSpacing: 1,
                                                  // fontWeight:
                                                  //     FontWeight
                                                  //         .bold
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0,
                                                right: 0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                                "تومان",
                                                style: TextStyle(
                                                  color: Theme.of(
                                                      context)
                                                      .colorScheme
                                                      .secondary
                                                      .withOpacity(1),
                                                  fontFamily: "Digital",
                                                  fontSize: b_text_size * 0.7,
                                                  // letterSpacing: 1,
                                                  // fontWeight:
                                                  //     FontWeight
                                                  //         .bold
                                                )
                                            ),
                                          ),
                                        ],
                                      )
                                  )
                                      : Padding(padding: EdgeInsets.all(0)),
                                ),
                                // width: double.infinity,
                                // height: double.infinity,
                              ),
                            ],
                          ),


                          has_reserve ?
                          Padding(
                            padding: EdgeInsets.only(bottom: 7),
                            child: Container(
                                height: container_height * 0.2,
                                width: width * 0.82,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  // border: Border.all(width: 0.15,
                                  //     color: Theme.of(context).colorScheme.secondary as Color),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //       right: 10, top: 0),
                                    //   child: Icon(has_reserve?
                                    //   LineariconsFree.checkmark_cicle
                                    //       :LineariconsFree.cross_circle,
                                    //     color: has_reserve
                                    //         ?
                                    //     Colors.greenAccent
                                    //         :
                                    //     Colors.red,
                                    //     size: width * 0.1,
                                    //   ),
                                    // ),
                                    // SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0),
                                      child: Text(has_reserve?
                                      'شما رزرو دارید':
                                      'شما رزرو ندارید',
                                        style: TextStyle(
                                            color: has_reserve
                                                ?
                                            Colors.green
                                                :
                                            Colors.red,
                                            fontSize: b_text_size,
                                            letterSpacing: 1,
                                            fontWeight:
                                            FontWeight.normal),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0),
                                      child: Text(
                                        '(امکان تغییر نیست)',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: b_text_size,
                                            letterSpacing: 1,
                                            fontWeight:
                                            FontWeight.normal),
                                      ),
                                    )
                                  ],
                                )),
                          )
                              :
                          InkWell(
                              child: Container(
                                // decoration:  BoxDecoration(
                                //   boxShadow: [
                                //     BoxShadow(
                                //       color: Colors.grey.shade300,
                                //       blurRadius: 10.0,
                                //     ),
                                //   ],
                                // ),
                                  child: Card(
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                                    // ),
                                      child: SizedBox(
                                          width: double.infinity,
                                          height: container_height * 0.12,
                                          child: Center(
                                            child: has_additional_sell ?
                                            Text(
                                              'قبلا خریده اید',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'Sahel',
                                                  fontSize: b_text_size  * 0.7
                                              ),
                                            )
                                            // Icon(
                                            //   LineariconsFree.cross_circle,
                                            //   color: Colors.red,
                                            //   size: width * 0.1,
                                            // )
                                                :
                                            Text(
                                              'خرید',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontFamily: 'Sahel',
                                                  fontSize: b_text_size  * 0.7
                                              ),
                                            ),
                                            // Icon(
                                            //   LineariconsFree.checkmark_cicle,
                                            //   color: Colors.green,
                                            //   size: width * 0.1,
                                            // ),,
                                          )
                                      )
                                  )
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Center(
                                      child: CustomProgressIndicator(),
                                    );
                                  },
                                );
                                if(has_additional_sell){

                                }else{
                                  mealFoodRepository.buy_meal_food({
                                    "meal_food_id": widget.meal_food.id,
                                  }).then((fetch_data) {
                                    print(fetch_data);
                                    setState(() {
                                      item_data = fetch_data;
                                      item_fetched = true;
                                      widget.meal_food.reserved.add(global_userInfo.id);
                                      // item['reserved'].remove(item['id']);
                                      Navigator.of(context,rootNavigator:true).pop();
                                      showDialog(
                                        context: context,
                                        builder: (
                                            BuildContext context) {
                                          // print("-----------------------------------------object");
                                          // print(result);
                                          return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      30)),
                                              // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                              //   title: Text("اطلاعات تگ :"),
                                              content: Container(
                                                // decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.circular(30)
                                                // ),
                                                height: MediaQuery
                                                    .of(
                                                    context)
                                                    .size
                                                    .height * 0.3,
                                                // color: data!['status'] as bool ? Colors.green : Colors.red,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    // Text('${value["nfca"]["identifier"]}'),
                                                    Icon(
                                                      item_data!['status'] as bool
                                                          ? LineariconsFree
                                                          .checkmark_cicle
                                                          : LineariconsFree
                                                          .cross_circle,
                                                      color: item_data!['status']
                                                      as bool
                                                          ? Colors
                                                          .green
                                                          : Colors
                                                          .red,
                                                      size: 170,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 10) ,
                                                      child: Text(
                                                        item_data!['message'],
                                                        style: TextStyle(
                                                          color: item_data!['status']
                                                          as bool
                                                              ? Colors
                                                              .green
                                                              : Colors
                                                              .red,
                                                          // fontSize: 20
                                                        ),
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ));
                                          ;
                                        },
                                      );
                                      // _refresh();

                                    });
                                  });
                                  setState((){});
                                }
                              }
                          )
                          ,

                        ],
                      ),
                    ),
                    // width: double.infinity,
                    // height: double.infinity,
                  ),
                ),
              ],
            ),

            Align(
              alignment:
              Alignment.topRight,
              child: Row(
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  // ProfileTileTrailingMenu(),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: Theme.of(context).iconTheme.color,
                      size: b_text_size,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.more_horiz_outlined,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              // AppLocalizations.of(
                              //   context,
                              // )!
                              //     .remove,
                                "جزیات بیشتر"
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.bar_chart_rounded,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              // AppLocalizations.of(
                              //   context,
                              // )!
                              //     .remove,
                                "دیدن آخرین نظرسنجی این غذا"
                            ),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (int? value) {
                      if (value == 0) {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => new DetailFood(meal_food: widget.meal_food,),
                            )
                        );
                      }
                      if (value == 1) {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MealFoodChart()
                        //     )
                        // );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: CustomProgressIndicator(),
                            );
                          },
                        );
                        MealFood_API().result_feedback({
                          "meal_food_id": widget.meal_food.id,
                          "is_last_record": true
                        }).then((fetch_data) {
                          print(fetch_data);
                          if(fetch_data['status'] == true){
                            setState(() {
                              // item_data = fetch_data;
                              Navigator.of(context, rootNavigator: true).pop();
                              showDialog(
                                context: context,
                                builder: (
                                    BuildContext context) {
                                  // print("-----------------------------------------object");
                                  // print(result);
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              30)),
                                      // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                      //   title: Text("اطلاعات تگ :"),
                                      content: Container(
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(30)
                                        // ),
                                        height: height * 0.62,
                                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                                        child: LargePageMealFoodChart(meal_food: meal_food_builder(fetch_data['data'])),
                                      )
                                  );
                                },
                              );

                            });
                          }else{
                            setState(() {
                              // item_data = fetch_data;
                              Navigator.of(context, rootNavigator: true).pop();

                              showDialog(
                                context: context,
                                builder: (
                                    BuildContext context) {
                                  // print("-----------------------------------------object");
                                  // print(result);
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              30)),
                                      // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
                                      //   title: Text("اطلاعات تگ :"),
                                      content: Container(
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(30)
                                        // ),
                                        height: height * 0.5,
                                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            // Text('${value["nfca"]["identifier"]}'),
                                            Icon(LineariconsFree.cross,
                                              color:Colors.redAccent.shade100,
                                              size: 170,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10) ,
                                              child: Text(
                                                fetch_data!['message'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color:Colors.grey[500],
                                                  // fontSize: 20
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ));
                                },
                              );

                            });
                          }

                        });

                      }
                    },
                  )
                ],
              ),
            ),

          ],

        ),
      ),
    );
  }
}