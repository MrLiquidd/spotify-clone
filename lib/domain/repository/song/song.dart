import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSong(String sondId);
  Future<bool> isFavoriteSong(String sondId);
  Future<Either> getUserFavoriteSongs();
}
