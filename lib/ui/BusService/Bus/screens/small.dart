import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/turn.dart';
import '../../../../ui/FoodService/ReserveFood/ReserveFood.dart';
import '../../../../data/auth_info.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/gradient_container.dart';
import '../../../widgets/progress_indicator.dart';
import '../../ReserveBus/ReserveBus.dart';
import '../../ReserveStatus/reserveStatus.dart';
import '../bloc/bus_bloc.dart';
import '../widgets/today_bus_card.dart';

class SmallBusPage extends StatefulWidget {
  final UserInfo user_info;
  final List<TurnEntity> turns;
  const SmallBusPage({Key? key, required this.user_info, required this.turns}) : super(key: key);

  @override
  State<SmallBusPage> createState() => _SmallBusPageState();
}

class _SmallBusPageState extends State<SmallBusPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_3 = new GlobalKey<RefreshIndicatorState>();
  bool fetched = true;
  bool internet_connection = true;
  // Map profile_data = Hive.box('cache').get('profile_data', defaultValue: {});
  // Map profile_data = {"id": 3991231137};
  List<TurnEntity> turns = [];

  Future<void> _refresh() async{
    // await get_data();
  }

  // late AnimateIconController controller;
  @override
  void initState() {
    // get_data();
    setState(() {
      turns = widget.turns;
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
    // bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;

    if(!internet_connection){
      // ShowSnackBar().showSnackBar(
      //     context,
      //     "اتصال به اینترنت برقرار نیست",
      //     duration: const Duration(seconds: 10),
      //     noAction: false,
      //     background_color: Colors.red.shade400,
      //     text_color: Colors.white
      // );
    }
    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.4,
        mediumScreen_size: width * 0.5,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.4,
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
    double item_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.78,
        mediumScreen_size: height * 0.8,
        smallScreen_size: height * 0.83,
        min_size: height * 0.75,
        max_size: height * 0.7,
        context: context
    ).get_height_size();
    double viewportFraction  = ResponsiveSizeWidget(
        largeScreen_size: 0.8,
        mediumScreen_size: 0.9,
        smallScreen_size: 0.8,
        min_size: 0.9,
        max_size: 0.89,
        context: context
    ).get_custom_size();
    double padding = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.1,
        min_size: width * 0.1,
        max_size: width * 0.025,
        context: context
    ).get_width_size();
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
    double toolbarHeight = ResponsiveSizeWidget(
        largeScreen_size: width * 0.055,
        mediumScreen_size: width * 0.08,
        smallScreen_size: width * 0.2,
        min_size: width * 0.2,
        max_size: width * 0.05,
        context: context
    ).get_width_size();
    final Widget appbar_flexibleSpace = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              elevation: 2,
              // color: Theme.of(context)
              //     .colorScheme
              //     .secondary
              //     .withOpacity(0.145),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                ),
              ),
              // shadowColor: Theme.of(context).colorScheme.secondary,
              child: SizedBox(
                height: toolbarHeight * 0.6,
                width: button_width * 1.15,
                child: InkWell(
                  hoverColor: Colors.white70,
                  enableFeedback: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReserveBusScreen()
                        )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          LineariconsFree.cart,
                          // color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        "رزرو سرویس",
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          fontSize:b_text_size* 0.8,
                          // fontFamily: 'decotype-thuluth-ii',
                          fontWeight: FontWeight.w800,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.all(0),
          //   child: Card(
          //     elevation: 2,
          //     // color: Theme.of(context)
          //     //     .colorScheme
          //     //     .secondary
          //     //     .withOpacity(0.145),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //
          //     // shadowColor: Theme.of(context).colorScheme.secondary,
          //     child: SizedBox(
          //       height: toolbarHeight * 0.7,
          //       width: button_width * 0.85,
          //       child: InkWell(
          //         hoverColor: Colors.white70,
          //         enableFeedback: true,
          //         onTap: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => FoodSaleDayScreen()
          //               )
          //           );
          //         },
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               "روز فروش",
          //               style: TextStyle(
          //                 // color: Theme.of(context).colorScheme.secondary,
          //                 fontSize:b_text_size*0.9,
          //                 fontFamily: 'Sahel',
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //             // SizedBox(width: 10),
          //             // Padding(
          //             //   padding: EdgeInsets.only(left: 5),
          //             //   child: Icon(
          //             //     LineariconsFree.checkmark_cicle,
          //             //     // color: Theme.of(context).colorScheme.secondary,
          //             //   ),
          //             // ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              elevation: 2,
              // color: Theme.of(context)
              //     .colorScheme
              //     .secondary
              //     .withOpacity(0.145),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(100),
                    bottomLeft: Radius.circular(100)
                ),
              ),
              // shadowColor: Theme.of(context).colorScheme.secondary,
              child: SizedBox(
                height: toolbarHeight * 0.6,
                width: button_width * 1.15,
                child: InkWell(
                  hoverColor: Colors.white70,
                  enableFeedback: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusReserveStatusPage()
                        )
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "رزرو ها",
                        style: TextStyle(
                          // color: Theme.of(context).colorScheme.secondary,
                          fontSize:b_text_size* 0.8,
                          // fontFamily: 'decotype-thuluth-ii',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      // SizedBox(width: 10),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          LineariconsFree.calendar_full,
                          // color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
    return GradientContainer(
      child: Scaffold(
        backgroundColor: Colors.cyan.withOpacity(0.001),
        appBar: AppBar(
          toolbarOpacity: 0.001,
          backgroundColor: Colors.white.withOpacity(0.001),
          shadowColor: Theme.of(context).shadowColor.withOpacity(0.001),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)
            ),
          ),
          flexibleSpace: appbar_flexibleSpace,
          toolbarHeight: toolbarHeight,
          // backgroundColor: Colors.white,
          // shadowColor: Colors.transparent,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios, color: isDarkMode ? Colors.white : Colors.black,),
          //   onPressed: () => Navigator.of(context).pop(false),
          // ),
        ),

        body: (!fetched)
            ? Center(
          child: CustomProgressIndicator(),
        )
            : turns.isEmpty
            ? Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Text(
                        "سرویس رزرو شده ای برای امروز ندارید"
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: InkWell(
                    onTap: (){
                      BlocProvider.of<BusBloc>(context).add(BusRefresh());
                      // get_data();
                    },
                    child: Icon(
                      LineariconsFree.redo,
                      size: 60,
                      color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                    ),
                  ),
                ),
              ]
          ),
        )
            :RefreshIndicator(
          color: Theme.of(context).colorScheme.secondary,
          key: _refreshIndicatorKey_3,
          onRefresh: ()async{
            BlocProvider.of<BusBloc>(context).add(BusRefresh());
            // _refresh
          },
          child: SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: CarouselSlider.builder(
              // page
                itemCount: turns.length,
                options: CarouselOptions(
                  reverse: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  height: height * 0.79,//item_height ,
                  viewportFraction:  0.81,//viewportFraction,//rotated ? 0.76 : 0.78,
                  // autoPlay: false,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (
                    BuildContext _context,
                    int index,
                    int pageViewIndex,
                    ) =>SmallBusCard(turn: turns[index],)
              // Container(
              //   height:
              //   rotated ? height * 0.65 : height * 0.78,
              //   // decoration: new BoxDecoration(
              //   //   boxShadow: [
              //   //     new BoxShadow(
              //   //       color: Colors.grey.shade300,
              //   //       blurRadius: 20.0,
              //   //     ),
              //   //   ],
              //   // ),
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(35.0),
              //     ),
              //     child: Column(
              //       children: [
              //         Expanded(
              //           child: Stack(children: <Widget>[
              //             Align(
              //               alignment: Alignment.center,
              //               child: Container(
              //                 // height: (MediaQuery.of(context).size.height) /2,
              //                 // width: (MediaQuery.of(context).size.width) /2,
              //                 decoration: BoxDecoration(
              //                   // color: Theme.of(context)
              //                   //     .colorScheme
              //                   //     .secondary
              //                   //     .withOpacity(0.17),
              //                   borderRadius: BorderRadius.circular(35.0),
              //                   // border: Border.all(width: 1,
              //                   //     color: Theme.of(context).colorScheme.secondary as Color),
              //                   // borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
              //                 ),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(0.0),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       Padding(
              //                         padding:  EdgeInsets.only(top: height * 0.2),
              //                         child: SizedBox(
              //                           height: image_width,//width * 0.6,
              //                           width: image_width,//width * 0.6,
              //                           child: Stack(
              //                               children: [
              //                                 InkWell(
              //                                     borderRadius: BorderRadius.circular(35.0),
              //                                     onTap: (){
              //                                       // var route = new MaterialPageRoute(
              //                                       //   builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
              //                                       // );
              //                                       Navigator.of(context).push(
              //                                           MaterialPageRoute(
              //                                             builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
              //                                           )
              //                                       );
              //                                     },
              //                                     child: fast_cached_image_builder(
              //                                         main_image_url: meal_foods[index].food.image, placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
              //                                     )
              //
              //                                 ),
              //                                 Positioned(
              //                                   // top: (width * 0.33),
              //                                     right: (image_width * 0.73),
              //
              //                                     child: InkWell(
              //                                       onTap: () {
              //                                         if (meal_foods[index].food.like.contains(global_userInfo.id)){
              //                                           setState(() {
              //                                             meal_foods[index].food.like.remove(global_userInfo.id);
              //                                             Food_API().remove_favorite(
              //                                                 {
              //                                                   "food_id":meal_foods[index].food.id
              //                                                 }
              //                                             ).then((fetch_data) {
              //                                               ShowSnackBar().showSnackBar(
              //                                                 context,
              //                                                 "با موفقیت لیست علاقه مندی تان تغییر داده شد",
              //                                                 duration: const Duration(seconds: 1),
              //                                                 noAction: false,
              //                                               );
              //                                             });
              //                                           });
              //                                         }else{
              //                                           setState(() {
              //                                             meal_foods[index].food.like.add(global_userInfo.id);
              //                                             Food_API().add_favorite(
              //                                                 {
              //                                                   "food_id":meal_foods[index].food.id
              //                                                 }
              //                                             ).then((fetch_data) {
              //                                               ShowSnackBar().showSnackBar(
              //                                                 context,
              //                                                 "با موفقیت لیست علاقه مندی تان تغییر داده شد",
              //                                                 duration: const Duration(seconds: 1),
              //                                                 noAction: false,
              //                                               );
              //                                             });
              //                                           });
              //                                         }
              //                                       },
              //                                       child: Card(
              //                                         shape: RoundedRectangleBorder(
              //                                           borderRadius: BorderRadius.circular(35.0),
              //                                         ),
              //                                         shadowColor: Colors.transparent,
              //                                         child: meal_foods[index].food.like.contains(widget.user_info.id)?
              //                                         Padding(
              //                                           padding: EdgeInsets.all(7),
              //                                           child: Icon(
              //                                             Icons.favorite_rounded,
              //                                             color: Colors.red,
              //                                             size: image_width * 0.2,
              //                                           ),
              //                                         )
              //                                             :
              //                                         Padding(
              //                                           padding: EdgeInsets.all(10),
              //                                           child: Icon(
              //                                             LineariconsFree.heart_1,
              //                                             color: Colors.black87,
              //                                             size: image_width * 0.13,
              //                                           ),
              //                                         ),
              //
              //                                         // widget.meal_food.like.contains(profile_data['id'])
              //                                         //     ?
              //                                         // Icon(
              //                                         //   Icons
              //                                         //       .favorite_rounded,
              //                                         //   color: Colors.red,
              //                                         //   size: width * 0.08,
              //                                         // )
              //                                         //     :
              //                                         // Icon(
              //                                         //   Icons.favorite_border_rounded,
              //                                         //   // LineariconsFree.heart_1,
              //                                         //   color: Colors.black87,
              //                                         //   size: width * 0.08,//isDarkMode ? Colors.black87 : Colors.white,
              //                                         // ),
              //                                       ),
              //                                     )
              //                                 ),
              //
              //                               ]
              //                           ),
              //                         ),
              //                       ),
              //                       Center(
              //                           child: Text(meal_foods[index].base.name as String,
              //                             style: TextStyle(
              //                               // color: isDarkMode
              //                               //     ? Colors.white
              //                               //     : Colors.white,
              //                               color: Colors.grey[500],
              //                               //Theme.of(context).colorScheme.secondary,
              //                               fontSize: h1_text_size,
              //                               // fontFamily: 'decotype-thuluth-ii',
              //                               fontWeight: FontWeight.w900,
              //                             ),
              //                           )
              //                       ),
              //                       // Padding(
              //                       //   padding: EdgeInsets.only(bottom: 7, top: 5),
              //                       //   child: Container(
              //                       //     height:
              //                       //     MediaQuery.of(context).size.height *
              //                       //         0.12,
              //                       //     width: MediaQuery.of(context).size.width *
              //                       //         0.52,
              //                       //     decoration: BoxDecoration(
              //                       //       borderRadius: BorderRadius.all(
              //                       //           Radius.circular(12)),
              //                       //       // border: Border.all(width: 0.15,
              //                       //       //     color: Theme.of(context).colorScheme.secondary as Color),
              //                       //     ),
              //                       //     // child: Padding(
              //                       //     //   padding: const EdgeInsets.only(
              //                       //     //       right: 0, top: 10),
              //                       //     //   child: Column(
              //                       //     //     children: [
              //                       //     //       check_reserved(items[index]['reserved'])?
              //                       //     //       Row(
              //                       //     //         mainAxisAlignment:
              //                       //     //         MainAxisAlignment.spaceAround,
              //                       //     //         crossAxisAlignment:
              //                       //     //         CrossAxisAlignment.center,
              //                       //     //         children: [
              //                       //     //           Padding(
              //                       //     //             padding: const EdgeInsets.only(
              //                       //     //                 right: 10, top: 0),
              //                       //     //             child: Icon(
              //                       //     //               LineariconsFree.checkmark_cicle,
              //                       //     //               color:Colors.greenAccent,
              //                       //     //               size: width * 0.1,
              //                       //     //             ),
              //                       //     //           ),
              //                       //     //           // SizedBox(height: 5),
              //                       //     //           Padding(
              //                       //     //             padding: const EdgeInsets.only(
              //                       //     //                 left: 8.0),
              //                       //     //             child: Text(
              //                       //     //               'شما رزرو دارید',
              //                       //     //               style: TextStyle(
              //                       //     //                   color: Colors.grey[700],
              //                       //     //                   fontSize: 14,
              //                       //     //                   letterSpacing: 1,
              //                       //     //                   fontWeight:
              //                       //     //                   FontWeight.normal),
              //                       //     //             ),
              //                       //     //           ),
              //                       //     //         ],
              //                       //     //       )
              //                       //     //       :
              //                       //     //       Column(
              //                       //     //         children: [
              //                       //     //           Row(
              //                       //     //             mainAxisAlignment:
              //                       //     //             MainAxisAlignment.center,
              //                       //     //             crossAxisAlignment:
              //                       //     //             CrossAxisAlignment.center,
              //                       //     //             children: [
              //                       //     //               Padding(
              //                       //     //                 padding: const EdgeInsets.only(
              //                       //     //                     right: 10, top: 0),
              //                       //     //                 child: Icon(
              //                       //     //                   LineariconsFree.cross_circle,
              //                       //     //                   color:Colors.red,
              //                       //     //                   size: width * 0.1,
              //                       //     //                 ),
              //                       //     //               ),
              //                       //     //               // SizedBox(height: 5),
              //                       //     //               Padding(
              //                       //     //                 padding: const EdgeInsets.only(
              //                       //     //                     left: 8.0, right: 7),
              //                       //     //                 child: Text(
              //                       //     //                   'شما رزرو ندارید',
              //                       //     //                   style: TextStyle(
              //                       //     //                       color: Colors.red[500],
              //                       //     //                       fontSize: 14,
              //                       //     //                       letterSpacing: 1,
              //                       //     //                       fontWeight:
              //                       //     //                       FontWeight.normal),
              //                       //     //                 ),
              //                       //     //               ),
              //                       //     //
              //                       //     //             ],
              //                       //     //           ),
              //                       //     //           Padding(
              //                       //     //             padding: const EdgeInsets.only(top: 15,
              //                       //     //                 left: 0.0),
              //                       //     //             child: Text(items[index]['enable_additional_sell'] ?
              //                       //     //             'هنوز فروش اضافه داریم':
              //                       //     //             'فروش اضافه هم تمام شد',
              //                       //     //               style: TextStyle(
              //                       //     //                   color: items[index]['enable_additional_sell'] ?
              //                       //     //                   Colors.green :
              //                       //     //                   Colors.red[400] ,
              //                       //     //                   fontSize: 15,
              //                       //     //                   letterSpacing: 1,
              //                       //     //                   fontWeight:
              //                       //     //                   FontWeight.normal),
              //                       //     //             ),
              //                       //     //           )
              //                       //     //         ],
              //                       //     //       ),
              //                       //     //     ],
              //                       //     //   ),
              //                       //     // )
              //                       //   ),
              //                       // ),
              //                     ],
              //                   ),
              //                 ),
              //                 // width: double.infinity,
              //                 // height: double.infinity,
              //               ),
              //             ),
              //
              //             Align(
              //               alignment: Alignment.bottomCenter,
              //               child: Padding(
              //                 padding: EdgeInsets.only(bottom: height * 0.1),
              //                 child: Container(
              //                   //   width: width * 0.2,
              //                   //   height: width * 0.3,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(30),
              //                     // color: Theme.of(context)
              //                     //     .colorScheme
              //                     //     .secondary.withOpacity(0.1),
              //                     // border: Border.all(width: 0.3,
              //                     //     color: Theme.of(
              //                     //         context)
              //                     //         .colorScheme
              //                     //         .secondary
              //                     //         .withOpacity(
              //                     //         1) as Color
              //                     // ),
              //
              //                     // boxShadow: const [
              //                     //   BoxShadow(
              //                     //     color: Colors.white,
              //                     //     blurRadius: 0.0,
              //                     //     offset: Offset(0.0, 0.0),
              //                     //   )
              //                     // ],
              //                   ),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.end,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       Padding(
              //                         padding: EdgeInsets.only(top: height * 0.0,right: 7, left: 7),
              //                         child: Row(
              //                             mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                             crossAxisAlignment:
              //                             CrossAxisAlignment.center,
              //                             children: [
              //                               Padding(
              //                                 padding: EdgeInsets.only(
              //                                     right: padding),
              //                                 child: Icon(
              //                                   LineariconsFree.store,
              //                                   size: b_text_size * 2,
              //                                   color: Colors.grey[600],
              //                                 ),
              //                               ),
              //                               Padding(
              //                                   padding: EdgeInsets.only(
              //                                       left: padding),
              //                                   child: Text(meal_foods[index].self_service.name as String,
              //                                     style: TextStyle(
              //                                       // color: isDarkMode
              //                                       //     ? Colors.white
              //                                       //     : Colors.white,
              //                                       color: Colors.grey[500],
              //                                       //Theme.of(context).colorScheme.secondary,
              //                                       fontSize: b_text_size,
              //                                       // fontFamily: 'decotype-thuluth-ii',
              //                                       fontWeight: FontWeight.w200,
              //                                     ),
              //                                   )
              //                               ),
              //
              //                             ]
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.only(
              //                             top:height * 0.0 ,right: 7, left: 7
              //                         ),
              //                         child: InkWell(
              //                           borderRadius: BorderRadius.circular(35.0),
              //                           onTap: (){
              //                             // var route = new MaterialPageRoute(
              //                             //   builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
              //                             // );
              //                             Navigator.of(context).push(
              //                                 MaterialPageRoute(
              //                                   builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
              //                                 )
              //                             );
              //                           },
              //                           child: Row(
              //                               mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                               crossAxisAlignment:
              //                               CrossAxisAlignment.center,
              //                               children: [
              //                                 Padding(
              //                                   padding: EdgeInsets.only(
              //                                       right: padding),
              //                                   child: Icon(
              //                                     Linecons.food,
              //                                     size: b_text_size * 2,
              //                                     color: Colors.grey[600],
              //                                   ),
              //                                 ),
              //                                 Padding(
              //                                     padding: EdgeInsets.only(
              //                                         left: padding),
              //                                     child: Text(meal_foods[index].food.name as String,
              //                                       style: TextStyle(
              //                                         // color: isDarkMode
              //                                         //     ? Colors.white
              //                                         //     : Colors.white,
              //                                         color: Colors.grey[500],
              //                                         //Theme.of(context).colorScheme.secondary,
              //                                         fontSize: b_text_size,
              //                                         // fontFamily: 'decotype-thuluth-ii',
              //                                         fontWeight: FontWeight.w200,
              //                                       ),
              //                                     )
              //                                 ),
              //
              //                               ]
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //
              //                 ),
              //               ),
              //             ),
              //
              //             // ----
              //             Align(
              //               alignment: Alignment.topRight,
              //               child: Padding(
              //                 padding: EdgeInsets.only(right: 20),
              //                 child: Card(
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
              //                   ),
              //                   child: Container(
              //                     // margin: const EdgeInsets.symmetric(
              //                     //   vertical: 10.0,
              //                     // ),
              //                       width: ResponsiveSizeWidget(
              //                           largeScreen_size: width * 0.12,
              //                           mediumScreen_size: width * 0.17,
              //                           smallScreen_size: width * 0.21,
              //                           min_size: width * 0.22,
              //                           max_size: width * 0.12,
              //                           context: context
              //                       ).get_width_size(),
              //                       height: ResponsiveSizeWidget(
              //                           largeScreen_size: width * 0.2,
              //                           mediumScreen_size: width * 0.25,
              //                           smallScreen_size: width * 0.3,
              //                           min_size: width * 0.3,
              //                           max_size: width * 0.2,
              //                           context: context
              //                       ).get_width_size(),
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(30),
              //                         // color: Theme.of(context)
              //                         //     .colorScheme
              //                         //     .secondary.withOpacity(0.1),
              //                         // border: Border.all(width: 0.3,
              //                         //     color: Theme.of(
              //                         //         context)
              //                         //         .colorScheme
              //                         //         .secondary
              //                         //         .withOpacity(
              //                         //         1) as Color
              //                         // ),
              //
              //                         // boxShadow: const [
              //                         //   BoxShadow(
              //                         //     color: Colors.white,
              //                         //     blurRadius: 0.0,
              //                         //     offset: Offset(0.0, 0.0),
              //                         //   )
              //                         // ],
              //                       ),
              //                       child: Column(
              //                         crossAxisAlignment: CrossAxisAlignment.center,
              //                         mainAxisAlignment: MainAxisAlignment.end,
              //                         children: [
              //                           Padding(
              //                             padding: EdgeInsets.only(bottom: 10),
              //                             child: InkWell(
              //                               onTap: () {
              //                                 showModalBottomSheet(
              //                                   isDismissible: true,
              //                                   backgroundColor: Colors.transparent,
              //                                   context: context,
              //                                   builder: (BuildContext context) {
              //                                     return SmallScreenFoodReactionWidget(
              //                                       meal_food: meal_foods[index],
              //                                       notifyParent: (){
              //                                         setState(() {});
              //                                         // _refresh();
              //                                       },
              //                                     );
              //                                   },
              //                                 );
              //                                 setState(() {});
              //                               },
              //                               child: Icon(
              //                                 (meal_foods[index].get_reaction(widget.user_info.id) == -1) ?
              //                                 LineariconsFree.question_circle :
              //                                 (meal_foods[index].user_vote == 2) ?
              //                                 LineariconsFree.sad :
              //                                 (meal_foods[index].user_vote == 1) ?
              //                                 LineariconsFree.neutral :
              //                                 LineariconsFree.smile,
              //                                 size: ResponsiveSizeWidget(
              //                                     largeScreen_size: width * 0.06,
              //                                     mediumScreen_size: width * 0.1,
              //                                     smallScreen_size: width * 0.14,
              //                                     min_size: width * 0.15,
              //                                     max_size: width * 0.055,
              //                                     context: context
              //                                 ).get_width_size(),
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       )
              //                   ),
              //                 ),
              //               ),
              //             ),
              //
              //             Align(
              //               alignment: Alignment.topLeft,
              //               child: Padding(
              //                 padding: EdgeInsets.only(left: 20),
              //                 child: Card(
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
              //                   ),
              //                   child: Container(
              //                     // margin: const EdgeInsets.symmetric(
              //                     //   vertical: 10.0,
              //                     // ),
              //                       width: ResponsiveSizeWidget(
              //                           largeScreen_size: width * 0.1,
              //                           mediumScreen_size: width * 0.12,
              //                           smallScreen_size: width * 0.15,
              //                           min_size: width * 0.15,
              //                           max_size: width * 0.1,
              //                           context: context
              //                       ).get_width_size(),
              //                       height: ResponsiveSizeWidget(
              //                           largeScreen_size: width * 0.17,
              //                           mediumScreen_size: width * 0.22,
              //                           smallScreen_size: width * 0.25,
              //                           min_size: width * 0.25,
              //                           max_size: width * 0.17,
              //                           context: context
              //                       ).get_width_size(),
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(30),
              //                       ),
              //                       child: Column(
              //                         crossAxisAlignment: CrossAxisAlignment.center,
              //                         mainAxisAlignment: MainAxisAlignment.end,
              //                         children: [
              //                           Padding(
              //                             padding: EdgeInsets.only(bottom: 10),
              //                             child: InkWell(
              //                               onTap: () async{
              //                                 // Navigator.of(context, rootNavigator: true).pop(context);
              //                                 Navigator.push(
              //                                     context,
              //                                     MaterialPageRoute(
              //                                         builder: (context) => TransferFoodScreen(
              //                                           meal_food: widget.meal_foods[index],
              //                                           notifyParent: () {
              //                                             setState(() {});
              //                                           },
              //                                         )
              //                                     )
              //                                 );
              //                                 setState(() {});
              //
              //                                 // showDialog(
              //                                 //   context: context,
              //                                 //   builder: (BuildContext _context) {
              //                                 //     return AlertDialog(
              //                                 //         shape: RoundedRectangleBorder(
              //                                 //             borderRadius:BorderRadius.circular(20)
              //                                 //         ),
              //                                 //         // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
              //                                 //         content: Container(
              //                                 //           // decoration: BoxDecoration(
              //                                 //           //     borderRadius: BorderRadius.circular(30)
              //                                 //           // ),
              //                                 //           height: height * 0.7,
              //                                 //           width: width * 0.4,
              //                                 //           child: Directionality(
              //                                 //               textDirection: TextDirection.rtl,
              //                                 //               child: TransferFoodScreen(meal_food: widget.meal_foods[index],)
              //                                 //           ),
              //                                 //         )
              //                                 //     );
              //                                 //   },
              //                                 // );
              //
              //                               },
              //                               child: Icon(
              //                                 (meal_foods[index].transfer_request_status == 2) ?
              //                                 LineariconsFree.checkmark_cicle :
              //                                 (meal_foods[index].transfer_request_status == 1) ?
              //                                 LineariconsFree.warning :
              //                                 LineariconsFree.sync_icon,
              //                                 size: ResponsiveSizeWidget(
              //                                     largeScreen_size: width * 0.05,
              //                                     mediumScreen_size: width * 0.07,
              //                                     smallScreen_size: width * 0.1,
              //                                     min_size: width * 0.1,
              //                                     max_size: width * 0.05,
              //                                     context: context
              //                                 ).get_width_size(),
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       )
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             Align(
              //               alignment: Alignment.topLeft,
              //               child: Padding(
              //                 padding: EdgeInsets.only(left: ResponsiveSizeWidget(
              //                     largeScreen_size: width * 0.23,
              //                     mediumScreen_size: width * 0.23,
              //                     smallScreen_size: width * 0.24,
              //                     min_size: width * 0.25,
              //                     max_size: width * 0.13,
              //                     context: context
              //                 ).get_width_size()),
              //                 child: Card(
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
              //                   ),
              //                   child: Container(
              //                     // margin: const EdgeInsets.symmetric(
              //                     //   vertical: 10.0,
              //                     // ),
              //                       width: ResponsiveSizeWidget(
              //                           largeScreen_size: width * 0.1,
              //                           mediumScreen_size: width * 0.12,
              //                           smallScreen_size: width * 0.15,
              //                           min_size: width * 0.15,
              //                           max_size: width * 0.1,
              //                           context: context
              //                       ).get_width_size(),
              //                       height: ResponsiveSizeWidget(
              //                           largeScreen_size: width * 0.17,
              //                           mediumScreen_size: width * 0.22,
              //                           smallScreen_size: width * 0.25,
              //                           min_size: width * 0.25,
              //                           max_size: width * 0.17,
              //                           context: context
              //                       ).get_width_size(),
              //                       decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(30),
              //                       ),
              //                       child: Column(
              //                         crossAxisAlignment: CrossAxisAlignment.center,
              //                         mainAxisAlignment: MainAxisAlignment.end,
              //                         children: [
              //                           Padding(
              //                             padding: EdgeInsets.only(bottom: 10),
              //                             child: InkWell(
              //                               onTap: () async{
              //                                 showDialog(
              //                                   context: context,
              //                                   builder: (BuildContext _context) {
              //                                     return AlertDialog(
              //                                         shape: RoundedRectangleBorder(
              //                                             borderRadius:
              //                                             BorderRadius.circular(
              //                                                 30)),
              //                                         // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
              //                                         //   title: Text("اطلاعات تگ :"),
              //                                         content: Container(
              //                                           // decoration: BoxDecoration(
              //                                           //     borderRadius: BorderRadius.circular(30)
              //                                           // ),
              //                                           height: MediaQuery.of(context)
              //                                               .size
              //                                               .height * 0.4,
              //                                           // color: data!['status'] as bool ? Colors.green : Colors.red,
              //                                           child: Column(
              //                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                                             crossAxisAlignment: CrossAxisAlignment.center,
              //                                             children: [
              //                                               // Text('${value["nfca"]["identifier"]}'),
              //                                               Column(
              //                                                 children: [
              //                                                   Text(
              //                                                     "دریافت کد فراموشی",
              //                                                     textAlign: TextAlign.center,
              //                                                     style: TextStyle(
              //                                                         color: Colors.grey[600],
              //                                                         fontSize: width * 0.07,
              //                                                         fontWeight: FontWeight.bold
              //                                                     ),
              //                                                   ),
              //                                                   Padding(
              //                                                     padding: EdgeInsets.all(10),
              //                                                     child: Text(
              //                                                       "دانشجو عزیز در نظر داشته باشید که دریافت کد فراموشی مستلزم پرداخت هزینه  ۱۰۰۰ تومان هست که از حساب کاربری تان کم میشود",
              //                                                       textAlign: TextAlign.center,
              //                                                       style: TextStyle(
              //                                                         color: Colors.grey[600],
              //                                                         // fontSize: 20
              //                                                       ),
              //                                                     ),
              //                                                   ),
              //                                                 ],
              //                                               ),
              //
              //                                               Card(
              //                                                 shape: RoundedRectangleBorder(
              //                                                   borderRadius: BorderRadius.circular(45),
              //                                                 ),
              //                                                 child: InkWell(
              //                                                   onTap: (){
              //                                                     Navigator.of(context,rootNavigator:true).pop();
              //
              //                                                     showDialog(
              //                                                       context: this.context,
              //                                                       builder: (BuildContext context) {
              //                                                         return const Center(
              //                                                           child: CircularProgressIndicator(),
              //                                                         );
              //                                                       },
              //                                                     );
              //                                                     print("[[[[[[[[[[[[[[[[[[[[");
              //                                                     MealFood_API().get_forgotten_code({
              //                                                       "meal_food_id": meal_foods[index].id,
              //                                                     }).then((fetch_data) {
              //                                                       print("[[[[[[[[[[[[[[[[[[[[");
              //                                                       // if (this.mounted) {
              //                                                       //   setState(() {
              //                                                       //     fetched = true;
              //                                                       //     Navigator.pop(context);
              //                                                       //   });
              //                                                       // }
              //                                                       if (fetch_data["status"]) {
              //                                                         Navigator.of(context,rootNavigator:true).pop();
              //
              //                                                         showDialog(
              //                                                           context: context,
              //                                                           builder: (BuildContext context) {
              //                                                             return AlertDialog(
              //                                                                 shape: RoundedRectangleBorder(
              //                                                                     borderRadius:
              //                                                                     BorderRadius.circular(
              //                                                                         30)),
              //                                                                 // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
              //                                                                 //   title: Text("اطلاعات تگ :"),
              //                                                                 content: Container(
              //                                                                   // decoration: BoxDecoration(
              //                                                                   //     borderRadius: BorderRadius.circular(30)
              //                                                                   // ),
              //                                                                   height: height * 0.7,
              //                                                                   width: width,
              //                                                                   // color: data!['status'] as bool ? Colors.green : Colors.red,
              //                                                                   child: Column(
              //                                                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                                                                     crossAxisAlignment: CrossAxisAlignment.center,
              //                                                                     children: [
              //                                                                       // Icon(
              //                                                                       //   fetch_data['status'] as bool
              //                                                                       //       ? LineariconsFree.checkmark_cicle
              //                                                                       //       : LineariconsFree.cross_circle,
              //                                                                       //   color: fetch_data['status']
              //                                                                       //   as bool
              //                                                                       //       ? Colors.greenAccent
              //                                                                       //       : Colors.red,
              //                                                                       //   size: 170,
              //                                                                       // ),
              //                                                                       QrImage(
              //                                                                         data: "${fetch_data['code']}",
              //                                                                         version: QrVersions.min,
              //                                                                         size: width * 0.7,
              //                                                                         gapless: false,
              //                                                                       ),
              //                                                                       Text(
              //                                                                         fetch_data['code'].toString(),
              //                                                                         textAlign: TextAlign.center,
              //                                                                         style: TextStyle(
              //                                                                             color: fetch_data['status']as bool
              //                                                                                 ? Colors.grey[600]
              //                                                                                 : Colors.red,
              //                                                                             fontSize: width * 0.13,
              //                                                                             fontFamily: 'Digital'
              //                                                                         ),
              //                                                                       ),
              //                                                                     ],
              //                                                                   ),
              //                                                                 ));
              //
              //                                                           },
              //                                                         );
              //                                                       } else {
              //                                                         Navigator.of(context,rootNavigator:true).pop();
              //
              //                                                         showDialog(
              //                                                           context: context,
              //                                                           builder: (BuildContext context) {
              //                                                             return AlertDialog(
              //                                                                 shape: RoundedRectangleBorder(
              //                                                                     borderRadius:
              //                                                                     BorderRadius.circular(
              //                                                                         30)),
              //                                                                 // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
              //                                                                 //   title: Text("اطلاعات تگ :"),
              //                                                                 content: Container(
              //                                                                   // decoration: BoxDecoration(
              //                                                                   //     borderRadius: BorderRadius.circular(30)
              //                                                                   // ),
              //                                                                   height: MediaQuery.of(context)
              //                                                                       .size
              //                                                                       .height * 0.35,
              //                                                                   // color: data!['status'] as bool ? Colors.green : Colors.red,
              //                                                                   child: Column(
              //                                                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                                                                     crossAxisAlignment: CrossAxisAlignment.center,
              //                                                                     children: [
              //                                                                       Icon(
              //                                                                         LineariconsFree.cross_circle,
              //                                                                         color:  Colors.red,
              //                                                                         size: 170,
              //                                                                       ),
              //                                                                       Text(
              //                                                                         fetch_data['message'].toString(),
              //                                                                         textAlign: TextAlign.center,
              //                                                                         style: TextStyle(
              //                                                                           color: Colors.red,
              //                                                                           // fontSize: 20
              //                                                                         ),
              //                                                                       ),
              //                                                                     ],
              //                                                                   ),
              //                                                                 )
              //                                                             );
              //
              //                                                           },
              //                                                         );
              //                                                       }
              //                                                     });
              //                                                   },
              //                                                   child: Padding(
              //                                                     padding: EdgeInsets.all(10),
              //                                                     child: Row(
              //                                                       mainAxisAlignment: MainAxisAlignment.center,
              //                                                       crossAxisAlignment: CrossAxisAlignment.center,
              //                                                       children: [
              //                                                         // Padding(
              //                                                         //   padding: EdgeInsets.only(right: 10),
              //                                                         //   child: Icon(
              //                                                         //     LineariconsFree.smile,
              //                                                         //     color:  Colors.grey[600],
              //                                                         //     size: width * 0.13,
              //                                                         //   ),
              //                                                         // ),
              //                                                         Padding(
              //                                                           padding: EdgeInsets.only(left: 10),
              //                                                           child: Text(
              //                                                             "دریافت کد",
              //                                                             textAlign: TextAlign.center,
              //                                                             style: TextStyle(
              //                                                                 color: Colors.grey[800],
              //                                                                 fontSize: width * 0.06,
              //                                                                 fontWeight: FontWeight.bold
              //                                                             ),
              //                                                           ),
              //                                                         ),
              //                                                       ],
              //                                                     ),
              //                                                   ),
              //                                                 ),
              //                                               ),
              //                                             ],
              //                                           ),
              //                                         )
              //                                     );
              //                                   },
              //                                 );
              //                               },
              //                               child: Icon(
              //                                 LineariconsFree.question_circle,
              //                                 size: ResponsiveSizeWidget(
              //                                     largeScreen_size: width * 0.05,
              //                                     mediumScreen_size: width * 0.07,
              //                                     smallScreen_size: width * 0.1,
              //                                     min_size: width * 0.1,
              //                                     max_size: width * 0.05,
              //                                     context: context
              //                                 ).get_width_size(),
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       )
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             // Align(
              //             //   alignment: Alignment.topLeft,
              //             //   child: Padding(
              //             //     padding: EdgeInsets.only(left: ResponsiveSizeWidget(
              //             //         largeScreen_size: width * 0.235,
              //             //         mediumScreen_size: width * 0.31,
              //             //         smallScreen_size: width * 0.37,
              //             //         min_size: width * 0.38,
              //             //         max_size: width * 0.105,
              //             //         context: context
              //             //     ).get_width_size()),
              //             //     child: Card(
              //             //       shape: RoundedRectangleBorder(
              //             //         borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
              //             //       ),
              //             //       child: Container(
              //             //         // margin: const EdgeInsets.symmetric(
              //             //         //   vertical: 10.0,
              //             //         // ),
              //             //           width: ResponsiveSizeWidget(
              //             //               largeScreen_size: width * 0.065,
              //             //               mediumScreen_size: width * 0.1,
              //             //               smallScreen_size: width * 0.15,
              //             //               min_size: width * 0.15,
              //             //               max_size: width * 0.065,
              //             //               context: context
              //             //           ).get_width_size(),
              //             //           height: ResponsiveSizeWidget(
              //             //               largeScreen_size: width * 0.1,
              //             //               mediumScreen_size: width * 0.2,
              //             //               smallScreen_size: width * 0.25,
              //             //               min_size: width * 0.25,
              //             //               max_size: width * 0.1,
              //             //               context: context
              //             //           ).get_width_size(),
              //             //           decoration: BoxDecoration(
              //             //             borderRadius: BorderRadius.circular(30),
              //             //           ),
              //             //           child: Column(
              //             //             crossAxisAlignment: CrossAxisAlignment.center,
              //             //             mainAxisAlignment: MainAxisAlignment.end,
              //             //             children: [
              //             //               Padding(
              //             //                 padding: EdgeInsets.only(bottom: 10),
              //             //                 child: InkWell(
              //             //                   onTap: () async{
              //             //                     showDialog(
              //             //                       context: context,
              //             //                       builder: (BuildContext _context) {
              //             //                         return AlertDialog(
              //             //                             shape: RoundedRectangleBorder(
              //             //                                 borderRadius:
              //             //                                 BorderRadius.circular(
              //             //                                     30)),
              //             //                             // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
              //             //                             //   title: Text("اطلاعات تگ :"),
              //             //                             content: Container(
              //             //                               // decoration: BoxDecoration(
              //             //                               //     borderRadius: BorderRadius.circular(30)
              //             //                               // ),
              //             //                               height: MediaQuery.of(context)
              //             //                                   .size
              //             //                                   .height * 0.4,
              //             //                               // color: data!['status'] as bool ? Colors.green : Colors.red,
              //             //                               child: Column(
              //             //                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             //                                 crossAxisAlignment: CrossAxisAlignment.center,
              //             //                                 children: [
              //             //                                   // Text('${value["nfca"]["identifier"]}'),
              //             //                                   Column(
              //             //                                     children: [
              //             //                                       Text(
              //             //                                         "دریافت کد فراموشی",
              //             //                                         textAlign: TextAlign.center,
              //             //                                         style: TextStyle(
              //             //                                             color: Colors.grey[600],
              //             //                                             fontSize: width * 0.07,
              //             //                                             fontWeight: FontWeight.bold
              //             //                                         ),
              //             //                                       ),
              //             //                                       Padding(
              //             //                                         padding: EdgeInsets.all(10),
              //             //                                         child: Text(
              //             //                                           "دانشجو عزیز در نظر داشته باشید که دریافت کد فراموشی مستلزم پرداخت هزینه  ۱۰۰۰ تومان هست که از حساب کاربری تان کم میشود",
              //             //                                           textAlign: TextAlign.center,
              //             //                                           style: TextStyle(
              //             //                                             color: Colors.grey[600],
              //             //                                             // fontSize: 20
              //             //                                           ),
              //             //                                         ),
              //             //                                       ),
              //             //                                     ],
              //             //                                   ),
              //             //
              //             //                                   Card(
              //             //                                     shape: RoundedRectangleBorder(
              //             //                                       borderRadius: BorderRadius.circular(45),
              //             //                                     ),
              //             //                                     child: InkWell(
              //             //                                       onTap: (){
              //             //                                         Navigator.of(context,rootNavigator:true).pop();
              //             //
              //             //                                         showDialog(
              //             //                                           context: this.context,
              //             //                                           builder: (BuildContext context) {
              //             //                                             return const Center(
              //             //                                               child: CircularProgressIndicator(),
              //             //                                             );
              //             //                                           },
              //             //                                         );
              //             //                                         print("[[[[[[[[[[[[[[[[[[[[");
              //             //                                         MealFood_API().get_forgotten_code({
              //             //                                           "meal_food_id": meal_foods[index].id,
              //             //                                         }).then((fetch_data) {
              //             //                                           print("[[[[[[[[[[[[[[[[[[[[");
              //             //                                           // if (this.mounted) {
              //             //                                           //   setState(() {
              //             //                                           //     fetched = true;
              //             //                                           //     Navigator.pop(context);
              //             //                                           //   });
              //             //                                           // }
              //             //                                           if (fetch_data["status"]) {
              //             //                                             Navigator.of(context,rootNavigator:true).pop();
              //             //
              //             //                                             showDialog(
              //             //                                               context: context,
              //             //                                               builder: (BuildContext context) {
              //             //                                                 return AlertDialog(
              //             //                                                     shape: RoundedRectangleBorder(
              //             //                                                         borderRadius:
              //             //                                                         BorderRadius.circular(
              //             //                                                             30)),
              //             //                                                     // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
              //             //                                                     //   title: Text("اطلاعات تگ :"),
              //             //                                                     content: Container(
              //             //                                                       // decoration: BoxDecoration(
              //             //                                                       //     borderRadius: BorderRadius.circular(30)
              //             //                                                       // ),
              //             //                                                       height: height * 0.7,
              //             //                                                       width: width,
              //             //                                                       // color: data!['status'] as bool ? Colors.green : Colors.red,
              //             //                                                       child: Column(
              //             //                                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             //                                                         crossAxisAlignment: CrossAxisAlignment.center,
              //             //                                                         children: [
              //             //                                                           // Icon(
              //             //                                                           //   fetch_data['status'] as bool
              //             //                                                           //       ? LineariconsFree.checkmark_cicle
              //             //                                                           //       : LineariconsFree.cross_circle,
              //             //                                                           //   color: fetch_data['status']
              //             //                                                           //   as bool
              //             //                                                           //       ? Colors.greenAccent
              //             //                                                           //       : Colors.red,
              //             //                                                           //   size: 170,
              //             //                                                           // ),
              //             //                                                           QrImage(
              //             //                                                             data: "${fetch_data['code']}",
              //             //                                                             version: QrVersions.min,
              //             //                                                             size: width * 0.7,
              //             //                                                             gapless: false,
              //             //                                                           ),
              //             //                                                           Text(
              //             //                                                             fetch_data['code'].toString(),
              //             //                                                             textAlign: TextAlign.center,
              //             //                                                             style: TextStyle(
              //             //                                                                 color: fetch_data['status']as bool
              //             //                                                                     ? Colors.grey[600]
              //             //                                                                     : Colors.red,
              //             //                                                                 fontSize: width * 0.13,
              //             //                                                                 fontFamily: 'Digital'
              //             //                                                             ),
              //             //                                                           ),
              //             //                                                         ],
              //             //                                                       ),
              //             //                                                     ));
              //             //
              //             //                                               },
              //             //                                             );
              //             //                                           } else {
              //             //                                             Navigator.of(context,rootNavigator:true).pop();
              //             //
              //             //                                             showDialog(
              //             //                                               context: context,
              //             //                                               builder: (BuildContext context) {
              //             //                                                 return AlertDialog(
              //             //                                                     shape: RoundedRectangleBorder(
              //             //                                                         borderRadius:
              //             //                                                         BorderRadius.circular(
              //             //                                                             30)),
              //             //                                                     // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
              //             //                                                     //   title: Text("اطلاعات تگ :"),
              //             //                                                     content: Container(
              //             //                                                       // decoration: BoxDecoration(
              //             //                                                       //     borderRadius: BorderRadius.circular(30)
              //             //                                                       // ),
              //             //                                                       height: MediaQuery.of(context)
              //             //                                                           .size
              //             //                                                           .height * 0.35,
              //             //                                                       // color: data!['status'] as bool ? Colors.green : Colors.red,
              //             //                                                       child: Column(
              //             //                                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //             //                                                         crossAxisAlignment: CrossAxisAlignment.center,
              //             //                                                         children: [
              //             //                                                           Icon(
              //             //                                                             LineariconsFree.cross_circle,
              //             //                                                             color:  Colors.red,
              //             //                                                             size: 170,
              //             //                                                           ),
              //             //                                                           Text(
              //             //                                                             fetch_data['message'].toString(),
              //             //                                                             textAlign: TextAlign.center,
              //             //                                                             style: TextStyle(
              //             //                                                               color: Colors.red,
              //             //                                                               // fontSize: 20
              //             //                                                             ),
              //             //                                                           ),
              //             //                                                         ],
              //             //                                                       ),
              //             //                                                     )
              //             //                                                 );
              //             //
              //             //                                               },
              //             //                                             );
              //             //                                           }
              //             //                                         });
              //             //                                       },
              //             //                                       child: Padding(
              //             //                                         padding: EdgeInsets.all(10),
              //             //                                         child: Row(
              //             //                                           mainAxisAlignment: MainAxisAlignment.center,
              //             //                                           crossAxisAlignment: CrossAxisAlignment.center,
              //             //                                           children: [
              //             //                                             // Padding(
              //             //                                             //   padding: EdgeInsets.only(right: 10),
              //             //                                             //   child: Icon(
              //             //                                             //     LineariconsFree.smile,
              //             //                                             //     color:  Colors.grey[600],
              //             //                                             //     size: width * 0.13,
              //             //                                             //   ),
              //             //                                             // ),
              //             //                                             Padding(
              //             //                                               padding: EdgeInsets.only(left: 10),
              //             //                                               child: Text(
              //             //                                                 "دریافت کد",
              //             //                                                 textAlign: TextAlign.center,
              //             //                                                 style: TextStyle(
              //             //                                                     color: Colors.grey[800],
              //             //                                                     fontSize: width * 0.06,
              //             //                                                     fontWeight: FontWeight.bold
              //             //                                                 ),
              //             //                                               ),
              //             //                                             ),
              //             //                                           ],
              //             //                                         ),
              //             //                                       ),
              //             //                                     ),
              //             //                                   ),
              //             //                                 ],
              //             //                               ),
              //             //                             )
              //             //                         );
              //             //                       },
              //             //                     );
              //             //                   },
              //             //                   child: Icon(
              //             //                     Linecons.arr,
              //             //                     size: ResponsiveSizeWidget(
              //             //                         largeScreen_size: width * 0.05,
              //             //                         mediumScreen_size: width * 0.07,
              //             //                         smallScreen_size: width * 0.1,
              //             //                         min_size: width * 0.1,
              //             //                         max_size: width * 0.05,
              //             //                         context: context
              //             //                     ).get_width_size(),
              //             //                   ),
              //             //                 ),
              //             //               ),
              //             //             ],
              //             //           )
              //             //       ),
              //             //     ),
              //             //   ),
              //             // ),
              //           ]
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              //-------
            ),
          ),
        ),
      ),
    );
  }
}
