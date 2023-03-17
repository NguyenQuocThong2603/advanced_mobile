import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required String title,
      required String hintText,
      required bool secured,
      required EdgeInsets padding,
      required TextEditingController controller,
      required String prefixIconPath,
      required String defaultValue})
      : _title = title,
        _hintText = hintText,
        _secured = secured,
        _padding = padding,
        _controller = controller,
        _prefixIconPath = prefixIconPath,
        _defaultValue = defaultValue,
        super(key: key);

  final String _title;
  final String _hintText;
  final bool _secured;
  final EdgeInsets _padding;
  final String _prefixIconPath;
  final String _defaultValue;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        style: TextStyle(fontSize: 15, color: Colors.grey.shade900),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            fillColor: Colors.white,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            hintText: _hintText),
      ),
    );
  }
}
