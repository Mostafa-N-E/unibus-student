import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../../../data/notification.dart';
import '../../../../../utils/responsiveLayout.dart';
import '../../NotificationDetail/notification_detail.dart';

class NotificationList extends StatelessWidget{
  final List<NotificationEntity> notifications;
  const NotificationList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: ListView.builder(
        padding: EdgeInsets.only(
            bottom: ResponsiveSizeWidget(
                largeScreen_size: height * 0.2,
                mediumScreen_size: height * 0.27,
                smallScreen_size: height * 0.25,
                min_size: height * 0.2,
                max_size: height * 0.2,
                context: context
            ).get_height_size()
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notifications!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Builder(builder: (context) {
              return StatefulBuilder(builder: (context, setState) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      LineariconsFree.bullhorn,
                      color: Colors.black87,
                    ),
                    // backgroundImage: NetworkImage(
                    //     getPictureOfUser(comments[index].userId),
                    //     headers: tokenWithHeader),
                  ),
                  title: SizedBox(
                    width: 300,
                    child: Text(
                      "${notifications[index].title}",
                      style: TextStyle(
                          fontFamily: "Sahel",
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notifications[index].publish.toPersianDate(),
                        style: TextStyle(
                            fontFamily: "Sahel",
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  onTap: (){

                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => new NotificationDetailScreen(notification: notifications[index]),
                        )
                    );
                  },
                );
              });
            }),
          );
        },
      ),
    );
  }
}