import 'package:flutter/material.dart';

class FilterSortButton extends StatefulWidget {
  final String title;
  final Function onPressed;
  const FilterSortButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  State<FilterSortButton> createState() => _FilterSortButton();
}

class _FilterSortButton extends State<FilterSortButton> {
  final bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => widget.onPressed,
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          textStyle:
              const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700)),
      child: Text(widget.title),
    );
  }
}
