import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/constants/icons.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    super.key,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late YoutubePlayerController _controller;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'abPmZCZZrFA', // Extracted from the URL
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(() {
        setState(() {
          if (_controller.value.isPlaying) {
            controls = GestureDetector(
              onTap: () {
                _controller.pause();
              },
              child: Image.asset(
                icPause,
                height: 50,
              ),
            );
          } else if (_controller.value.playerState == PlayerState.ended) {
            controls = GestureDetector(
              onTap: () {
                _controller.play();
              },
              child: Image.asset(
                icLearning,
                height: 50,
              ),
            );
          } else {
            controls = GestureDetector(
              onTap: () {
                _controller.play();
              },
              child: Image.asset(
                icLearning,
                height: 50,
              ),
            );
          }
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [controls ?? Container()],
            ),
          ),
        ],
      ),
    );
  }
}
