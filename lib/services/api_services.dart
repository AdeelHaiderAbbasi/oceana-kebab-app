
import 'dart:io';

import 'package:dio/dio.dart';
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


}
