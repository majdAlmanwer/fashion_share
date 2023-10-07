// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../utils/app_config.dart';

// class CustomImageSlider extends StatelessWidget {
//   CustomImageSlider({super.key, this.imageList, this.customHight});
//   List<String>? imageList;
//   double? customHight = getPercentScreenHeight(20);
//   String
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//             margin: EdgeInsets.only(left: 15, right: 15, top: 5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(children: [
//               CarouselSlider(
//                   options: CarouselOptions(
//                     autoPlay: true,
//                     viewportFraction: 1,
//                     height: getPercentScreenHeight(20),
//                   ),
//                   items: imageList!.map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Stack(
//                           children: [
//                             Image.network(
//                               // color: Colors.grey,
//                               '${i.image}',
//                               fit: BoxFit.fill,
//                               width: getPercentScreenWidth(100),
//                             ),
//                             Center(
//                               child: Text(
//                                 textAlign: TextAlign.start,
//                                 i.name,
//                                 style: const TextStyle(
//                                     fontSize: 22, color: Colors.white),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 25,
//                             ),
//                             Text(
//                               i.description,
//                               style: const TextStyle(
//                                   fontSize: 10, color: Colors.black),
//                               textAlign: TextAlign.start,
//                             )
//                           ],
//                         );
//                       },
//                     );
//                   }).toList()
//                   // : List.empty(),
//                   )
//             ]),
//           ),
//   }
// }
