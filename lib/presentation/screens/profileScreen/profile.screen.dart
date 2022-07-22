import 'dart:io';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/core/service/photo.service.dart';
import 'package:metroom/presentation/widgets/custom.button.dart';
import 'package:metroom/presentation/widgets/custom.snackbar.dart';
import 'package:metroom/presentation/widgets/custom.text.field.dart';
import 'package:metroom/presentation/widgets/loading.dialog.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileTaskArgs? profileTaskArgs;

  ProfileScreen({Key? key, required this.profileTaskArgs}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPhoneNController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();

  @override
  void initState() {
    userNameController.text = widget.profileTaskArgs!.user_name;
    userPhoneNController.text = widget.profileTaskArgs!.user_phoneNo;
    userEmailController.text = widget.profileTaskArgs!.user_email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    PhotoService _photoService =
        Provider.of<PhotoService>(context, listen: true);
    AuthenticationNotifer _auth =
        Provider.of<AuthenticationNotifer>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;
    double _height = MediaQuery.of(context).size.height / 815;

    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Profile",
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        child: _photoService.image == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.network(
                                  widget.profileTaskArgs!.user_image!,
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.file(
                                  File(
                                    _photoService.image!.path,
                                  ),
                                ),
                              ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: 18,
                            ),
                            onPressed: () {
                              _photoService.selectFile();
                            },
                          ),
                        ),
                        top: 115,
                        left: 110,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    CustomTextField.customTextField(
                        themeFlag: themeFlag,
                        hintText: 'Username',
                        inputType: TextInputType.text,
                        validator: (val) =>
                            val!.isEmpty ? 'Enter a username' : null,
                        textEditingController: userNameController),
                    CustomTextField.customTextField(
                      themeFlag: themeFlag,
                      hintText: 'Email',
                      inputType: TextInputType.text,
                      textEditingController: userEmailController,
                      enabled: false,
                    ),
                    CustomTextField.customTextField(
                      themeFlag: themeFlag,
                      hintText: 'Enter Mobile No',
                      inputType: TextInputType.number,
                      maxLength: 10,
                      textEditingController: userPhoneNController,
                      validator: (val) => val!.isEmpty || val.length < 10
                          ? 'Enter a Mobile'
                          : null,
                    ),
                    SizedBox(
                      height: _height * 165,
                    ),
                    CustomButton.customBtnLogin(
                      buttonName: 'Update Profile',
                      onTap: () async {
                        LoadingDialog.showLoaderDialog(
                            context: context, themeFlag: themeFlag);
                        if (_photoService.image != null) {
                          await _photoService.upload(context: context).then(
                            (value) async {
                              if (value) {
                                bool isDone = await _auth.updateUserData(
                                  useremail: userEmailController.text,
                                  username: userNameController.text,
                                  userMobileNo: userPhoneNController.text,
                                  userPhoto: _photoService.photo_url!,
                                );
                                if (isDone) {
                                  SnackUtil.showSnackBar(
                                    context: context,
                                    text: 'Success',
                                    textColor: AppColors.creamColor,
                                    backgroundColor: Colors.green,
                                  );
                                } else {
                                  SnackUtil.showSnackBar(
                                    context: context,
                                    text: _auth.error!,
                                    textColor: AppColors.creamColor,
                                    backgroundColor: Colors.red.shade200,
                                  );
                                }
                              } else {
                                SnackUtil.showSnackBar(
                                  context: context,
                                  text: _photoService.errorUpload!,
                                  textColor: AppColors.creamColor,
                                  backgroundColor: Colors.red.shade200,
                                );
                              }
                            },
                          );
                        } else {
                          if (_photoService.photo_url == null) {
                            bool isDone = await _auth.updateUserData(
                              useremail: userEmailController.text,
                              username: userNameController.text,
                              userMobileNo: userPhoneNController.text,
                              userPhoto: widget.profileTaskArgs!.user_image!,
                            );

                            if (isDone) {
                              SnackUtil.showSnackBar(
                                context: context,
                                text: 'Success',
                                textColor: AppColors.creamColor,
                                backgroundColor: Colors.green,
                              );
                            } else {
                              SnackUtil.showSnackBar(
                                context: context,
                                text: _auth.error!,
                                textColor: AppColors.creamColor,
                                backgroundColor: Colors.red.shade200,
                              );
                            }
                          }
                        }
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      bgColor:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      textColor:
                          themeFlag ? AppColors.mirage : AppColors.creamColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileTaskArgs {
  final String user_name;
  final String user_email;
  final String user_phoneNo;
  String? user_image;

  ProfileTaskArgs({
    required this.user_name,
    required this.user_email,
    required this.user_phoneNo,
    this.user_image,
  });
}
