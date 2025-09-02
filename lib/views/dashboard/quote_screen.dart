import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:status_craft/controller/dashboard/quote_controller.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';

// class QuotesScreen extends StatelessWidget {
//   final String categorySlug;

//   QuotesScreen({super.key, required this.categorySlug});

//   final controller = Get.put(QuoteController());

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.fetchQuotesByTag(categorySlug);
//     });

//     return Scaffold(
//       backgroundColor: AppColors.extraWhite,
//       appBar: AppBar(
//         backgroundColor: AppColors.extraWhite,
//         elevation: 1,
//         leading: InkWell(
//           onTap: () => Get.back(),
//           child: Icon(Icons.arrow_back, color: AppColors.textColor),
//         ),
//         title: Text(
//           categorySlug.capitalizeFirst ?? "",
//           style: CustomTextStyles.f14W600(color: AppColors.textColor),
//         ),
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (controller.quotesList.isEmpty) {
//           return const Center(child: Text("No quotes found"));
//         }

//         return ListView.separated(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           itemCount: controller.quotesList.length,
//           separatorBuilder: (_, __) => const SizedBox(height: 12),
//           itemBuilder: (context, index) {
//             final quote = controller.quotesList[index];

//             return Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(
//                       left: 14, right: 14, top: 12, bottom: 12),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     gradient: LinearGradient(
//                       colors: [
//                         AppColors.secondaryColor.withOpacity(0.8),
//                         AppColors.primaryColor.withOpacity(0.8),
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 10,
//                         offset: const Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         quote.content ?? "",
//                         style: CustomTextStyles.f12W400(
//                           color: AppColors.extraWhite,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 12),
//                       if (quote.author != null && quote.author!.isNotEmpty)
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Text("- ${quote.author}",
//                               style: TextStyle(
//                                 color: AppColors.extraWhite.withOpacity(0.9),
//                                 fontStyle: FontStyle.italic,
//                                 fontFamily: "Poppins",
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w400,
//                               )),
//                         ),
//                       Row(
//                         children: [
//                           _QuoteActionButton(
//                             icon: Icons.copy,
//                             label: "",
//                             onTap: () {
//                               Clipboard.setData(ClipboardData(
//                                   text: '${quote.content} - ${quote.author}'));
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text('Quote copied!')),
//                               );
//                             },
//                           ),
//                           const SizedBox(width: 8),
//                           _QuoteActionButton(
//                             icon: Icons.share,
//                             label: "",
//                             onTap: () {
//                               Share.share('${quote.content} - ${quote.author}');
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       }),
//     );
//   }
// }

class _QuoteActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuoteActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.extraWhite,
      shape: const CircleBorder(),
      elevation: 3,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, color: AppColors.primaryColor, size: 18),
        ),
      ),
    );
  }
}

class QuotesScreen extends StatelessWidget {
  final String category;
  final QuoteController controller = Get.put(QuoteController());
  final ScrollController _scrollController = ScrollController();

  QuotesScreen({super.key, required this.category}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchQuotesByTag(category, refresh: true);
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 100 &&
            !controller.isMoreLoading.value) {
          controller.fetchQuotesByTag(category);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        elevation: 1,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: Text(
          category.capitalizeFirst ?? "",
          style: CustomTextStyles.f14W600(color: AppColors.textColor),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.quotesList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.quotesList.isEmpty) {
          return const Center(child: Text("No quotes found"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchQuotesByTag(category, refresh: true);
          },
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(14),
            itemCount: controller.quotesList.length +
                (controller.isMoreLoading.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == controller.quotesList.length) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final quote = controller.quotesList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.secondaryColor.withOpacity(0.8),
                            AppColors.primaryColor.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            quote.content ?? "",
                            style: CustomTextStyles.f12W500(
                              color: AppColors.extraWhite,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          if (quote.author != null && quote.author!.isNotEmpty)
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text("- ${quote.author}",
                                  style: TextStyle(
                                    color:
                                        AppColors.extraWhite.withOpacity(0.9),
                                    fontStyle: FontStyle.italic,
                                    fontFamily: "Poppins",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          Row(
                            children: [
                              _QuoteActionButton(
                                icon: Icons.copy,
                                label: "",
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text:
                                          '${quote.content} - ${quote.author}'));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Quote copied!')),
                                  );
                                },
                              ),
                              const SizedBox(width: 8),
                              _QuoteActionButton(
                                icon: Icons.share,
                                label: "",
                                onTap: () {
                                  Share.share(
                                      '${quote.content} - ${quote.author}');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
