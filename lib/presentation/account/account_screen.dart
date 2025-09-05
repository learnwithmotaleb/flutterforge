import 'package:flutter/material.dart';
import 'package:flutterforge/presentation/account/wigets/custom_background.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  // Social link open helper
  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: BackgroundGradient(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Sign in section
              GestureDetector(
                onTap: () {
                  // TODO: Implement Google Sign-In
                },
                child: Column(
                  children: [
                    const Text(
                      "Sign in with Google",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      'assets/icon/google.png',
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Learn With Motaleb Container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Learn With Motaleb",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              // Profile Rows
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text("My Profile: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("App Developer"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Text("Developer: ", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Abdul Motaleb"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Social Links
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Image.asset('assets/icon/youtube.png', height: 32),
                    onPressed: () => _launchURL('https://youtube.com/@LearnWithMotaleb'),
                  ),
                  IconButton(
                    icon: Image.asset('assets/icon/instagram.png', height: 32),
                    onPressed: () => _launchURL('https://instagram.com/your_instagram'),
                  ),
                  IconButton(
                    icon: Image.asset('assets/icon/facebook.png', height: 32),
                    onPressed: () => _launchURL('https://facebook.com/your_facebook'),
                  ),
                  IconButton(
                    icon: Image.asset('assets/icon/linkedin.png', height: 32),
                    onPressed: () => _launchURL('https://learnwithmotaleb.com'),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Legal Links
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Privacy Policy"),
                  ),
                  const Text("OR"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Terms & Conditions"),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              const Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),

      )
    );
  }
}
