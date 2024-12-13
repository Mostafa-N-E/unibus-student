import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/repo/meal_food_repository.dart';
import '../../../../data/repo/turn_repository.dart';
import '../../../../utils/responsiveLayout.dart';
import '../../../widgets/progress_indicator.dart';
import '../bloc/reserve_bus_bloc.dart';
import '../widgets/app_bar.dart';
import '../widgets/change_dormitory.dart';
import '../widgets/floating_action_button.dart';
import '../widgets/bus_reserve_card.dart';
import '../../../../data/dormitory.dart';


class SmallReserveBusPage extends StatelessWidget {
  // const SmallReserveFoodPage({Key? key, }) : super(key: key);

  // const LargeReserveFoodPage({Key? key,}) : super(key: key);
  Jalali date = Jalali.now();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;
    final ReserveBusSmallScreenAppBar app_bar = ReserveBusSmallScreenAppBar(context);
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

    return BlocProvider(
      create: (context) {
        final reserveBusBloc = ReserveBusBloc(
            turnRepository: turnRepository
        );
        reserveBusBloc.add(ReserveBusStarted(picked_date: Jalali.now(), dormitory_id: -1, ));
        return reserveBusBloc;
      },
      child: BlocBuilder<ReserveBusBloc, ReserveBusState>(builder: ((context, state) {
        if (state is ReserveBusSuccess) {
          return Scaffold(
            appBar: app_bar.build(
                dormitory_selecter_onTap:  () async {
                  await showModalBottomSheet(
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ChangeDormitoryWidget(dormitories: state.dormitories,);
                    },
                  );
                  BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusChangeSelfService(picked_date: state.picked_date as Jalali, dormitory_id: state.dormitory_id, dormitories: state.dormitories));
                },
                date_piker_onTap:  () async {
                  Jalali? picked = await showPersianDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: Jalali(1399, 1),
                    lastDate: Jalali(1410, 12),
                  );
                  BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusRefresh(picked_date: picked as Jalali, dormitory_id: state.dormitory_id, dormitories: state.dormitories));
                },
                date_lable:state.picked_date.formatFullDate(),
                dormitory_lable:state.dormitory_id != -1 ? state.dormitories[state.dormitory_id].name : "====="
            ),
            floatingActionButton: floating_action_button.build(
              next_button_onTap: ()async{
                BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusRefresh(picked_date: state.picked_date.addDays(1) as Jalali, dormitory_id: state.dormitory_id, dormitories: state.dormitories));
              },
              back_button_onTap: ()async{
                BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusRefresh(picked_date: state.picked_date.addDays(-1) as Jalali, dormitory_id: state.dormitory_id, dormitories: state.dormitories));
              },
            ),
            body: SafeArea(
              child: state.turns.length == 0 ?
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
                          BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusRefresh(picked_date: state.picked_date, dormitory_id: state.dormitory_id, dormitories: state.dormitories));
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
              ListView.builder(
                  itemCount: state.turns.length,
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                  itemBuilder: (context, index) {
                    return BusReserveCard(
                      turn: state.turns[index],
                    );
                  }),
            ),
          );
        } else if (state is ReserveBusFirstSuccess) {
          return Scaffold(
            appBar: app_bar.build(
                dormitory_selecter_onTap:  () async {
                  await showModalBottomSheet(
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return ChangeDormitoryWidget(dormitories: state.dormitoies,);
                    },
                  );
                  int selected_dormitoiy_id = -1;
                  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  int? selected_dormitoiy_id_temp = sharedPreferences.getInt("selected_dormitory_id");
                  if(selected_dormitoiy_id_temp == null){
                    selected_dormitoiy_id = -1;
                  }else{
                    selected_dormitoiy_id = selected_dormitoiy_id_temp;
                  }
                  BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusRefresh(picked_date: state.picked_date, dormitory_id: selected_dormitoiy_id, dormitories: state.dormitoies));

                },
                date_piker_onTap:  () async {
                  Jalali? picked = await showPersianDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: Jalali(1399, 1),
                    lastDate: Jalali(1410, 12),
                  );
                  BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusRefresh(picked_date: picked as Jalali, dormitory_id: state.dormitory_id, dormitories: state.dormitoies));

                },
                date_lable:state.picked_date.formatFullDate(),
                dormitory_lable: state.dormitory_id != -1 ? state.dormitoies[state.dormitory_id].name : "( انتخاب کنید )"
            ),
            floatingActionButton: floating_action_button.build(),
            body: Center(),
          );
        } else if (state is ReserveBusFirstLoading) {
          return Scaffold(
              appBar: app_bar.build(
                dormitory_selecter_onTap:  () {},
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
        } else if (state is ReserveBusLoading) {
          return Scaffold(
              appBar: app_bar.build(
                  dormitory_selecter_onTap:  () async {
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
                    BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusRefresh(picked_date: picked as Jalali, dormitory_id: state.dormitoiy_id, dormitories: state.dormitoies));
                  },
                  date_lable:state.picked_date.formatFullDate(),
                  dormitory_lable:state.dormitoiy_id != -1 ? state.dormitoies[state.dormitoiy_id].name : "-------"
              ),
              floatingActionButton: floating_action_button.build(),
              body: Center(child: CustomProgressIndicator())
          );
        } else if (state is ReserveBusError) {
          return Scaffold(
            appBar: app_bar.build(
                dormitory_selecter_onTap:  ()  {},
                date_piker_onTap:  ()  {},
                date_lable:"-------------",
                dormitory_lable:"-------------"
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
                          BlocProvider.of<ReserveBusBloc>(context).add(ReserveBusStarted(picked_date: date, dormitory_id: -1));
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
