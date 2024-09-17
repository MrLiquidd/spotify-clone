import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
  String? songId;
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDay;
  bool? isFavorite;

  SongModel({
    required this.songId,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDay,
    required this.isFavorite,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    songId = data['songId'];
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDay = data['releaseDay'];
    isFavorite = data['isFavorite'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      songId: songId!,
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDay: releaseDay!,
      isFavorite: isFavorite!,
    );
  }
}
