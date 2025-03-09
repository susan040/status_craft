import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:status_craft/models/quote.dart';
import 'dart:convert';

class QuoteController extends GetxController {
  var quotes = <Quotes>[].obs;
  var isLoading = true.obs;

  void clearQuotes() {
    quotes.clear();
  }

  Future<void> fetchQuote(String category, int count) async {
    final url =
        'https://api.api-ninjas.com/v1/quotes?category=$category&limit=$count';
    final headers = {'X-Api-Key': 'iiDChh7p8mo3Th8SxFB0Tw==EEWwjbfFq8Yi9vJh'};

    try {
      isLoading(true);
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData is List && jsonData.isNotEmpty) {
          quotes.value =
              jsonData.map((quoteJson) => Quotes.fromJson(quoteJson)).toList();
        } else {
          quotes.value = [
            Quotes(
                quote: 'No quote available',
                author: 'Unknown',
                category: category)
          ];
        }
      } else {
        throw Exception('Failed to fetch quotes');
      }
    } catch (e) {
      print('Exception: $e');
      quotes.value = [
        Quotes(
            quote: 'Error fetching quotes',
            author: 'Unknown',
            category: category)
      ];
    } finally {
      isLoading(false);
    }
  }

  Future<List<Quotes>> fetchQuotes() async {
    const url = 'https://api.api-ninjas.com/v1/quotes';
    final headers = {
      'X-Api-Key': 'iiDChh7p8mo3Th8SxFB0Tw==EEWwjbfFq8Yi9vJh',
    };

    // Perform multiple API calls in parallel
    final responses = await Future.wait([
      _fetchQuoteFromApi(url, headers), // First API call
      _fetchQuoteFromApi(url, headers), // Second API call
      _fetchQuoteFromApi(url, headers), // Third API call
    ]);

    // Combine the results of all 3 API calls
    List<Quotes> allQuotes = [];
    for (var response in responses) {
      allQuotes.addAll(response); // Add quotes from each response to the list
    }

    return allQuotes
        .take(3)
        .toList(); // You can limit the results to 3 quotes if needed
  }

// Helper function to fetch quotes from the API
  Future<List<Quotes>> _fetchQuoteFromApi(
      String url, Map<String, String> headers) async {
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return quotesFromJson(
          data); // Converts the response JSON to list of Quotes
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
