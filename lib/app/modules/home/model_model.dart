class Model {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Model(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Model.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (data != null) {
      // data['data'] = data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links?.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Data {
  int? id;
  String? pawari;
  String? pawariHinglish;
  String? hindi;
  String? hindiHinglish;
  String? english;
  String? pawariSentence;
  String? hindiSentence;
  String? englishSentence;
  String? wordType1;
  String? wordType2;
  dynamic wordType3;
  dynamic synonyms;
  dynamic antonyms;
  dynamic tags;
  String? details;
  dynamic pronounciation;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.pawari,
      this.pawariHinglish,
      this.hindi,
      this.hindiHinglish,
      this.english,
      this.pawariSentence,
      this.hindiSentence,
      this.englishSentence,
      this.wordType1,
      this.wordType2,
      this.wordType3,
      this.synonyms,
      this.antonyms,
      this.tags,
      this.details,
      this.pronounciation,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pawari = json['pawari'];
    pawariHinglish = json['pawari_hinglish'];
    hindi = json['hindi'];
    hindiHinglish = json['hindi_hinglish'];
    english = json['english'];
    pawariSentence = json['pawari_sentence'];
    hindiSentence = json['hindi_sentence'];
    englishSentence = json['english_sentence'];
    wordType1 = json['word_type1'];
    wordType2 = json['word_type2'];
    wordType3 = json['word_type3'];
    synonyms = json['synonyms'];
    antonyms = json['antonyms'];
    tags = json['tags'];
    details = json['details'];
    pronounciation = json['pronounciation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['pawari'] = pawari;
    data['pawari_hinglish'] = pawariHinglish;
    data['hindi'] = hindi;
    data['hindi_hinglish'] = hindiHinglish;
    data['english'] = english;
    data['pawari_sentence'] = pawariSentence;
    data['hindi_sentence'] = hindiSentence;
    data['english_sentence'] = englishSentence;
    data['word_type1'] = wordType1;
    data['word_type2'] = wordType2;
    data['word_type3'] = wordType3;
    data['synonyms'] = synonyms;
    data['antonyms'] = antonyms;
    data['tags'] = tags;
    data['details'] = details;
    data['pronounciation'] = pronounciation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
