import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import '../../../../data/meal_food.dart';
import '../../../../data/repo/meal_food_repository.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/progress_indicator.dart';
import '../bloc/reserve_food_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/change_self_service.dart';
import '../widgets/floating_action_button.dart';
import '../widgets/food_reserve_card.dart';

class LargeReserveFoodPage extends StatelessWidget {
  // const LargeReserveFoodPage({Key? key,}) : super(key: key);

  Jalali date = Jalali.now();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
    final ReserveFoodLargeScreenAppBar app_bar = ReserveFoodLargeScreenAppBar(context);
    final ReserveFoodScreenFloatingActionButton floating_action_button = ReserveFoodScreenFloatingActionButton(context);

    double image_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.2,
        mediumScreen_size: width * 0.3,
        smallScreen_size: width * 0.55,
        min_size: width * 0.7,
        max_size: width * 0.23,
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
        largeScreen_size: height * 0.48,
        mediumScreen_size: height * 0.7,
        smallScreen_size: height * 0.75,
        min_size: height * 0.75,
        max_size: height * 0.6,
        context: context
    ).get_height_size();
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
    double container_width = ResponsiveSizeWidget(
        largeScreen_size: width * 0.26,
        mediumScreen_size: width * 0.32,
        smallScreen_size: width * 0.9,
        min_size: width * 0.9,
        max_size: width * 0.26,
        context: context
    ).get_width_size();

    return BlocProvider(
      create: (context) {
        final reserveFoodBloc = ReserveFoodBloc(
            mealFoodRepository: mealFoodRepository
        );
        reserveFoodBloc.add(ReserveFoodStarted(picked_date: Jalali.now(), SelfServiceId: -1, ));
        return reserveFoodBloc;
      },
      child: BlocBuilder<ReserveFoodBloc, ReserveFoodState>(builder: ((context, state) {
        if (state is ReserveFoodSuccess) {
          Map<String, List<MealFoodEntity>> classified_meal_foods = MealFoodEntity.get_meal_foods_dased_on_meal_type(state.meal_foods);
          return Scaffold(
            appBar: app_bar.build(
                self_service_selecter_onTap:  () async {
                  await showModalBottomSheet(
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ChangeSelfServiceWidget(self_services: state.self_services,);
                    },
                  );
                  BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodChangeSelfService(picked_date: state.picked_date as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
                },
                date_piker_onTap:  () async {
                  Jalali? picked = await showPersianDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: Jalali(1399, 1),
                    lastDate: Jalali(1410, 12),
                  );
                  BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
                },
                date_lable:state.picked_date.formatFullDate(),
                self_service_lable:state.SelfServiceId != -1 ? state.self_services[state.SelfServiceId].name : "-------"
            ),
            floatingActionButton: floating_action_button.build(
              next_button_onTap: ()async{
                BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: state.picked_date.addDays(1) as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
              },
              back_button_onTap: ()async{
                BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: state.picked_date.addDays(-1) as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
              },
            ),
            body: SafeArea(
              child: state.meal_foods.length == 0 ?
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("موردی برای نمایش وجود ندارد"),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                      ),
                      child: InkWell(
                        onTap: (){
                          BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: state.picked_date, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
                        },
                        child: Icon(
                          LineariconsFree.redo,
                          size: 60,
                          color: Theme.of(context).colorScheme.secondary.withOpacity(1),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  :
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: container_width,
                      child: classified_meal_foods['breakfast_foods']?.length != 0 ?
                      ListView.builder(
                          itemCount: classified_meal_foods['breakfast_foods']?.length,
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                          itemBuilder: (context, index) {
                            return LargePageFoodReserveCard(
                              meal_food: classified_meal_foods['breakfast_foods']![index],
                            );
                          }
                      )
                          : Container(
                        width: ResponsiveSizeWidget(
                            largeScreen_size: width * 0.26,
                            mediumScreen_size: width * 0.32,
                            smallScreen_size: width * 0.9,
                            min_size: width * 0.9,
                            max_size: width * 0.26,
                            context: context
                        ).get_width_size(),
                        child: Center(
                          child: Text(
                            "غذایی برای وعده صبحانه وجود ندارد",
                            style: TextStyle(
                                fontSize: b_text_size /2,
                                fontFamily: "Sahel"

                            ),
                          ),
                        ),
                      ),

                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: width * 0.6,
                      child: classified_meal_foods['lunch_foods']?.length != 0 ?
                      ListView.builder(
                          itemCount: classified_meal_foods['lunch_foods']?.length,
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                          itemBuilder: (context, index) {
                            return LargePageFoodReserveCard(
                              meal_food: classified_meal_foods['lunch_foods']![index],
                            );
                          }
                        )
                      :
                      Container(
                        width: ResponsiveSizeWidget(
                            largeScreen_size: width * 0.26,
                            mediumScreen_size: width * 0.32,
                            smallScreen_size: width * 0.9,
                            min_size: width * 0.9,
                            max_size: width * 0.26,
                            context: context
                        ).get_width_size(),
                        child: Center(
                          child: Text(
                            "غذایی برای وعده ناهار وجود ندارد",
                            style: TextStyle(
                                fontSize: b_text_size /2,
                                fontFamily: "Sahel"

                            ),
                          ),
                        ),
                      ),

                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: width * 0.6,
                      child: classified_meal_foods['dinner_foods']?.length != 0 ?
                      ListView.builder(
                          itemCount: classified_meal_foods['dinner_foods']?.length,
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                          itemBuilder: (context, index) {
                            return LargePageFoodReserveCard(
                              meal_food: classified_meal_foods['dinner_foods']![index],
                            );
                          }
                          )
                      :
                      Container(
                        width: ResponsiveSizeWidget(
                            largeScreen_size: width * 0.26,
                            mediumScreen_size: width * 0.32,
                            smallScreen_size: width * 0.9,
                            min_size: width * 0.9,
                            max_size: width * 0.26,
                            context: context
                        ).get_width_size(),
                        child: Center(
                          child: Text(
                            "غذایی برای وعده شام وجود ندارد",
                            style: TextStyle(
                                fontSize: b_text_size /2,
                                fontFamily: "Sahel"

                            ),
                          ),
                        ),
                      ),

                    ),
                  )
                ],
              )
            ),
          );
        } else if (state is ReserveFoodFirstSuccess) {
          return Scaffold(
            appBar: app_bar.build(
                self_service_selecter_onTap:  () async {
                  await showModalBottomSheet(
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ChangeSelfServiceWidget(self_services: state.self_services,);
                    },
                  );
                  BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodChangeSelfService(picked_date: state.picked_date as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
                },
                date_piker_onTap:  () async {
                  Jalali? picked = await showPersianDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: Jalali(1399, 1),
                    lastDate: Jalali(1410, 12),
                  );
                  BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
                },
                date_lable:state.picked_date.formatFullDate(),
                self_service_lable: state.SelfServiceId != -1 ? state.self_services[state.SelfServiceId].name : "-------"
            ),
            floatingActionButton: floating_action_button.build(),
            body: Center(),
          );
        } else if (state is ReserveFoodFirstLoading) {
          return Scaffold(
              appBar: app_bar.build(
                self_service_selecter_onTap:  () {},
                date_piker_onTap:  () async {
                  Jalali? picked = await showPersianDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: Jalali(1399, 1),
                    lastDate: Jalali(1410, 12),
                  );
                  // BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: 1, selfservices: state.self_services));
                },
                date_lable:state.picked_date.formatFullDate(),
                // self_service_lable: ""
              ),
              floatingActionButton: floating_action_button.build(),
              body: const Center()
          );
        } else if (state is ReserveFoodLoading) {
          return Scaffold(
              appBar: app_bar.build(
                  self_service_selecter_onTap:  () async {
                    // Jalali? picked = await showPersianDatePicker(
                    //   context: context,
                    //   initialDate: date,
                    //   firstDate: Jalali(1399, 1),
                    //   lastDate: Jalali(1410, 12),
                    // );
                    // BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: 1, selfservices: state.self_services));
                  },
                  date_piker_onTap:  () async {
                    Jalali? picked = await showPersianDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: Jalali(1399, 1),
                      lastDate: Jalali(1410, 12),
                    );
                    BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodRefresh(picked_date: picked as Jalali, SelfServiceId: state.SelfServiceId, selfservices: state.self_services));
                  },
                  date_lable:state.picked_date.formatFullDate(),
                  self_service_lable:state.SelfServiceId != -1 ? state.self_services[state.SelfServiceId].name : "-------"
              ),
              floatingActionButton: floating_action_button.build(),
              body: Center(child: CustomProgressIndicator())
          );
        } else if (state is ReserveFoodError) {
          return Scaffold(
            appBar: app_bar.build(
                self_service_selecter_onTap:  ()  {},
                date_piker_onTap:  ()  {},
                date_lable:"-------------",
                self_service_lable:"-------------"
            ),
            floatingActionButton: floating_action_button.build(),
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
                          BlocProvider.of<ReserveFoodBloc>(context).add(ReserveFoodStarted(picked_date: date, SelfServiceId: -1));
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
        } else {
          throw Exception("state is not supported");
        }
      })),
    );
  }
}
