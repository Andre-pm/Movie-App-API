import 'package:app_movies/src/presentation/ui/movies/widgets/body_movie.dart';
import 'package:app_movies/src/presentation/ui/movies/widgets/drawer_movies.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../riverpod/movies/movies_provider.dart';

class MoviesPage extends HookConsumerWidget {
  MoviesPage({Key? key}) : super(key: key);
  final colorList = <Color>[
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesNotifierProvider);

    return Scaffold(
      drawer: const DrawerMovies(),
      appBar: (AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
        title: const Text(
          'Movies App',
          style: TextStyle(color: Colors.white),
        ),
      )),
      body: BodyMovie(movies: movies),
    );
  }
}
