import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rajaee_web_app/theme.dart';
import 'package:rajaee_web_app/ui/auth/auth.dart';
import 'package:rajaee_web_app/ui/root.dart';

import 'config.dart';
import 'data/repo/auth_repository.dart';

import 'package:hive/hive.dart';


Future<void> openHiveBox(String boxName, {bool limit = false}) async {
  final box = await Hive.openBox(boxName).onError((error, stackTrace) async {
    // final Directory dir = await getApplicationDocumentsDirectory();
    // final String dirPath = dir.path;
    // File dbFile = File('$dirPath/$boxName.hive');
    // File lockFile = File('$dirPath/$boxName.lock');
    // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    //   dbFile = File('$dirPath/RajaeeBusService/$boxName.hive');
    //   lockFile = File('$dirPath/RajaeeBusService/$boxName.lock');
    // }
    // await dbFile.delete();
    // await lockFile.delete();
    await Hive.openBox(boxName);
    throw 'Failed to open $boxName Box\nError: $error';
  });
  // clear box if it grows large
  if (limit && box.length > 500) {
    box.clear();
  }
}

Future<void> startService() async {
  GetIt.I.registerSingleton<MyTheme>(MyTheme());
}

Future<void> main() async {

  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   // await Hive.initFlutter('BlackHole');
  //   await Hive.initFlutter('RajaeeBusService');
  // } else {
  //   await Hive.initFlutter();
  // }
  await Hive.initFlutter();
  await openHiveBox('settings');
  // await openHiveBox('downloads');
  // await openHiveBox('Favorite Songs');
  await openHiveBox('cache', limit: true);

  WidgetsFlutterBinding.ensureInitialized();
  authRepository.loadAuthInfo();
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(seconds: 1));//days
  await startService();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget initialFuntion() {
    // return Hive.box('settings').get('TOKEN') != null
    return AuthRepository.authChangeNotifier.value != null
    // ? HomePage(pageController: _pageController,)
        ? RootScreen()
        : AuthScreen();
    // return HomePage();
  }

  @override
  void initState() {
    super.initState();
    AppTheme.currentTheme.addListener(() {
      setState(() {});
    });

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // productRepository.getAll(ProductSort.latest).then((value) {
    //   debugPrint(value.toString());
    // }).catchError((e) {
    //   debugPrint(e.toString());
    // });
    //
    // bannerRepository.getAll().then((value) {
    //   debugPrint(value.toString());
    // }).catchError((e) {
    //   debugPrint(e.toString());
    // });
    // mealFoodRepository.meal_foods(MealFood_APIbody.none).then((value) {
    //   debugPrint(value.toString());
    // }).catchError((e) {
    //   debugPrint(e.toString());
    //   debugPrint("______________");
    // });

    const defaultTextStyle = TextStyle(
        fontFamily: 'Sahel', color: LightThemeColors.primaryTextColor, fontWeight:FontWeight.w700);
    bool isDarkMode = AppTheme.themeMode == ThemeMode.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uni Student',
      themeMode: AppTheme.themeMode,
      theme: isDarkMode ? AppTheme.darkTheme(
        context: context,
      ):AppTheme.lightTheme(
        context: context,
      ),
      darkTheme: AppTheme.darkTheme(
        context: context,
      ),

      // theme: ThemeData(fontFamily: "Sahel",primaryColor: LightThemeColors.secondaryColor,
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   textTheme: TextTheme(
      //     // 2021
      //     // headlineSmall: TextStyle(fontSize: 16.0, fontFamily: "Titr", color: Colors.black87),
      //     // labelMedium: TextStyle(fontSize: 16.0, fontFamily: "Titr", color: Colors.black87),
      //     // labelSmall: TextStyle(fontSize: 16.0, fontFamily: "Titr", color: Colors.black87),
      //     // labelLarge: TextStyle(fontSize: 16.0, fontFamily: "Titr", color: Colors.black87),
      //
      //     // 2018
      //     //   headline1: TextStyle(fontSize: 45.0, fontFamily: "Titr", color: Colors.black87),
      //     //   headline2: TextStyle(fontSize: 40.0, fontFamily: "Titr", color: Colors.black87),
      //     //   headline3: TextStyle(fontSize: 35.0, fontFamily: "Titr", color: Colors.black87),
      //     //   headline4: TextStyle(fontSize: 30.0, fontFamily: "Titr", color: Colors.black87),
      //     //   headline5: TextStyle(fontSize: 26.0, fontFamily: "Titr", color: Colors.black87),
      //     //   // headline6: TextStyle(fontSize: 16.0, fontFamily: "Titr", color: Colors.black87),
      //     //
      //     //   bodyText1: TextStyle(fontSize: 23.0, fontFamily: "Titr", color: Colors.black87.withOpacity(.4)),
      //     //   bodyText2: TextStyle(fontSize: 20.0, fontFamily: "Titr", color: Colors.black87),
      //     //   subtitle2: TextStyle(fontSize: 20.0, fontFamily: "Titr", color: Colors.black87),
      //       // subtitle1: TextStyle(fontSize: 16.0, fontFamily: "Titr", color: Colors.black87),
      //       button: TextStyle(fontSize: 16.0, fontFamily: "Sahel", fontWeight: FontWeight.w600),
      //       caption: TextStyle(fontSize: 18.0, fontFamily: "Titr", color: Colors.grey.shade600)
      //
      //   ),
      //
      //   // colorScheme: const ColorScheme.light(
      //   //   primary: LightThemeColors.secondaryColor,
      //   //   secondary: LightThemeColors.secondaryColor,
      //   //   onSecondary: Colors.white,
      //   // ),
      //
      //   colorScheme: const ColorScheme.dark(
      //     primary: Color(0xff0a0d22),
      //     secondary: Color(0xFFEB1555),
      //     //   const kAcyiveCardColor = Color(0xFF1D1E33);
      //     // const kInacyiveCardColor = Color(0xFF111328);
      //
      //   ),
      //
      //   scaffoldBackgroundColor: Color(0xff0a0d22),
      //   bottomAppBarColor: Color(0xff0a0d22),
      //
      //   appBarTheme:AppBarTheme(
      //     backgroundColor: Color(0xff0a0d22),
      //   ),
      //
      // ),



      home: Directionality(
          textDirection: TextDirection.rtl,
          child: initialFuntion()
        // child: SplashScreen(),
      ),
    );
  }
}
