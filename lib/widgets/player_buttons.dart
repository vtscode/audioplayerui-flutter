import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.audioplayer,
  });

  final AudioPlayer audioplayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioplayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed:
                  audioplayer.hasPrevious ? audioplayer.seekToPrevious : null,
              iconSize: 45.0,
              icon: const Icon(
                Icons.skip_previous,
                color: Colors.white,
              ),
            );
          },
        ),
        StreamBuilder<PlayerState>(
          stream: audioplayer.playerStateStream,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = playerState!.processingState;

              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  width: 64.0,
                  height: 64.0,
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                );
              } else if (!audioplayer.playing) {
                return IconButton(
                  onPressed: audioplayer.play,
                  iconSize: 75,
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: audioplayer.pause,
                  iconSize: 75,
                  icon: const Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                  ),
                );
              } else {
                return IconButton(
                  onPressed: () => audioplayer.seek(Duration.zero,
                      index: audioplayer.effectiveIndices!.first),
                  iconSize: 75,
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: Colors.white,
                  ),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        StreamBuilder<SequenceState?>(
          stream: audioplayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: audioplayer.hasNext ? audioplayer.seekToNext : null,
              iconSize: 45.0,
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
            );
          },
        ),
      ],
    );
  }
}
