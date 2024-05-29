import 'package:flutter/material.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers1/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers10/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers2/Show%20answers%20page1%20in2.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers3/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers4/Show_anser2.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers5/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers6/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers7/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers8/Show%20answers%20page1.dart';
import 'package:restaurant_project/Veiw/Homepage/answers/Show%20answers9/Show%20answers%20page1.dart';
import 'package:restaurant_project/controller/answersSubset/IconButtton.dart';
import 'package:restaurant_project/widget/Sections/%D9%90appbar.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int sum = 0;
  final Verifications verifications = Get.put(Verifications());

  @override
  void initState() {
    super.initState();
    _loadSum();
  }

  Future<void> _loadSum() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      sum = prefs.getInt('sum') ?? 0;
    });
  }

  Future<void> _saveSum(int newSum) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('sum', newSum);
  }

  @override
  Widget build(BuildContext context) {
    if (verifications.o.isNotEmpty) {
      sum = verifications.o.reduce((value, element) => value + element);
      _saveSum(sum);
    }

    return Scaffold(
      appBar: const MyAppBar(
        text: 'اهلا بك في تطبيقنا!',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: LiveGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 30.0,
            ),
            itemCount: 10,
            itemBuilder: (context, index, animation) {
              return FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: NumberContainer(
                  number: index + 1,
                  isLocked: !_isLevelUnlocked(index + 1, sum),
                  onPressed: () {
                    _handleButtonPress(index + 1, sum);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleButtonPress(int index, int sum) {
    if (_isLevelUnlocked(index, sum)) {
      _navigateToPage(index, sum);
    } else {
      Get.snackbar(
        'مستوى مغلق',
        'يجب فتح المستوى السابق لفتح هذا المستوى.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  bool _isLevelUnlocked(int index, int sum) {
    if (index == 1) return true;
    return sum >= index * 10;
  }

  void _navigateToPage(int index, int sum) {
    if (index == 1) {
      print('قيمة sum هي: $sum');
    }
    switch (index) {
      case 1:
        Get.to(PageWithContainers());
        break;
      case 2:
        Get.to(PageWithContainersS2());
        break;
      case 3:
        Get.to(PageWithContainersS3());
        break;
      case 4:
        Get.to(PageWithContainers2S4());
        break;
      case 5:
        Get.to(PageWithContainersS5());
        break;
      case 6:
        Get.to(PageWithContainersS6());
        break;
      case 7:
        Get.to(PageWithContainersS7());
        break;
      case 8:
        Get.to(PageWithContainersS8());
        break;
      case 9:
        Get.to(PageWithContainersS9());
        break;
      case 10:
        Get.to(PageWithContainersS10());
        break;
      default:
        break;
    }
  }
}

class NumberContainer extends StatelessWidget {
  final int number;
  final bool isLocked;
  final VoidCallback onPressed;

  const NumberContainer({
    required this.number,
    required this.isLocked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150, 
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          if (isLocked)
            Icon(
              Icons.lock,
              color: Colors.red,
              size: 30, // الحفاظ على حجم القفل كما هو
            ),
        ],
      ),
    );
  }
}
