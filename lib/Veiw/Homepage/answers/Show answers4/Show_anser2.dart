import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers4/Show%20anser3.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:restaurant_project/json/Lists/List%20of%20questions/fourlist.dart';
import 'package:restaurant_project/json/Lists/Lists%20of%20wrong%20answers/fourlist.dart';
import 'package:restaurant_project/widget/Sections/Contaner.dart';

import '../../../../widget/Sections/MaterialButton.dart';

class PageWithContainers2S4 extends StatefulWidget {
  @override
  _PageWithContainers2S4State createState() => _PageWithContainers2S4State();
}

class _PageWithContainers2S4State extends State<PageWithContainers2S4> {
  String? selectedText;
  List<String> answersSubset = fakeAnswers3[1];
  List<String> question = questions3[1];
  String correct1 = "معاذ بن جبل";

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
              if (selectedText != null && selectedText == correct1) {
                controller.correctAnswer();
              } else if (selectedText == null) {
                controller.Null();
              } else {
                controller.wrongAnswer();
              }
              Future.delayed(Duration(milliseconds: 1000), () {
                Get.offAll(PageWithContainers3S4());
              });
            },
            text: "موافق",
          )
        ],
      ),
    );
  }
}
