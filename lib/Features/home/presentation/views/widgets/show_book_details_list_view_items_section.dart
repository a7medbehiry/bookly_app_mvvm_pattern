import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_details_list_view_items.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ShowBookDetailsListViewItemsSection extends StatelessWidget {
  const ShowBookDetailsListViewItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const CustomBookDetailsListViewItems(),
      ],
    );
  }
}
