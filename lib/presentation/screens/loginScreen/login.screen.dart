import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/app/routes/app.routes.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/utils/obscure.text.util.dart';
import 'package:metroom/presentation/widgets/custom.button.dart';
import 'package:metroom/presentation/widgets/custom.snackbar.dart';
import 'package:metroom/presentation/widgets/custom.styles.dart';
import 'package:metroom/presentation/widgets/custom.text.field.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      appBar: AppBar(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            color: themeFlag ? AppColors.creamColor : AppColors.mirage,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back.",
                            style: TextStyle(
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You've been missed!",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField.customTextField(
                                  hintText: 'Email',
                                  inputType: TextInputType.text,
                                  textEditingController: userEmailController,
                                  validator: (val) =>
                                      !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                              .hasMatch(val!)
                                          ? 'Enter an email'
                                          : null,
                                  themeFlag: themeFlag,
                                ),
                                CustomTextField.customPasswordField(
                                  themeFlag: themeFlag,
                                  context: context,
                                  validator: (val) =>
                                      val!.isEmpty ? 'Enter a password' : null,
                                  onTap: () {
                                    Provider.of<ObscureTextUtil>(context,
                                            listen: false)
                                        .toggleObs();
                                  },
                                  textEditingController: userPassController,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't have an account? ",
                          style: kBodyText.copyWith(
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRouter.signupRoute);
                          },
                          child: Text(
                            'Register',
                            style: kBodyText.copyWith(
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton.customBtnLogin(
                      buttonName: 'Sign In',
                      onTap: () {
                        login(context: context);
                      },
                      bgColor:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      textColor:
                          themeFlag ? AppColors.mirage : AppColors.creamColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  login({required BuildContext context}) async {
    if (_formKey.currentState!.validate()) {
      bool isValid =
          await Provider.of<AuthenticationNotifer>(context, listen: false)
              .login(
        email: userEmailController.text,
        password: userPassController.text,
      );
      if (isValid) {
        Navigator.of(context)
            .pushReplacementNamed(AppRouter.navRoute);
            
          SnackUtil.showSnackBar(
            context: context,
            text: "Login Successfull",
            textColor: AppColors.creamColor,
            backgroundColor: Colors.green,
          );
        
      } else {
        var errorType =
            Provider.of<AuthenticationNotifer>(context, listen: false).error;
        SnackUtil.showSnackBar(
          context: context,
          text: errorType!,
          textColor: AppColors.creamColor,
          backgroundColor: Colors.red.shade200,
        );
      }
    }
  }
}
