import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant_project/json/Lists/List%20of%20questions/Twolist.dart';
import 'package:restaurant_project/json/Lists/Lists%20of%20wrong%20answers/Twolist.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers2/Show%20anser8%20in2.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:restaurant_project/widget/Sections/Contaner.dart';
import 'package:restaurant_project/widget/Sections/MaterialButton.dart';

import '../../../../widget/Sections/time.dart';

class PageWithContainers7S2 extends StatefulWidget {
  @override
  _PageWithContainers7S2State createState() => _PageWithContainers7S2State();
}

class _PageWithContainers7S2State extends State<PageWithContainers7S2> {
  String? selectedText;
  List<String> answersSubset = fakeAnswers1[6];
  List<String> question = questions1[6];
  String correct = "النصاري";

  @override
  Widget build(BuildContext context) {
    Verifications controller = Get.put(Verifications());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 51, 51),
      appBar: AppBar(
        title: const Text(
          "أجِبْ على الأسئِلة الآتِيَة",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          CountdownWidget(
            onZeroReached: () {
              controller.wrongAnswer();

              Future.delayed(const Duration(milliseconds: 1000), () {
                Get.offAll(PageWithContainers8S2());
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  question[0],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: answersSubset.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      horizontalOffset: 50.0,
                      curve: Curves.easeInOutBack,
                      child: FadeInAnimation(
                        child: MyContainer(
                          text: answersSubset[index],
                          selectedItems: [selectedText ?? ''],
                          onSelect: (selectedItem) {
                            setState(() {
                              selectedText = selectedItem;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          MaterialButtoN(
            ontape: () {
              if (selectedText != null && correct.contains(selectedText!)) {
                controller.correctAnswer();
              } else if (selectedText == null) {
                controller.Null();
              } else {
                controller.wrongAnswer();
              }
              Future.delayed(const Duration(milliseconds: 1000), () {
                Get.offAll(PageWithContainers8S2());
              });
            },
            text: "موافق",
          )
        ],
      ),
    );
  }
}
