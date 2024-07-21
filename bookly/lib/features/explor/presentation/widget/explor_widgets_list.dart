import 'dart:async';

import 'package:bookly/core/utiles/api_service.dart';
import 'package:bookly/features/explor/data/book_model/book_model.dart';
import 'package:bookly/features/explor/presentation/widget/book_widget.dart';
import 'package:bookly/features/explor/presentation/widget/explor_widget.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../../core/utiles/errors/filar.dart';
import '../../data/book_model/repo/explor_repo_impl.dart';

class ExplorWidgetsList extends StatefulWidget {
  const ExplorWidgetsList({super.key});

  @override
  State<ExplorWidgetsList> createState() => _ExplorWidgetsListState();
}

class _ExplorWidgetsListState extends State<ExplorWidgetsList> {
  ExplorRepoImpl explorRepoImpl = ExplorRepoImpl(ApiService(dio: Dio()));
  late Future<dartz.Either<Failure, List<BookModel>>> bookFuture;

  @override
  void initState() {
    super.initState();
    bookFuture = explorRepoImpl.featchAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dartz.Either<Failure, List<BookModel>>>(
        future: bookFuture,
        builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator(),);
      }else if (snapshot.hasError)
        {
          return Center(child: Text("Error: ${snapshot.error}"),);
        }
      else if (snapshot.hasData)
        {
          return snapshot.data!.fold((failure)=> Text("Error: ${failure.toString()}"),
                  (book)=> SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExplorWidget(bigImage: book[index].volumeInfo?.imageLinks!.thumbnail, bookModel: book[index],),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: book.length,
                ),
              )
          );
        }else
          {
            return Center(child: Text("No Book Found"));
          }
    });
  }
}
class NewestBook extends StatelessWidget {
  const NewestBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "Newest Books",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  ExplorRepoImpl explorRepoImpl = ExplorRepoImpl(ApiService(dio: Dio()));
  late Future<dartz.Either<Failure, List<BookModel>>> bookFuture;

  @override
  void initState() {
    super.initState();
    bookFuture = explorRepoImpl.featchAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dartz.Either<Failure, List<BookModel>>>(future: bookFuture, builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }else if (snapshot.hasError)
        {
          return Center(child: Text("Error: ${snapshot.error}"),);
        }
      else if (snapshot.hasData)
        {
          return snapshot.data!.fold(
              (failure)=> Text("Error: ${failure.toString()}"),
                  (book)=> SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index){
                        return BookWidget(smallImage: book[index].volumeInfo?.imageLinks!.smallThumbnail!, titleOfBook: book[index].volumeInfo?.title, nameOfAuther: book[index].volumeInfo!.authors?[0]);
                      },
                      itemCount: book.length,
                    ),
                  ),
          );
        }
      else
        {
          return Center(child: Text("No Books Found"),);
        }
    });
  }
}
//BookWidget(smallImage: book[index].volumeInfo?.imageLinks!.smallThumbnail!, titleOfBook: book[index].volumeInfo?.title, nameOfAuther: book[index].volumeInfo!.authors?[0])