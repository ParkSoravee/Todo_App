import 'package:flutter/material.dart';

class TagButton extends StatefulWidget {
  final String title;
  final Color color;
  final bool isSelected;
  final Function makeSelected;

  TagButton(this.title, this.color, this.isSelected, this.makeSelected);

  @override
  _TagButtonState createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  // var _isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3.0,
      ),
      child: OutlinedButton(
        onPressed: () {
          widget.makeSelected(widget.title);
        },
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : null,
            // height: 0.1,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        style: OutlinedButton.styleFrom(
          minimumSize: Size(0, 30),
          primary: widget.color,
          side: BorderSide(
            color: widget.color,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: widget.isSelected ? widget.color : null,
        ),
      ),
    );
  }
}
