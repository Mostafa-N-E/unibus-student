import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../../../ui/Profile/CardManagement/widgets/card_card.dart';
import '../../../../../../ui/Profile/CardManagement/widgets/card_register_menu.dart';
import '../../../../../../ui/Profile/MainPage/widgets/app_bar.dart';
import '../../../data/repo/auth_repository.dart';
import '../../../data/repo/card_repository.dart';
import '../../../utils/responsiveLayout.dart';
import 'dart:math' as math;

import '../../widgets/alert_dialog.dart';
import '../../widgets/progress_indicator.dart';
import 'bloc/card_management_bloc.dart';


class CardManagementScreen extends StatefulWidget {
  @override
  State<CardManagementScreen> createState() => _CardManagementScreenState();
}

class _CardManagementScreenState extends State<CardManagementScreen>  {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey_7 = new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
    final ProfileScreenAppBar app_bar = ProfileScreenAppBar(context);

    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.2,
        mediumScreen_size: width * 0.3,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.17,
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

    double padding = ResponsiveSizeWidget(
        largeScreen_size: width * 0.03,
        mediumScreen_size: width * 0.035,
        smallScreen_size: width * 0.1,
        min_size: width * 0.1,
        max_size: width * 0.025,
        context: context
    ).get_width_size();
    double container_height = ResponsiveSizeWidget(
        largeScreen_size: screenHeight * 0.55,
        mediumScreen_size: screenHeight * 0.6,
        smallScreen_size: screenHeight * 0.8,
        min_size: screenHeight *0.8,
        max_size: screenHeight *0.55,
        context: context
    ).get_custom_size();
    double viewportFraction  = ResponsiveSizeWidget(
        largeScreen_size: 0.75,
        mediumScreen_size: 0.8,
        smallScreen_size: 0.85,
        min_size: 0.9,
        max_size: 0.65,
        context: context
    ).get_custom_size();
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

    // final money_format = new NumberFormat("#,##0", "en_US");
    return BlocProvider(
      create: (context) {
        final cardManagementBloc = CardManagementBloc(
            cardRepository: cardRepository, authRepository: authRepository
        );
        cardManagementBloc.add(CardManagementStarted());
        return cardManagementBloc;
      },
      child: BlocBuilder<CardManagementBloc, CardManagementState>(builder: ((context, state) {
        if (state is CardManagementSuccess) {
          return Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              toolbarOpacity: 1,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Card(
                    elevation: 1,
                    // color: Theme.of(context)
                    //     .colorScheme
                    //     .secondary
                    //     .withOpacity(0.145),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    shadowColor: Theme.of(context).colorScheme.secondary,
                    child: InkWell(
                      // hoverColor: Colors.white70,
                      enableFeedback: true,
                      onTap: () {
                        if(ResponsiveLayout.isMobileSmall(context) || ResponsiveLayout.isMobileMedium(context) ||ResponsiveLayout.isMobileLarge(context)){
                          showModalBottomSheet(
                            isDismissible: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return SmallCradRegisterMenu();
                            },
                          );
                        }else{
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomAlertDialog(
                                  content: Directionality(
                                    textDirection: TextDirection.rtl,
                                    // child: initialFuntion()
                                    child: Container(
                                      width: width * 0.65,
                                      height: height /2,
                                      child: SmallCradRegisterMenu(),
                                    ),
                                  )
                              );
                            },
                          );
                        }

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ثبت کارت فراموشی جدید",
                              style: TextStyle(
                                // color: Theme.of(context).colorScheme.secondary,
                                fontSize:b_text_size* 0.7,
                                // fontFamily: 'decotype-thuluth-ii',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                LineariconsFree.plus_circle_1,
                                color: Colors.black87,
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
            body: RefreshIndicator(
              key: _refreshIndicatorKey_7,
              onRefresh: ()async{
                BlocProvider.of<CardManagementBloc>(context).add(CardManagementRefresh());
                // _refresh
              },
              child: state.cards.isEmpty
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
                              "کارت ثبت شده ای ندارید"
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: InkWell(
                          onTap: (){
                            BlocProvider.of<CardManagementBloc>(context).add(CardManagementRefresh());
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
                  :SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics() ),
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: CarouselSlider.builder(
                  // page
                  itemCount: state.cards.length,
                  options: CarouselOptions(
                    reverse: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    height: ResponsiveLayout.isMobileLarge(context) ? screenHeight * 0.8 : container_height,//item_height ,
                    viewportFraction: ResponsiveLayout.isMobileLarge(context) ? 0.8 : viewportFraction,//rotated ? 0.76 : 0.78,
                    // autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                  itemBuilder: (
                      BuildContext _context,
                      int index,
                      int pageViewIndex,
                      ) =>ResponsiveLayout(
                        largeScreen: LargeCardCard(card: state.cards[index],),
                        smallScreen: SmallCardCard(card: state.cards[index],),
                      )
                ),
              ),
            ),
          );
        } else if (state is CardManagementLoading) {
          return Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              toolbarOpacity: 1,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              actions: [
                Container(
                  // height: 90,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      if(ResponsiveLayout.isMobileSmall(context) || ResponsiveLayout.isMobileMedium(context) ||ResponsiveLayout.isMobileLarge(context)){
                        showModalBottomSheet(
                          isDismissible: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return SmallCradRegisterMenu();
                          },
                        );
                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                                content: Directionality(
                                  textDirection: TextDirection.rtl,
                                  // child: initialFuntion()
                                  child: Container(
                                    width: width * 0.65,
                                    height: height /2,
                                    child: SmallCradRegisterMenu(),
                                  ),
                                )
                            );
                          },
                        );
                      }

                    },
                    child: Icon(
                      LineariconsFree.plus_circle_1,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: Center(child: CustomProgressIndicator()),

          );
        } else if (state is CardManagementError) {
          return Scaffold(
            appBar: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              toolbarOpacity: 1,
              toolbarHeight: rotated
                  ? MediaQuery.of(context).size.height * 0.2
                  : MediaQuery.of(context).size.width * 0.17,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              actions: [
                Container(
                  // height: 90,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      if(ResponsiveLayout.isMobileSmall(context) || ResponsiveLayout.isMobileMedium(context) ||ResponsiveLayout.isMobileLarge(context)){
                        showModalBottomSheet(
                          isDismissible: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return SmallCradRegisterMenu();
                          },
                        );
                      }else{
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                                content: Directionality(
                                  textDirection: TextDirection.rtl,
                                  // child: initialFuntion()
                                  child: Container(
                                    width: width * 0.65,
                                    height: height /2,
                                    child: SmallCradRegisterMenu(),
                                  ),
                                )
                            );
                          },
                        );
                      }

                    },
                    child: Icon(
                      LineariconsFree.plus_circle_1,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                        ),
                        child: Text(
                            state.exception.message
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                      ),
                      child: InkWell(
                        onTap: (){
                          BlocProvider.of<CardManagementBloc>(context).add(CardManagementStarted());
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
            ),
          );
        }
        else {
          throw Exception("state is not supported ${state}");
        }
      })),
    );
  }
}



