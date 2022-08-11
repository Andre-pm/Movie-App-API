import 'package:app_movies/src/domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase_imp.dart';
import 'package:app_movies/src/presentation/riverpod/movies/movies_notifier.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider((ref) => Dio());

final moviesUsecaseProvider = Provider((ref) {
  return GetAllTrendingMoviesUsecaseImp(_repository);
});

final MoviesNotifierProvider = StateNotifierProvider((ref) {
  return MoviesNotifier(ref.watch(moviesUsecaseProvider));
});
