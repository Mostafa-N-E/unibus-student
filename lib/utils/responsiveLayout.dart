import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  Widget? mediumScreen;
  Widget? smallScreen;

  ResponsiveLayout(
      {
        Key? key,
        required this.largeScreen,
      this.mediumScreen ,
      this.smallScreen,
      }
      ) : super(key: key);
  static double MobileSmallScreen = 320.0;
  static double MobileMediumScreen = 375.0;
  static double MobileLargeScreen = 425;
  static double TabletScreen = 768;
  static double LaptopScreen = 1024;
  static double LaptopLargeScreen = 1440;
  static double FourKScreen = 2560;


  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 500 &&
        MediaQuery.of(context).size.width > 300;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 500 &&
        MediaQuery.of(context).size.width < 1000;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000;
  }

  static bool isMobileSmall(BuildContext context) {
    return MediaQuery.of(context).size.width < 321;
  }

  static bool isMobileMedium(BuildContext context) {
    return MediaQuery.of(context).size.width > 320 &&
        MediaQuery.of(context).size.width < 376;
  }

  static bool isMobileLarge(BuildContext context) {
    return MediaQuery.of(context).size.width > 375 &&
        MediaQuery.of(context).size.width < 426;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 425 &&
        MediaQuery.of(context).size.width < 769;
  }

  static bool isLaptop(BuildContext context) {
    return MediaQuery.of(context).size.width > 768 &&
        MediaQuery.of(context).size.width < 1025;
  }

  static bool isLaptopLarge(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024 &&
        MediaQuery.of(context).size.width < 1440;
  }

  static bool is4K(BuildContext context) {
    return MediaQuery.of(context).size.width > 1439 &&
        MediaQuery.of(context).size.width < 2561;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints)
      {
        double screen_width = MediaQuery.of(context).size.width;
        if (screen_width > 2560) {
          return largeScreen;

        } else if (ResponsiveLayout.is4K(context) || ResponsiveLayout.isLaptopLarge(context) || ResponsiveLayout.isLaptop(context)) {
          return largeScreen;

        } else if (ResponsiveLayout.isTablet(context)) {
          return mediumScreen ?? largeScreen;

        } else if (ResponsiveLayout.isMobileLarge(context) || ResponsiveLayout.isMobileMedium(context) || ResponsiveLayout.isMobileSmall(context)) {
          return smallScreen ?? largeScreen;

        } else {
          return smallScreen ?? largeScreen;
        }
      }
      // {
      //   if (constraints.maxWidth > 1000) {
      //     return largeScreen;
      //   } else if (constraints.maxWidth < 1000 && constraints.maxWidth > 800) {
      //     return mediumScreen ?? largeScreen;
      //   } else {
      //     return smallScreen ?? largeScreen;
      //   }
      // },
    );
  }
}



class ResponsiveSizeWidget{
  final double largeScreen_size;
  final double mediumScreen_size;
  final double smallScreen_size;
  final double min_size;
  final double max_size;
  final BuildContext context;


  ResponsiveSizeWidget({
    required this.largeScreen_size,
    required this.mediumScreen_size,
    required this.smallScreen_size,
    required this.min_size,
    required this.max_size,
    required this.context,
  });

  double get_mobile_low_cat_width(screen_width){
    return screen_width-(screen_width % 20);
  }
  double get_tablet_low_cat_width(screen_width){
    return screen_width-(screen_width % 20);
  }
  double get_laptop_low_cat_width(screen_width){
    return screen_width-(screen_width % 20);
  }
  double get_4k_low_cat_width(screen_width){
    return screen_width-(screen_width % 100);
  }

  bool is_border_width(double high_border, double screen_width, double low_border){
    return (low_border < screen_width) && (screen_width < high_border);
  }

