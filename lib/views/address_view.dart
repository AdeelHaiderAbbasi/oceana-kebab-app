import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oceanakabab/controllers/address-controller.dart';

import '../common/app_colors.dart';
import 'add_new_address_view.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({Key? key}) : super(key: key);

  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      builder: (controller) {
        return controller.listCheck==false?Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button and title
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ]),
                  SizedBox(height: 16),
                  Expanded(
                    child: controller.addressList.length!=0?ListView.builder(
                        itemCount: controller.addressList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AddressCard(type: controller.addressList[index].city.toString(),
                            address: "${controller.addressList[index].street.toString()} "
                                "${controller.addressList[index].houseNo.toString()} ${controller.addressList[index].postcode.toString()}",
                            icon: Icons.book, iconColor: Colors.black38,

                          );
                        }):Center(
                      child: Text("No Data found",
                        style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),),
                  ),

                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(AddLocationScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'ADD NEW ADDRESS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ):Center(
          child: CircularProgressIndicator(
            color: Colors.red,strokeWidth: 3.0,
          ),
        );
      },
    );
  }
}

class AddressCard extends StatelessWidget {
  final String type;
  final String address;
  final IconData icon;
  final Color iconColor;

  const AddressCard({
    Key? key,
    required this.type,
    required this.address,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined, color: Colors.deepOrange[300]),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.deepOrange[300]),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
