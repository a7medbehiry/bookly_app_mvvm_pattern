import 'package:bookly_app/Features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_newest_books_view_items.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_list_view_items.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeViewAppBar(),
              CustomListViewItems(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: CustomNewestBooksListViewItems(),
          ),
        ),
      ],
    );
  }
}
