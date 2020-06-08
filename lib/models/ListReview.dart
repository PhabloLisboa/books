import 'dart:convert';

import 'package:books/models/Book.dart';
import 'package:http/http.dart' as http;

class ListReview {
  int listId;
  String listName;
  String listNameEncoded;
  String displayName;
  String updated;
  String listImage;
  int listImageWidth;
  int listImageHeight;
  List<Books> books;

  ListReview(
      {this.listId,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.listImage,
      this.listImageWidth,
      this.listImageHeight,
      this.books});

  ListReview.fromJson(Map<String, dynamic> json) {
    listId = json['list_id'];
    listName = json['list_name'];
    listNameEncoded = json['list_name_encoded'];
    displayName = json['display_name'];
    updated = json['updated'];
    listImage = json['list_image'];
    listImageWidth = json['list_image_width'];
    listImageHeight = json['list_image_height'];
    if (json['books'] != null) {
      books = new List<Books>();
      json['books'].forEach((v) {
        books.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list_id'] = this.listId;
    data['list_name'] = this.listName;
    data['list_name_encoded'] = this.listNameEncoded;
    data['display_name'] = this.displayName;
    data['updated'] = this.updated;
    data['list_image'] = this.listImage;
    data['list_image_width'] = this.listImageWidth;
    data['list_image_height'] = this.listImageHeight;
    if (this.books != null) {
      data['books'] = this.books.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<List<ListReview>> getAll() async {
    final response = await http.get(
        "https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=AAqALNu0rtPYBeFpPHXKWcX22kb6qTO5");

    Map decoded = jsonDecode(response.body);
    List<ListReview> reviwesList = decoded["results"]["lists"]
        .map<ListReview>((list) => ListReview.fromJson(list))
        .toList();

    return reviwesList;
  }
}
