import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:status_craft/models/quote.dart';
import 'dart:convert';
import 'package:status_craft/models/tags.dart';
import 'package:status_craft/utils/api.dart';

class QuoteController extends GetxController {
  var isLoading = false.obs;
  var isMoreLoading = false.obs;
  RxList<Results> quotesList = <Results>[].obs;

  int currentPage = 1;
  int totalPages = 1;
  final int limit = 10;

  Future<void> fetchQuotesByTag(String tag, {bool refresh = false}) async {
    try {
      if (refresh) {
        currentPage = 1;
        totalPages = 1;
        quotesList.clear();
      }

      if (currentPage > totalPages) return;

      if (refresh) {
        isLoading.value = true;
      } else {
        isMoreLoading.value = true;
      }

      final url =
          'https://api.quotable.io/quotes?tags=$tag&page=$currentPage&limit=$limit';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = Quotes.fromJson(jsonDecode(response.body));

        if (refresh) {
          quotesList.assignAll(data.results ?? []);
        } else {
          quotesList.addAll(data.results ?? []);
        }

        totalPages = data.totalPages ?? 1;
        currentPage++;
      } else {
        print("Failed to load quotes: ${response.body}");
      }
    } catch (e) {
      print("Error fetching quotes: $e");
    } finally {
      isLoading.value = false;
      isMoreLoading.value = false;
    }
  }
  // var isLoading = false.obs;
  // RxList<Results> quotesList = <Results>[].obs;

  // int currentPage = 1;
  // int totalPages = 1;
  // final int limit = 8;

  // Future<void> fetchQuotesByTag(String tag, {int page = 1}) async {
  //   try {
  //     isLoading.value = true;
  //     currentPage = page;

  //     final url =
  //         'https://api.quotable.io/quotes?tags=$tag&page=$page&limit=$limit';
  //     final response = await http.get(Uri.parse(url));

  //     if (response.statusCode == 200) {
  //       final data = Quotes.fromJson(jsonDecode(response.body));
  //       quotesList.assignAll(data.results ?? []);
  //       totalPages = data.totalPages ?? 1;
  //     } else {
  //       quotesList.clear();
  //     }
  //   } catch (e) {
  //     print("Error fetching quotes: $e");
  //     quotesList.clear();
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> fetchQuote(String category, int count) async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse(Api.getRandomQuoteUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData is List && jsonData.isNotEmpty) {
          List<Results> results = jsonData
              .map((item) => Results.fromJson(item as Map<String, dynamic>))
              .where((quote) {
            final tags = quote.tags ?? [];
            return tags.length == 1 && // only single tag
                !tags.any((tag) =>
                    tag.trim().toLowerCase() ==
                    'famous quotes'); // exclude Famous Quotes
          }).toList();

          quotesList.value = results.take(count).toList();
        } else {
          quotesList.value = [
            Results(
              content: 'No quote available',
              author: 'Unknown',
            )
          ];
        }
      } else {
        throw Exception('Failed to fetch quotes');
      }
    } catch (e) {
      print('Exception: $e');
      quotesList.value = [
        Results(
          content: 'Error fetching quotes',
          author: 'Unknown',
        )
      ];
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<Quotes>> fetchQuotes() async {
    const url = Api.getRandomQuoteUrl;

    final responses = await Future.wait([
      _fetchQuoteFromApi(url),
      _fetchQuoteFromApi(url),
      _fetchQuoteFromApi(url),
      _fetchQuoteFromApi(url),
    ]);

    List<Quotes> allQuotes = [];
    for (var quotes in responses) {
      allQuotes.addAll(quotes);
    }

    return allQuotes.take(3).toList();
  }

  Future<List<Quotes>> _fetchQuoteFromApi(
    String url,
  ) async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      List<Quotes> quotesList = data.map((item) {
        return Quotes(
            results: [Results.fromJson(item as Map<String, dynamic>)]);
      }).toList();

      return quotesList;
    } else {
      throw Exception('Failed to load quotes');
    }
  }

  RxList<Tags> categories = <Tags>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      var response = await http.get(Uri.parse(Api.getTagsUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;

        categories.value = data
            .map((e) => Tags.fromJson(e))
            .where((tag) => tag.slug?.toLowerCase() != "famous-quotes")
            .toList();
      } else {
        log("Failed to load categories", name: "API Error");
      }
    } catch (e) {
      log("$e");
    } finally {
      isLoading.value = false;
    }
  }

  final Map<String, String> categoryImages = {
    "business": "assets/common/business.jpg",
    "change": "assets/common/change.jpg",
    "education": "assets/common/education.jpg",
    "friendship": "assets/common/friendship.jpg",
    "happiness": "assets/common/happiness.jpg",
    "inspirational": "assets/common/courage.png",
    "love": "assets/common/love.jpg",
    "famous quotes": "assets/common/famous_quotes.jpg",
    "wisdom": "assets/common/wisdom.jpg",
    "famous-quotes": "assets/common/famous_quotes.jpg",
    "age": "assets/common/age.png",
    "athletics": "assets/common/athletics.png",
    "competition": "assets/common/competition.png",
    "courage": "assets/common/courage.png",
    "creativity": "assets/common/creativity.png",
    "faith": "assets/common/faith.png",
    "failure": "assets/common/failure.png",
    "film": "assets/common/flim.png",
    "future": "assets/common/future.jpg",
    "family": "assets/common/family.png",
    "generosity": "assets/common/generosity.png",
    "genius": "assets/common/genius.png",
    "gratitude": "assets/common/gratitude.png",
    "health": "assets/common/health.png",
    "history": "assets/common/history.png",
    "humor": "assets/common/humor.png",
    "imagination": "assets/common/imagination.png",
    "knowledge": "assets/common/knowledge.png",
    "life": "assets/common/life.png",
    "literature": "assets/common/literature.png",
    "mathematics": "assets/common/math.png",
    "motivational": "assets/common/motivational.png",
    "humorous": "assets/common/humor.png",
    "religion": "assets/common/religions.png",
    "self": "assets/common/self.png",
    "success": "assets/common/success.png",
    "truth": "assets/common/truth.png",
    "sports": "assets/common/sports.png",
    "science": "assets/common/science.png",
    "technology": "assets/common/technology.png",
    "philosophy": "assets/common/philosophy.png",
    "politics": "assets/common/politics.png",
    "character": "assets/common/character.jpg",
    "freedom": "assets/common/freedom.jpg",
    "honor": "assets/common/honor.jpg",
    "self-help": "assets/common/self-help.jpg",
    "virtue": "assets/common/virtue.jpg"
  //8888888888888888888888888888888888888888888888888888888

    // "conservative": "assets/common/conservative.png",

    // "honor": "assets/common/honor.png",

    // "leadership": "assets/common/leadership.png",

    // "nature": "assets/common/nature.png",
    // "opportunity": "assets/common/opportunity.png",
    // "pain": "assets/common/pain.png",
    // "perseverance": "assets/common/perseverance.png",

    // "power-quotes": "assets/common/power-quotes.png",
    // "proverb": "assets/common/proverb.png",
    // "self-help": "assets/common/self-help.png",

    // "sadness": "assets/common/sadness.png",

    // "social-justice": "assets/common/social-justice.png",
    // "society": "assets/common/society.png",
    // "spirituality": "assets/common/spirituality.png",

    // "stupidity": "assets/common/stupidity.png",

    // "time": "assets/common/time.png",
    // "tolerance": "assets/common/tolerance.png",

    // "virtue": "assets/common/virtue.png",
    // "war": "assets/common/war.png",
    // "weakness": "assets/common/weakness.png",
    // "wellness": "assets/common/wellness.png",
    // "work": "assets/common/work.png"
  };
}
