import 'package:bookly/features/explor/data/book_model/book_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExplorWidget extends StatelessWidget {
  String? bigImage;
  BookModel bookModel = BookModel();
   ExplorWidget({super.key, required this.bigImage, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, "BookDetails", arguments: {
          "bigImage": bigImage,
          "titleOfBook": bookModel.volumeInfo!.title,
          "nameOfAuther": bookModel.volumeInfo!.authors?[0],
        });
      },
      child: Container(
        width: 150,
        height: 224,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(bigImage!),
            fit: BoxFit.fill,
          )
          ),
      ),
    );
  }
}


/*ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: imageOpject != null ? Image.asset(
            "images/nullImage.jpg",
            height: 128,
            width: 128,
            fit: BoxFit.contain,):
              Image.asset("images/nullImage.jpg",
                height: 128,
                width: 128,
                fit: BoxFit.contain,),
      ),*/