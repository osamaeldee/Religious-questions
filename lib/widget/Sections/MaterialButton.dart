import 'dart:async';

import 'package:flutter/material.dart';

class MaterialButtoN extends StatefulWidget {
  final String text;
  final void Function() ontape;

  const MaterialButtoN({
    required this.text,
    required this.ontape,
  });

  @override
  _MaterialButtoNState createState() => _MaterialButtoNState();
}

class _MaterialButtoNState extends State<MaterialButtoN> {
  bool _isButtonDisabled = false;
  int _counter = 3;

  void _handleTap() {
    if (!_isButtonDisabled) {
      widget.ontape();
      setState(() {
        _isButtonDisabled = true;
        _counter = 3; // إعادة تعيين العداد
      });

      Timer.periodic(Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            if (_counter > 0) {
              _counter--;
            } else {
              _isButtonDisabled = false;
              timer.cancel();
            }
          });
        } else {
          timer.cancel();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            onPressed: _isButtonDisabled ? null : _handleTap,
            color: _isButtonDisabled
                ? Colors.grey.shade400
                : const Color.fromARGB(255, 255, 255, 255),
            textColor: const Color.fromARGB(255, 0, 0, 0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          if (_isButtonDisabled)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'إعادة المحاولة في $_counter',
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
