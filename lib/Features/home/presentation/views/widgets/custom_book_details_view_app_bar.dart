import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsViewAppBar extends StatelessWidget {
  const CustomBookDetailsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            size: 28,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            size: 28,
          ),
        ),
      ],
    );
  }
}
