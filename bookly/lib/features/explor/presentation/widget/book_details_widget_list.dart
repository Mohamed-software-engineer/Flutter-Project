import 'package:bookly/features/explor/presentation/widget/book_details_widget.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/utiles/api_service.dart';
import '../../../../core/utiles/errors/filar.dart';
import '../../data/book_model/book_model.dart';
import '../../data/book_model/repo/explor_repo_impl.dart';

class BookDetailsWidgetList extends StatefulWidget {
  const BookDetailsWidgetList({super.key, required bigImage});

  @override
  State<BookDetailsWidgetList> createState() => _BookDetailsWidgetListState();
}

class _BookDetailsWidgetListState extends State<BookDetailsWidgetList> {
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
      if(snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(),);
        }else if (snapshot.hasError)
          {
            return Center(child: Text("Error: ${snapshot.error}"),);
          }
      else if (snapshot.hasData)
        {
          return snapshot.data!.fold(
              (failure)=> Text("Error: ${failure.toString()}")
          , (book)=>SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaybeLike(bigImage: book[index].volumeInfo?.imageLinks!.smallThumbnail, bookModel: book[index],),
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
        }
      else {
        return Center(child: Text("No Books Found"),);
      }
    });
  }
}
