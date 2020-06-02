class Book {
  String title;
  String writer;
  String synopsis;
  String urlCover;
  String urlReview;
  String latitude;
  String longitude;
  String createdDate;
  String id;

  Book(
      {this.title,
      this.writer,
      this.synopsis,
      this.urlCover,
      this.urlReview,
      this.latitude,
      this.longitude,
      this.createdDate,
      this.id});

  Book.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    writer = json['writer'];
    synopsis = json['synopsis'];
    urlCover = json['urlCover'];
    urlReview = json['urlReview'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdDate = json['createdDate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['writer'] = this.writer;
    data['synopsis'] = this.synopsis;
    data['urlCover'] = this.urlCover;
    data['urlReview'] = this.urlReview;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['createdDate'] = this.createdDate;
    data['id'] = this.id;
    return data;
  }
}
