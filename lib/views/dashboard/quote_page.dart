import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/quote_controller.dart';
import 'package:status_craft/models/quote.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';


class QuotesDisplayPage extends StatelessWidget {
  final String category;
  final int count;
  final QuoteController controller = Get.put(QuoteController());

  QuotesDisplayPage({super.key, required this.category, required this.count}) {
    controller.fetchQuote(category, count);
  }

  void _refreshQuotes() {
    controller.fetchQuote(category, count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: InkWell(
          onTap: () {
            controller.clearQuotes();
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text('$category Quotes', style: CustomTextStyles.f16W600()),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            onPressed: _refreshQuotes,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: controller.quotes.length,
              itemBuilder: (context, index) {
                final quote = controller.quotes[index];
                return QuoteWidget(quote: quote);
              },
            );
          }
        }),
      ),
    );
  }
}

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({
    super.key,
    required this.quote,
  });
  final Quotes quote;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.extraWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: AppColors.unselectedGrey, blurRadius: 2, spreadRadius: 2)
          ]),
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    quote.quote ?? "",
                    style:
                        CustomTextStyles.f14W400(color: AppColors.extraWhite),
                    textAlign: TextAlign.center,
                  ),
                ),
                // const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 12, bottom: 18),
                  child: Center(
                      child: Text("— ${quote.author}",
                          style: CustomTextStyles.f14W600(
                              color: AppColors.extraWhite))),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 17, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                        text: '${quote.quote} - ${quote.author}'));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Quote copied to clipboard!')));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.copy,
                        color: AppColors.secondaryColor,
                        size: 23,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Copy',
                        style: CustomTextStyles.f14W600(
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Share.share('${quote.quote} - ${quote.author}');
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.share,
                        color: AppColors.secondaryColor,
                        size: 23,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Share',
                        style: CustomTextStyles.f14W600(
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
