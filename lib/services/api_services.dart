
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oceanakabab/common/app_manager.dart';
import 'package:oceanakabab/models/address_model.dart';
import 'package:oceanakabab/models/food_products_model.dart';
import 'package:oceanakabab/models/response_data.dart';

import '../network/api_class.dart';



class ApiService {

  Dio dio = Dio();

  String baseIrl = "https://foodbackend-crm7.vercel.app";


  Future<ResponseData> getVendorsList() async {
    try {
      Response response = await dio.get(
          '$baseIrl/products'
      );

      var status = response.statusCode;

      if (status != 200) {
        print('getVendorsList: ERROR');
        return ResponseData('ERROR', response.statusMessage.toString(), []);
      }

      print('getVendorsList: OK');
      return ResponseData('OK', 'Success', response.data);
    } on DioException catch (e) {
      print('getVendorsList: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }


  Future<ResponseData> getProductsData() async {
    try {
      Response response = await dio.get(
          'https://foodbackend-crm7.vercel.app/products'
      );

      var status = response.statusCode;

      if (status != 200) {
        print('getProductsData: ERROR');
        return ResponseData('ERROR', response.statusMessage.toString(), []);
      }

      print('getProductsData: OK');
      return ResponseData('OK', 'Success', response.data);
    } on DioException catch (e) {
      print('getProductsData: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }

  Future<ResponseData> getAddressList() async {
    try {
      Response response = await dio.get(
          'https://foodbackend-crm7.vercel.app/address/get-address/guest/${AppManager.guestUid}'
      );

      var status = response.statusCode;

      if (status != 200) {
        print('getAddressList: ERROR');
        return ResponseData('ERROR', response.statusMessage.toString(), []);
      }

      print('getAddressList: OK');
      return ResponseData('OK', 'Success', response.data);
    } on DioException catch (e) {
      print('getAddressList: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }


  Future<ResponseData> saveAddress(
      //  String guestId,
      //  String houseNo,
      //  String street,
      //  String city,
      //  String postcode,
      // String? instructions,
      // String? apartmentName,
      // String? floor,
      // String? buildingName,
      // String? entryCode,
      // String? businessName,
      // String? hotelName,
      // String? business,
      Address model
      ) async {
    final dio = Dio();
    // final Map<String, dynamic> payload = {
    //   "guest_id": guestId,
    //   "house_no": houseNo,
    //   "street": street,
    //   "city": city,
    //   "postcode": postcode,
    //   "instructions": instructions,
    //   "appartment_name": apartmentName,
    //   "floor": floor,
    //   "building_name": buildingName,
    //   "entry_code": entryCode,
    //   "business_name": businessName,
    //   "hotel_name": hotelName,
    //   "business": business,
    // };

    // Set headers (Content-Type and Accept)
    final options = Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    try {
      final response = await dio.post(
        'https://foodbackend-crm7.vercel.app/address/add-address',
        data: model,
        options: options,
      );
      if (response.statusCode == 200) {
        // Parse response based on your API structure
        return ResponseData("OK", "SUCCESS", response.data);
      } else {
        // Parse response based on your API structure
        return ResponseData("ERROR", "Failed", []);
      }
    } on DioException catch (e) {
      return ResponseData("ERROR", "${e.toString()}", []);
    }
  }


}
