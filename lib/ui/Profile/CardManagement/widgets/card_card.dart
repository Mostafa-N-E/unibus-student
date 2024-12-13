import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../../../data/repo/card_repository.dart';
import '../../../../../../ui/widgets/snackbar.dart';
import '../../../../../../utils/responsiveLayout.dart';
import '../../../../data/card.dart';
import '../bloc/card_management_bloc.dart';

class SmallCardCard extends StatefulWidget {
  CardEntity card;
  SmallCardCard({
    // Key? key,
    required this.card
  }) ;

  @override
  State<SmallCardCard> createState() => _SmallCardCardState();
}

class _SmallCardCardState extends State<SmallCardCard> {
  late bool is_active_cart;
  @override
  void initState() {
    is_active_cart = widget.card.is_active;
    super.initState();
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
        mediumScreen_size: width * 0.43,
        smallScreen_size: width * 0.51,
        min_size: width * 0.5,
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

    on_change() async{
      print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
      await cardRepository.change_cart_activation({"card_id": widget.card.id}).then((response) => {
        if(response['status']){
          ShowSnackBar().showSnackBar(context, response['message'],background_color: Colors.greenAccent),
          setState((){
            if(is_active_cart){
              // widget.card.is_active = false;
              is_active_cart = false;
            }else{
              // widget.card.is_active = true;
              is_active_cart = true;
            }
          })
        }else{
          ShowSnackBar().showSnackBar(context, response['message'],background_color: Colors.redAccent),
        },
      });
      setState((){});
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                              padding:  EdgeInsets.only(top: 20),
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
                                          child: Image(
                                            width: image_width,
                                            height: image_width,
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              "assets/images/card.png",
                                            ),
                                          )

                                      ),

                                    ]
                                ),
                              ),
                            ),
                            Center(
                                child: Text(widget.card.card_serial as String,
                                  style: TextStyle(
                                    // color: isDarkMode
                                    //     ? Colors.white
                                    //     : Colors.white,
                                    color: Colors.grey[500],
                                    //Theme.of(context).colorScheme.secondary,
                                    fontSize: h1_text_size * 1.2,
                                    fontFamily: 'Digital',
                                    fontWeight: FontWeight.w100,
                                  ),
                                )
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
                                    widget.card.main_card ?
                                    "کارت اصلی"
                                        :
                                    "کارت فراموشی",
                                    style: TextStyle(
                                        fontSize: b_text_size * 0.85,
                                        fontFamily: "Sahel"

                                    ),
                                  ),
                                  subtitle: Text(
                                    widget.card.main_card ?
                                    "کارت دانشجویی شماا به عنوان کارت اصلی شماست"
                                        :
                                    "کارت مترو و ..  ",
                                    style: TextStyle(
                                        fontSize: b_text_size * 0.46
                                    ),
                                  ),
                                  dense: true,
                                  trailing:Icon(
                                      LineariconsFree.checkmark_cicle,
                                      color: Colors.greenAccent
                                  ),
                                  onTap: () {

                                  },
                                ),

                              ),

                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                            //   child:Padding(
                            //     padding: EdgeInsets.only(
                            //         right: 0),
                            //     child:ListTile(
                            //       title: Text(
                            //         "مجازی سازی",
                            //         style: TextStyle(
                            //             fontSize: b_text_size * 0.85,
                            //             fontFamily: "Sahel"
                            //
                            //         ),
                            //       ),
                            //       subtitle: Text(
                            //         "NFC جایگزین کارت فیزیکی شما",
                            //         style: TextStyle(
                            //             fontSize: b_text_size * 0.46
                            //         ),
                            //       ),
                            //       dense: true,
                            //       trailing:Icon(
                            //           LineariconsFree.chevron_left,
                            //           // color: Colors.greenAccent
                            //       ),
                            //       onTap: () {
                            //
                            //       },
                            //     ),
                            //
                            //   ),
                            //
                            // ),
                            Padding(
                              padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                              child:Padding(
                                padding: EdgeInsets.only(
                                    right: 0),
                                child:ListTile(
                                  title: Text(
                                    "حذف کارت",
                                    style: TextStyle(
                                        fontSize: b_text_size * 0.85,
                                        fontFamily: "Sahel"

                                    ),
                                  ),
                                  subtitle: Text(
                                    widget.card.main_card ?
                                    "کارت اصلی خود را نمیتوانید حذف کنید"
                                    :
                                    "در صورت مفقودی یا ... میتوانید این کارت را حذف کنید",
                                    style: TextStyle(
                                        fontSize: b_text_size * 0.5
                                    ),
                                  ),
                                  dense: true,
                                    trailing:Icon(
                                        LineariconsFree.trash,
                                      color: widget.card.main_card ?
                                      Colors.grey: Colors.red ,
                                    ),
                                  onTap: () {

                                  },
                                ),

                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 5),
                              child:Padding(
                                padding: EdgeInsets.only(
                                    right: 0),
                                child:SizedBox(
                                  width: width* 0.74,
                                  height: 50,
                                  child: SwitchListTile(
                                    activeColor: Theme.of(context).colorScheme.secondary,
                                    title: Text(
                                        "مستود سازی موقت",
                                      style: TextStyle(
                                        fontSize: b_text_size * 0.85,
                                        fontFamily: "Sahel"

                                      ),
                                    ),
                                    subtitle: Text(
                                      "کارت خود را به صورت موقت غیرفعال کنید",
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.5
                                      ),
                                    ),
                                    // isThreeLine: false,
                                    // dense: false,
                                    value: !is_active_cart,
                                    onChanged: (val) async {
                                      await cardRepository.change_cart_activation({"card_id": widget.card.id}).then((response) => {
                                        if(response['status']){
                                          BlocProvider.of<CardManagementBloc>(context).add(CardManagementRefresh()),
                                          ShowSnackBar().showSnackBar(context, response['message'],background_color: Colors.greenAccent),
                                          setState((){
                                            if(is_active_cart){
                                              // widget.card.is_active = false;
                                              is_active_cart = false;
                                            }else{
                                              // widget.card.is_active = true;
                                              is_active_cart = true;
                                            }
                                          }),
                                      }else{
                                          ShowSnackBar().showSnackBar(context, response['message'],background_color: Colors.redAccent),
                                        },
                                      });
                                    },
                                  ),
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
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LargeCardCard extends StatelessWidget {
  CardEntity card;
  LargeCardCard({
    Key? key,
    required this.card
  }) : super(key: key);

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
        largeScreen_size: width * 0.24,
        mediumScreen_size: width * 0.26,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.22,
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

    double container_width  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.4,
        mediumScreen_size: width * 0.5,
        smallScreen_size: width * 0.3,
        min_size: width * 0.3,
        max_size: width * 0.35,
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

    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Expanded(
              child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
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
                                padding:  EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  height: image_width,//width * 0.6,
                                  width: image_width,//width * 0.6,
                                  child: Image(
                                    width: image_width,
                                    height: image_width,
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/images/card.png",
                                    ),
                                  ),
                                ),
                              ),
                              Text(card.card_serial as String,
                                style: TextStyle(
                                  // color: isDarkMode
                                  //     ? Colors.white
                                  //     : Colors.white,
                                  color: Colors.grey[500],
                                  //Theme.of(context).colorScheme.secondary,
                                  fontSize: h1_text_size * 1.2,
                                  fontFamily: 'Digital',
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
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                            width: container_width,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:ListTile(
                                    title: Text(
                                      card.main_card ?
                                      "کارت اصلی"
                                          :
                                      "کارت فراموشی",
                                    ),
                                    subtitle: Text(
                                      card.main_card ?
                                      "کارت دانشجویی شماا به عنوان کارت اصلی شماست"
                                          :
                                      "کارت مترو و ..  ",
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.46
                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                        LineariconsFree.checkmark_cicle,
                                        color: Colors.greenAccent
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
                                      "مجازی سازی",
                                    ),
                                    subtitle: Text(
                                      "NFC جایگزین کارت فیزیکی شما",
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.46
                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                      LineariconsFree.chevron_left,
                                      // color: Colors.greenAccent
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
                                      "حذف کارت",
                                    ),
                                    subtitle: Text(
                                      card.main_card ?
                                      "کارت اصلی خود را نمیتوانید حذف کنید"
                                          :
                                      "در صورت مفقودی یا ... میتوانید این کارت را حذف کنید",
                                      style: TextStyle(
                                          fontSize: b_text_size * 0.5
                                      ),
                                    ),
                                    dense: true,
                                    trailing:Icon(
                                      LineariconsFree.trash,
                                      color: card.main_card ?
                                      Colors.grey: Colors.red ,
                                    ),
                                    onTap: () {

                                    },
                                  ),

                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 5),
                                child:Padding(
                                  padding: EdgeInsets.only(
                                      right: 0),
                                  child:SizedBox(
                                    width: width* 0.74,
                                    height: 50,
                                    child: SwitchListTile(
                                      activeColor: Theme.of(context).colorScheme.secondary,
                                      title: Text("مستود سازی موقت"),
                                      subtitle: Text(
                                        "کارت خود را به صورت موقت غیرفعال کنید",
                                        style: TextStyle(
                                            fontSize: b_text_size * 0.5
                                        ),
                                      ),
                                      isThreeLine: false,
                                      dense: true,
                                      value: false,//card.is_active
                                      onChanged: (val) {
                                        // box.put(keyName, val);
                                        // onChanged?.call(val, box);
                                      },
                                    ),
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
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}