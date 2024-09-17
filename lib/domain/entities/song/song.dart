import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String songId;
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDay;
  final bool isFavorite;

  SongEntity({
    required this.songId,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDay,
    required this.isFavorite
  });
}
