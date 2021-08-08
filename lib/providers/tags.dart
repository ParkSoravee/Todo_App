import 'package:flutter/material.dart';

class Tag {
  final String title;
  final Color color;

  Tag(this.title, this.color);
}

class Tags with ChangeNotifier {
  List<Tag> _tags = [
    Tag('work', Colors.blue),
    Tag('study', Colors.orange),
    Tag('improving', Colors.red),
    Tag('other', Colors.grey),
  ];

  List<Tag> get tags {
    return [..._tags];
  }

  Tag findTagByTitle(String title) {
    return _tags.firstWhere((tag) => tag.title == title);
  }
}
