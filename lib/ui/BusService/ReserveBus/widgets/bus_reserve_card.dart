import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rajaee_web_app/data/repo/turn_repository.dart';
import '../../../../common/http_client.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/source/food_data_source.dart';
import '../../../../data/source/meal_food_data_source.dart';
import '../../../../data/turn.dart';
import '../../../../ui/widgets/snackbar.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/fast_cached_image.dart';
import 'bus_chart.dart';

class BusReserveCard extends StatefulWidget {
  TurnEntity turn;
  BusReserveCard({
    Key? key,
    required this.turn
  }) : super(key: key);

  @override
  _BusReserveCardState createState() => _BusReserveCardState();
}

class _BusReserveCardState extends State<BusReserveCard> {
  // Map profile_data = Hive.box('cache').get('profile_data');
  bool has_reserve = false;
  Map item_data = {};
  bool item_fetched = true;
  bool fetched = false;
  Map data = {};

  Future<void> _refresh() async{
    // setState((){fetched = false; status = false;} );
    // await get_data();
    setState((){
      has_reserve = widget.turn.has_reserve(global_userInfo.id);
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
      has_reserve = widget.turn.has_reserve(global_userInfo.id);
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
        largeScreen_size: width * 0.015,
        mediumScreen_size: width * 0.044,
        smallScreen_size: width * 0.1,
        min_size: width * 0.1,
        max_size: width * 0.015,
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
        smallScreen_size: height * 0.255,
        min_size: height * 0.255,
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
            Align(
              alignment:
              Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(widget.turn.base.type == 1? "رفت به دانشگاه" : "برگشت از دانشگاه" as String,
                  style: TextStyle(
                    // color: isDarkMode
                    //     ? Colors.white
                    //     : Colors.white,
                    color: Colors.grey.shade700,
                    //Theme.of(context).colorScheme.secondary,
                    fontSize: b_text_size * 0.9,
                    fontFamily: 'Sahel',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: image_width,
                    width: image_width,
                    child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: fast_cached_image_builder(
                                main_image_url: "", placeholder_image_path: widget.turn.base.type == 1 ?  'assets/images/bus-went.png':"assets/images/bus-return.png", width: image_width * 0.95, height: image_width * 0.95
                            ),
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
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Text(widget.turn.base.dormitory.name as String,
                              //       style: TextStyle(
                              //         // color: isDarkMode
                              //         //     ? Colors.white
                              //         //     : Colors.white,
                              //         color: Colors.grey[500],
                              //         //Theme.of(context).colorScheme.secondary,
                              //         fontSize: b_text_size,
                              //         fontFamily: 'Sahel',
                              //         fontWeight: FontWeight.w900,
                              //       ),
                              //     ),
                              //     Text(" - "),
                              //     Text(widget.turn.base.type == 1 ? "رفت" : "برگشت" as String,
                              //       style: TextStyle(
                              //         // color: isDarkMode
                              //         //     ? Colors.white
                              //         //     : Colors.white,
                              //         color: Colors.grey[400],
                              //         //Theme.of(context).colorScheme.secondary,
                              //         fontSize: b_text_size,
                              //         fontFamily: 'Sahel',
                              //         fontWeight: FontWeight.w900,
                              //       ),
                              //     )
                              //
                              //   ],
                              // ),

                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:ListTile(
                                  isThreeLine: false,
                                  title: Text(
                                    widget.turn.base.type == 1 ? widget.turn.base.dormitory.name : "دانشگاه",
                                    style: TextStyle(
                                        fontFamily: "Sahel",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  subtitle: Text(
                                    "مبدا",
                                    style: TextStyle(
                                        fontSize: b_text_size * 0.46
                                    ),
                                  ),
                                  dense: true,
                                  trailing:Text(
                                    widget.turn.base.start_time.toPersianDigit(),
                                    style: TextStyle(
                                        fontFamily: "Sahel",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  // onTap: () {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => DetailFood(turns: widget.turns,)
                                  //       )
                                  //   );
                                  // },
                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:ListTile(
                                  isThreeLine: false,
                                  hoverColor: Colors.white,
                                  title: Text(
                                    widget.turn.base.type == 1 ? "دانشگاه" : widget.turn.base.dormitory.name,
                                    style: TextStyle(
                                        fontFamily: "Sahel",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  subtitle: Text(
                                    "مقصد",
                                    style: TextStyle(
                                        fontSize: b_text_size * 0.46
                                    ),
                                  ),
                                  dense: true,
                                  trailing:Text(
                                    widget.turn.base.start_time.toPersianDigit(),
                                    style: TextStyle(
                                        fontFamily: "Sahel",
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:ListTile(
                                  hoverColor: Colors.white,
                                  isThreeLine: false,
                                  title: Text(
                                    "هزینه" ,
                                    style: TextStyle(
                                        fontFamily: "Sahel",
                                        fontWeight: FontWeight.w900,
                                      fontSize: b_text_size * 0.8
                                    ),
                                  ),
                                  // subtitle: Text(
                                  //   "مقصد",
                                  //   style: TextStyle(
                                  //       fontSize: b_text_size * 0.46
                                  //   ),
                                  // ),
                                  dense: true,
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0.0,
                                        right: 5,
                                        top: 0,
                                        bottom: 0),
                                    child: Text(
                                        "${widget.turn.base.cost_main_traveler.toString().toPersianDigit()} تومان",
                                        style: TextStyle(
                                            color: Theme.of(
                                                context)
                                                .colorScheme
                                                .secondary
                                                .withOpacity(1),
                                            fontFamily: "Sahel",
                                            fontSize: b_text_size * 0.85,
                                            fontWeight: FontWeight.w900
                                          // letterSpacing: 1,
                                          // fontWeight:
                                          //     FontWeight
                                          //         .bold
                                        )
                                    ),
                                  )
                                ),

                              ),

                            ],
                          ),




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
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (BuildContext context) => new DetailFood(turn: widget.turn,),
                        //     )
                        // );
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
                        turnRepository.result_feedback({
                          "turn_id": widget.turn.id,
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
                                  return CustomAlertDialog(
                                      content: Container(
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(30)
                                        // ),
                                        height: height * 0.8,
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

            widget.turn.enable_main_reserve ?
            Align(
              alignment:
              Alignment.bottomCenter,
              child: Container(
                height: 50,
                padding: EdgeInsets.all(6),
                child: InkWell(
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        shadowColor: Colors.white.withOpacity(0.01),
                        color: has_reserve ? Colors
                            .redAccent.withOpacity(0.2)
                            : Colors
                            .greenAccent.withOpacity(0.2),
                        child: Center(
                          child: has_reserve ?
                          Text(
                            'حذف',
                            style: TextStyle(
                                color: has_reserve ? Colors
                                    .red
                                    : Colors
                                    .green,
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
                            'رزرو',
                            style: TextStyle(
                                color: has_reserve ? Colors
                                    .red
                                    : Colors
                                    .green,
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
                    ),
                    onTap: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return Center(
                      //       child: CustomProgressIndicator(),
                      //     );
                      //   },
                      // );
                      if(has_reserve){
                        turnRepository.delete_reserve({
                          "turn_id": widget.turn.id,
                        }).then((fetch_data) {
                          print(fetch_data);
                          setState(() {
                            item_data = fetch_data;
                            item_fetched = true;
                            if(item_data['status'] == true){
                              widget.turn.reserved.remove(global_userInfo.id);
                            }

                            // Navigator.of(context,rootNavigator:true).pop();
                            ShowSnackBar().showSnackBar(
                              context,
                              item_data!['message'],//? "با موفقیت حذف شد" : "خطا در بارگیری",
                              duration: const Duration(seconds: 1),
                              noAction: false,
                              text_color: Colors.white,
                              background_color: item_data!['status']
                              as bool
                                  ? Colors.green : Colors.red,
                            );
                            if(item_data!['status'])
                              _refresh();

                          });
                        });

                        setState((){});

                      }else{
                        turnRepository.reserve({
                          "turn_id": widget.turn.id,
                        }).then((fetch_data) {
                          print(fetch_data);
                          setState(() {
                            item_data = fetch_data;
                            item_fetched = true;
                            if(item_data['status'] == true){
                              widget.turn.reserved.add(global_userInfo.id);
                            }
                            // Navigator.of(context,rootNavigator:true).pop();
                            ShowSnackBar().showSnackBar(
                              context,
                              item_data!['message'],//item_data!['status']?"با موفقیت اضافه شد":"خطا در بارگیری",
                              duration: const Duration(seconds: 1),
                              noAction: false,
                              text_color: Colors.white,
                              background_color: item_data!['status']
                              as bool
                                  ? Colors
                                  .green
                                  : Colors
                                  .red,
                            );
                            if(item_data!['status'])
                              _refresh();

                          });
                        });
                        setState((){});
                      }
                    }
                ),
              ),
            )
                :
            Align(
              alignment:
              Alignment.bottomCenter,
              child: Padding(
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
                                fontSize: b_text_size * 0.7,
                                // letterSpacing: 1,
                                fontWeight:
                                FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0),
                          child: Text(
                            '(امکان تغییر نیست)',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: b_text_size * 0.6,
                                // letterSpacing: 1,
                                fontWeight:
                                FontWeight.bold),
                          ),
                        )
                      ],
                    )),
              ),
            ),

          ],

        ),
      ),
    );
  }
}


class LargePageBusReserveCard extends StatefulWidget {
  TurnEntity turn;
  LargePageBusReserveCard({
    Key? key,
    required this.turn
  }) : super(key: key);

  @override
  _LargePageBusReserveCardState createState() => _LargePageBusReserveCardState();
}

class _LargePageBusReserveCardState extends State<LargePageBusReserveCard> {
  // Map profile_data = Hive.box('cache').get('profile_data');
  bool has_reserve = false;
  Map item_data = {};
  bool item_fetched = true;
  bool fetched = false;
  Map data = {};

  @override
  void initState() {
    print("|||||||||||||||||||||||||||||||||||||||||||");

    print(global_userInfo.id);
    setState((){
      has_reserve = widget.turn.has_reserve(global_userInfo.id);
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
        largeScreen_size: width * 0.09,
        mediumScreen_size: width * 0.086,
        smallScreen_size: width * 0.39,
        min_size: width * 0.75,
        max_size: width * 0.11,
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
        largeScreen_size: width * 0.015,
        mediumScreen_size: width * 0.03,
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
        largeScreen_size: height * 0.22,
        mediumScreen_size: height * 0.22,
        smallScreen_size: height * 0.25,
        min_size: height * 0.25,
        max_size: height * 0.22,
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
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: SizedBox(
                height: image_width,
                width: image_width,
                child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: fast_cached_image_builder(
                            main_image_url: "", placeholder_image_path: 'assets/images/bus-station.jpeg', width: image_width * 0.95, height: image_width * 0.95
                        ),
                      ),

                    ]
                ),
              ),
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
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //       builder: (BuildContext context) => new DetailFood(turn: widget.meal_food,),
                        //     )
                        // );
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
                        turnRepository.result_feedback({
                          "turn_id": widget.turn.id,
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