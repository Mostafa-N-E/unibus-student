import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../ui/Profile/MainPage/widgets/app_bar.dart';
import '../../../data/repo/auth_repository.dart';
import '../../../utils/responsiveLayout.dart';
import 'dart:math' as math;

import '../../widgets/progress_indicator.dart';
import 'bloc/profile_detail_bloc.dart';

class ProfileDetailScreen extends StatefulWidget {
  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    // final money_format = new NumberFormat("#,##0", "en_US");
    return BlocProvider(
      create: (context) {
        final profileDetailBloc = ProfileDetailBloc(
            authRepository: authRepository
        );
        profileDetailBloc.add(ProfileDetailStarted());
        return profileDetailBloc;
      },
      child: BlocBuilder<ProfileDetailBloc, ProfileDetailState>(builder: ((context, state) {
        if (state is ProfileDetailSuccess) {
          return Scaffold(
            appBar:AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              leading: IconButton(
                icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ),
            body: SafeArea(
              child:Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width-0,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0, right: 20, left: 20,bottom: 5),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      // height: 91,
                                      // width: 91,
                                      // margin: const EdgeInsets.only(
                                      //     left: 225, right: 5, top: 25, bottom: 5),
                                        padding: const EdgeInsets.all(20.0),
                                        // decoration: BoxDecoration(
                                        // border: Border.all(color: Colors.grey, width: 4),
                                        // borderRadius: BorderRadius.circular(140)
                                        // ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 190,
                                              width: 190,
                                              // margin: const EdgeInsets.only(
                                              //     left: 225, right: 5, top: 25, bottom: 5),
                                              padding: const EdgeInsets.all(3.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey[400] as Color, width: 2),
                                                  borderRadius: BorderRadius.circular(140)
                                              ),
                                              child: CircleAvatar(
                                                // onBackgroundImageError: (context, _) =>Icon(Icons.person),
                                                backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                                                backgroundImage: AssetImage('assets/images/profile.png'),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 20),
                                              child: Text(
                                                // 'مصطفی نظری ',
                                                state.user_info.first_name != "" && state.user_info.last_name != ""?
                                                state.user_info.first_name+" "+ state.user_info.last_name :
                                                "(کاربر بی نام)",
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 25,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),


                                          ],
                                        )
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(LineariconsFree.user_1, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "نام کاربری : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 0.0),
                                            child: Text(
                                              // '09016064697',
                                              state.user_info.id.toString() ?? "",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(LineariconsFree.user_1, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "تلفن همراه : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 0.0),
                                            child: Text(
                                              state.user_info.phone_number.toString() ?? "",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(Linecons.location, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "خوابگاه : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: Text(
                                              // 'خوابگاه حافظ - پسران(۱)',
                                              state.user_info.dormitory == 1 ? "حافظ" :
                                              state.user_info.dormitory == 2 ? "طزشت" :
                                              state.user_info.dormitory == 3 ? "مدنی" :
                                              state.user_info.dormitory == 4 ? "اختیاره" :
                                              state.user_info.dormitory == 5 ? "ازگل":
                                              "حافظ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(LineariconsFree.user_1, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "شماره دانشجویی : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 0.0),
                                            child: Text(
                                              // '09016064697',
                                              state.user_info.id.toString() ?? "",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(LineariconsFree.user_1, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "رشته : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 0.0),
                                            child: Text(
                                              // '09016064697',
                                              state.user_info.major.toString() ?? "",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(LineariconsFree.user_1, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "سریال کارت فعال : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 0.0),
                                            child: Text(
                                              // '09016064697',
                                               "",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(LineariconsFree.user_1, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "اعتبار حساب : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 0.0),
                                            child: Text(
                                              // '09016064697',
                                              state.user_info.credit_amount.toString() ?? "",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(LineariconsFree.user_1, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "جنسیت : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              // '09016064697',
                                              state.user_info.gender.toString() ?? "",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          // Padding(
                                          //   padding: const EdgeInsets.only(right: 54.0),
                                          //   child: Icon(LineariconsFree.user_1, color: Colors.grey[500]),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 0.0),
                                            child: Text(
                                              "تاریخ آخرین ورود : ",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              // '09016064697',
                                              state.user_info.last_login.toString() ?? "",
                                              style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontSize: 14,
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )
                ),
              ),
            ),
          );
        } else if (state is ProfileDetailLoading) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(child: CustomProgressIndicator())

          );
        } else if (state is ProfileDetailError) {
          return Scaffold(
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
                          BlocProvider.of<ProfileDetailBloc>(context).add(ProfileDetailStarted());
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


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

