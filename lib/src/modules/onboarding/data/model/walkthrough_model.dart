import 'dart:convert';

import 'package:equatable/equatable.dart';

class WalkthroughModel extends Equatable {
  final String title;
  final String subtitle;
  final String image;

  const WalkthroughModel({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  factory WalkthroughModel.fromMap(Map<String, dynamic> map) {
    return WalkthroughModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'image': image,
    };
  }

  factory WalkthroughModel.empty() {
    return const WalkthroughModel(
      title: '',
      subtitle: '',
      image: '',
    );
  }

  @override
  List<Object?> get props => [
        title,
        subtitle,
        image,
      ];

  @override
  String toString() => jsonEncode(toMap());
}
