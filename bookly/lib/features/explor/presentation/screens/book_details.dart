import 'package:bookly/features/explor/presentation/widget/book_details_widget.dart';
import 'package:bookly/features/explor/presentation/widget/book_details_widget_list.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Color(0xff100B20),
      appBar: AppBar(
        backgroundColor: Color(0xff100B20),
        actions: [
          Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 17,),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: BookDetailsWidget(bigImage: data["bigImage"], titleOfBook: data["titleOfBook"], nameOfAuther: data["nameOfAuther"]),),
          SliverToBoxAdapter(child: Button(),),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text("You can also like", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),),
              ]
            ),
          ),
          SliverToBoxAdapter(child: BookDetailsWidgetList(bigImage: data["bigImage"],),)
        ],
      ),
    );
  }
}
