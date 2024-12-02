List<Quotes> quotesFromJson(List<dynamic> quotesJson) => List<Quotes>.from(
    quotesJson.map((quotesJson) => Quotes.fromJson(quotesJson)));

class Quotes {
  String? quote;
  String? author;
  String? category;

  Quotes({this.quote, this.author, this.category});

  Quotes.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    author = json['author'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quote'] = quote;
    data['author'] = author;
    data['category'] = category;
    return data;
  }
}
