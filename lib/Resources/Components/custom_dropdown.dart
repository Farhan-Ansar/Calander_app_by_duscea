import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../AppConstant/app_constant.dart';

class CustomLabeledDropdown extends StatefulWidget {
  final String hintText;
  final TextStyle hintTextStyle;
  final List<DropdownMenuItem<String>> items; // Dropdown items
  final String? value; // Selected value
  final Function(String?) onChanged; // Callback when value changes

  const CustomLabeledDropdown({
    Key? key,
    required this.hintText,
    required this.hintTextStyle,
    required this.items,
    required this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  State<CustomLabeledDropdown> createState() => _CustomLabeledDropdownState();
}

class _CustomLabeledDropdownState extends State<CustomLabeledDropdown> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: kColorBlack,
      focusNode: _focusNode,
      value: widget.value,
      style: widget.hintTextStyle,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      decoration: InputDecoration(
        hintStyle: widget.hintTextStyle,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(
            width: 1,
            color: kColorWhite,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.white, // Color when focused
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey, // Color when not focused
          ),
        ),
      ),
      items: widget.items,
      onChanged: widget.onChanged,
    );
  }
}
