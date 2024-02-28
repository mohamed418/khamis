import 'package:flutter/material.dart';

class FavouritesWidget extends StatelessWidget {
  const FavouritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Favourites',
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
