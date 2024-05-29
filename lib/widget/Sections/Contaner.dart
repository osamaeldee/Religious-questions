import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  final String text;
  final List<String> selectedItems;
  final Function(String) onSelect;

  const MyContainer({
    Key? key,
    required this.text,
    required this.selectedItems,
    required this.onSelect,
  }) : super(key: key);

  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedItems.contains(widget.text);

    return GestureDetector(
      onTap: () {
        if (isSelected) {
          widget.onSelect('');
        } else {
          widget.onSelect(widget.text);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 5, left: 5),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue
                : const Color.fromARGB(255, 88, 50, 36),
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              color:
                  isSelected ? Colors.blue : const Color.fromARGB(255, 0, 0, 0),
              width: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 20,
                color: isSelected
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color.fromARGB(255, 255, 255, 255),
              ), // تغيير لون النص
            ),
          ),
        ),
      ),
    );
  }
}
