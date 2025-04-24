import 'package:cinemapedia/infrastructure/datasource/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



//Este repositorio es inmutable (solo lectura)

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMoviedbDatasource());
});
