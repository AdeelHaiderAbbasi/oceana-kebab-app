import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oceanakabab/models/products_model.dart';
import 'package:oceanakabab/models/response_data.dart';
import 'package:oceanakabab/services/api_services.dart';
import 'package:oceanakabab/models/food_products_model.dart' as pr;

import '../models/cart_model.dart';
import '../services/cart_service.dart';



class FlutterCart {
  static List<CartModel> cartItems = [];

  // Add item to cart
  static void addToCart({required CartModel cartModel}) {
    cartItems.add(cartModel);
    print('Product added to cart: ${cartModel.title}');
  }

  // You can also create methods to retrieve the cart items, remove items, etc.
  static List<CartModel> getCartItems() {
    return cartItems;
  }
}

class HomeController extends GetxController{


  List<pr.Products> dataList =[];

  final apiService = ApiService();

   List<CartModel> cartItems = [];


  List<Products> catList =[];

  int totalItem =0;

  double totalPrice = 0.0;

  bool listCheck = false;

  String category = "";

  List<pr.Products> categoryDataList =[];

  void getCat(String cate){
    category = cate;
    Get.forceAppUpdate();
    getCategoryList();
  }





  void getSingleCategoryData(List<Products> data,String cat){
   List<Products> myList =  data.where((e)=>e.category==cat).toList();
   catList = myList;
   Get.forceAppUpdate();
  }


  void addToCart(pr.Products product,BuildContext context) async{
    // Prepare the product metadata as a Map<String, dynamic>

    List<CartModel> cartItems  =[];

    // Add the product to the cart
    FlutterCart.addToCart(
      cartModel: CartModel(
        productid: product.id.toString(),
        title: product.name.toString(),
        category: product.category.toString(),
        price: product.price!.toDouble(),
        imagepath: "https://dashboard.codeparrot.ai/api/image/Z5ipc4IayXWIU-Dh/home-v.png",
        item: 1,

      ),
    );
    totalItem = totalItem+ 1;
    Get.forceAppUpdate();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product.name.toString()} added to cart')));
    getList();
  }

  void getList() async {
    // Fetch the cart items
    cartItems = await FlutterCart.getCartItems();
    Get.forceAppUpdate();
    await CartService.saveCartItems(cartItems);

    // Initialize the total amount variable
    double totalAmount = 0.0;

    // Loop through each cart item to calculate the total amount
    cartItems.forEach((cartItem) {
      totalAmount += cartItem.price * cartItem.item; // Assuming quantity is included in CartModel
    });

    // Update the total price with the calculated totalAmount
    totalPrice = totalAmount;
    Get.forceAppUpdate();
  }



  void minusItem() {
      totalItem--;
    Get.forceAppUpdate();
    updateTotalAmountMinus();
  }

  void updateTotalAmountMinus() {
    // Recalculate total amount after modification
    totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice -= item.price * item.item;
    }
  }
  void updateTotalAmount() {
    // Recalculate total amount after modification
    totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += item.price * item.item;
    }
  }
  Future<void> plusItem(String productid) async {
    if (productid.isNotEmpty) {
      // Find the index of the product in the list
      int index = cartItems.indexWhere((item) => item.productid == productid);

      if (index != -1) {
        // Item found in the list, increase item count
        cartItems[index].item++;

        // Update total price correctly
        totalPrice += cartItems[index].price;
        update(); // Notify GetX to refresh UI
      }
    }
  }

  Future<void> MinusItem(String productid) async {
    if (productid.isNotEmpty) {
      // Find the index of the product in the list
      int index = cartItems.indexWhere((item) => item.productid == productid);

      if (index != -1) {
        // Item found in the list, increase item count
        cartItems[index].item--;

        // Update total price correctly
        totalPrice -= cartItems[index].price;
        update(); // Notify GetX to refresh UI
      }
    }
  }


  void getProductList() async {
    listCheck = true;
    Get.forceAppUpdate();

    try {
      // Make the API call to get the data
      ResponseData response = await apiService.getProductsData();

      // Parse the response data into a List<Products>
      List<pr.Products> productsList = (response.Data as List<dynamic>)
          .map((item) => pr.Products.fromJson(item))
          .toList();

      // Assign the parsed list to dataList
      dataList = productsList.cast<pr.Products>();
      print(dataList.length);
      Get.forceAppUpdate();
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

  void getCategoryList() async {
    listCheck = true;
    Get.forceAppUpdate();

    try {
      // // Make the API call to get the data
      // ResponseData response = await apiService.getProductsData();
      // // Parse the response data into a List<Products>
      // List<pr.Products> productsList = (response.Data as List<dynamic>)
      //     .map((item) => pr.Products.fromJson(item))
      //     .toList();
      //
      // // Assign the parsed list to dataList
      // dataList = productsList.cast<pr.Products>();
      List<pr.Products> cateList = dataList.where((e)=>e.category==category).toList();
      categoryDataList =  cateList;
      print(dataList.length);
      Get.forceAppUpdate();
    } catch (e) {
      // Handle any errors that might occur during the API call
      print("Error fetching category data: $e");
      // Optionally, handle error state here if needed
    } finally {
      // After the API call is complete (either success or failure), set listCheck to false
      listCheck = false;
      Get.forceAppUpdate();
    }
  }





  @override
  void onInit() {
    getProductList();
    super.onInit();
  }
}