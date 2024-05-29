import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class CountdownWidget extends StatefulWidget {
  final Function() onZeroReached;

  CountdownWidget({required this.onZeroReached});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int _countdown = 20;
  late Timer _timer;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
          if (_countdown <= 5) {
            _audioPlayer.setPlaybackRate(0.5);
            _audioPlayer.play(
              AssetSource("tt.mp3"),
            );
          }
        } else {
          _timer.cancel();
          widget.onZeroReached();
          _audioPlayer.stop();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor =
        _countdown <= 5 && _countdown > 0 ? Colors.red : Colors.black;

    return Text(
      '$_countdown',
      style: TextStyle(fontSize: 48.0, color: textColor),
    );
  }
}
