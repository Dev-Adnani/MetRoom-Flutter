import 'package:metroom/core/notifiers/authentication.notifier.dart';
import 'package:metroom/core/notifiers/booking.notifer.dart';
import 'package:metroom/core/notifiers/events.notifier.dart';
import 'package:metroom/core/notifiers/favourite.notifier.dart';
import 'package:metroom/core/notifiers/feedback.notifier.dart';
import 'package:metroom/core/notifiers/password.notifier.dart';
import 'package:metroom/core/notifiers/room.notifier.dart';
import 'package:metroom/core/notifiers/theme.notifier.dart';
import 'package:metroom/core/service/photo.service.dart';
import 'package:metroom/core/utils/obscure.text.util.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => PasswordNotifier()),
    ChangeNotifierProvider(create: (_) => AuthenticationNotifer()),
    ChangeNotifierProvider(create: (_) => ObscureTextUtil()),
    ChangeNotifierProvider(create: (_) => FeedbackNotifier()),
    ChangeNotifierProvider(create: (_) => RoomNotifier()),
    ChangeNotifierProvider(create: (_) => BookingNotifier()),
    ChangeNotifierProvider(create: (_) => EventsNotifier()),
    ChangeNotifierProvider(create: (_) => FavouriteNotifier()),
    ChangeNotifierProvider(create: (_) => PhotoService()),
  ];
}
