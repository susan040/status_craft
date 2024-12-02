import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:status_generator/models/quote.dart';
import 'dart:convert';

class QuoteController extends GetxController {
  var quotes = <Quotes>[].obs;
  var isLoading = true.obs;

  void clearQuotes() {
    quotes.clear();
  }

  Future<void> fetchQuote(String category, int count) async {
    final url = 'https://api.api-ninjas.com/v1/quotes?category=$category';
    final headers = {'X-Api-Key': 'iiDChh7p8mo3Th8SxFB0Tw==EEWwjbfFq8Yi9vJh'};

    List<Future<http.Response>> requests =
        List.generate(count, (index) => http.get(Uri.parse(url), headers: headers));

    try {
      isLoading(true);
      final responses = await Future.wait(requests);
      quotes.value = responses
          .where((response) => response.statusCode == 200)
          .map((response) {
        final jsonData = json.decode(response.body);
        if (jsonData.isNotEmpty) {
          return Quotes.fromJson(jsonData[0]);
        } else {
          return Quotes(
              quote: 'No quote', author: 'Unknown', category: category);
        }
      }).toList();
    } catch (e) {
      print('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
