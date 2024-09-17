import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/core/constants/app_urls.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/news_songs_bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/home/bloc/news_songs_bloc/news_songs_state.dart';
import 'package:spotify/presentation/song_player/pages/song_player.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
              if (state is NewsSongsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is NewsSongsLoadFailure) {
                return const Center(child: Text('Error loading news songs.'));
              }
              if (state is NewsSongsLoaded) {
                return _songs(state.songs);
              }
              return Container();
            },
          )),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: songs.length,
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SongPlayerPage(
                    songEntity: songs[index],
                  ),
                ),
              );
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${AppUrls.coverFirestorage}${songs[index].artist} - ${songs[index].title}.jpeg?${AppUrls.mediaAlt}'),
                      )),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(10, 10, 0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode
                              ? AppColors.darkGrey
                              : const Color(0xffE6E6E6)),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.isDarkMode
                            ? const Color(0xff959595)
                            : const Color(0xff555555),
                      ),
                    ),
                  ),
                )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  songs[index].title,
                  style:
                      const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  songs[index].artist,
                  style:
                      const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
