import 'package:flutter/material.dart';

class Login2Screen extends StatefulWidget {
  const Login2Screen({super.key});

  @override
  State<Login2Screen> createState() => _Login2ScreenState();
}

class _Login2ScreenState extends State<Login2Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool tampilPassword = true;

  void showPassword() {
    setState(() {
      tampilPassword = !tampilPassword;
    });
  }

  void login() {
    String email = emailController.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen(email: email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Masukkan Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: tampilPassword,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Masukkan Password",
                  suffixIcon: IconButton(
                    onPressed: showPassword,
                    icon: Icon(
                      tampilPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: login, child: const Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}

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
