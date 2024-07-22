import 'package:bookly/features/explor/presentation/widget/explor_widgets_list.dart';
import 'package:flutter/material.dart';

class ExplorScreen extends StatefulWidget {
  const ExplorScreen({super.key});

  @override
  State<ExplorScreen> createState() => _ExplorScreenState();
}

class _ExplorScreenState extends State<ExplorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Row(
            children: [
              const Image(
                image: AssetImage("images/Logo.png"),
                width: 75,
                height: 16.11,
              ),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.search, color: Colors.white,))
            ],
          ),
          backgroundColor: const Color(0xff100B20),
        ),
        backgroundColor: const Color(0xff100B20),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: [
              SliverToBoxAdapter(child: ExplorWidgetsList(),),
              SliverToBoxAdapter(child: NewestBook(),),
              SliverToBoxAdapter(child: BookList(),)
            ],
          ),
        ),
    );
  }
}
