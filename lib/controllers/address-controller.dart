import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class AddressController extends GetxController{
  GoogleMapController? mapController;
  LatLng? selectedLocation;
  String address = "Select a location on the map";

  @override
  void onInit() {
    _getCurrentLocation();
    super.onInit();
  }

  // Get the user's current location
  Future<void> _getCurrentLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
        selectedLocation = LatLng(position.latitude, position.longitude);
        updateAddress(selectedLocation!);
        Get.forceAppUpdate();
      // Move the camera to the current location
      mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(selectedLocation!, 15),
      );
    } else {
      print("Location permission denied");
    }
  }

  // Update the address based on the selected location
  void updateAddress(LatLng location) async {
    try {
      // Use the geocoding package to convert coordinates to an address
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address = "${place.street}, ${place.locality}, ${place.country}";
      } else {
        address = "Address not found";
      }
    } catch (e) {
      address = "Failed to fetch address: $e";
    }
    Get.forceAppUpdate();
  }
}