import 'dart:convert';

import 'package:books/models/BuyLinks.dart';
import 'package:http/http.dart' as http;

class Books {
  String ageGroup;
  String amazonProductUrl;
  String articleChapterLink;
  String author;
  String bookImage;
  int bookImageWidth;
  int bookImageHeight;
  String bookReviewLink;
  String contributor;
  String contributorNote;
  String createdDate;
  String description;
  String firstChapterLink;
  int price;
  String primaryIsbn10;
  String primaryIsbn13;
  String bookUri;
  String publisher;
  int rank;
  int rankLastWeek;
  String sundayReviewLink;
  String title;
  String updatedDate;
  int weeksOnList;
  List<BuyLinks> buyLinks;

  Books(
      {this.ageGroup,
      this.amazonProductUrl,
      this.articleChapterLink,
      this.author,
      this.bookImage,
      this.bookImageWidth,
      this.bookImageHeight,
      this.bookReviewLink,
      this.contributor,
      this.contributorNote,
      this.createdDate,
      this.description,
      this.firstChapterLink,
      this.price,
      this.primaryIsbn10,
      this.primaryIsbn13,
      this.bookUri,
      this.publisher,
      this.rank,
      this.rankLastWeek,
      this.sundayReviewLink,
      this.title,
      this.updatedDate,
      this.weeksOnList,
      this.buyLinks});

  Books.fromJson(Map<String, dynamic> json) {
    ageGroup = json['age_group'];
    amazonProductUrl = json['amazon_product_url'];
    articleChapterLink = json['article_chapter_link'];
    author = json['author'];
    bookImage = json['book_image'];
    bookImageWidth = json['book_image_width'];
    bookImageHeight = json['book_image_height'];
    bookReviewLink = json['book_review_link'];
    contributor = json['contributor'];
    contributorNote = json['contributor_note'];
    createdDate = json['created_date'];
    description = json['description'];
    firstChapterLink = json['first_chapter_link'];
    price = json['price'];
    primaryIsbn10 = json['primary_isbn10'];
    primaryIsbn13 = json['primary_isbn13'];
    bookUri = json['book_uri'];
    publisher = json['publisher'];
    rank = json['rank'];
    rankLastWeek = json['rank_last_week'];
    sundayReviewLink = json['sunday_review_link'];
    title = json['title'];
    updatedDate = json['updated_date'];
    weeksOnList = json['weeks_on_list'];
    if (json['buy_links'] != null) {
      buyLinks = new List<BuyLinks>();
      json['buy_links'].forEach((v) {
        buyLinks.add(new BuyLinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age_group'] = this.ageGroup;
    data['amazon_product_url'] = this.amazonProductUrl;
    data['article_chapter_link'] = this.articleChapterLink;
    data['author'] = this.author;
    data['book_image'] = this.bookImage;
    data['book_image_width'] = this.bookImageWidth;
    data['book_image_height'] = this.bookImageHeight;
    data['book_review_link'] = this.bookReviewLink;
    data['contributor'] = this.contributor;
    data['contributor_note'] = this.contributorNote;
    data['created_date'] = this.createdDate;
    data['description'] = this.description;
    data['first_chapter_link'] = this.firstChapterLink;
    data['price'] = this.price;
    data['primary_isbn10'] = this.primaryIsbn10;
    data['primary_isbn13'] = this.primaryIsbn13;
    data['book_uri'] = this.bookUri;
    data['publisher'] = this.publisher;
    data['rank'] = this.rank;
    data['rank_last_week'] = this.rankLastWeek;
    data['sunday_review_link'] = this.sundayReviewLink;
    data['title'] = this.title;
    data['updated_date'] = this.updatedDate;
    data['weeks_on_list'] = this.weeksOnList;
    if (this.buyLinks != null) {
      data['buy_links'] = this.buyLinks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
