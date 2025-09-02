class Tags {
  String? sId;
  String? name;
  String? slug;
  int? quoteCount;
  String? dateAdded;
  String? dateModified;

  Tags(
      {this.sId,
      this.name,
      this.slug,
      this.quoteCount,
      this.dateAdded,
      this.dateModified});

  Tags.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    quoteCount = json['quoteCount'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['quoteCount'] = this.quoteCount;
    data['dateAdded'] = this.dateAdded;
    data['dateModified'] = this.dateModified;
    return data;
  }
}
