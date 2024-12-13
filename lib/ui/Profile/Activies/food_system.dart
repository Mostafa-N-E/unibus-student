//LazyLoadScrollView(
//                                       // scrollOffset: 100,isLoading: fetched,
//                                       onEndOfPage: () {
//                                         print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
//                                         print(food_activity__perPage);
//                                         print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
//
//                                         BlocProvider.of<ProfileBloc>(context).add(
//                                           UpdateProfileFoodActivity(
//                                             perPage: food_activity__perPage,
//                                             user_info: state.user_info,
//                                             user_food_system_activities: state.user_food_system_activities,
//                                             user_bus_system_activities: state.user_bus_system_activities,
//                                             user_financial_activities: state.user_financial_activities,
//                                             user_dormitory_system_activities: state.user_dormitory_system_activities,
//                                             user_system_activities: state.user_system_activities,
//                                           )
//                                         );
//                                         // setState(() {
//                                           food_activity__perPage = food_activity__perPage +1;
//                                         // });
//                                       },
//                                       child:
//                                       ListView.builder(reverse: true,
//                                         shrinkWrap: true,
//                                         itemCount: state.user_food_system_activities.length,
//                                         itemBuilder: (BuildContext context, int index) {
//                                           return ListTile(
//                                             leading: CircleAvatar(
//                                               backgroundColor: Colors.grey.shade200,
//                                               child: Icon(
//                                                 LineariconsFree.cart,
//                                                 color: Colors.black87,
//                                               ),
//                                               // backgroundImage: NetworkImage(
//                                               //     getPictureOfUser(comments[index].userId),
//                                               //     headers: tokenWithHeader),
//                                             ),
//                                             title: SizedBox(
//                                               width: 300,
//                                               child: Text(
//                                                 "${state.user_food_system_activities[index].activity_type}",
//                                                 style: TextStyle(
//                                                     fontFamily: "Sahel",
//                                                     fontWeight: FontWeight.w600
//                                                 ),
//                                               ),
//                                             ),
//                                             subtitle: Column(
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   "${
//                                                       Jalali(
//                                                           int.parse(state.user_food_system_activities[index].date.split("-")[0]),
//                                                           int.parse(state.user_food_system_activities[index].date.split("-")[1]),
//                                                           int.parse(state.user_food_system_activities[index].date.split("-")[2])
//                                                       )
//                                                           .formatFullDate().toPersianDigit()
//                                                   } - ${state.user_food_system_activities[index].time.substring(0, 8).toPersianDigit()}",
//                                                   style: TextStyle(
//                                                       fontFamily: "Sahel",
//                                                       fontWeight: FontWeight.w500
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             trailing: CircleAvatar(
//                                               backgroundColor: Colors.grey.shade200,
//                                               // child:
//                                               // Icon(
//                                               //   LineariconsFree.dinner,
//                                               //   color: Colors.black87,
//                                               // ),
//                                               // backgroundImage: NetworkImage(
//                                               //     getPictureOfUser(comments[index].userId),
//                                               //     headers: tokenWithHeader),
//                                             ),
//                                           );
//                                           // return FoodActivityList(activities: state.user_food_system_activities,);
//                                         },
//                                       ),
//                                     ),