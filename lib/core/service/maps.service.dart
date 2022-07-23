import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as geo_co;
import 'package:geolocator/geolocator.dart';

class MapsService with ChangeNotifier {
  String finalAddress = 'Searching...';
  String? countryName;
  String mainAddress = 'Please Select Any Place In Order To Get Address';

  double? intialLat;
  double? intialLong;

  Future getCurrentLocation() async {
    var postionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final coords = geo_co.Coordinates(
      postionData.latitude,
      postionData.longitude,
    );
    intialLat = postionData.latitude;
    intialLong = postionData.longitude;
    var address =
        await geo_co.Geocoder.local.findAddressesFromCoordinates(coords);
    String mainAddress = address.first.addressLine!;
    finalAddress = mainAddress;
    notifyListeners();
  }
}
