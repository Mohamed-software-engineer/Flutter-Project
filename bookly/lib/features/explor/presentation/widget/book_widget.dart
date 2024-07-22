import 'dart:math';
import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final String? smallImage;
  final String? titleOfBook;
  final String? nameOfAuther;
  const BookWidget({super.key, required this.smallImage, required this.titleOfBook, required this.nameOfAuther,});
  @override
  Widget build(BuildContext context) {
    double rate = Random().nextDouble() * 4;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, "BookDetails", arguments: {
          "bigImage": smallImage,
          "titleOfBook": titleOfBook,
          "nameOfAuther": nameOfAuther,
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  smallImage!,
                  height: 100,
                  width: 64,
                  fit: BoxFit.contain,
                )),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleOfBook!,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    nameOfAuther!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
