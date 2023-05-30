import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientContainer(
            beginColor: Colors.blue,
            endColor: Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 140,
                ),
                const Text(
                  'LogIn',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                const EMailField(),
                const SizedBox(height: 20),
                const PasswordField(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF616161),
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: const Text('Register'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Forgot Password?',
                    style: const TextStyle(
                      color: Color(0xAA616161),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri url = Uri.parse(
                            'https://www.youtube.com/watch?v=dQw4w9WgXcQ');
                        await launchUrl(url);
                      },
                  ),
                ),
                /* const Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Color(0xAA616161),
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                  ),
                ), */
              ],
            ),
          ),
          const CustomTitleBar(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      autocorrect: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Password',
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.grey,
        ),
      ),
      obscureText: true,
    );
  }
}

class EMailField extends StatelessWidget {
  const EMailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Email',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    this.beginColor = Colors.black,
    this.endColor = Colors.black,
    super.key,
    this.child,
  });

  final Color beginColor;
  final Color endColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                beginColor,
                endColor,
              ]),
        ),
        child: child,
      ),
    );
  }
}

class CustomTitleBar extends StatelessWidget {
  const CustomTitleBar({
    super.key,
    this.height = 0,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        windowManager.startDragging();
      },
      child: Container(
        height: height,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.minus),
              padding: EdgeInsets.zero,
              color: Colors.white,
              onPressed: () {
                windowManager.minimize();
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.xmark),
              padding: EdgeInsets.zero,
              color: Colors.white,
              onPressed: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
