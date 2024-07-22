import 'dart:math';
import 'package:flutter/material.dart';

import '../../data/book_model/book_model.dart';

class BookDetailsWidget extends StatefulWidget {
  BookDetailsWidget({super.key, required this.bigImage, required this.titleOfBook, required this.nameOfAuther});
  final String bigImage;
  final String titleOfBook;
  final String nameOfAuther;

  @override
  State<BookDetailsWidget> createState() => _BookDetailsWidgetState();
}

class _BookDetailsWidgetState extends State<BookDetailsWidget> {
  double rate = Random().nextDouble() * 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              width: 162,
              height: 243,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(widget.bigImage),
                  fit: BoxFit.fill,
                )
              ),
            ),
          ),
          SizedBox(height: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.titleOfBook,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.nameOfAuther,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Free",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffFFDD4F),
                    size: 20,
                  ),
                  Text(
                    "${rate.ceilToDouble()}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}
class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Center(child: Text("Free", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),)),
            ),
            Container(
              width: 150,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                color: Color(0xffEF8262),
              ),
              child: Center(child: Text("Free preview", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}

class MaybeLike extends StatefulWidget {
  MaybeLike({super.key, required this.bigImage, required this.bookModel});
  final String? bigImage;
  BookModel bookModel = BookModel();

  @override
  State<MaybeLike> createState() => _MaybeLikeState();
}

class _MaybeLikeState extends State<MaybeLike> {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()
      {
        Navigator.pushNamed(context, "BookDetails", arguments: {
          "bigImage": widget.bigImage,
          "titleOfBook": widget.bookModel.volumeInfo!.title,
          "nameOfAuther": widget.bookModel.volumeInfo!.authors?[0],
        });
      },
      child: Container(
        width: 70,
        height: 112,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.bigImage!),
              fit: BoxFit.fill,
            )
        ),
      ),
    );
  }
}

