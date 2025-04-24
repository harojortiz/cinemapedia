

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/movidedb/credits_response.dart';



class ActorMapper {
  static Actor castToEntity(Cast cast) => 
  Actor(
    id: cast.id,
    name: cast.name,
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://www.shutterstock.com/shutterstock/photos/1760295569/display_1500/stock-vector-profile-picture-avatar-icon-vector-1760295569.jpg',
    character: cast.character ?? 'Unknown'
    );
}
