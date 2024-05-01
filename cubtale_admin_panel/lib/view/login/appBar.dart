// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // Bu değişken AppBar widgetinin yüksekliğinin diğer appbar bileşenlerinin
//     // responsive oranları için kullanılmıştır
//     double toolbarWidth = MediaQuery.of(context).size.width * 0.07;
//     return Scaffold(
//       body: Stack(
//         //fit: StackFit.expand,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width/2,
//                 height: toolbarWidth * 2,
//                 decoration: BoxDecoration(
//                     color: const Color(0xffb8e6db),
//                 ),
//               ),
//               Spacer(),
//               Container(
//                 width: MediaQuery.of(context).size.width/2,
//                 height: toolbarWidth *0.99 ,
//                 decoration: BoxDecoration(
//                     color: const Color(0xffb8e6db),
//                     borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(toolbarWidth *0.3)
//                     )
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               AppBar(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(toolbarWidth * 0.3)
//                   )
//                 ),
//                 toolbarHeight: toolbarWidth,
//                 elevation: 5,
//                 title: Row(
//                   children: [
//                     const SizedBox(
//                       width: 6,
//                     ),
//                     SizedBox(
//                       height: toolbarWidth * 0.9,
//                       width: toolbarWidth * 0.9,
//                       child: Image.asset("assets/cubtale logo1.png"),
//                     ),
//                     const SizedBox(
//                       width: 14,
//                     ),
//                     SizedBox(
//                         height: toolbarWidth * 1.7,
//                         width: toolbarWidth * 1.7,
//                         child: Image.asset("assets/Cubtale watermark.png"))
//                   ],
//                 ),
//                 actions: [
//                   Container(
//                     decoration: const BoxDecoration(
//                         color: Color(0xffd7f1ed),
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(kToolbarHeight * 0.19))),
//                     height: toolbarWidth * 0.7,
//                     width: toolbarWidth * 1.8,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         SizedBox(
//                             width: toolbarWidth * 0.5,
//                             height: toolbarWidth * 0.5,
//                             child: Image.asset("assets/darkmode_icon.png")),
//                         Text(
//                           "Dark Mode",
//                           style: GoogleFonts.aBeeZee(
//                               textStyle: TextStyle(
//                                 fontSize: toolbarWidth * 0.2,
//                                 color: Colors.black.withOpacity(0.5)
//                           )),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.01,
//                   )
//                 ],
//                 backgroundColor:  Colors.transparent,
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: toolbarWidth * 0.96,
//               ),
//               Expanded(
//                 child: Container(
//                   height: toolbarWidth,
//                   decoration: BoxDecoration(
//                     // AppBar ' ın Sol tarafına shape vermek için
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(toolbarWidth * 0.3),
//                       //topRight: Radius.circular(toolbarWidth * 0.2),
//                     ),
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
