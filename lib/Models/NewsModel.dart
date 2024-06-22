
class NewsModel {

    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    String? publishedAt;
    String? content;
  NewsModel({
      this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if(json["source"] is Map) {
      source = json["source"] == null ? null : Source.fromJson(json["source"]);
    }
    if(json["author"] is String) {
      author = json["author"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }

    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["url"] is String){
      url = json["url"];
    }
    if(json["urlToImage"] is String){
      urlToImage = json["urlToImage"];
    }
    if(json["publishedAt"] is String) {
      publishedAt = json["publishedAt"];
    }
    if(json["content"] is String) {
      content = json["content"];
    }
  }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> _data = <String, dynamic>{};
      if (source != null) {
        _data['source'] = source?.toJson();
      }
      _data['author'] = author;
      _data['title'] = title;
      _data['description'] = description;
      _data['url'] = url;
      _data['urlToImage'] = urlToImage;
      _data['publishedAt'] = publishedAt;
      _data['content'] = content;
      return _data;
    }
  }
  class Source {
    String? id;
    String? name;

    Source({
      this.id,
      this.name,});

    Source.fromJson(Map<String, dynamic> json) {
      if(json["id"] is String) {
        id = json["id"];
      }
      if(json["name"] is String) {
        name = json["name"];
      }
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> _data = <String, dynamic>{};
      _data['id'] = id;
      _data['name'] = name;
      return _data;
    }

}