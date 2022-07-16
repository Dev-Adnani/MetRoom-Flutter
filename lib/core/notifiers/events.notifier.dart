import 'package:flutter/material.dart';
import 'package:metroom/core/models/events.model.dart';
import 'package:metroom/core/service/events.service.dart';
import 'package:supabase/supabase.dart';

class EventsNotifier extends ChangeNotifier {
  final EventsService eventsService = EventsService();
  PostgrestResponse? allEventsData;

  Future getAllEvents() async {
    if (allEventsData == null) {
      allEventsData = await eventsService.getAllEvents();
      notifyListeners();
      return allEventsData!.data
          .map((element) => EventsModel.fromJson(element))
          .toList();
    } else {
      return allEventsData!.data
          .map((element) => EventsModel.fromJson(element))
          .toList();
    }
  }
}
