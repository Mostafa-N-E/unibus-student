import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import '../../../data/repo/auth_repository.dart';
import '../../../theme.dart';
import '../../../utils/responsiveLayout.dart';
import '../../root.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/suport.dart';
import '../bloc/auth_bloc.dart';

class ProfileSmallPage extends StatefulWidget {
  const ProfileSmallPage({Key? key, }) : super(key: key);

  @override
  State<ProfileSmallPage> createState() => _ProfileSmallPageState();
}

class _ProfileSmallPageState extends State<ProfileSmallPage> {
  final TextEditingController usernameController =
  TextEditingController(text: "");
  final TextEditingController passwordController =
  TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    const onBackground = LightThemeColors.secondaryColor;//Colors.white;
    const text_color = LightThemeColors.secondaryTextColor;//Colors.white;
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

    return GradientContainer(
      child: Scaffold(
        // backgroundColor: themeData.colorScheme.secondary,
        backgroundColor: Colors.cyan.withOpacity(0.001),
        body: BlocProvider<AuthBloc>(
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
                    SnackBar(content: Text(state.exception.message,
                      // style: TextStyle(color: Colors.white),
                    )));
              }
            });
            bloc.add(AuthStarted());
            return bloc;
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom:28.0),
                      child: Image.asset(
                        'assets/images/register_1.png',
                        // color: Colors.white,
                        width: width * 0.8,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 24,
                    // ),
                    // Text(
                    //   state.isLoginMode ? 'خوش آمدید' : 'ثبت نام',
                    //   style:
                    //   const TextStyle(
                    //       color: onBackground, fontSize: 24,
                    //     fontWeight: FontWeight.w900,
                    //     fontFamily: "Sahel"
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
                    //   const TextStyle(color: onBackground, fontSize: 16),
                    // ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      controller: usernameController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "",
                        icon: Icon(
                            LineariconsFree.user_1
                        ),
                        hoverColor: onBackground,// Theme.of(context).colorScheme.secondary,
                        iconColor: onBackground,// Theme.of(context).colorScheme.secondary,
                        label: Text(
                            'کد دانشجویی',
                          style: TextStyle(
                            fontFamily: "Sahel"
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _PasswordTextField(
                      onBackground: onBackground,
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
                          color: Colors.white,
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
                              showModalBottomSheet(
                                isDismissible: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext _context) {
                                  return SuportWidget();
                                },
                              );
                              // Navigator.popAndPushNamed(context, '/register');
                            },
                            child: Text(
                              // AppLocalizations.of(context)!.skip,
                              "تماس با پشتیبانی",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: b_text_size * 0.65,
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
    );
  }

}


class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({
    Key? key,
    required this.onBackground,
    required this.controller,
  }) : super(key: key);

  final Color onBackground;
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
              color: widget.onBackground.withOpacity(0.6),
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