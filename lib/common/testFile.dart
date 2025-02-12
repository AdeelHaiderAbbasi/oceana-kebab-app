// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _obscureText = true;
//   bool _rememberMe = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(''),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const SizedBox(height: 60),
//                   const Text(
//                     'Log In',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Please sign in to your existing account',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 40),
//                   Container(
//                     padding: const EdgeInsets.all(24),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.deepOrangeAccent.withOpacity(0.5), // Shadow color with opacity
//                           spreadRadius: 2, // How far the shadow spreads
//                           blurRadius: 10, // Softness of the shadow
//                           offset: Offset(4, 4), // X and Y offsets for the shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'EMAIL',
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         TextField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             hintText: 'example@gmail.com',
//                             hintStyle: TextStyle(color: Colors.grey[400]),
//                             filled: true,
//                             fillColor: Colors.grey[50],
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         const Text(
//                           'PASSWORD',
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black54,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         TextField(
//                           controller: _passwordController,
//                           obscureText: _obscureText,
//                           decoration: InputDecoration(
//                             hintText: '••••••••••',
//                             hintStyle: TextStyle(color: Colors.grey[400]),
//                             filled: true,
//                             fillColor: Colors.grey[50],
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide.none,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _obscureText ? Icons.visibility_off : Icons.visibility,
//                                 color: Colors.grey[400],
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _obscureText = !_obscureText;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: 24,
//                                   height: 24,
//                                   child: Checkbox(
//                                     value: _rememberMe,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         _rememberMe = value ?? false;
//                                       });
//                                     },
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 const Text(
//                                   'Remember me',
//                                   style: TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 'Forgot Password',
//                                 style: TextStyle(
//                                   color: Colors.deepOrange,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 24),
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             minimumSize: Size(250, 45),
//                             maximumSize: Size(MediaQuery.sizeOf(context).width, 60),
//                             backgroundColor: Colors.deepOrange,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           child: const Text(
//                             'LOG IN',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Don't have an account? ",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           'SIGN UP',
//                           style: TextStyle(
//                             color: Colors.deepOrange,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   const Text(
//                     'Or',
//                     style: TextStyle(color: Colors.black),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 6),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _SocialButton(
//                         icon: Icons.facebook,
//                         color: const Color(0xFF3B5998),
//                         onPressed: () {},
//                       ),
//                       const SizedBox(width: 16),
//                       _SocialButton(
//                         icon: Icons.apple,
//                         color: Colors.black,
//                         onPressed: () {},
//                       ),
//                       const SizedBox(width: 16),
//                       _SocialButton(
//                         icon: Icons.g_mobiledata,
//                         color: Colors.blue,
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _SocialButton extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final VoidCallback onPressed;
//
//   const _SocialButton({
//     required this.icon,
//     required this.color,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         width: 48,
//         height: 48,
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//         child: Icon(
//           icon,
//           color: Colors.white,
//           size: 28,
//         ),
//       ),
//     );
//   }
// }
