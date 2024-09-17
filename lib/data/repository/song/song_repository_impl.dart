import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/songs/song_firebase_service.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
  
  @override
  Future<Either> getPlayList() async{
    return await sl<SongFirebaseService>().getPlayList();
  }
  
  @override
  Future<Either> addOrRemoveFavoriteSong(String sondId) async{
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSongs(sondId);
  }
  
  @override
  Future<bool> isFavoriteSong(String sondId) async{
     return await sl<SongFirebaseService>().isFavoriteSong(sondId);
  }
  
  @override
  Future<Either> getUserFavoriteSongs() async{
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }
}
