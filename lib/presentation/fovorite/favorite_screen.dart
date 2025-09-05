import 'package:flutter/material.dart';

import '../account/wigets/custom_background.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body:BackgroundGradient(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.favorite_border,
                size: 80,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                'No favorites yet',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
