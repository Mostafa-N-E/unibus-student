import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../common/http_client.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/repo/transfer_food_repository.dart';
import '../../../../data/source/food_data_source.dart';
import '../../../../data/source/meal_food_data_source.dart';
import '../../../../ui/widgets/snackbar.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/alert_dialog.dart';
import '../../../widgets/fast_cached_image.dart';
import '../../../widgets/progress_indicator.dart';
import '../../DetailFood/detailFood.dart';
import '../../TransferFood/TransferFood.dart';
import 'modal_send_feedback.dart';

class SmallFoodCard extends StatefulWidget {
  MealFoodEntity meal_food;
  SmallFoodCard({
    // Key? key,
    required this.meal_food
  }) ;

  @override
  State<SmallFoodCard> createState() => _SmallFoodCardState();
}

class _SmallFoodCardState extends State<SmallFoodCard> {
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
        largeScreen_size: width * 0.4,
        mediumScreen_size: width * 0.47,
        smallScreen_size: width * 0.46,
        min_size: width * 0.5,
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

    double icon_size = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.06,
        smallScreen_size: width * 0.1,
        min_size: width * 0.1,
        max_size: width * 0.02,
        context: context
    ).get_width_size();



    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        // shadowColor: Theme.of(context).colorScheme.secondary,
        child: Column(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding:  EdgeInsets.only(right: 15, top: 15),
                                  child: Text(widget.meal_food.base.name as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey.shade400,
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: h1_text_size,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )
                              ),

                              Padding(
                                padding:  EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  height: image_width,//width * 0.6,
                                  width: image_width,//width * 0.6,
                                  child: Stack(
                                      children: [
                                        InkWell(
                                            borderRadius: BorderRadius.circular(35.0),
                                            onTap: (){
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext context) => new DetailFood(meal_food: widget.meal_food,),
                                                  )
                                              );
                                            },
                                            child: fast_cached_image_builder(
                                                main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
                                            )

                                        ),
                                        Positioned(
                                          // top: (width * 0.33),
                                            right: (image_width * 0.73),

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
                                                          "food_id":widget.meal_food.food.id
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
                                              child: Card(
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(35.0),
                                                ),
                                                // shadowColor: Colors.transparent,
                                                child: widget.meal_food.food.like.contains(global_userInfo.id)?
                                                Padding(
                                                  padding: EdgeInsets.all(7),
                                                  child: Icon(
                                                    Icons.favorite_rounded,
                                                    color: Colors.red,
                                                    size: image_width * 0.2,
                                                  ),
                                                )
                                                    :
                                                Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Icon(
                                                    LineariconsFree.heart_1,
                                                    // color: Colors.black87,
                                                    size: image_width * 0.13,
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
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          //   width: width * 0.2,
                          //   height: width * 0.3,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:ListTile(
                                    title: Text(
                                      widget.meal_food.food.name,
                                      style: TextStyle(
                                          fontFamily: "Sahel",
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    subtitle: Text(
                                      widget.meal_food.food.type,
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.46
                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                      LineariconsFree.dinner,
                                        // color: Colors.black87
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailFood(meal_food: widget.meal_food,)
                                          )
                                      );
                                    },
                                  ),

                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:ListTile(
                                    hoverColor: Colors.white,
                                    title: Text(
                                      widget.meal_food.self_service.name,
                                      style: TextStyle(
                                          fontFamily: "Sahel",
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    subtitle: Text(
                                      "سلف تحویل غذا",
                                      style: TextStyle(
                                          // fontSize: b_text_size * 0.46,
                                        fontFamily: "Sahel"

                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                        LineariconsFree.store,
                                        // color: Colors.black87
                                    ),
                                    onTap: () {

                                    },
                                  ),

                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:ListTile(
                                    title: Text(
                                      "کد فراموشی",
                                      style: TextStyle(
                                          fontFamily: "Sahel",
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    subtitle: Text(
                                      "در صورت به همراه نداشتن کارت ",
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.5
                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                      LineariconsFree.redo,
                                      color: Colors.red
                                    ),
                                    onTap: () async{
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext _context) {
                                          return CustomAlertDialog(
                                              content: Container(
                                                // decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.circular(30)
                                                // ),
                                                height: height * 0.5,
                                                // color: data!['status'] as bool ? Colors.green : Colors.red,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    // Text('${value["nfca"]["identifier"]}'),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "دریافت کد فراموشی",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.grey[600],
                                                              fontSize: b_text_size,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.all(10),
                                                          child: Text(
                                                            "دانشجو عزیز در نظر داشته باشید که دریافت کد فراموشی مستلزم پرداخت هزینه  ۱۰۰۰ تومان هست که از حساب کاربری تان کم میشود",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              // color: Colors.grey[600],
                                                              fontSize: b_text_size * 0.65
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    Card(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(45),
                                                      ),
                                                      child: InkWell(
                                                        onTap: (){
                                                          Navigator.of(context,rootNavigator:true).pop();

                                                          showDialog(
                                                            context: this.context,
                                                            builder: (BuildContext context) {
                                                              return Center(
                                                                child: CustomProgressIndicator(),
                                                              );
                                                            },
                                                          );
                                                          print("[[[[[[[[[[[[[[[[[[[[");
                                                          MealFood_API().get_forgotten_code({
                                                            "meal_food_id": widget.meal_food.id,
                                                          }).then((fetch_data) {
                                                            print("[[[[[[[[[[[[[[[[[[[[");
                                                            // if (this.mounted) {
                                                            //   setState(() {
                                                            //     fetched = true;
                                                            //     Navigator.pop(context);
                                                            //   });
                                                            // }
                                                            if (fetch_data["status"]) {
                                                              Navigator.of(context,rootNavigator:true).pop();

                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return CustomAlertDialog(
                                                                      content: Container(
                                                                        // decoration: BoxDecoration(
                                                                        //     borderRadius: BorderRadius.circular(30)
                                                                        // ),
                                                                        height: height * 0.7,
                                                                        width: width,
                                                                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            // Icon(
                                                                            //   fetch_data['status'] as bool
                                                                            //       ? LineariconsFree.checkmark_cicle
                                                                            //       : LineariconsFree.cross_circle,
                                                                            //   color: fetch_data['status']
                                                                            //   as bool
                                                                            //       ? Colors.greenAccent
                                                                            //       : Colors.red,
                                                                            //   size: 170,
                                                                            // ),
                                                                            QrImageView(
                                                                              data: "${fetch_data['code']}",
                                                                              version: QrVersions.min,
                                                                              size: width * 0.7,
                                                                              gapless: false,
                                                                            ),
                                                                            Text(
                                                                              fetch_data['code'].toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: fetch_data['status']as bool
                                                                                      ? Colors.grey[600]
                                                                                      : Colors.red,
                                                                                  fontSize: width * 0.13,
                                                                                  fontFamily: 'Digital'
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ));

                                                                },
                                                              );
                                                            } else {
                                                              Navigator.of(context,rootNavigator:true).pop();

                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return CustomAlertDialog(
                                                                      content: Container(
                                                                        // decoration: BoxDecoration(
                                                                        //     borderRadius: BorderRadius.circular(30)
                                                                        // ),
                                                                        height: MediaQuery.of(context)
                                                                            .size
                                                                            .height * 0.35,
                                                                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              LineariconsFree.cross,
                                                                              color:  Colors.red,
                                                                              size: 170,
                                                                            ),
                                                                            Text(
                                                                              fetch_data['message'].toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Colors.red,
                                                                                // fontSize: 20
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                  );

                                                                },
                                                              );
                                                            }
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets.all(10),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              // Padding(
                                                              //   padding: EdgeInsets.only(right: 10),
                                                              //   child: Icon(
                                                              //     LineariconsFree.smile,
                                                              //     color:  Colors.grey[600],
                                                              //     size: width * 0.13,
                                                              //   ),
                                                              // ),
                                                              Padding(
                                                                padding: EdgeInsets.only(left: 10),
                                                                child: Text(
                                                                  "دریافت کد",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                      color: Colors.grey[800],
                                                                      fontSize: b_text_size,
                                                                      fontWeight: FontWeight.bold
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                          );
                                        },
                                      );
                                    },
                                  ),

                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 15),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:SizedBox(
                                    width: width* 0.74,
                                    height: 50,
                                    child: ListTile(
                                      title: Text(
                                          "جابه جایی سلف غذا",
                                        style: TextStyle(
                                            fontFamily: "Sahel",
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      subtitle: Text(
                                        "میتوانید غذای خود را در صورت امکان انتقال دهید",
                                        style: TextStyle(
                                            fontSize: b_text_size * 0.5
                                        ),
                                      ),
                                      dense: true,
                                      trailing:
                                      (widget.meal_food.transfer_request_status == 2) ?
                                      Icon(
                                        LineariconsFree.checkmark_cicle,
                                        color: Colors.green,
                                      ) :
                                      (widget.meal_food.transfer_request_status == 1) ?
                                      Icon(
                                        LineariconsFree.warning,
                                        color: Colors.yellow,
                                      ) :
                                      Column(
                                        children: [
                                          Icon(
                                              LineariconsFree.arrow_left,
                                            size: b_text_size * 0.73,
                                            color: Colors.greenAccent,
                                          ),
                                          Icon(
                                              LineariconsFree.arrow_right,
                                            size: b_text_size * 0.73,
                                            color: Colors.greenAccent,
                                          )
                                        ],
                                      ),
                                      onTap: () async{
                                        // showDialog(
                                        //   context: context,
                                        //   builder: (BuildContext context) {
                                        //     return Center(
                                        //       child: CustomProgressIndicator(),
                                        //     );
                                        //   },
                                        // );
                                        transferFoodRepository.pre_create_request({
                                          "meal_food_id": widget.meal_food.id,
                                        }).then((fetch_data) {
                                          // Navigator.of(context,rootNavigator:true).pop();
                                          if(fetch_data['status']){

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => TransferFoodScreen(
                                                      meal_food: widget.meal_food,
                                                      notifyParent: () {
                                                        setState(() {});
                                                      },
                                                    )
                                                )
                                            );
                                          }else{
                                            if (fetch_data['state'] != 3) {
                                              ShowSnackBar().showSnackBar(
                                                context,
                                                fetch_data['message'],
                                                duration: const Duration(seconds: 1),
                                                noAction: false,
                                                text_color: Colors.white,
                                                background_color: fetch_data['state'] == 1 ? Colors.green : Colors.red,
                                              );
                                            }else{
                                              showModalBottomSheet(
                                                isDismissible: true,
                                                backgroundColor: Colors.transparent,
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Container(
                                                    height: MediaQuery.of(context).size.height * .4,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20),
                                                        topRight: Radius.circular(20),
                                                      ),
                                                      color: Colors.white,// Theme.of(context).colorScheme.secondary,
                                                    ),
                                                    child: Stack(
                                                        children: [
                                                          Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                              // mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(top: 15),
                                                                  child: Center(
                                                                    child: Text("وضعیت درخواست قبلی" as String,
                                                                        style: TextStyle(
                                                                          color: Colors.grey[700],
                                                                          fontSize: b_text_size * 1.1,
                                                                          fontWeight: FontWeight.w800,
                                                                        )
                                                                      //   TextStyle(
                                                                      //     fontSize: 43,
                                                                      //     color: Colors.white,
                                                                      //     fontWeight: FontWeight.w900
                                                                      // ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  LineariconsFree.hourglass,
                                                                  size: h1_text_size * 2,
                                                                  color: Colors.grey[400],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 40),
                                                                  child: Text(
                                                                      fetch_data['message'] ?? "",
                                                                      // maxLines: 3,
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        overflow: TextOverflow.ellipsis,
                                                                        // color: Colors.black87,
                                                                        fontSize: b_text_size * 0.7,
                                                                        // fontFamily: 'a-thuluth',
                                                                        // fontWeight: FontWeight.w500,
                                                                      )
                                                                  ),
                                                                ),

                                                              ]
                                                          ),

                                                          Align(
                                                            alignment: Alignment.topCenter,
                                                            child: Icon(
                                                              Icons.maximize_rounded,
                                                              size: h1_text_size * 2,
                                                              color: Colors.grey[400],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.bottomCenter,

                                                            child: Padding(
                                                              padding: const EdgeInsets.only(bottom: 8.0),
                                                              child: ElevatedButton(
                                                                child: Text(
                                                                  "حذف درخواست",
                                                                  style: TextStyle(
                                                                      color: Colors.white
                                                                  ),
                                                                ),
                                                                onPressed: () async{
                                                                  // showDialog(
                                                                  //   context: context,
                                                                  //   builder: (BuildContext context) {
                                                                  //     return Center(
                                                                  //       child: CustomProgressIndicator(),
                                                                  //     );
                                                                  //   },
                                                                  // );
                                                                  transferFoodRepository.delete_request({
                                                                    "meal_food_id": widget.meal_food.id,
                                                                    "request_id": fetch_data['transferMealFoodRequest_id']
                                                                  }).then((fetch_data_2){
                                                                    // Navigator.of(context,rootNavigator:true).pop();
                                                                    Navigator.of(context).pop();
                                                                    if(fetch_data_2['status']){
                                                                      ShowSnackBar().showSnackBar(
                                                                        context,
                                                                        fetch_data_2['message'],
                                                                        duration: const Duration(seconds: 1),
                                                                        noAction: false,
                                                                        text_color: Colors.white,
                                                                        background_color: Colors.green,
                                                                      );
                                                                    }
                                                                  });



                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                  elevation:2 ,
                                                                  minimumSize: Size(width * 0.85 , 40),
                                                                  foregroundColor: Colors.white,
                                                                  backgroundColor: Colors.red,//Colors.white70,
                                                                  shadowColor: Colors.white,
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(32.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ]
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          }
                                        });

                                      },
                                    ),
                                    // SwitchListTile(
                                    //   activeColor: Theme.of(context).colorScheme.secondary,
                                    //   title: Text("جابه جایی سلف غذا"),
                                    //   subtitle: Text(
                                    //     "میتوانید غذای خود را در صورت امکان انتقال دهید",
                                    //     style: TextStyle(
                                    //         fontSize: b_text_size * 0.5
                                    //     ),
                                    //   ),
                                    //   isThreeLine: false,
                                    //   dense: true,
                                    //   value: false,//card.is_active
                                    //   onChanged: (val) {
                                    //     // box.put(keyName, val);
                                    //     // onChanged?.call(val, box);
                                    //   },
                                    // ),
                                    // CheckboxListTile(
                                    //   value: card.is_active,
                                    //   onChanged: (bool? value) {
                                    //     // _setState(() => isSelected = value);
                                    //   },
                                    // ),
                                  ),

                                ),

                              ),


                            ],
                          ),

                        ),
                      ),
                    ),

                    //-----
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Card(
                          elevation: 7,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
                          ),
                          child: Container(
                            // margin: const EdgeInsets.symmetric(
                            //   vertical: 10.0,
                            // ),
                              width: ResponsiveSizeWidget(
                                  largeScreen_size: width * 0.12,
                                  mediumScreen_size: width * 0.17,
                                  smallScreen_size: width * 0.21,
                                  min_size: width * 0.22,
                                  max_size: width * 0.12,
                                  context: context
                              ).get_width_size(),
                              height: ResponsiveSizeWidget(
                                  largeScreen_size: width * 0.2,
                                  mediumScreen_size: width * 0.25,
                                  smallScreen_size: width * 0.3,
                                  min_size: width * 0.3,
                                  max_size: width * 0.2,
                                  context: context
                              ).get_width_size(),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "بازخورد شما",
                                      style: TextStyle(
                                        fontSize: b_text_size * 0.4,
                                        color: Colors.grey.shade500
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isDismissible: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SmallScreenFoodReactionWidget(
                                              meal_food: widget.meal_food,
                                              notifyParent: (){
                                                setState(() {});
                                                // _refresh();
                                              },
                                            );
                                          },
                                        );
                                        setState(() {});
                                      },
                                      child: Icon(
                                        (widget.meal_food.get_reaction(global_userInfo.id) == -1) ?
                                        LineariconsFree.question_circle :
                                        (widget.meal_food.user_vote == 2) ?
                                        LineariconsFree.sad :
                                        (widget.meal_food.user_vote == 1) ?
                                        LineariconsFree.neutral :
                                        LineariconsFree.smile,
                                        size: ResponsiveSizeWidget(
                                            largeScreen_size: width * 0.06,
                                            mediumScreen_size: width * 0.1,
                                            smallScreen_size: width * 0.14,
                                            min_size: width * 0.15,
                                            max_size: width * 0.055,
                                            context: context
                                        ).get_width_size(),
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
    );
  }
}


class LargeFoodCard extends StatefulWidget {
  MealFoodEntity meal_food;
  LargeFoodCard({
    Key? key,
    required this.meal_food
  }) : super(key: key);

  @override
  _LargeCardCardState createState() => _LargeCardCardState();
}

class _LargeCardCardState extends State<LargeFoodCard> {

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
        largeScreen_size: width * 0.12,
        mediumScreen_size: width * 0.09,
        smallScreen_size: width * 0.39,
        min_size: width * 0.7,
        max_size: width * 0.12,
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
      height:rotated ? height * 0.65 : height * 0.78,
      // width:rotated ? width * 0.65 : width * 0.78,

      // decoration: new BoxDecoration(
      //   boxShadow: [
      //     new BoxShadow(
      //       color: Colors.grey,
      //       blurRadius: 20.0,
      //     ),
      //   ],
      // ),
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Column(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding:  EdgeInsets.only(right: 15, top: 15),
                                  child: Text(widget.meal_food.base.name as String,
                                    style: TextStyle(
                                      // color: isDarkMode
                                      //     ? Colors.white
                                      //     : Colors.white,
                                      color: Colors.grey.shade400,
                                      //Theme.of(context).colorScheme.secondary,
                                      fontSize: h1_text_size,
                                      fontFamily: 'Sahel',
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )
                              ),

                              Padding(
                                padding:  EdgeInsets.only(top: 5),
                                child: SizedBox(
                                  height: image_width,//width * 0.6,
                                  width: image_width,//width * 0.6,
                                  child: Stack(
                                      children: [
                                        InkWell(
                                            borderRadius: BorderRadius.circular(35.0),
                                            onTap: (){
                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //       builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
                                              //     )
                                              // );
                                            },
                                            child: fast_cached_image_builder(
                                                main_image_url: widget.meal_food.food.image, placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
                                            )

                                        ),
                                        Positioned(
                                          // top: (width * 0.33),
                                            right: (image_width * 0.73),

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
                                                          "food_id":widget.meal_food.food.id
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
                                              child: Card(
                                                elevation: 2,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(35.0),
                                                ),
                                                // shadowColor: Colors.transparent,
                                                child: widget.meal_food.food.like.contains(global_userInfo.id)?
                                                Padding(
                                                  padding: EdgeInsets.all(7),
                                                  child: Icon(
                                                    Icons.favorite_rounded,
                                                    color: Colors.red,
                                                    size: image_width * 0.2,
                                                  ),
                                                )
                                                    :
                                                Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Icon(
                                                    LineariconsFree.heart_1,
                                                    // color: Colors.black87,
                                                    size: image_width * 0.13,
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
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          //   width: width * 0.2,
                          //   height: width * 0.3,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:ListTile(
                                    title: Text(
                                      widget.meal_food.food.name,
                                      style: TextStyle(
                                        fontFamily: "Sahel",
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    subtitle: Text(
                                      widget.meal_food.food.type,
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.46
                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                        LineariconsFree.dinner,
                                        // color: Colors.black87,
                                      size: h1_text_size * 0.8,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailFood(meal_food: widget.meal_food,)
                                          )
                                      );
                                    },
                                  ),

                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:ListTile(
                                    hoverColor: Colors.white,
                                    title: Text(
                                      widget.meal_food.self_service.name,
                                      style: TextStyle(
                                          fontFamily: "Sahel",
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    subtitle: Text(
                                      "سلف تحویل غذا",
                                      style: TextStyle(
                                        fontSize: b_text_size * 0.46,
                                          fontFamily: "Sahel"

                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                        LineariconsFree.store,
                                        // color: Colors.black87,
                                      size: h1_text_size * 0.8,
                                    ),
                                    onTap: () {

                                    },
                                  ),

                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:ListTile(
                                    title: Text(
                                      "کد فراموشی",
                                      style: TextStyle(
                                          fontFamily: "Sahel",
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    subtitle: Text(
                                      "در صورت به همراه نداشتن کارت ",
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.5
                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                        LineariconsFree.redo,
                                        color: Colors.red,
                                      size: h1_text_size * 0.8,

                                    ),
                                    onTap: () async{
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext _context) {
                                          return CustomAlertDialog(
                                              content: Container(
                                                // decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.circular(30)
                                                // ),
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height * 0.4,
                                                // color: data!['status'] as bool ? Colors.green : Colors.red,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    // Text('${value["nfca"]["identifier"]}'),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          "دریافت کد فراموشی",
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                              color: Colors.grey[600],
                                                              fontSize: h1_text_size,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.all(10),
                                                          child: Text(
                                                            "دانشجو عزیز در نظر داشته باشید که دریافت کد فراموشی مستلزم پرداخت هزینه  ۱۰۰۰ تومان هست که از حساب کاربری تان کم میشود",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              color: Colors.grey[600],
                                                              fontSize: b_text_size
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    Card(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(45),
                                                      ),
                                                      child: InkWell(
                                                        onTap: (){
                                                          Navigator.of(context,rootNavigator:true).pop();

                                                          showDialog(
                                                            context: this.context,
                                                            builder: (BuildContext context) {
                                                              return Center(
                                                                child: CustomProgressIndicator(),
                                                              );
                                                            },
                                                          );
                                                          print("[[[[[[[[[[[[[[[[[[[[");
                                                          MealFood_API().get_forgotten_code({
                                                            "meal_food_id": widget.meal_food.id,
                                                          }).then((fetch_data) {
                                                            print("[[[[[[[[[[[[[[[[[[[[");
                                                            // if (this.mounted) {
                                                            //   setState(() {
                                                            //     fetched = true;
                                                            //     Navigator.pop(context);
                                                            //   });
                                                            // }
                                                            if (fetch_data["status"]) {
                                                              Navigator.of(context,rootNavigator:true).pop();

                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return CustomAlertDialog(
                                                                      content: Container(
                                                                        // decoration: BoxDecoration(
                                                                        //     borderRadius: BorderRadius.circular(30)
                                                                        // ),
                                                                        height: height * 0.6,
                                                                        width: image_width * 2.3,
                                                                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            // Icon(
                                                                            //   fetch_data['status'] as bool
                                                                            //       ? LineariconsFree.checkmark_cicle
                                                                            //       : LineariconsFree.cross_circle,
                                                                            //   color: fetch_data['status']
                                                                            //   as bool
                                                                            //       ? Colors.greenAccent
                                                                            //       : Colors.red,
                                                                            //   size: 170,
                                                                            // ),
                                                                            QrImageView(
                                                                              data: "${fetch_data['code']}",
                                                                              version: QrVersions.min,
                                                                              size: image_width * 2.1,
                                                                              gapless: false,
                                                                            ),
                                                                            Text(
                                                                              fetch_data['code'].toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: fetch_data['status']as bool
                                                                                      ? Colors.grey[600]
                                                                                      : Colors.red,
                                                                                  fontSize: h1_text_size * 1.75,
                                                                                  fontFamily: 'Digital'
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ));

                                                                },
                                                              );
                                                            } else {
                                                              Navigator.of(context,rootNavigator:true).pop();

                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return CustomAlertDialog(
                                                                      content: Container(
                                                                        // decoration: BoxDecoration(
                                                                        //     borderRadius: BorderRadius.circular(30)
                                                                        // ),
                                                                        height: MediaQuery.of(context)
                                                                            .size
                                                                            .height * 0.35,
                                                                        // color: data!['status'] as bool ? Colors.green : Colors.red,
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            Icon(
                                                                              LineariconsFree.cross,
                                                                              color:  Colors.red,
                                                                              size: 170,
                                                                            ),
                                                                            Text(
                                                                              fetch_data['message'].toString(),
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Colors.red,
                                                                                // fontSize: 20
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                  );

                                                                },
                                                              );
                                                            }
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets.all(10),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              // Padding(
                                                              //   padding: EdgeInsets.only(right: 10),
                                                              //   child: Icon(
                                                              //     LineariconsFree.smile,
                                                              //     color:  Colors.grey[600],
                                                              //     size: width * 0.13,
                                                              //   ),
                                                              // ),
                                                              Padding(
                                                                padding: EdgeInsets.only(left: 10),
                                                                child: Text(
                                                                  "دریافت کد",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                      color: Colors.grey[800],
                                                                      fontSize: b_text_size,
                                                                      fontWeight: FontWeight.bold
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                          );
                                        },
                                      );
                                    },
                                  ),

                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 11),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:SizedBox(
                                    width: width* 0.74,
                                    height: 50,
                                    child: ListTile(
                                      title: Text(
                                        "جابه جایی سلف غذا",
                                        style: TextStyle(
                                            fontFamily: "Sahel",
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                      subtitle: Text(
                                        "میتوانید غذای خود را در صورت امکان انتقال دهید",
                                        style: TextStyle(
                                            fontSize: b_text_size * 0.45
                                        ),
                                      ),
                                      dense: true,
                                      trailing:
                                      (widget.meal_food.transfer_request_status == 2) ?
                                      Icon(
                                        LineariconsFree.checkmark_cicle,
                                        color: Colors.green,
                                      ) :
                                      (widget.meal_food.transfer_request_status == 1) ?
                                      Icon(
                                        LineariconsFree.warning,
                                        color: Colors.yellow,
                                      ) :
                                      SizedBox(
                                        // width: 50,
                                        height: 50,
                                        child: Stack(
                                          children: [
                                            Icon(
                                              LineariconsFree.arrow_left,
                                              size: h1_text_size * 0.7,
                                              // color: Colors.black87,
                                            ),
                                            Positioned(
                                              top: 13,
                                              child: Icon(
                                                LineariconsFree.arrow_right,
                                                size: h1_text_size * 0.7,
                                                // color: Colors.black87,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () async{
                                        //                                 // Navigator.of(context, rootNavigator: true).pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => TransferFoodScreen(
                                                  meal_food: widget.meal_food,
                                                  notifyParent: () {
                                                    setState(() {});
                                                  },
                                                )
                                            )
                                        );
                                        setState(() {});


                                      },
                                    ),
                                    // SwitchListTile(
                                    //   activeColor: Theme.of(context).colorScheme.secondary,
                                    //   title: Text("جابه جایی سلف غذا"),
                                    //   subtitle: Text(
                                    //     "میتوانید غذای خود را در صورت امکان انتقال دهید",
                                    //     style: TextStyle(
                                    //         fontSize: b_text_size * 0.5
                                    //     ),
                                    //   ),
                                    //   isThreeLine: false,
                                    //   dense: true,
                                    //   value: false,//card.is_active
                                    //   onChanged: (val) {
                                    //     // box.put(keyName, val);
                                    //     // onChanged?.call(val, box);
                                    //   },
                                    // ),
                                    // CheckboxListTile(
                                    //   value: card.is_active,
                                    //   onChanged: (bool? value) {
                                    //     // _setState(() => isSelected = value);
                                    //   },
                                    // ),
                                  ),

                                ),

                              ),


                            ],
                          ),

                        ),
                      ),
                    ),

                    //-----
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Card(
                          elevation: 6,
                          margin: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
                          ),
                          child: Container(
                            // margin: const EdgeInsets.symmetric(
                            //   vertical: 10.0,
                            // ),
                              width: ResponsiveSizeWidget(
                                  largeScreen_size: width * 0.06,
                                  mediumScreen_size: width * 0.06,
                                  smallScreen_size: width * 0.21,
                                  min_size: width * 0.22,
                                  max_size: width * 0.06,
                                  context: context
                              ).get_width_size(),
                              height: ResponsiveSizeWidget(
                                  largeScreen_size: width * 0.1,
                                  mediumScreen_size: width * 0.1,
                                  smallScreen_size: width * 0.3,
                                  min_size: width * 0.3,
                                  max_size: width * 0.086,
                                  context: context
                              ).get_width_size(),
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "بازخورد شما",
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.4,
                                          color: Colors.grey.shade500
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (
                                              BuildContext context) {
                                            // print("-----------------------------------------object");
                                            // print(result);
                                            return CustomAlertDialog(
                                              content: Directionality(
                                                textDirection: TextDirection.rtl,
                                                child: LargeScreenFoodReactionWidget(
                                                  meal_food: widget.meal_food,
                                                  notifyParent: (){
                                                    setState(() {});
                                                    // _refresh();
                                                  },
                                                ),
                                              ),

                                            );
                                          },
                                        );

                                        setState(() {});
                                      },
                                      child: Icon(
                                        (widget.meal_food.get_reaction(global_userInfo.id) == -1) ?
                                        LineariconsFree.question_circle :
                                        (widget.meal_food.user_vote == 2) ?
                                        LineariconsFree.sad :
                                        (widget.meal_food.user_vote == 1) ?
                                        LineariconsFree.neutral :
                                        LineariconsFree.smile,
                                        size: ResponsiveSizeWidget(
                                            largeScreen_size: width * 0.035,
                                            mediumScreen_size: width * 0.035,
                                            smallScreen_size: width * 0.14,
                                            min_size: width * 0.15,
                                            max_size: width * 0.035,
                                            context: context
                                        ).get_width_size(),
                                      ),
                                    ),
                                  ),
                                ],
                              )
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
    );
  }
}




//---------------------------
//Container(
//                               //   // height:
//                               //   // rotated ? height * 0.65 : height * 0.72,
//                               //   // decoration: new BoxDecoration(
//                               //   //   boxShadow: [
//                               //   //     new BoxShadow(
//                               //   //       color: Colors.grey.shade300,
//                               //   //       blurRadius: 20.0,
//                               //   //     ),
//                               //   //   ],
//                               //   // ),
//                               //   child: Card(
//                               //     shape: RoundedRectangleBorder(
//                               //       borderRadius: BorderRadius.circular(borderRadius),
//                               //     ),
//                               //     child: Stack(children: <Widget>[
//                               //       Align(
//                               //         alignment: Alignment.center,
//                               //         child: Container(
//                               //           // height: (MediaQuery.of(context).size.height) /2,
//                               //           // width: (MediaQuery.of(context).size.width) /2,
//                               //           decoration: BoxDecoration(
//                               //             // color: Theme.of(context)
//                               //             //     .colorScheme
//                               //             //     .secondary
//                               //             //     .withOpacity(0.17),
//                               //             borderRadius: BorderRadius.circular(35.0),
//                               //             // border: Border.all(width: 1,
//                               //             //     color: Theme.of(context).colorScheme.secondary as Color),
//                               //             // borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
//                               //           ),
//                               //           child: Padding(
//                               //             padding: const EdgeInsets.all(0.0),
//                               //             child: Column(
//                               //               mainAxisAlignment: MainAxisAlignment.start,
//                               //               crossAxisAlignment: CrossAxisAlignment.center,
//                               //               children: [
//                               //                 Padding(
//                               //                   padding:  EdgeInsets.only(top: height * 0.2),
//                               //                   child: SizedBox(
//                               //                     height: image_width,//width * 0.6,
//                               //                     width: image_width,//width * 0.6,
//                               //                     child: Stack(
//                               //                         children: [
//                               //                           InkWell(
//                               //                               borderRadius: BorderRadius.circular(35.0),
//                               //                               onTap: (){
//                               //                                 // var route = new MaterialPageRoute(
//                               //                                 //   builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
//                               //                                 // );
//                               //                                 Navigator.of(context).push(
//                               //                                     MaterialPageRoute(
//                               //                                       builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
//                               //                                     )
//                               //                                 );
//                               //                               },
//                               //                               child: fast_cached_image_builder(
//                               //                                   main_image_url: meal_foods[index].food.image, placeholder_image_path: 'assets/images/food.png', width: image_width, height: image_width
//                               //                               )
//                               //
//                               //                           ),
//                               //                           Positioned(
//                               //                             // top: (width * 0.33),
//                               //                               right: (image_width * 0.73),
//                               //
//                               //                               child: InkWell(
//                               //                                 onTap: () {
//                               //                                   if (meal_foods[index].food.like.contains(global_userInfo.id)){
//                               //                                     setState(() {
//                               //                                       meal_foods[index].food.like.remove(global_userInfo.id);
//                               //                                       Food_API().remove_favorite(
//                               //                                           {
//                               //                                             "food_id":meal_foods[index].food.id
//                               //                                           }
//                               //                                       ).then((fetch_data) {
//                               //                                         ShowSnackBar().showSnackBar(
//                               //                                           context,
//                               //                                           "با موفقیت لیست علاقه مندی تان تغییر داده شد",
//                               //                                           duration: const Duration(seconds: 1),
//                               //                                           noAction: false,
//                               //                                         );
//                               //                                       });
//                               //                                     });
//                               //                                   }else{
//                               //                                     setState(() {
//                               //                                       meal_foods[index].food.like.add(global_userInfo.id);
//                               //                                       Food_API().add_favorite(
//                               //                                           {
//                               //                                             "food_id":meal_foods[index].food.id
//                               //                                           }
//                               //                                       ).then((fetch_data) {
//                               //                                         ShowSnackBar().showSnackBar(
//                               //                                           context,
//                               //                                           "با موفقیت لیست علاقه مندی تان تغییر داده شد",
//                               //                                           duration: const Duration(seconds: 1),
//                               //                                           noAction: false,
//                               //                                         );
//                               //                                       });
//                               //                                     });
//                               //                                   }
//                               //                                 },
//                               //                                 child: Card(
//                               //                                   shape: RoundedRectangleBorder(
//                               //                                     borderRadius: BorderRadius.circular(35.0),
//                               //                                   ),
//                               //                                   shadowColor: Colors.transparent,
//                               //                                   child: meal_foods[index].food.like.contains(widget.user_info.id)?
//                               //                                   Padding(
//                               //                                     padding: EdgeInsets.all(7),
//                               //                                     child: Icon(
//                               //                                       Icons.favorite_rounded,
//                               //                                       color: Colors.red,
//                               //                                       size: image_width * 0.2,
//                               //                                     ),
//                               //                                   )
//                               //                                       :
//                               //                                   Padding(
//                               //                                     padding: EdgeInsets.all(10),
//                               //                                     child: Icon(
//                               //                                       LineariconsFree.heart_1,
//                               //                                       color: Colors.black87,
//                               //                                       size: image_width * 0.13,
//                               //                                     ),
//                               //                                   ),
//                               //
//                               //                                   // widget.meal_food.like.contains(profile_data['id'])
//                               //                                   //     ?
//                               //                                   // Icon(
//                               //                                   //   Icons
//                               //                                   //       .favorite_rounded,
//                               //                                   //   color: Colors.red,
//                               //                                   //   size: width * 0.08,
//                               //                                   // )
//                               //                                   //     :
//                               //                                   // Icon(
//                               //                                   //   Icons.favorite_border_rounded,
//                               //                                   //   // LineariconsFree.heart_1,
//                               //                                   //   color: Colors.black87,
//                               //                                   //   size: width * 0.08,//isDarkMode ? Colors.black87 : Colors.white,
//                               //                                   // ),
//                               //                                 ),
//                               //                               )
//                               //                           ),
//                               //
//                               //                         ]
//                               //                     ),
//                               //                   ),
//                               //                 ),
//                               //                 Center(
//                               //                     child: Text(meal_foods[index].base.name as String,
//                               //                       style: TextStyle(
//                               //                         // color: isDarkMode
//                               //                         //     ? Colors.white
//                               //                         //     : Colors.white,
//                               //                         color: Colors.grey[500],
//                               //                         //Theme.of(context).colorScheme.secondary,
//                               //                         fontSize: h1_text_size,
//                               //                         // fontFamily: 'decotype-thuluth-ii',
//                               //                         fontWeight: FontWeight.w900,
//                               //                       ),
//                               //                     )
//                               //                 ),
//                               //                 // Padding(
//                               //                 //   padding: EdgeInsets.only(bottom: 7, top: 5),
//                               //                 //   child: Container(
//                               //                 //     height:
//                               //                 //     MediaQuery.of(context).size.height *
//                               //                 //         0.12,
//                               //                 //     width: MediaQuery.of(context).size.width *
//                               //                 //         0.52,
//                               //                 //     decoration: BoxDecoration(
//                               //                 //       borderRadius: BorderRadius.all(
//                               //                 //           Radius.circular(12)),
//                               //                 //       // border: Border.all(width: 0.15,
//                               //                 //       //     color: Theme.of(context).colorScheme.secondary as Color),
//                               //                 //     ),
//                               //                 //     // child: Padding(
//                               //                 //     //   padding: const EdgeInsets.only(
//                               //                 //     //       right: 0, top: 10),
//                               //                 //     //   child: Column(
//                               //                 //     //     children: [
//                               //                 //     //       check_reserved(items[index]['reserved'])?
//                               //                 //     //       Row(
//                               //                 //     //         mainAxisAlignment:
//                               //                 //     //         MainAxisAlignment.spaceAround,
//                               //                 //     //         crossAxisAlignment:
//                               //                 //     //         CrossAxisAlignment.center,
//                               //                 //     //         children: [
//                               //                 //     //           Padding(
//                               //                 //     //             padding: const EdgeInsets.only(
//                               //                 //     //                 right: 10, top: 0),
//                               //                 //     //             child: Icon(
//                               //                 //     //               LineariconsFree.checkmark_cicle,
//                               //                 //     //               color:Colors.greenAccent,
//                               //                 //     //               size: width * 0.1,
//                               //                 //     //             ),
//                               //                 //     //           ),
//                               //                 //     //           // SizedBox(height: 5),
//                               //                 //     //           Padding(
//                               //                 //     //             padding: const EdgeInsets.only(
//                               //                 //     //                 left: 8.0),
//                               //                 //     //             child: Text(
//                               //                 //     //               'شما رزرو دارید',
//                               //                 //     //               style: TextStyle(
//                               //                 //     //                   color: Colors.grey[700],
//                               //                 //     //                   fontSize: 14,
//                               //                 //     //                   letterSpacing: 1,
//                               //                 //     //                   fontWeight:
//                               //                 //     //                   FontWeight.normal),
//                               //                 //     //             ),
//                               //                 //     //           ),
//                               //                 //     //         ],
//                               //                 //     //       )
//                               //                 //     //       :
//                               //                 //     //       Column(
//                               //                 //     //         children: [
//                               //                 //     //           Row(
//                               //                 //     //             mainAxisAlignment:
//                               //                 //     //             MainAxisAlignment.center,
//                               //                 //     //             crossAxisAlignment:
//                               //                 //     //             CrossAxisAlignment.center,
//                               //                 //     //             children: [
//                               //                 //     //               Padding(
//                               //                 //     //                 padding: const EdgeInsets.only(
//                               //                 //     //                     right: 10, top: 0),
//                               //                 //     //                 child: Icon(
//                               //                 //     //                   LineariconsFree.cross_circle,
//                               //                 //     //                   color:Colors.red,
//                               //                 //     //                   size: width * 0.1,
//                               //                 //     //                 ),
//                               //                 //     //               ),
//                               //                 //     //               // SizedBox(height: 5),
//                               //                 //     //               Padding(
//                               //                 //     //                 padding: const EdgeInsets.only(
//                               //                 //     //                     left: 8.0, right: 7),
//                               //                 //     //                 child: Text(
//                               //                 //     //                   'شما رزرو ندارید',
//                               //                 //     //                   style: TextStyle(
//                               //                 //     //                       color: Colors.red[500],
//                               //                 //     //                       fontSize: 14,
//                               //                 //     //                       letterSpacing: 1,
//                               //                 //     //                       fontWeight:
//                               //                 //     //                       FontWeight.normal),
//                               //                 //     //                 ),
//                               //                 //     //               ),
//                               //                 //     //
//                               //                 //     //             ],
//                               //                 //     //           ),
//                               //                 //     //           Padding(
//                               //                 //     //             padding: const EdgeInsets.only(top: 15,
//                               //                 //     //                 left: 0.0),
//                               //                 //     //             child: Text(items[index]['enable_additional_sell'] ?
//                               //                 //     //             'هنوز فروش اضافه داریم':
//                               //                 //     //             'فروش اضافه هم تمام شد',
//                               //                 //     //               style: TextStyle(
//                               //                 //     //                   color: items[index]['enable_additional_sell'] ?
//                               //                 //     //                   Colors.green :
//                               //                 //     //                   Colors.red[400] ,
//                               //                 //     //                   fontSize: 15,
//                               //                 //     //                   letterSpacing: 1,
//                               //                 //     //                   fontWeight:
//                               //                 //     //                   FontWeight.normal),
//                               //                 //     //             ),
//                               //                 //     //           )
//                               //                 //     //         ],
//                               //                 //     //       ),
//                               //                 //     //     ],
//                               //                 //     //   ),
//                               //                 //     // )
//                               //                 //   ),
//                               //                 // ),
//                               //               ],
//                               //             ),
//                               //           ),
//                               //           // width: double.infinity,
//                               //           // height: double.infinity,
//                               //         ),
//                               //       ),
//                               //
//                               //       Align(
//                               //         alignment: Alignment.bottomCenter,
//                               //         child: Padding(
//                               //           padding: EdgeInsets.only(bottom: item_height * 0.1),
//                               //           child: Container(
//                               //             //   width: width * 0.2,
//                               //             //   height: width * 0.3,
//                               //             decoration: BoxDecoration(
//                               //               borderRadius: BorderRadius.circular(30),
//                               //               // color: Theme.of(context)
//                               //               //     .colorScheme
//                               //               //     .secondary.withOpacity(0.1),
//                               //               // border: Border.all(width: 0.3,
//                               //               //     color: Theme.of(
//                               //               //         context)
//                               //               //         .colorScheme
//                               //               //         .secondary
//                               //               //         .withOpacity(
//                               //               //         1) as Color
//                               //               // ),
//                               //
//                               //               // boxShadow: const [
//                               //               //   BoxShadow(
//                               //               //     color: Colors.white,
//                               //               //     blurRadius: 0.0,
//                               //               //     offset: Offset(0.0, 0.0),
//                               //               //   )
//                               //               // ],
//                               //             ),
//                               //             child: Column(
//                               //               mainAxisAlignment: MainAxisAlignment.end,
//                               //               crossAxisAlignment: CrossAxisAlignment.end,
//                               //               children: [
//                               //                 Padding(
//                               //                   padding: EdgeInsets.only(top: height * 0.0,right: 7, left: 7),
//                               //                   child: Row(
//                               //                       mainAxisAlignment:
//                               //                       MainAxisAlignment.spaceBetween,
//                               //                       crossAxisAlignment:
//                               //                       CrossAxisAlignment.center,
//                               //                       children: [
//                               //                         Padding(
//                               //                           padding: EdgeInsets.only(
//                               //                               right: padding),
//                               //                           child: Icon(
//                               //                             LineariconsFree.store,
//                               //                             size: b_text_size * 2,
//                               //                             color: Colors.grey[600],
//                               //                           ),
//                               //                         ),
//                               //                         Padding(
//                               //                             padding: EdgeInsets.only(
//                               //                                 left: padding),
//                               //                             child: Text(meal_foods[index].self_service.name as String,
//                               //                               style: TextStyle(
//                               //                                 // color: isDarkMode
//                               //                                 //     ? Colors.white
//                               //                                 //     : Colors.white,
//                               //                                 color: Colors.grey[500],
//                               //                                 //Theme.of(context).colorScheme.secondary,
//                               //                                 fontSize: b_text_size,
//                               //                                 // fontFamily: 'decotype-thuluth-ii',
//                               //                                 fontWeight: FontWeight.w200,
//                               //                               ),
//                               //                             )
//                               //                         ),
//                               //
//                               //                       ]
//                               //                   ),
//                               //                 ),
//                               //                 Padding(
//                               //                   padding: EdgeInsets.only(
//                               //                       top:height * 0.0 ,right: 7, left: 7
//                               //                   ),
//                               //                   child: InkWell(
//                               //                     borderRadius: BorderRadius.circular(35.0),
//                               //                     onTap: (){
//                               //                       // var route = new MaterialPageRoute(
//                               //                       //   builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
//                               //                       // );
//                               //                       Navigator.of(context).push(
//                               //                           MaterialPageRoute(
//                               //                             builder: (BuildContext context) => new DetailFood(meal_food: meal_foods[index],),
//                               //                           )
//                               //                       );
//                               //                     },
//                               //                     child: Row(
//                               //                         mainAxisAlignment:
//                               //                         MainAxisAlignment.spaceBetween,
//                               //                         crossAxisAlignment:
//                               //                         CrossAxisAlignment.center,
//                               //                         children: [
//                               //                           Padding(
//                               //                             padding: EdgeInsets.only(
//                               //                                 right: padding),
//                               //                             child: Icon(
//                               //                               Linecons.food,
//                               //                               size: b_text_size * 2,
//                               //                               color: Colors.grey[600],
//                               //                             ),
//                               //                           ),
//                               //                           Padding(
//                               //                               padding: EdgeInsets.only(
//                               //                                   left: padding),
//                               //                               child: Text(meal_foods[index].food.name as String,
//                               //                                 style: TextStyle(
//                               //                                   // color: isDarkMode
//                               //                                   //     ? Colors.white
//                               //                                   //     : Colors.white,
//                               //                                   color: Colors.grey[500],
//                               //                                   //Theme.of(context).colorScheme.secondary,
//                               //                                   fontSize: b_text_size,
//                               //                                   // fontFamily: 'decotype-thuluth-ii',
//                               //                                   fontWeight: FontWeight.w200,
//                               //                                 ),
//                               //                               )
//                               //                           ),
//                               //
//                               //                         ]
//                               //                     ),
//                               //                   ),
//                               //                 ),
//                               //               ],
//                               //             ),
//                               //
//                               //           ),
//                               //         ),
//                               //       ),
//                               //
//                               //       // ----
//                               //       Align(
//                               //         alignment: Alignment.topRight,
//                               //         child: Padding(
//                               //           padding: EdgeInsets.only(right: 20),
//                               //           child: Card(
//                               //             shape: RoundedRectangleBorder(
//                               //               borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
//                               //             ),
//                               //             child: Container(
//                               //               // margin: const EdgeInsets.symmetric(
//                               //               //   vertical: 10.0,
//                               //               // ),
//                               //                 width: ResponsiveSizeWidget(
//                               //                     largeScreen_size: width * 0.075,
//                               //                     mediumScreen_size: width * 0.077,
//                               //                     smallScreen_size: width * 0.21,
//                               //                     min_size: width * 0.22,
//                               //                     max_size: width * 0.07,
//                               //                     context: context
//                               //                 ).get_width_size(),
//                               //                 height: ResponsiveSizeWidget(
//                               //                     largeScreen_size: width * 0.12,
//                               //                     mediumScreen_size: width * 0.13,
//                               //                     smallScreen_size: width * 0.3,
//                               //                     min_size: width * 0.3,
//                               //                     max_size: width * 0.12,
//                               //                     context: context
//                               //                 ).get_width_size(),
//                               //                 decoration: BoxDecoration(
//                               //                   borderRadius: BorderRadius.circular(30),
//                               //                   // color: Theme.of(context)
//                               //                   //     .colorScheme
//                               //                   //     .secondary.withOpacity(0.1),
//                               //                   // border: Border.all(width: 0.3,
//                               //                   //     color: Theme.of(
//                               //                   //         context)
//                               //                   //         .colorScheme
//                               //                   //         .secondary
//                               //                   //         .withOpacity(
//                               //                   //         1) as Color
//                               //                   // ),
//                               //
//                               //                   // boxShadow: const [
//                               //                   //   BoxShadow(
//                               //                   //     color: Colors.white,
//                               //                   //     blurRadius: 0.0,
//                               //                   //     offset: Offset(0.0, 0.0),
//                               //                   //   )
//                               //                   // ],
//                               //                 ),
//                               //                 child: Column(
//                               //                   crossAxisAlignment: CrossAxisAlignment.center,
//                               //                   mainAxisAlignment: MainAxisAlignment.end,
//                               //                   children: [
//                               //                     Padding(
//                               //                       padding: EdgeInsets.only(bottom: 10),
//                               //                       child: InkWell(
//                                                       onTap: () {
//                                                         showDialog(
//                                                           context: context,
//                                                           builder: (
//                                                               BuildContext context) {
//                                                             // print("-----------------------------------------object");
//                                                             // print(result);
//                                                             return AlertDialog(
//                                                               shape: RoundedRectangleBorder(
//                                                                   borderRadius:BorderRadius.circular(30)),
//                                                               // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
//                                                               //   title: Text("اطلاعات تگ :"),
//                                                               content: Directionality(
//                                                                 textDirection: TextDirection.rtl,
//                                                                 child: LargeScreenFoodReactionWidget(
//                                                                   meal_food: meal_foods[index],
//                                                                   notifyParent: (){
//                                                                     setState(() {});
//                                                                     // _refresh();
//                                                                   },
//                                                                 ),
//                                                               ),
//
//                                                             );
//                                                           },
//                                                         );
//
//                                                         setState(() {});
//                                                       },
//                               //                         child: Icon(
//                               //                           (meal_foods[index].get_reaction(widget.user_info.id) == -1) ?
//                               //                           LineariconsFree.question_circle :
//                               //                           (meal_foods[index].user_vote == 2) ?
//                               //                           LineariconsFree.sad :
//                               //                           (meal_foods[index].user_vote == 1) ?
//                               //                           LineariconsFree.neutral :
//                               //                           LineariconsFree.smile,
//                               //                           size: ResponsiveSizeWidget(
//                               //                               largeScreen_size: width * 0.06,
//                               //                               mediumScreen_size: width * 0.06,
//                               //                               smallScreen_size: width * 0.14,
//                               //                               min_size: width * 0.15,
//                               //                               max_size: width * 0.055,
//                               //                               context: context
//                               //                           ).get_width_size(),
//                               //                         ),
//                               //                       ),
//                               //                     ),
//                               //                   ],
//                               //                 )
//                               //             ),
//                               //           ),
//                               //         ),
//                               //       ),
//                               //
//                               //       Align(
//                               //         alignment: Alignment.topLeft,
//                               //         child: Padding(
//                               //           padding: EdgeInsets.only(left: ResponsiveSizeWidget(
//                               //               largeScreen_size: width * 0.1,
//                               //               mediumScreen_size: width * 0.113,
//                               //               smallScreen_size: width * 0.22,
//                               //               min_size: width * 0.23,
//                               //               max_size: width * 0.0855,
//                               //               context: context
//                               //           ).get_width_size()),
//                               //           child: Card(
//                               //             shape: RoundedRectangleBorder(
//                               //               borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
//                               //             ),
//                               //             child: Container(
//                               //               // margin: const EdgeInsets.symmetric(
//                               //               //   vertical: 10.0,
//                               //               // ),
//                               //                 width: ResponsiveSizeWidget(
//                               //                     largeScreen_size: width * 0.065,
//                               //                     mediumScreen_size: width * 0.06,
//                               //                     smallScreen_size: width * 0.15,
//                               //                     min_size: width * 0.15,
//                               //                     max_size: width * 0.055,
//                               //                     context: context
//                               //                 ).get_width_size(),
//                               //                 height: ResponsiveSizeWidget(
//                               //                     largeScreen_size: width * 0.1,
//                               //                     mediumScreen_size: width * 0.108,
//                               //                     smallScreen_size: width * 0.25,
//                               //                     min_size: width * 0.25,
//                               //                     max_size: width * 0.1,
//                               //                     context: context
//                               //                 ).get_width_size(),
//                               //                 decoration: BoxDecoration(
//                               //                   borderRadius: BorderRadius.circular(30),
//                               //                 ),
//                               //                 child: Column(
//                               //                   crossAxisAlignment: CrossAxisAlignment.center,
//                               //                   mainAxisAlignment: MainAxisAlignment.end,
//                               //                   children: [
//                               //                     Padding(
//                               //                       padding: EdgeInsets.only(bottom: 10),
//                               //                       child: InkWell(
//                               //                         onTap: () async{
//                               //                           showDialog(
//                               //                             context: context,
//                               //                             builder: (BuildContext _context) {
//                               //                               return AlertDialog(
//                               //                                   shape: RoundedRectangleBorder(
//                               //                                       borderRadius:
//                               //                                       BorderRadius.circular(
//                               //                                           30)),
//                               //                                   // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
//                               //                                   //   title: Text("اطلاعات تگ :"),
//                               //                                   content: Container(
//                               //                                     // decoration: BoxDecoration(
//                               //                                     //     borderRadius: BorderRadius.circular(30)
//                               //                                     // ),
//                               //                                     height: height * 0.35,
//                               //                                     width: width * 0.7,
//                               //                                     // color: data!['status'] as bool ? Colors.green : Colors.red,
//                               //                                     child: Column(
//                               //                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               //                                       crossAxisAlignment: CrossAxisAlignment.center,
//                               //                                       children: [
//                               //                                         // Text('${value["nfca"]["identifier"]}'),
//                               //                                         Column(
//                               //                                           children: [
//                               //                                             Text(
//                               //                                               "دریافت کد فراموشی",
//                               //                                               textAlign: TextAlign.center,
//                               //                                               style: TextStyle(
//                               //                                                   color: Colors.grey[600],
//                               //                                                   fontSize: h1_text_size,
//                               //                                                   fontWeight: FontWeight.bold
//                               //                                               ),
//                               //                                             ),
//                               //                                             Padding(
//                               //                                               padding: EdgeInsets.all(10),
//                               //                                               child: Text(
//                               //                                                 "دانشجو عزیز در نظر داشته باشید که دریافت کد فراموشی مستلزم پرداخت هزینه  ۱۰۰۰ تومان هست که از حساب کاربری تان کم میشود",
//                               //                                                 textAlign: TextAlign.center,
//                               //                                                 style: TextStyle(
//                               //                                                     color: Colors.grey[600],
//                               //                                                     fontSize: b_text_size
//                               //                                                 ),
//                               //                                               ),
//                               //                                             ),
//                               //                                           ],
//                               //                                         ),
//                               //
//                               //                                         Card(
//                               //                                           shape: RoundedRectangleBorder(
//                               //                                             borderRadius: BorderRadius.circular(45),
//                               //                                           ),
//                               //                                           child: InkWell(
//                               //                                             onTap: (){
//                               //                                               Navigator.of(context,rootNavigator:true).pop();
//                               //
//                               //                                               showDialog(
//                               //                                                 context: this.context,
//                               //                                                 builder: (BuildContext context) {
//                               //                                                   return Center(
//                               //                                                     child: CustomProgressIndicator(),
//                               //                                                   );
//                               //                                                 },
//                               //                                               );
//                               //                                               print("[[[[[[[[[[[[[[[[[[[[");
//                               //                                               MealFood_API().get_forgotten_code({
//                               //                                                 "meal_food_id": meal_foods[index].id,
//                               //                                               }).then((fetch_data) {
//                               //                                                 print("[[[[[[[[[[[[[[[[[[[[");
//                               //                                                 // if (this.mounted) {
//                               //                                                 //   setState(() {
//                               //                                                 //     fetched = true;
//                               //                                                 //     Navigator.pop(context);
//                               //                                                 //   });
//                               //                                                 // }
//                               //                                                 if (fetch_data["status"]) {
//                               //                                                   Navigator.of(context,rootNavigator:true).pop();
//                               //
//                               //                                                   showDialog(
//                               //                                                     context: context,
//                               //                                                     builder: (BuildContext context) {
//                               //                                                       return AlertDialog(
//                               //                                                           shape: RoundedRectangleBorder(
//                               //                                                               borderRadius:
//                               //                                                               BorderRadius.circular(
//                               //                                                                   30)),
//                               //                                                           // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
//                               //                                                           //   title: Text("اطلاعات تگ :"),
//                               //                                                           content: Container(
//                               //                                                             // decoration: BoxDecoration(
//                               //                                                             //     borderRadius: BorderRadius.circular(30)
//                               //                                                             // ),
//                               //                                                             height: height * 0.7,
//                               //                                                             width: width * 0.4,
//                               //                                                             // color: data!['status'] as bool ? Colors.green : Colors.red,
//                               //                                                             child: Column(
//                               //                                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               //                                                               crossAxisAlignment: CrossAxisAlignment.center,
//                               //                                                               children: [
//                               //                                                                 // Icon(
//                               //                                                                 //   fetch_data['status'] as bool
//                               //                                                                 //       ? LineariconsFree.checkmark_cicle
//                               //                                                                 //       : LineariconsFree.cross_circle,
//                               //                                                                 //   color: fetch_data['status']
//                               //                                                                 //   as bool
//                               //                                                                 //       ? Colors.greenAccent
//                               //                                                                 //       : Colors.red,
//                               //                                                                 //   size: 170,
//                               //                                                                 // ),
//                                                                                               QrImage(
//                                                                                                 data: "${fetch_data['code']}",
//                                                                                                 version: QrVersions.min,
//                                                                                                 size: image_width * 1.7,
//                                                                                                 gapless: false,
//                                                                                               ),
//                                                                                               Text(
//                                                                                                 fetch_data['code'].toString(),
//                                                                                                 textAlign: TextAlign.center,
//                                                                                                 style: TextStyle(
//                                                                                                     color: fetch_data['status']as bool
//                                                                                                         ? Colors.grey[600]
//                                                                                                         : Colors.red,
//                                                                                                     fontSize: h1_text_size * 1.75,
//                                                                                                     fontFamily: 'Digital'
//                                                                                                 ),
//                                                                                               ),
//                               //                                                               ],
//                               //                                                             ),
//                               //                                                           ));
//                               //
//                               //                                                     },
//                               //                                                   );
//                               //                                                 } else {
//                               //                                                   Navigator.of(context,rootNavigator:true).pop();
//                               //
//                               //                                                   showDialog(
//                               //                                                     context: context,
//                               //                                                     builder: (BuildContext context) {
//                               //                                                       return AlertDialog(
//                               //                                                           shape: RoundedRectangleBorder(
//                               //                                                               borderRadius:
//                               //                                                               BorderRadius.circular(
//                               //                                                                   30)),
//                               //                                                           // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
//                               //                                                           //   title: Text("اطلاعات تگ :"),
//                               //                                                           content: Container(
//                               //                                                             // decoration: BoxDecoration(
//                               //                                                             //     borderRadius: BorderRadius.circular(30)
//                               //                                                             // ),
//                               //                                                             height: height * 0.35,
//                               //                                                             // color: data!['status'] as bool ? Colors.green : Colors.red,
//                               //                                                             child: Column(
//                               //                                                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               //                                                               crossAxisAlignment: CrossAxisAlignment.center,
//                               //                                                               children: [
//                               //                                                                 Icon(
//                               //                                                                   LineariconsFree.cross_circle,
//                               //                                                                   color:  Colors.red,
//                               //                                                                   size: h1_text_size,
//                               //                                                                 ),
//                               //                                                                 Text(
//                               //                                                                   fetch_data['message'].toString(),
//                               //                                                                   textAlign: TextAlign.center,
//                               //                                                                   style: TextStyle(
//                               //                                                                     color: Colors.red,
//                               //                                                                     // fontSize: 20
//                               //                                                                   ),
//                               //                                                                 ),
//                               //                                                               ],
//                               //                                                             ),
//                               //                                                           )
//                               //                                                       );
//                               //
//                               //                                                     },
//                               //                                                   );
//                               //                                                 }
//                               //                                               });
//                               //                                             },
//                               //                                             child: Padding(
//                               //                                               padding: EdgeInsets.all(10),
//                               //                                               child: Row(
//                               //                                                 mainAxisAlignment: MainAxisAlignment.center,
//                               //                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                               //                                                 children: [
//                               //                                                   // Padding(
//                               //                                                   //   padding: EdgeInsets.only(right: 10),
//                               //                                                   //   child: Icon(
//                               //                                                   //     LineariconsFree.smile,
//                               //                                                   //     color:  Colors.grey[600],
//                               //                                                   //     size: width * 0.13,
//                               //                                                   //   ),
//                               //                                                   // ),
//                               //                                                   Padding(
//                               //                                                     padding: EdgeInsets.only(left: 10),
//                               //                                                     child: Text(
//                               //                                                       "دریافت کد",
//                               //                                                       textAlign: TextAlign.center,
//                               //                                                       style: TextStyle(
//                               //                                                           color: Colors.grey[800],
//                               //                                                           fontSize: b_text_size,
//                               //                                                           fontWeight: FontWeight.bold
//                               //                                                       ),
//                               //                                                     ),
//                               //                                                   ),
//                               //                                                 ],
//                               //                                               ),
//                               //                                             ),
//                               //                                           ),
//                               //                                         ),
//                               //                                       ],
//                               //                                     ),
//                               //                                   )
//                               //                               );
//                               //                             },
//                               //                           );
//                               //                         },
//                               //                         child: Icon(
//                               //                           LineariconsFree.question_circle,
//                               //                           size: ResponsiveSizeWidget(
//                               //                               largeScreen_size: width * 0.05,
//                               //                               mediumScreen_size: width * 0.04,
//                               //                               smallScreen_size: width * 0.1,
//                               //                               min_size: width * 0.1,
//                               //                               max_size: width * 0.045,
//                               //                               context: context
//                               //                           ).get_width_size(),
//                               //                         ),
//                               //                       ),
//                               //                     ),
//                               //                   ],
//                               //                 )
//                               //             ),
//                               //           ),
//                               //         ),
//                               //       ),
//                               //       Align(
//                               //         alignment: Alignment.topLeft,
//                               //         child: Padding(
//                               //           padding: EdgeInsets.only(left: 20),
//                               //           child: Card(
//                               //             shape: RoundedRectangleBorder(
//                               //               borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
//                               //             ),
//                               //             child: Container(
//                               //               // margin: const EdgeInsets.symmetric(
//                               //               //   vertical: 10.0,
//                               //               // ),
//                               //                 width: ResponsiveSizeWidget(
//                               //                     largeScreen_size: width * 0.065,
//                               //                     mediumScreen_size: width * 0.06,
//                               //                     smallScreen_size: width * 0.15,
//                               //                     min_size: width * 0.15,
//                               //                     max_size: width * 0.055,
//                               //                     context: context
//                               //                 ).get_width_size(),
//                               //                 height: ResponsiveSizeWidget(
//                               //                     largeScreen_size: width * 0.1,
//                               //                     mediumScreen_size: width * 0.108,
//                               //                     smallScreen_size: width * 0.25,
//                               //                     min_size: width * 0.25,
//                               //                     max_size: width * 0.1,
//                               //                     context: context
//                               //                 ).get_width_size(),
//                               //                 decoration: BoxDecoration(
//                               //                   borderRadius: BorderRadius.circular(30),
//                               //                 ),
//                               //                 child: Column(
//                               //                   crossAxisAlignment: CrossAxisAlignment.center,
//                               //                   mainAxisAlignment: MainAxisAlignment.end,
//                               //                   children: [
//                               //                     Padding(
//                               //                       padding: EdgeInsets.only(bottom: 10),
//                               //                       child: InkWell(
//                               //                         onTap: () async{
//                               //                           showDialog(
//                               //                             context: context,
//                               //                             builder: (BuildContext _context) {
//                               //                               return AlertDialog(
//                               //                                   shape: RoundedRectangleBorder(
//                               //                                       borderRadius:BorderRadius.circular(20)
//                               //                                   ),
//                               //                                   // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
//                               //                                   content: Container(
//                               //                                     // decoration: BoxDecoration(
//                               //                                     //     borderRadius: BorderRadius.circular(30)
//                               //                                     // ),
//                               //                                     height: height * 0.55,
//                               //                                     width: width * 0.7,
//                               //                                     child: Directionality(
//                               //                                         textDirection: TextDirection.rtl,
//                               //                                         child: TransferFoodScreen(
//                               //                                           meal_food: widget.meal_foods[index],
//                               //                                           notifyParent: () {
//                               //                                             setState(() {});
//                               //                                           },
//                               //                                         )
//                               //                                     ),
//                               //                                   )
//                               //                               );
//                               //                             },
//                               //                           );
//                               //                           setState(() {});
//                               //                         },
//                               //                         child: Icon(
//                               //                           (meal_foods[index].transfer_request_status == 2) ?
//                               //                           LineariconsFree.checkmark_cicle :
//                               //                           (meal_foods[index].transfer_request_status == 1) ?
//                               //                           LineariconsFree.warning :
//                               //                           LineariconsFree.sync_icon,
//                               //                           size: ResponsiveSizeWidget(
//                               //                               largeScreen_size: width * 0.05,
//                               //                               mediumScreen_size: width * 0.04,
//                               //                               smallScreen_size: width * 0.1,
//                               //                               min_size: width * 0.1,
//                               //                               max_size: width * 0.045,
//                               //                               context: context
//                               //                           ).get_width_size(),
//                               //                         ),
//                               //                       ),
//                               //                     ),
//                               //                   ],
//                               //                 )
//                               //             ),
//                               //           ),
//                               //         ),
//                               //       ),
//                               //
//                               //       // Align(
//                               //       //   alignment: Alignment.topLeft,
//                               //       //   child: Padding(
//                               //       //     padding: EdgeInsets.only(left: 20),
//                               //       //     child: Card(
//                               //       //       shape: RoundedRectangleBorder(
//                               //       //         borderRadius: BorderRadius.vertical(bottom: Radius.circular(width)),
//                               //       //       ),
//                               //       //       child: Container(
//                               //       //         // margin: const EdgeInsets.symmetric(
//                               //       //         //   vertical: 10.0,
//                               //       //         // ),
//                               //       //           width: ResponsiveSizeWidget(
//                               //       //               largeScreen_size: width * 0.065,
//                               //       //               mediumScreen_size: width * 0.06,
//                               //       //               smallScreen_size: width * 0.15,
//                               //       //               min_size: width * 0.15,
//                               //       //               max_size: width * 0.055,
//                               //       //               context: context
//                               //       //           ).get_width_size(),
//                               //       //           height: ResponsiveSizeWidget(
//                               //       //               largeScreen_size: width * 0.1,
//                               //       //               mediumScreen_size: width * 0.108,
//                               //       //               smallScreen_size: width * 0.25,
//                               //       //               min_size: width * 0.25,
//                               //       //               max_size: width * 0.1,
//                               //       //               context: context
//                               //       //           ).get_width_size(),
//                               //       //           decoration: BoxDecoration(
//                               //       //             borderRadius: BorderRadius.circular(30),
//                               //       //           ),
//                               //       //           child: Column(
//                               //       //             crossAxisAlignment: CrossAxisAlignment.center,
//                               //       //             mainAxisAlignment: MainAxisAlignment.end,
//                               //       //             children: [
//                               //       //               Padding(
//                               //       //                 padding: EdgeInsets.only(bottom: 10),
//                               //       //                 child: InkWell(
//                               //       //                   onTap: () async{
//                               //       //                     showDialog(
//                               //       //                       context: context,
//                               //       //                       builder: (BuildContext _context) {
//                               //       //                         return AlertDialog(
//                               //       //                             shape: RoundedRectangleBorder(
//                               //       //                                 borderRadius:
//                               //       //                                 BorderRadius.circular(
//                               //       //                                     30)),
//                               //       //                             // backgroundColor:data_res!['status'] as bool ? Colors.green : Colors.red,
//                               //       //                             //   title: Text("اطلاعات تگ :"),
//                               //       //                             content: Container(
//                               //       //                               // decoration: BoxDecoration(
//                               //       //                               //     borderRadius: BorderRadius.circular(30)
//                               //       //                               // ),
//                               //       //                               height: MediaQuery.of(context)
//                               //       //                                   .size
//                               //       //                                   .height * 0.4,
//                               //       //                               // color: data!['status'] as bool ? Colors.green : Colors.red,
//                               //       //                               child: Column(
//                               //       //                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               //       //                                 crossAxisAlignment: CrossAxisAlignment.center,
//                               //       //                                 children: [
//                               //       //                                   // Text('${value["nfca"]["identifier"]}'),
//                               //       //                                   Column(
//                               //       //                                     children: [
//                               //       //                                       Text(
//                               //       //                                         "ارسال گزارش",
//                               //       //                                         textAlign: TextAlign.center,
//                               //       //                                         style: TextStyle(
//                               //       //                                             color: Colors.grey[600],
//                               //       //                                             fontSize: width * 0.07,
//                               //       //                                             fontWeight: FontWeight.bold
//                               //       //                                         ),
//                               //       //                                       ),
//                               //       //                                       Padding(
//                               //       //                                         padding: EdgeInsets.all(10),
//                               //       //                                         child: Text(
//                               //       //                                           "دانشجو عزیز در نظر داشته باشید که از این طریق میتوانید هر موردی در رابطه با غذا ها برای مسیولین دانشگاه ارسال کنید تا در اسرع وقت پیگیری شود",
//                               //       //                                           textAlign: TextAlign.center,
//                               //       //                                           style: TextStyle(
//                               //       //                                             color: Colors.grey[600],
//                               //       //                                             // fontSize: 20
//                               //       //                                           ),
//                               //       //                                         ),
//                               //       //                                       ),
//                               //       //                                     ],
//                               //       //                                   ),
//                               //       //
//                               //       //                                   Card(
//                               //       //                                     shape: RoundedRectangleBorder(
//                               //       //                                       borderRadius: BorderRadius.circular(45),
//                               //       //                                     ),
//                               //       //                                     child: InkWell(
//                               //       //                                       onTap: (){
//                               //       //                                         Navigator.pop(context);
//                               //       //
//                               //       //                                       },
//                               //       //                                       child: Padding(
//                               //       //                                         padding: EdgeInsets.all(10),
//                               //       //                                         child: Row(
//                               //       //                                           mainAxisAlignment: MainAxisAlignment.center,
//                               //       //                                           crossAxisAlignment: CrossAxisAlignment.center,
//                               //       //                                           children: [
//                               //       //                                             // Padding(
//                               //       //                                             //   padding: EdgeInsets.only(right: 10),
//                               //       //                                             //   child: Icon(
//                               //       //                                             //     LineariconsFree.smile,
//                               //       //                                             //     color:  Colors.grey[600],
//                               //       //                                             //     size: width * 0.13,
//                               //       //                                             //   ),
//                               //       //                                             // ),
//                               //       //                                             Padding(
//                               //       //                                               padding: EdgeInsets.only(left: 10),
//                               //       //                                               child: Text(
//                               //       //                                                 "تکمیل اطلاعات و ارسال",
//                               //       //                                                 textAlign: TextAlign.center,
//                               //       //                                                 style: TextStyle(
//                               //       //                                                     color: Colors.grey[800],
//                               //       //                                                     fontSize: width * 0.06,
//                               //       //                                                     fontWeight: FontWeight.bold
//                               //       //                                                 ),
//                               //       //                                               ),
//                               //       //                                             ),
//                               //       //                                           ],
//                               //       //                                         ),
//                               //       //                                       ),
//                               //       //                                     ),
//                               //       //                                   ),
//                               //       //                                 ],
//                               //       //                               ),
//                               //       //                             )
//                               //       //                         );
//                               //       //                       },
//                               //       //                     );
//                               //       //                   },
//                               //       //                   child: Icon(
//                               //       //                     LineariconsFree.sync_icon,
//                               //       //                     size: ResponsiveSizeWidget(
//                               //       //                         largeScreen_size: width * 0.05,
//                               //       //                         mediumScreen_size: width * 0.04,
//                               //       //                         smallScreen_size: width * 0.1,
//                               //       //                         min_size: width * 0.1,
//                               //       //                         max_size: width * 0.045,
//                               //       //                         context: context
//                               //       //                     ).get_width_size(),
//                               //       //                   ),
//                               //       //                 ),
//                               //       //               ),
//                               //       //             ],
//                               //       //           )
//                               //       //       ),
//                               //       //     ),
//                               //       //   ),
//                               //       // ),
//                               //
//                               //     ]
//                               //     ),
//                               //   ),
//                               // ),