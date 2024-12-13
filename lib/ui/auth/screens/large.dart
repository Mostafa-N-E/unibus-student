import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../data/repo/auth_repository.dart';
import '../../../utils/responsiveLayout.dart';
import '../../root.dart';
import '../../widgets/alert_dialog.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/suport.dart';
import '../bloc/auth_bloc.dart';

class ProfileLargePage extends StatefulWidget {
  const ProfileLargePage({Key? key, }) : super(key: key);

  @override
  State<ProfileLargePage> createState() => _ProfileLargePageState();
}

class _ProfileLargePageState extends State<ProfileLargePage> {
  final TextEditingController usernameController =
  TextEditingController(text: "");
  final TextEditingController passwordController =
  TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    const onBackground = Colors.white;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
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

    double container_margin  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.07,
        mediumScreen_size: width * 0,
        smallScreen_size: width * 0,
        min_size: width * 0,
        max_size: width * 0.07,
        context: context
    ).get_width_size();
    double app_bar_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.1,
        mediumScreen_size: height * 0.09,
        smallScreen_size: height * 0,
        min_size: height * 0,
        max_size: height * 0.09,
        context: context
    ).get_height_size();
    double box_height  = ResponsiveSizeWidget(
        largeScreen_size: height * 0.99,
        mediumScreen_size: height * 1,
        smallScreen_size: height * 0.9,
        min_size: height * 0.9,
        max_size: height * 0.99,
        context: context
    ).get_custom_size();
    double box_width_1  = ResponsiveSizeWidget(
        largeScreen_size: 400,
        mediumScreen_size: 400,
        smallScreen_size: 400,
        min_size: 400,
        max_size: 400,
        context: context
    ).get_custom_size();
    double box_width_2  = ResponsiveSizeWidget(
        largeScreen_size: 400,
        mediumScreen_size: 400,
        smallScreen_size: width * 0.7,
        min_size: width * 0.6,
        max_size: width * 0.53,
        context: context
    ).get_custom_size();
    double image_width  = ResponsiveSizeWidget(
        largeScreen_size: width * 0.5,
        mediumScreen_size: width * 0.65,
        smallScreen_size: width * 0.6,
        min_size: width * 0.6,
        max_size: width * 0.55,
        context: context
    ).get_width_size();

    return GradientContainer(
      child: Scaffold(
          backgroundColor: Colors.cyan.withOpacity(0.001),
          // backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: height * 0.8,
            width: box_width_1,
            // margin: EdgeInsets.only(
            //     bottom: container_margin * 0.80,
            //     top: container_margin * 0.80,
            //     left: container_margin * 5.2,
            //     right: container_margin * 5.2
            // ),
            // padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                // color: Colors.white,
                border: Border.all(
                  color: onBackground,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: BlocProvider<AuthBloc>(
              create: (context) {
                final bloc =
                AuthBloc(authRepository, );
                bloc.stream.forEach((state) {
                  if (state is AuthSuccess) {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Directionality(
                              textDirection: TextDirection.rtl,
                              child: RootScreen()
                          ),
                        )
                    );
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                              state.exception.message,
                              // style: TextStyle(color: onBackground),
                            )
                        )
                    );
                  }
                });
                bloc.add(AuthStarted());
                return bloc;
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) {
                    return current is AuthLoading ||
                        current is AuthInitial ||
                        current is AuthError;
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //   height: width * 0.15,
                        //   width: width * 0.15,
                        //   // margin: const EdgeInsets.only(
                        //   //     left: 225, right: 5, top: 25, bottom: 5),
                        //   padding: const EdgeInsets.all(3.0),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.grey[400] as Color, width: 2),
                        //       borderRadius: BorderRadius.circular(140)
                        //   ),
                        //   child: CircleAvatar(
                        //     // child: Icon(
                        //     // LineariconsFree.user_1,
                        //     // size: 100,
                        //     // color: Colors.black87,
                        //     // ),
                        //     // onBackgroundImageError: (context, _) =>Icon(Icons.person),
                        //     backgroundColor: Colors.white,//Theme.of(context).colorScheme.secondary.withOpacity(0.4),
                        //     backgroundImage: AssetImage('assets/images/register_1.png'),
                        //   ),
                        // ),
                        Image.asset(
                          'assets/images/register_1.png',
                          // color: Colors.white,
                          width: 320,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        // Text(
                        //   state.isLoginMode ? 'خوش آمدید' : 'ثبت نام',
                        //   style:
                        //   const TextStyle(
                        //       color: onBackground, fontSize: 24,
                        //       fontWeight: FontWeight.w900,
                        //       fontFamily: "Sahel"
                        //
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 16,
                        // ),

                        // Text(
                        //   state.isLoginMode
                        //       ? 'لطفا وارد حساب کاربری خود شوید'
                        //       : 'ایمیل و رمز عبور خود را تعیین کنید',
                        //   style:
                        //   const TextStyle(
                        //       color: onBackground, fontSize: 16
                        //   ),
                        // ),

                        // const SizedBox(
                        //   height: 24,
                        // ),
                        TextField(
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          controller: usernameController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.secondary,

                            focusColor: Theme.of(context).colorScheme.secondary,
                            hintText: "",
                            icon: Icon(
                                LineariconsFree.user_1
                            ),
                            hoverColor: Theme.of(context).colorScheme.secondary,
                            iconColor: Theme.of(context).colorScheme.secondary,
                            label: Text(
                              'کد دانشجویی',
                              style: TextStyle(
                                // color: onBackground,
                                  fontFamily: "Sahel"
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        _PasswordTextField(
                          // onBackground: onBackground,
                          controller: passwordController,

                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).colorScheme.secondary//Colors.white
                              )
                          ),
                          onPressed: () async {
                            // await authRepository.login("test@gmail.com", "123456");
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthButtonIsClicked(usernameController.text,
                                    passwordController.text));
                          },
                          child: state is AuthLoading
                              ? const CircularProgressIndicator(color: Colors.white,)
                              : Text(
                            state.isLoginMode ? 'ورود' : 'ثبت نام',
                            style: TextStyle(
                                fontFamily: "Sahel",
                                fontWeight: FontWeight.w900,
                                color: onBackground,
                                fontSize: 20
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Text(
                              //   "در صورتی که استاد هستید، برای تحویل گرفتن صفحه خود با ما تماس بگیرید",
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //       color: Colors.grey.shade600,
                              //       fontSize: b_text_size * 0.6,
                              //       fontFamily: "Sahel"
                              //
                              //   ),
                              // ),

                              TextButton(
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext _context) {
                                      return CustomAlertDialog(
                                          content: Container(
                                            // decoration: BoxDecoration(
                                            //     borderRadius: BorderRadius.circular(30)
                                            // ),
                                            height: height * 0.4,
                                            width: width * 0.45,
                                            // color: data!['status'] as bool ? Colors.green : Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                                              child: ListView(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 10),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                                          child:Padding(
                                                            padding: EdgeInsets.only(
                                                                right: 0),
                                                            child:ListTile(
                                                              // leading: Icon(
                                                              //   LineAwesomeIcons.instagram,
                                                              //   color: Colors.black87,
                                                              //   size: h1_text_size * 1.0,
                                                              // ),
                                                              // trailing: Icon(
                                                              //   LineariconsFree.chevron_left,
                                                              //   color: Colors.black87,
                                                              //   size: h1_text_size * 0.8,
                                                              // ),
                                                              hoverColor: Colors.white,
                                                              title: Text(
                                                                "پشتیبانی",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    fontSize: h1_text_size * 0.76,
                                                                    fontFamily: "Sahel",
                                                                    fontWeight: FontWeight.w800
                                                                ),
                                                              ),
                                                              isThreeLine: true,
                                                              subtitle: Text(
                                                                "راه های  ارتباط با پشتیبانی اپلیکیشن",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    fontSize: b_text_size * 0.66,
                                                                    fontFamily: "Sahel",
                                                                    fontWeight: FontWeight.w600

                                                                ),
                                                              ),
                                                              dense: true,
                                                            ),

                                                          ),

                                                        ),

                                                        Padding(
                                                          padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                                          child:Padding(
                                                            padding: EdgeInsets.only(
                                                                right: 0),
                                                            child:ListTile(
                                                              // leading: Icon(
                                                              //   LineAwesomeIcons.instagram,
                                                              //   color: Colors.black87,
                                                              //   size: h1_text_size * 1.0,
                                                              // ),
                                                              // trailing: Icon(
                                                              //   LineariconsFree.chevron_left,
                                                              //   color: Colors.black87,
                                                              //   size: h1_text_size * 0.8,
                                                              // ),
                                                              hoverColor: Colors.white,
                                                              // title: Text(
                                                              //   "پشتیبانی",
                                                              //   textAlign: TextAlign.center,
                                                              //   style: TextStyle(
                                                              //       fontSize: h1_text_size * 0.76,
                                                              //       fontFamily: "Sahel",
                                                              //       fontWeight: FontWeight.w700
                                                              //   ),
                                                              // ),
                                                              isThreeLine: true,
                                                              subtitle: Text(
                                                                "اگر برای ورود به اپلیکیشن دچار مشکل شده اید می توانید ابتدا به اداره رفاه دانشگاه مراجعه و یا با پشتیبانی اپلیکیشن تماس بگیرید",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    fontSize: b_text_size * 0.6,
                                                                    fontFamily: "Sahel"

                                                                ),
                                                              ),
                                                              dense: true,
                                                            ),

                                                          ),

                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 15),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 0,right: 7, left: 7, bottom: 0),
                                                          child:Padding(
                                                            padding: EdgeInsets.only(
                                                                right: 0),
                                                            child:ListTile(
                                                              leading: Icon(
                                                                LineariconsFree.phone_handset,
                                                                color: Theme.of(context).colorScheme.secondary,
                                                                size: h1_text_size * 0.8,
                                                              ),
                                                              // trailing: Icon(
                                                              //   LineariconsFree.chevron_left,
                                                              //   color: Colors.black87,
                                                              //   size: h1_text_size * 0.8,
                                                              // ),
                                                              hoverColor: Colors.white,
                                                              title: Text(
                                                                "شماره تماس",
                                                                style: TextStyle(
                                                                    fontSize: b_text_size * 0.76,
                                                                    fontFamily: "Sahel",
                                                                    fontWeight: FontWeight.w500
                                                                ),
                                                              ),
                                                              isThreeLine: true,
                                                              subtitle: Text(
                                                                "0937 606 4697",//item.number.toString(),
                                                                style: TextStyle(
                                                                    letterSpacing: 2.5,
                                                                    fontSize: b_text_size * 0.66,
                                                                    fontFamily: "Sahel"

                                                                ),
                                                              ),
                                                              dense: true,
                                                              onTap: () {
                                                                // if(item.number != 0){
                                                                //   launchUrl(
                                                                //       Uri.parse(
                                                                //           item.number.toString()
                                                                //       )
                                                                //   );
                                                                // }
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
                                                              leading: Icon(
                                                                LineariconsFree.envelope,
                                                                color: Theme.of(context).colorScheme.secondary,
                                                                size: h1_text_size * 0.83,
                                                              ),
                                                              // trailing: Icon(
                                                              //   LineariconsFree.chevron_left,
                                                              //   color: Colors.black87,
                                                              //   size: h1_text_size * 0.8,
                                                              // ),
                                                              hoverColor: Colors.white,
                                                              title: Text(
                                                                "ایمیل",
                                                                style: TextStyle(
                                                                    fontSize: b_text_size * 0.76,
                                                                    fontFamily: "Sahel",
                                                                    fontWeight: FontWeight.w500
                                                                ),
                                                              ),
                                                              isThreeLine: true,
                                                              subtitle: Text(
                                                                "mostafa.nazari.est@gmail.com",
                                                                style: TextStyle(
                                                                    fontSize: b_text_size * 0.66,
                                                                    fontFamily: "Sahel"

                                                                ),
                                                              ),
                                                              dense: true,
                                                              onTap: () {
                                                                // if(item.email != ""){
                                                                //   launchUrl(
                                                                //       Uri.parse(
                                                                //           item.email
                                                                //       )
                                                                //   );
                                                                // }
                                                              },
                                                            ),

                                                          ),

                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                      );
                                      // return SuportWidget();
                                    },
                                  );
                                  // showModalBottomSheet(
                                  //   isDismissible: true,
                                  //   backgroundColor: Colors.transparent,
                                  //   context: context,
                                  //   builder: (BuildContext _context) {
                                  //     return SuportWidget();
                                  //   },
                                  // );
                                  // Navigator.popAndPushNamed(context, '/register');
                                },
                                child: Text(
                                  // AppLocalizations.of(context)!.skip,
                                  "تماس با پشتیبانی",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      fontFamily: "Sahel"
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        )



      ),
    );

  }

}


class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    Key? key,
    // required this.onBackground,
    required this.controller,
  }) : super(key: key);

  // final Color onBackground;
  final TextEditingController controller;
  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.secondary,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obsecureText,
      decoration: InputDecoration(
        hintText: "",
        icon: Icon(
            LineariconsFree.lock_1
        ),
        hoverColor: Theme.of(context).colorScheme.secondary,
        iconColor: Theme.of(context).colorScheme.secondary,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obsecureText = !obsecureText;
              });
            },
            icon: Icon(
              obsecureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              // color: widget.onBackground.withOpacity(0.6),
            )),
        label: const Text(
          'رمز عبور',
          style: TextStyle(
              fontFamily: "Sahel"
          ),
        ),
      ),
    );
  }
}
