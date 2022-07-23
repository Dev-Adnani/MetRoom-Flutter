import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.credentials.dart';
import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentNotifier extends ChangeNotifier {
  Razorpay razorpay = Razorpay();

  String? payResponse;
  bool? paymentStatus;

  initializeRazorPay({required BuildContext context}) {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<bool> checkMeOut(
      {required BuildContext context, required int amt}) async {
    AuthenticationNotifer authenticationNotifer =
        Provider.of<AuthenticationNotifer>(context, listen: false);

    initializeRazorPay(context: context);
    var options = {
      'key': AppCredentials.razorKey,
      'amount': amt,
      'name': authenticationNotifer.userName,
      'description': 'Payment',
      'prefill': {
        'contact': authenticationNotifer.userPhoneNo,
        'email': authenticationNotifer.userEmail,
      },
      'external': {
        'wallet': ['paytm', 'freecharge', 'amazonpay', 'mobikwik']
      }
    };
    try {
      razorpay.open(options);
      return paymentStatus!;
    } catch (e) {
      payResponse = e.toString();
      return false;
    }
  }

  disposeRazorPay() {
    razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    payResponse = response.paymentId;
    paymentStatus = true;
    notifyListeners();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    payResponse = response.message;
    paymentStatus = false;
    notifyListeners();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    payResponse = response.walletName;
    paymentStatus = true;
    notifyListeners();
  }
}
