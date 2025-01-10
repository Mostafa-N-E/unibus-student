import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../ui/auth/screens/large.dart';
import '../../../ui/auth/screens/small.dart';
import '../../theme.dart';
import '../../utils/responsiveLayout.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController usernameController =
      TextEditingController(text: "1111231137");
  final TextEditingController passwordController =
      TextEditingController(text: "Mn@1234567");
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const onBackground = LightThemeColors.secondaryColor;//Colors.white;
    const text_color = LightThemeColors.secondaryTextColor;//Colors.white;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Theme(
        data: AppTheme.lightTheme(
          context: context,
        ).copyWith(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size.fromHeight(56),
                  ),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                  backgroundColor: MaterialStateProperty.all(onBackground),
                  foregroundColor: MaterialStateProperty.all(
                      themeData.colorScheme.secondary)),
            ),
            snackBarTheme: SnackBarThemeData(
                backgroundColor: LightThemeColors.secondaryTextColor,
                contentTextStyle: const TextStyle(fontFamily: 'Sahel', color: LightThemeColors.primaryTextColor)),
            // colorScheme: themeData.colorScheme.copyWith(primary: Theme.of(context).colorScheme.secondary, onSurface: onBackground),
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: const TextStyle(
                  color: text_color,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Sahel"
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                            color: onBackground,
                            width: 1
                        )
                )
            )
        ),
        child: ResponsiveLayout(
            largeScreen: ProfileLargePage(),
            smallScreen: ProfileSmallPage(),
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
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obsecureText,
      decoration: InputDecoration(
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
        label: const Text('رمز عبور'),
      ),
    );
  }
}
