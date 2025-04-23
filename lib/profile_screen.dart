import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String email;

  const ProfileScreen({super.key, required this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color backgroundColor = Colors.white;

  void ubahWarnaBackground() {
    setState(() {
      if (backgroundColor == Colors.white) {
        backgroundColor = const Color(0xFFADD8E6); // Baby blue
      } else if (backgroundColor == const Color(0xFFADD8E6)) {
        backgroundColor = const Color.fromARGB(255, 187, 87, 128); // Merah
      } else {
        backgroundColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              "Selamat datang, ${widget.email}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: ubahWarnaBackground,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.color_lens),
                  SizedBox(width: 8),
                  Text("Ubah Warna Background"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
