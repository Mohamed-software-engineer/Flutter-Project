import 'package:bookly/core/utiles/api_service.dart';
import 'package:bookly/core/utiles/errors/filar.dart';
import 'package:bookly/features/explor/data/book_model/book_model.dart';
import 'package:bookly/features/explor/data/book_model/repo/explor_repo.dart';
import 'package:dartz/dartz.dart';

class ExplorRepoImpl implements ExplorRepo{
  ApiService apiService;
  ExplorRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> featchAllBooks() async {
    List<BookModel> book = [];
      try {
        var newData = await apiService.get(endPoints: "volumes?q=subject:&Filtering=free-ebooks"); //newdata = response.data

        for (var i in newData["items"])
        {
          book.add(BookModel.fromJson(i));
        }
        return right(book);
      } catch (e) {
        return left(ServerError(e.toString()));
      }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchNewestBooks() async {
    List<BookModel> book = [];
    try {
      var newData = await apiService.get(endPoints: "volumes?q=subject:&Filtering=free-ebooks"); //newdata = response.data

      for (var i in newData["items"])
      {
        book.add(BookModel.fromJson(i));
      }
      return right(book);
    } catch (e) {
      return left(ServerError(e.toString()));
    }
  }
}