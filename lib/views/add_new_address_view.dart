import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oceanakabab/common/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:oceanakabab/custom_widget/custom_inputField.dart';

import '../controllers/address-controller.dart';
import '../custom_widget/text_widget.dart';

class AddLocationScreen extends StatelessWidget {
  AddLocationScreen({Key? key}) : super(key: key);

  final controller = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Get.back();
                  },
                ),
                const Text(
                  'Add New Address',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Address Type Dropdown
                      _buildAddressTypeDropdown(context),
                      if (controller.Addresstype == "Home") ...[
                        SectionTitle(title: 'HOUSE'),
                        customInputField(
                          textValue: 'Enter House No',
                          keyboardType: TextInputType.text,
                          controller: controller.houseNo,

                        ),
                      ],

                      // Conditional Fields Based on Address Type
                      if (controller.Addresstype == "Hotel") ...[
                        SectionTitle(title: 'HOUSE'),
                        customInputField(
                          textValue: 'Enter house no',
                          keyboardType: TextInputType.text,
                          controller: controller.houseNo,

                        ),
                        SectionTitle(title: 'HOTEL'),
                        customInputField(
                          textValue: 'Enter Hotel Name',
                          keyboardType: TextInputType.text,
                          controller: controller.hotel,
                        ),
                        SectionTitle(title: 'FLOOR'),
                        customInputField(
                          textValue: 'Enter floor no',
                          keyboardType: TextInputType.text,
                          controller: controller.floorNo,
                        ),
                      ],
                      if (controller.Addresstype == "Office") ...[
                        SectionTitle(title: 'HOME'),
                        customInputField(
                          textValue: 'Enter house no',
                          keyboardType: TextInputType.text,
                          controller: controller.houseNo,
                        ),
                        SectionTitle(title: 'OFFICE'),
                        customInputField(
                          textValue: 'Enter floor no',
                          keyboardType: TextInputType.text,
                          controller: controller.floorNo,
                        ),
                        SectionTitle(title: 'BUSINESS NAME'),
                        customInputField(
                          textValue: 'Enter Business Name',
                          keyboardType: TextInputType.text,
                          controller: controller.business,
                        ),
                      ],
                      if (controller.Addresstype == "Apartment") ...[
                        SectionTitle(title: 'HOME'),
                        customInputField(
                          textValue: 'Enter house no',
                          keyboardType: TextInputType.text,
                          controller: controller.houseNo,
                        ),
                        SectionTitle(title: 'APARTMENT'),
                        customInputField(
                          textValue: 'Enter Apartment Name',
                          keyboardType: TextInputType.text,
                          controller: controller.apartment,
                        ),
                        SectionTitle(title: 'FLOOR'),
                        customInputField(
                          textValue: 'Enter floor Name',
                          keyboardType: TextInputType.text,
                          controller: controller.floorNo,
                        ),
                        SectionTitle(title: 'BUILDING NAME'),
                        customInputField(
                          textValue: 'Enter building Name',
                          keyboardType: TextInputType.text,
                          controller: controller.buildingName,
                        ),
                        SectionTitle(title: 'ENTRY CODE'),
                        customInputField(
                          textValue: 'Enter Entry Code',
                          keyboardType: TextInputType.text,
                          controller: controller.entrycode,
                        ),
                      ],
                      if (controller.Addresstype == "Others") ...[
                        SectionTitle(title: 'HOUSE'),
                        customInputField(
                          textValue: 'Enter House No',
                          keyboardType: TextInputType.text,
                          controller: controller.houseNo,
                        ),
                        SectionTitle(title: 'BUSINESS NAME'),
                        customInputField(
                          textValue: 'Enter Business name',
                          keyboardType: TextInputType.text,
                          controller: controller.business,
                        ),
                        SectionTitle(title: 'FLOOR'),
                        customInputField(
                          textValue: 'Enter floor No',
                          keyboardType: TextInputType.text,
                          controller: controller.floorNo,
                        ),
                      ],

                      // Common Fields for All Address Types
                      SectionTitle(title: 'STREET'),
                      customInputField(
                        textValue: 'Enter Street',
                        keyboardType: TextInputType.text,
                        controller: controller.street,
                      ),
                      const SizedBox(height: 5),

                      SectionTitle(title: 'POST CODE'),
                      customInputField(
                        textValue: 'Enter PostCode',
                        keyboardType: TextInputType.text,
                        controller: controller.postcode,
                      ),
                      const SizedBox(height: 5),

                      SectionTitle(title: 'CITY'),
                      customInputField(
                        textValue: 'Enter City',
                        keyboardType: TextInputType.text,
                        controller: controller.city,
                      ),
                      const SizedBox(height: 5),

                      SectionTitle(title: 'INSTRUCTION FOR DELIVERY BOY'),
                      InputFieldWithIcon(
                        textValue: 'Enter Instructions',
                        keyboardType: TextInputType.text,
                        controller: controller.instruction,
                      ),
                      const SizedBox(height: 24),

                      // Save Button
                      _buildSaveButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAddressTypeDropdown(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      width: MediaQuery.sizeOf(context).width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            controller.Addresstype == "" ? 'Select Address Type' : controller.Addresstype.toString(),
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: controller.data
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
              .toList(),
          onChanged: (String? value) {
            controller.getAddress(value ?? "");
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }

  // Address Type Dropdown Widget
  Widget _buildSaveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          controller.saveAddress(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: controller.check==false? Text(
          'SAVE ADDRESS',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ):Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         CircularProgressIndicator(
            color: Colors.white,
          strokeWidth: 2.0,
        )
          ],
        ),
      ),
    );
  }
}