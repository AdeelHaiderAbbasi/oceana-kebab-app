import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oceanakabab/views/address_view.dart';

import 'add_new_address_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildProfileInfo(),
              const SizedBox(height: 20),
              _buildMenuSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black54),
            onPressed: () {},
          ),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('https://dashboard.codeparrot.ai/api/image/Z5pCq4IayXWIU-JN/menu.png'),
        ),
        const SizedBox(height: 16),
        const Text(
          'Vishal Khadok',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'I love fast food',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        _buildMenuGroup([
          _buildMenuItem(Icons.person_outline, 'Personal Info'),
          _buildMenuItem(Icons.location_on_outlined, 'Addresses'),
        ]),
        const SizedBox(height: 16),
        _buildMenuGroup([
          _buildMenuItem(Icons.shopping_cart_outlined, 'Cart'),
          _buildMenuItem(Icons.favorite_border, 'Favourite'),
          _buildMenuItem(Icons.notifications_none, 'Notifications'),
          _buildMenuItem(Icons.credit_card, 'Payment Method'),
        ]),
        const SizedBox(height: 16),
        _buildMenuGroup([
          _buildMenuItem(Icons.help_outline, 'FAQs'),
          _buildMenuItem(Icons.star_border, 'User Reviews'),
          _buildMenuItem(Icons.settings_outlined, 'Settings'),
        ]),
        const SizedBox(height: 16),
        _buildMenuGroup([
          _buildMenuItem(Icons.logout, 'Log Out', color: Colors.red),
        ]),
      ],
    );
  }

  Widget _buildMenuGroup(List<Widget> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {Color? color}) {
    return InkWell(
      onTap: () {
        Get.to(AddressScreen());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: color ?? Colors.black54, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: color ?? Colors.black87,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}