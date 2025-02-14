import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oceanakabab/common/app_manager.dart';
import 'package:oceanakabab/models/address-list_model.dart';
import 'package:oceanakabab/models/address_model.dart';
import 'package:oceanakabab/models/response_data.dart';
import 'package:oceanakabab/services/api_services.dart';
import 'package:permission_handler/permission_handler.dart';

class AddressController extends GetxController {

  final city = TextEditingController();
  final postcode = TextEditingController();
  final street = TextEditingController();
  final instruction = TextEditingController();
  final floorNo = TextEditingController();
  final entrycode = TextEditingController();

  final houseNo = TextEditingController();
  final buildingName = TextEditingController();
  final apartment = TextEditingController();
  final business = TextEditingController();
  final hotel = TextEditingController();


  GoogleMapController? mapController;
  LatLng? selectedLocation;
  String address = "Select a location on the map";

  final apiService = ApiService();
  bool listCheck = false;

  List<AddressList> addressList = [];

  List<String> data = [
    "Hotel",
    "Others",
    "Home",
    "Apartment",
    "Office"
  ];

  String Addresstype = "";

  bool check = false;
  @override
  void onInit() {
    _getCurrentLocation();
    getAddressList();

    AppManager.update = () {
      updateList();
    };
    super.onInit();
  }

  void getAddress(String type) {
    Addresstype = type;
    Get.forceAppUpdate();
  }

  void getAddressList() async {
    listCheck = true;
    Get.forceAppUpdate();

    try {
      ResponseData resp = await apiService.getAddressList();
      List<AddressList> productsList = (resp.Data as List<dynamic>)
          .map((item) => AddressList.fromJson(item))
          .toList();

      // Assign the parsed list to dataList
      addressList = productsList.cast<AddressList>();
      Get.forceAppUpdate();
      print(addressList.length);
    } catch (e) {
      // Handle any errors that might occur during the API call
      print("Error fetching data: $e");
      // Optionally, handle error state here if needed
    } finally {
      // After the API call is complete (either success or failure), set listCheck to false
      listCheck = false;

      Get.forceAppUpdate();
    }
  }

  void updateList() async {
    listCheck = true;
    Get.forceAppUpdate();

    try {
      ResponseData resp = await apiService.getAddressList();
      List<AddressList> productsList = (resp.Data as List<dynamic>)
          .map((item) => AddressList.fromJson(item))
          .toList();

      // Assign the parsed list to dataList
      addressList = productsList.cast<AddressList>();
      Get.forceAppUpdate();
      print(addressList.length);
    } catch (e) {
      // Handle any errors that might occur during the API call
      print("Error fetching data: $e");
      // Optionally, handle error state here if needed
    } finally {
      // After the API call is complete (either success or failure), set listCheck to false
      listCheck = false;

      Get.forceAppUpdate();
    }
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

  void saveAddress(BuildContext context)async {
    if (city.text.isEmpty || street.text.isEmpty || postcode.text.isEmpty) {
      AppManager.errorMessageToast( context,"Please Enter all required fields");
      return;
    }
    check = !check;
    Get.forceAppUpdate();
    Address data = Address(guestId: AppManager.guestUid, houseNo: houseNo.text, street: street.text, city: city.text, postcode: postcode.text, instructions: instruction.text,
        appartmentName: apartment.text, floor: floorNo.text, buildingName: buildingName.text, entryCode: entrycode.text,
        businessName: business.text, hotelName: hotel.text, business: business.text);
    ResponseData resp = await apiService.saveAddress(data);
    if (resp.Status == "ERROR") {
      AppManager.getErrorMessage(context, " Address Saved ${resp.Message}");
      check = !check;
      Get.forceAppUpdate();
    } else {
      AppManager.successMessageToast(context, "Address Saved ${resp.Message}");
      check = !check;
      Get.forceAppUpdate();
      AppManager.update!();
      Get.back();
    }
  }
}