import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../../data/notification.dart';
import '../../../../utils/responsiveLayout.dart';
import 'dart:math' as math;


class NotificationDetailScreen extends StatefulWidget {
  final NotificationEntity notification;

  const NotificationDetailScreen({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  State<NotificationDetailScreen> createState() => _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {

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
    var screenHeight = MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).size.height * 0.8;
    var width = MediaQuery.of(context).size.width * 0.8;
    final bool rotated = MediaQuery.of(context).size.height < width;

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        leading: IconButton(
          icon: Icon(LineariconsFree.chevron_right, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:30.0, bottom: 30),
                child: Text(
                  widget.notification.title,
                  style: TextStyle(
                    fontFamily: "Titr",
                    fontSize: h1_text_size
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                widget.notification.message,
                style: TextStyle(
                    fontFamily: "Sahel",
                    fontSize: b_text_size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


