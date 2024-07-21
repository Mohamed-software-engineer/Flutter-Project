import 'package:bookly/features/explor/data/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/utiles/errors/filar.dart';

abstract class ExplorRepo{
  Future<Either<Failure, List<BookModel>>> featchAllBooks();
  Future<Either<Failure, List<BookModel>>> featchNewestBooks();
}