import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({required this.imageUrl, this.radius=40.0, Key? key}) : super(key: key);
  final String imageUrl;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(
        imageUrl,
      ),
    );
  }
}