// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:status_craft/controller/dashboard/quote_controller.dart';
// import 'package:status_craft/models/quote.dart';
// import 'package:status_craft/utils/colors.dart';
// import 'package:status_craft/utils/custom_text_style.dart';
// import 'package:shimmer/shimmer.dart';

// class QuotesDisplayPage extends StatelessWidget {
//   final String category;
//   final int count;
//   final QuoteController controller = Get.put(QuoteController());

//   QuotesDisplayPage({super.key, required this.category, required this.count}) {
//     controller.fetchQuote(category, count);
//   }

//   void _refreshQuotes() {
//     controller.fetchQuote(category, count);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.extraWhite,
//       appBar: AppBar(
//         centerTitle: false,
//         backgroundColor: Colors.white,
//         elevation: 2,
//         leading: InkWell(
//           onTap: () {
//             controller.clearQuotes();
//             Get.back();
//           },
//           child: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//         title: Text('${category.capitalizeFirst!} Quotes',
//             style: CustomTextStyles.f14W600(color: AppColors.textColor)),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh, color: Colors.black),
//             onPressed: _refreshQuotes,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
//         child: Obx(() {
//           if (controller.isLoading.value) {
//             return _buildShimmer(); // Shimmer effect for loading quotes
//           } else {
//             return ListView.builder(
//               itemCount: controller.quotes.length,
//               itemBuilder: (context, index) {
//                 final quote = controller.quotes[index];
//                 return QuoteWidget(quote: quote);
//               },
//             );
//           }
//         }),
//       ),
//     );
//   }

//   // Shimmer effect widget for loading state
//   Widget _buildShimmer() {
//     return ListView.builder(
//       itemCount:
//           5, // Adjust based on the number of items you want to show as loading
//       itemBuilder: (context, index) {
//         return Shimmer.fromColors(
//           baseColor: Colors.grey[300]!,
//           highlightColor: Colors.grey[100]!,
//           child: Container(
//             margin: const EdgeInsets.only(bottom: 20),
//             height: MediaQuery.of(context).size.height / 2.7,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 color: AppColors.extraWhite,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: const [
//                   BoxShadow(
//                       color: AppColors.unselectedGrey,
//                       blurRadius: 2,
//                       spreadRadius: 2)
//                 ]),
//             child: Column(
//               children: [
//                 Container(
//                   height: 215,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     color: AppColors.primaryColor,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10)),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Container(
//                           color: Colors.white,
//                           height: 14,
//                           width: double.infinity,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Container(
//                           color: Colors.white,
//                           height: 14,
//                           width: 120,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         color: Colors.white,
//                         height: 14,
//                         width: 60,
//                       ),
//                       const SizedBox(width: 20),
//                       Container(
//                         color: Colors.white,
//                         height: 14,
//                         width: 60,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class QuoteWidget extends StatelessWidget {
//   const QuoteWidget({
//     super.key,
//     required this.quote,
//   });
//   final Quotes quote;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       height: MediaQuery.of(context).size.height / 2.7,
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: AppColors.extraWhite,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: const [
//             BoxShadow(
//                 color: AppColors.unselectedGrey, blurRadius: 2, spreadRadius: 2)
//           ]),
//       child: Column(
//         children: [
//           Container(
//             height: 215,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               color: AppColors.primaryColor,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
//                   child: Text(
//                     quote.quote ?? "",
//                     style:
//                         CustomTextStyles.f12W400(color: AppColors.extraWhite),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 20, right: 20, top: 12, bottom: 18),
//                   child: Center(
//                       child: Text("— ${quote.author}",
//                           style: CustomTextStyles.f12W600(
//                               color: AppColors.extraWhite))),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 10),
//           Padding(
//             padding:
//                 const EdgeInsets.only(left: 20, right: 20, bottom: 17, top: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Clipboard.setData(ClipboardData(
//                         text: '${quote.quote} - ${quote.author}'));
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         content: Text('Quote copied to clipboard!')));
//                   },
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.copy,
//                         color: AppColors.secondaryColor,
//                         size: 20,
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         'Copy',
//                         style: CustomTextStyles.f12W600(
//                             color: AppColors.primaryColor),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 InkWell(
//                   onTap: () {
//                     Share.share('${quote.quote} - ${quote.author}');
//                   },
//                   child: Row(
//                     children: [
//                       const Icon(
//                         Icons.share,
//                         color: AppColors.secondaryColor,
//                         size: 20,
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         'Share',
//                         style: CustomTextStyles.f12W600(
//                             color: AppColors.primaryColor),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
