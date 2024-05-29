import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_project/Veiw/Homepage/Home_Page.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:restaurant_project/widget/Sections/costombutton.dart';
import 'package:confetti/confetti.dart';

class ResultsPage extends StatelessWidget {
  final Verifications verifications = Get.put(Verifications());
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    Color starColor1;
    Color starColor2;
    Color starColor3;
    final _audioPlayer = AudioPlayer();

    if (verifications.correctCount >= 0 && verifications.correctCount <= 3) {
      starColor1 = Colors.grey;
      starColor2 = Colors.grey;
      starColor3 = Colors.grey;
    } else if (verifications.correctCount >= 4 &&
        verifications.correctCount <= 5) {
      starColor1 = Colors.yellow;
      starColor2 = Colors.grey;
      starColor3 = Colors.grey;
    } else if (verifications.correctCount >= 6 &&
        verifications.correctCount <= 8) {
      starColor1 = Colors.yellow;
      starColor2 = Colors.yellow;
      starColor3 = Colors.grey;
    } else {
      starColor1 = Colors.yellow;
      starColor2 = Colors.yellow;
      starColor3 = Colors.yellow;
    }

    if (verifications.correctCount >= 9 && verifications.correctCount <= 10) {
      _confettiController.play();
    }
    if (verifications.correctCount >= 0 && verifications.correctCount <= 6) {
      _audioPlayer.setPlaybackRate(0.5);
      _audioPlayer.play(
        AssetSource("Lose sound effects.mp3"),
      );
    }
    if (verifications.correctCount == 10) {
      verifications.list();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Results Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 70, left: 18, right: 18),
                child: const Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100,
                    ),
                    Spacer(),
                    Icon(
                      Icons.cancel,
                      size: 100,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${verifications.correctCount}',
                            style: const TextStyle(fontSize: 70),
                          ),
                          const Spacer(),
                          Text(
                            '${verifications.wrongCount}',
                            style: const TextStyle(fontSize: 70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: starColor1,
                    size: 100,
                  ),
                  Icon(
                    Icons.star,
                    color: starColor2,
                    size: 100,
                  ),
                  Icon(
                    Icons.star,
                    color: starColor3,
                    size: 100,
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(bottom: 40, right: 15, left: 15),
                width: double.infinity,
                child: CustomAuthButton(
                  onPressed: () {
                    verifications.correctCount = 0;
                    verifications.wrongCount = 0;
                    Get.offAll(Home_Page());
                  },
                  title: "المستوي التالي",
                  icon: Icons.drive_file_move_rtl_outlined,
                  color: Colors.green,
                  margin: const EdgeInsets.only(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20, right: 15, left: 15),
                width: double.infinity,
                child: CustomAuthButton(
                  onPressed: () {
                    verifications.correctCount = 0;
                    verifications.wrongCount = 0;

                    Get.offAll(Home_Page());
                  },
                  title: "محاوله مره اخرا؟",
                  icon: Icons.refresh_outlined,
                  color: Colors.red,
                  margin: const EdgeInsets.only(),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.5,
                colors: const [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.purple,
                  Colors.orange,
                  Colors.pink,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
