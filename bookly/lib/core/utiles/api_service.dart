import 'package:bookly/features/explor/data/book_model/book_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiService {
  final Dio dio;
  String baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService({required this.dio});

  get({required String endPoints}) async {
    Response response = await dio.get("$baseUrl$endPoints)");
    // List<dynamic> books = response.data["items"];
    // List<BookModel> bookObject = [];
    //
    // for (var i in books)
    //   {
    //     BookModel objcet = BookModel.fromJson(i);
    //     bookObject.add(objcet);
    //   }
    return response.data;
  }
}
