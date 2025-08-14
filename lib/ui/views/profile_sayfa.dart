import 'package:flutter/material.dart';

import '../../utility/profile_circle_avatar.dart';

class ProfileSayfa extends StatefulWidget {
  const ProfileSayfa({super.key});

  @override
  State<ProfileSayfa> createState() => _ProfileSayfaState();
}

class _ProfileSayfaState extends State<ProfileSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Profilim",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF003366),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 200,height: 200,
                child: ProfileAvatar(imageUrl: "https://randomuser.me/api/portraits/men/32.jpg")),
            const SizedBox(height: 30),
            Text(
              "Enes",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121)
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              "0552 213 20 02",
              style: const TextStyle(
                fontSize: 20,
                color: Color(0xFF757575),
                letterSpacing: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
