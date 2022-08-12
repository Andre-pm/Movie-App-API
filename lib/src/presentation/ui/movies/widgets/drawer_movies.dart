import 'package:app_movies/src/presentation/riverpod/movies/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerMovies extends HookConsumerWidget {
  const DrawerMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Text(
              'Trend',
              style: TextStyle(fontSize: 95),
            ),
          ),
          ListTile(
            title: const Text('Trazer filmes diários'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('day');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Trazer filmes semanais'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('week');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
