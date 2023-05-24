import 'package:blog_sec_app/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:universal_html/html.dart' as html;

import '../../config/endpoints.dart';
import '../../controllers/auth_controller.dart';

class LogingPage extends StatefulWidget {
  const LogingPage({super.key});

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {
  @override
  void initState() {
    if (authController.isLoggedIn && !authController.isValidTokenExpiration()) {
      authController.signOut();
    }

    // get token from login provider
    html.window.onMessage
        .listen((event) => authController.listenLoginEvent(event));

    if (authController.isLoggedIn) {
      Get.toNamed(Endpoints.home);
    }
    super.initState();
  }

  AuthController get authController => Get.put(AuthController());

  bool homeBtnPressed = false;

  Widget get space => const SizedBox(height: 24, width: 24);
  Widget get smallSpace => const SizedBox(height: 5, width: 5);
  Widget get smallSpace10 => const SizedBox(height: 10, width: 10);
  Widget get spaceLarge => const SizedBox(height: 32, width: 32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        if (authController.isLoggedIn) {
          return const Home();
        }

        return Container(child: _buildContent());
      }),
    );
  }

  _buildContent() {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                spaceLarge,
                spaceLarge,
                const Text(
                  textAlign: TextAlign.center,
                  "Blog Sec App",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          child: SizedBox(
            width: 300,
            child: authController.isLoggedIn
                ? Column(children: [
                    ElevatedButton(
                      child: Text("Login"),
                      onPressed: () {
                        Get.toNamed(Endpoints.home);
                      },
                    ),
                    smallSpace10,
                    ElevatedButton(
                        child: Text("Logout"),
                        onPressed: () {
                          authController.signOut();
                        }),
                  ])
                : Column(
                    children: [
                      ElevatedButton(
                          child: Text("Login"),
                          onPressed: () {
                            authController.signIn();
                          }),
                      space,
                    ],
                  ), /*const CircularProgressIndicator(
                              color: surfaceColor,
                            )*/
          ),
        ),
      ],
    );
  }
}