  double get_width_size(){
    double screen_width = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).size.width > 2560) {
      return this.max_size / screen_width * 2560;

    } else if (ResponsiveLayout.is4K(this.context)) {
      return (get_4k_low_cat_width(screen_width)) * this.max_size * 1 / screen_width;

    } else if (ResponsiveLayout.isLaptopLarge(this.context)) {
      if(is_border_width(1024, screen_width, 1150)){
        return (get_tablet_low_cat_width(screen_width)) * ( this.largeScreen_size * 1.04 ) / screen_width;
      }else{
        return (get_laptop_low_cat_width(screen_width)) * this.largeScreen_size * 1.1 / screen_width;
      }

    } else if (ResponsiveLayout.isLaptop(this.context)) {
      if(is_border_width(767, screen_width, 820)){
        return (get_tablet_low_cat_width(screen_width)) * ((this.largeScreen_size * 0.7) ) / screen_width;
      }else{
        return (get_laptop_low_cat_width(screen_width)) * this.largeScreen_size * 0.8 / screen_width;
      }

    } else if (ResponsiveLayout.isTablet(this.context)) {
      if(is_border_width(475, screen_width, 530)){
        return (get_tablet_low_cat_width(screen_width)) * ( this.mediumScreen_size * 0.87 ) / screen_width;
      }else{
        return (get_tablet_low_cat_width(screen_width)) * this.mediumScreen_size * 1 / screen_width;
      }

    }  else if (ResponsiveLayout.isMobileLarge(this.context)) {
      if(is_border_width(375, screen_width, 450)){
        return (get_tablet_low_cat_width(screen_width)) * ( this.smallScreen_size * 1.14 ) / screen_width;
      }else {
        return (get_mobile_low_cat_width(screen_width)) * this.smallScreen_size * 1.155 / screen_width;
      }
    } else if (ResponsiveLayout.isMobileMedium(this.context)) {
      if(is_border_width(320, screen_width, 340)){
        return (get_tablet_low_cat_width(screen_width)) * ( (this.smallScreen_size * 1.1) ) / screen_width;
      }else {
        return (get_mobile_low_cat_width(screen_width)) * this.smallScreen_size * 1.15 / screen_width;
      }

    } else if (ResponsiveLayout.isMobileSmall(this.context)) {
      return (get_mobile_low_cat_width(screen_width)) * this.smallScreen_size * 1 / screen_width;

    }
    else {
      return this.min_size * screen_width;
    }
  }

  double get_height_size(){
    double screen_height = MediaQuery.of(context).size.height;
    final responsiveLayout = ResponsiveLayout.is4K(this.context);

    if (MediaQuery.of(context).size.width > 2560) {
      return this.max_size / screen_height * 2560;

    } else if (ResponsiveLayout.is4K(this.context)) {
      return (get_4k_low_cat_width(screen_height)) * this.max_size * 1 / screen_height;

    } else if (ResponsiveLayout.isLaptopLarge(this.context)) {
      if(is_border_width(1024, screen_height, 1150)){
        return (get_tablet_low_cat_width(screen_height)) * ( this.largeScreen_size * 1.04 ) / screen_height;
      }else{
        return (get_laptop_low_cat_width(screen_height)) * this.largeScreen_size * 1.1 / screen_height;
      }

    } else if (ResponsiveLayout.isLaptop(this.context)) {
      if(is_border_width(767, screen_height, 820)){
        return (get_tablet_low_cat_width(screen_height)) * ((this.largeScreen_size * 0.87) ) / screen_height;
      }else{
        return (get_laptop_low_cat_width(screen_height)) * this.largeScreen_size * 1 / screen_height;
      }

    } else if (ResponsiveLayout.isTablet(this.context)) {
      if(is_border_width(475, screen_height, 530)){
        return (get_tablet_low_cat_width(screen_height)) * ( this.mediumScreen_size * 0.85 ) / screen_height;
      }else{
        return (get_tablet_low_cat_width(screen_height)) * this.mediumScreen_size * 1 / screen_height;
      }

    }  else if (ResponsiveLayout.isMobileLarge(this.context)) {
      if(is_border_width(375, screen_height, 450)){
        return (get_tablet_low_cat_width(screen_height)) * ( this.mediumScreen_size * 0.7 ) / screen_height;
      }else {
        return (get_mobile_low_cat_width(screen_height)) * this.mediumScreen_size * 0.86 / screen_height;
      }
    } else if (ResponsiveLayout.isMobileMedium(this.context)) {
      if(is_border_width(320, screen_height, 340)){
        return (get_tablet_low_cat_width(screen_height)) * ( (this.smallScreen_size * 0.6) + (this.largeScreen_size * 0.4) ) / screen_height;
      }else {
        return (get_mobile_low_cat_width(screen_height)) * this.smallScreen_size / screen_height;
      }

    } else if (ResponsiveLayout.isMobileSmall(this.context)) {
      return (get_mobile_low_cat_width(screen_height)) * this.smallScreen_size * 1 / screen_height;

    } else {
      return this.min_size * screen_height;
    }
  }

  // double get_viewportFraction(){
  //   double screen_width = MediaQuery.of(context).size.width;
  //   if (MediaQuery.of(context).size.width > 2560) {
  //     return this.max_size / screen_width * 2560;
  //
  //   } else if (ResponsiveLayout.is4K(this.context)) {
  //     return  this.max_size ;
  //
  //   } else if (ResponsiveLayout.isLaptopLarge(this.context)) {
  //     return this.largeScreen_size * 0.93;
  //
  //   } else if (ResponsiveLayout.isLaptop(this.context)) {
  //     return this.largeScreen_size * 0.87;
  //
  //   } else if (ResponsiveLayout.isTablet(this.context)) {
  //     return this.mediumScreen_size * 1;
  //
  //   }  else if (ResponsiveLayout.isMobileLarge(this.context)) {
  //     return this.mediumScreen_size * 0.8;
  //
  //   } else if (ResponsiveLayout.isMobileMedium(this.context)) {
  //     return this.smallScreen_size;
  //
  //   } else if (ResponsiveLayout.isMobileSmall(this.context)) {
  //     return this.smallScreen_size * 0.9;
  //
  //   } else {
  //     return this.min_size;
  //   }
  // }

  double get_custom_size(){
    double screen_width = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).size.width > 2560) {
      return this.max_size / screen_width * 2560;

    } else if (ResponsiveLayout.is4K(this.context)) {
      return  this.max_size ;

    } else if (ResponsiveLayout.isLaptopLarge(this.context)) {
      return this.largeScreen_size * 0.93;

    } else if (ResponsiveLayout.isLaptop(this.context)) {
      return this.largeScreen_size * 0.87;

    } else if (ResponsiveLayout.isTablet(this.context)) {
      return this.mediumScreen_size * 1;

    }  else if (ResponsiveLayout.isMobileLarge(this.context)) {
      return this.mediumScreen_size * 0.8;

    } else if (ResponsiveLayout.isMobileMedium(this.context)) {
      return this.smallScreen_size;

    } else if (ResponsiveLayout.isMobileSmall(this.context)) {
      return this.smallScreen_size * 0.9;

    } else {
      return this.min_size;
    }
  }
}

