import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/core/models/booking.model.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/booking.notifer.dart';
import 'package:metroom/core/notifiers/payment.notifer.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/presentation/widgets/custom.button.dart';
import 'package:metroom/presentation/widgets/custom.snackbar.dart';
import 'package:provider/provider.dart';

class BookingScreen extends StatelessWidget {
  final BookingScreenArgs bookingScreenArgs;

  const BookingScreen({Key? key, required this.bookingScreenArgs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    var themeFlag = _themeNotifier.darkTheme;
    var userData = Provider.of<AuthenticationNotifer>(context, listen: true);
    var bookNotifier = Provider.of<BookingNotifier>(context, listen: true);

    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      appBar: AppBar(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        title: Text(
          'Booking Room',
          style: TextStyle(
            color: themeFlag ? AppColors.creamColor : AppColors.mirage,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Details',
                style: TextStyle(
                  color: AppColors.yellowish,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage),
              Text(
                'User Name : ${userData.userName!}',
                style: TextStyle(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'User Email : ${userData.userEmail}',
                style: TextStyle(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'User Phone : ${userData.userPhoneNo}',
                style: TextStyle(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Room Details',
                style: TextStyle(
                  color: AppColors.yellowish,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage),
              Text(
                'Room Name : ${bookingScreenArgs.roomData.roomName}',
                style: TextStyle(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Room Address : ${bookingScreenArgs.roomData.roomAddress}',
                style: TextStyle(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Room Type : ${bookingScreenArgs.roomData.roomType}',
                style: TextStyle(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Room Price : ${bookingScreenArgs.roomData.roomPrice}',
                style: TextStyle(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Divider(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Confirm Booking Dates',
                style: TextStyle(
                  color: AppColors.yellowish,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start Date : ${bookNotifier.startDate ?? ''}',
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  IconButton(
                    splashColor:
                        themeFlag ? AppColors.creamColor : AppColors.mirage,
                    icon: Icon(
                      Icons.edit_calendar,
                      size: 20,
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                    onPressed: () {
                      StartDatePicker(
                        themeFlag: themeFlag,
                        context: context,
                        bookingNotifier: bookNotifier,
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'End Date : ${bookNotifier.endDate ?? ''} ',
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  IconButton(
                    onPressed: () {
                      EndDatePicker(
                        themeFlag: themeFlag,
                        context: context,
                        bookingNotifier: bookNotifier,
                      );
                    },
                    splashColor:
                        themeFlag ? AppColors.creamColor : AppColors.mirage,
                    icon: Icon(
                      Icons.edit_calendar,
                      size: 20,
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton.customBtnLogin(
                buttonName: 'Book Room',
                onTap: () async {
                  if (bookNotifier.startDate != null &&
                      bookNotifier.endDate != null) {
                    var PayStatus = await Provider.of<PaymentNotifier>(
                      context,
                      listen: false,
                    );
                    await PayStatus.checkMeOut(
                      context: context,
                      amt: bookingScreenArgs.roomData.roomPrice.toInt(),
                    ).whenComplete(
                      () async {
                        if (PayStatus.paymentStatus!) {
                          BookingModel bookingModel = BookingModel(
                            bookingRazorid: 'PayStatus.payResponse!',
                            bookingPrice: bookingScreenArgs.roomData.roomPrice,
                            bookingStartDate: bookNotifier.startDate!,
                            bookingEndDate: bookNotifier.endDate!,
                          );

                          var isSuccessFul = await Provider.of<BookingNotifier>(
                                  context,
                                  listen: false)
                              .confirmBooking(
                            bookingModel: bookingModel,
                            userId: userData.userId!,
                            roomId: bookingScreenArgs.roomData.roomId,
                          );

                          if (isSuccessFul) {
                            SnackUtil.showSnackBar(
                              context: context,
                              text: 'Sucessfully Booked',
                              textColor: AppColors.creamColor,
                              backgroundColor: Colors.red.shade200,
                            );
                            Navigator.pop(context);
                          } else {
                            SnackUtil.showSnackBar(
                              context: context,
                              text: 'Some Error Occurred',
                              textColor: AppColors.creamColor,
                              backgroundColor: Colors.red.shade200,
                            );
                            Navigator.pop(context);
                          }
                        }
                      },
                    );
                  } else {
                    SnackUtil.showSnackBar(
                      context: context,
                      text: 'Please Select Dates',
                      textColor: AppColors.creamColor,
                      backgroundColor: Colors.red.shade200,
                    );
                  }
                },
                bgColor: themeFlag ? AppColors.creamColor : AppColors.mirage,
                textColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingScreenArgs {
  final RoomModel roomData;
  final dynamic user_id;

  BookingScreenArgs({
    required this.user_id,
    required this.roomData,
  });
}

Future StartDatePicker({
  required bool themeFlag,
  required BuildContext context,
  required BookingNotifier bookingNotifier,
}) {
  final date = DateTime.now();
  return showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        backgroundColor: themeFlag ? AppColors.creamColor : AppColors.mirage,
        content: Container(
          height: 200,
          width: 350.0,
          child: CupertinoDatePicker(
            minimumDate: DateTime.now(),
            maximumDate: DateTime(date.year, date.month + 1, date.day),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              String createdAt = DateFormat("dd-MMMM-yyyy").format(value);
              bookingNotifier.startDateSet(createdAt: createdAt);
            },
            initialDateTime: DateTime.now(),
          ),
        ),
      );
    },
  );
}

Future EndDatePicker({
  required bool themeFlag,
  required BuildContext context,
  required BookingNotifier bookingNotifier,
}) {
  final date = DateTime.now();

  return showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        backgroundColor: themeFlag ? AppColors.creamColor : AppColors.mirage,
        content: Container(
          height: 200,
          width: 350.0,
          child: CupertinoDatePicker(
            // minimumDate: DateTime(date.year, date.month, date.day + 1),
            maximumDate: DateTime(date.year, date.month + 1, date.day),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              String createdAt = DateFormat("dd-MMMM-yyyy").format(value);
              bookingNotifier.endDateSet(createdAt: createdAt);
            },
            initialDateTime: DateTime(date.year, date.month, date.day + 1),
          ),
        ),
      );
    },
  );
}
