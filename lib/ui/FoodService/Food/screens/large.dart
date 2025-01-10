import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../../data/auth_info.dart';
import '../../../../data/meal_food.dart';
import '../../../../ui/FoodService/ReserveFood/ReserveFood.dart';
import '../../../../data/notification.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../FoodSaleDay/FoodSaleDay.dart';
import '../../ReserveStatus/reserveStatus.dart';
import '../bloc/food_bloc.dart';
import '../widgets/action_card.dart';
import '../widgets/today_food_card.dart';

class LargeFoodPage extends StatefulWidget {
  final UserInfo user_info;
  final List<MealFoodEntity> meal_foods;
  final List<NotificationEntity> notifications;

  const LargeFoodPage({Key? key, required this.meal_foods, required this.user_info, required this.notifications}) : super(key: key);

  @override
  State<LargeFoodPage> createState() => _LargeFoodPageState();
}

class _LargeFoodPageState extends State<LargeFoodPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_3 = new GlobalKey<RefreshIndicatorState>();
  bool fetched = true;
  bool internet_connection = true;
  // Map profile_data = Hive.box('cache').get('profile_data', defaultValue: {});
  // Map profile_data = {"id": 3991231137};
  List<MealFoodEntity> meal_foods = [];
  // get_data() async {
  //   setState(() {fetched = false;});
  //   // internet_connection = await check_internet_connection() ?? false;
  //   // setState(() {
  //   //   internet_connection = internet_connection;
  //   // });
  //
  //   // if(internet_connection){
  //   //
  //   //   // MealFood_API().meal_foods({
  //   //   //   "date":"1401-12-14",//'${Jalali.now().year}-${Jalali.now().month}-${Jalali.now().day}',
  //   //   //   "reserved_user_id": 3991231137//profile_data['id']
  //   //   // }).then((fetch_data) {
  //   //   //   // Hive.box('cache').put('home_items_cache_list', fetch_data['meals']);
  //   //   //   setState(() {
  //   //   //     // home_food_items_cache_list = fetch_data['meals'];
  //   //   //     meal_foods.clear();
  //   //   //     // for (var item in fetch_data['meals'] as List)
  //   //   //     //   meal_foods.add(meal_food_builder(item));
  //   //   //     (fetch_data['meals'] as List).forEach((element) {
  //   //   //       meal_foods.add(meal_food_builder(element));
  //   //   //     });
  //   //   //     fetched = true;
  //   //   //     // status = true;
  //   //   //   });
  //   //   // });
  //   // }
  //
  //   mealFoodRepository.meal_foods({
  //     "date":"1401-12-14",//'${Jalali.now().year}-${Jalali.now().month}-${Jalali.now().day}',
  //     "reserved_user_id": 3991231137//profile_data['id']
  //   }).then((fetch_data) {
  //     setState(() {
  //       // home_food_items_cache_list = fetch_data['meals'];
  //       // meal_foods.clear();
  //       meal_foods = fetch_data;
  //       fetched = true;
  //       // status = true;
  //     });
  //   });
  // }

  Future<void> _refresh() async{
    // await get_data();
  }

  // late AnimateIconController controller;
  @override
  void initState() {
    // get_data();
    setState(() {
      meal_foods = widget.meal_foods;
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
        largeScreen_size: width * 0.2,
        mediumScreen_size: width * 0.2,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.17,
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
        mediumScreen_size: width * 0.02,
        smallScreen_size: width * 0.05,
        min_size: width * 0.1,
        max_size: width * 0.013,
        context: context
    ).get_width_size();
    double item_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.65,
        mediumScreen_size: height * 0.7,
        smallScreen_size: height * 0.75,
        min_size: height * 0.75,
        max_size: height * 0.69,
        context: context
    ).get_height_size();
    double viewportFraction  = ResponsiveSizeWidget(
        largeScreen_size: 0.75,
        mediumScreen_size: 0.8,
        smallScreen_size: 0.75,
        min_size: 0.9,
        max_size: 0.65,
        context: context
    ).get_custom_size();
    double borderRadius = ResponsiveSizeWidget(
        largeScreen_size: 35,
        mediumScreen_size: 15,
        smallScreen_size: 30,
        min_size: 15,
        max_size: 38,
        context: context
    ).get_custom_size();
    double padding = ResponsiveSizeWidget(
        largeScreen_size: width * 0.045,
        mediumScreen_size: width * 0.043,
        smallScreen_size: width * 0,
        min_size: width * 0.1,
        max_size: width * 0.047,
        context: context
    ).get_width_size();
    double top_padding = ResponsiveSizeWidget(
        largeScreen_size: height * 0.011,
        mediumScreen_size: height * 0.01,
        smallScreen_size: height * 0,
        min_size: height * 0.1,
        max_size: height * 0.016,
        context: context
    ).get_height_size();
    double container_margin  = ResponsiveSizeWidget(
        largeScreen_size: MediaQuery.of(context).size.width * 0.07,
        mediumScreen_size: MediaQuery.of(context).size.width * 0,
        smallScreen_size: MediaQuery.of(context).size.width * 0,
        min_size: MediaQuery.of(context).size.width * 0,
        max_size: MediaQuery.of(context).size.width * 0.07,
        context: context
    ).get_width_size();
    double box_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.825,
        mediumScreen_size: height * 0.8,
        smallScreen_size: height * 0.9,
        min_size: height * 0.9,
        max_size: height * 0.9,
        context: context
    ).get_height_size();

    return Scaffold(
      backgroundColor: Colors.cyan.withOpacity(0.001),

      body: RefreshIndicator(
        key: _refreshIndicatorKey_3,
        onRefresh: ()async{
          BlocProvider.of<FoodBloc>(context).add(FoodRefresh());
          // _refresh
        },
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                    child: Column(
                      children: [
                        // Align(
                        //   alignment: Alignment.topCenter,
                        //   child: Container(
                        //     // height: (MediaQuery.of(context).size.height) /2,
                        //     // width: (MediaQuery.of(context).size.width) /2,
                        //     decoration: BoxDecoration(
                        //       // color: Theme.of(context)
                        //       //     .colorScheme
                        //       //     .secondary
                        //       //     .withOpacity(0.17),
                        //       borderRadius: BorderRadius.circular(35.0),
                        //       // border: Border.all(width: 1,
                        //       //     color: Theme.of(context).colorScheme.secondary as Color),
                        //       // borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
                        //     ),
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(0.0),
                        //       child: Text("غذا های رزرو شده امروز",
                        //         style: TextStyle(
                        //           // color: isDarkMode
                        //           //     ? Colors.white
                        //           //     : Colors.white,
                        //           color: Colors.grey.shade800,
                        //           //Theme.of(context).colorScheme.secondary,
                        //           fontSize: h1_text_size,
                        //           fontFamily: 'Sahel',
                        //           // fontWeight: FontWeight.w600,
                        //         ),
                        //       ),
                        //     ),
                        //     // width: double.infinity,
                        //     // height: double.infinity,
                        //   ),
                        // ),
                        // Divider(
                        //     color: Colors.black
                        // ),
                        widget.meal_foods.length == 0 ?
                        Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      top: 30,
                                    ),
                                    child: Text(
                                        "غذای رزرو شده ای ندارید"
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 30,
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      BlocProvider.of<FoodBloc>(context).add(FoodRefresh());
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
                        ) :
                        CarouselSlider.builder(
                          // page
                          itemCount: meal_foods.length,
                          options: CarouselOptions(
                            reverse: true,
                            enableInfiniteScroll: false,
                            initialPage: 0,
                            height: item_height ,
                            viewportFraction: viewportFraction,//rotated ? 0.76 : 0.78,
                            // autoPlay: false,
                            enlargeCenterPage: true,
                          ),
                          itemBuilder: (
                              BuildContext _context,
                              int index,
                              int pageViewIndex,
                              ) =>
                              LargeFoodCard(meal_food: meal_foods[index],)

                        ),
                      ],
                    )
                ),
                // Divider(
                //     color: Colors.black
                // ),
                SizedBox(
                  height: box_height - (container_margin * 2),
                  width: width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ActionCard(
                            context: context,
                            on_tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReserveFoodScreen()
                                  )
                              );
                            },
                            icon: LineariconsFree.cart,
                            title:'رزرو غذا',
                          ),
                          ActionCard(
                            context: context,
                            on_tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReserveStatusPage()
                                  )
                              );
                            },
                            icon: LineariconsFree.calendar_full,
                            title:'وضعیت رزرو ها',
                          ),
                          ActionCard(
                            context: context,
                            on_tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodSaleDayScreen()
                                  )
                              );
                            },
                            icon: LineariconsFree.line_spacing,
                            title:'روز فروش',
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: top_padding ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("اطلاعیه های اداره امور رفاه",
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey.shade800,
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: h1_text_size * 0.7,
                                      fontFamily: 'Sahel',
                                      // fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Icon(
                                      LineariconsFree.bullhorn,
                                      size: h1_text_size,
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                      ),
                      // Divider(
                      //     color: Colors.black
                      // ),
                      widget.notifications.length == 0 ?
                      SizedBox(
                        width: width/2,height: height/5,
                        child: Center(child: Text("اطلاعیه منتشر نشده است")),
                      ) :
                      CarouselSlider.builder(
                        // page
                        itemCount: widget.notifications.length,
                        options: CarouselOptions(
                          reverse: true,
                          enableInfiniteScroll: false,
                          initialPage: 0,
                          height: item_height /2 ,
                          viewportFraction:  ResponsiveSizeWidget(
                              largeScreen_size: 0.8,
                              mediumScreen_size: 0.8,
                              smallScreen_size: 0.8,
                              min_size: 0.8,
                              max_size: 0.8,
                              context: context
                          ).get_width_size(),//rotated ? 0.76 : 0.78,
                          // autoPlay: false,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (
                            BuildContext context,
                            int index,
                            int pageViewIndex,
                            ) =>
                            Container(

                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: SizedBox(
                                  // width: width/2,height: height/6,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [
                                      Expanded(
                                        child: Stack(
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.topCenter,
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
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: Column(
                                                      // mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets.only(top: 3),
                                                          child: SizedBox(
                                                            height: image_width *1,//width * 0.6,
                                                            width: image_width *1.2,//width * 0.6,
                                                            child: Image(
                                                              width: image_width,
                                                              height: image_width,
                                                              fit: BoxFit.cover,
                                                              image: AssetImage(
                                                                "images/notification.png",
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(widget.notifications[index].title as String,
                                                          style: TextStyle(
                                                            // color: isDarkMode
                                                            //     ? Colors.white
                                                            //     : Colors.white,
                                                            // color: Colors.grey[500],
                                                            //Theme.of(context).colorScheme.secondary,
                                                            fontSize: h1_text_size * 0.6,
                                                            // fontFamily: 'Digital',
                                                            fontWeight: FontWeight.w100,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // width: double.infinity,
                                                  // height: double.infinity,
                                                ),
                                              ),

                                              Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Padding(
                                                  padding: EdgeInsets.only(bottom: 0),
                                                  child: Container(
                                                    // width: width * 0.3,
                                                      // height: 20,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(30),
                                                      // color: Theme.of(context)
                                                      //     .colorScheme
                                                      //     .secondary.withOpacity(0.1),
                                                      // border: Border.all(width: 0.3,
                                                      //     color: Theme.of(
                                                      //         context)
                                                      //         .colorScheme
                                                      //         .secondary
                                                      //         .withOpacity(
                                                      //         1) as Color
                                                      // ),

                                                      // boxShadow: const [
                                                      //   BoxShadow(
                                                      //     color: Colors.white,
                                                      //     blurRadius: 0.0,
                                                      //     offset: Offset(0.0, 0.0),
                                                      //   )
                                                      // ],
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                                      child:Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 0),
                                                        child:ListTile(
                                                          hoverColor: Colors.white.withOpacity(0.01),
                                                          title: Text(
                                                            "",
                                                          ),
                                                          subtitle: Text(
                                                            "${
                                                                Jalali(
                                                                    int.parse(widget.notifications[index].publish.split("-")[0]),
                                                                    int.parse(widget.notifications[index].publish.split("-")[1]),
                                                                    int.parse(widget.notifications[index].publish.split("-")[2])
                                                                )
                                                                    .formatFullDate().toPersianDigit()
                                                            }",
                                                            style: TextStyle(
                                                                fontFamily: "Sahel",
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: b_text_size * 0.9

                                                            ),
                                                          ),
                                                          dense: true,
                                                          trailing:Icon(
                                                            LineariconsFree.chevron_left,
                                                            size:  b_text_size * 1.3,
                                                            // color: Colors.greenAccent
                                                          ),
                                                          onTap: () {

                                                          },
                                                        ),

                                                      ),

                                                    ),

                                                  ),
                                                ),
                                              ),
                                            ]
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
                )
              ],
            )
        ),
      ),
    );
  }
}
