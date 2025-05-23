import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedMoviesProvider =
    StateNotifierProvider<SearchMoviesProvider, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchMoviesProvider(
    searchMovies: movieRepository.searchMovies,
    ref: ref,
  );
});

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMoviesProvider extends StateNotifier<List<Movie>> {
  final SearchMoviesCallBack searchMovies;
  final Ref ref;

  SearchMoviesProvider({
    required this.searchMovies,
    required this.ref,
  }) : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
