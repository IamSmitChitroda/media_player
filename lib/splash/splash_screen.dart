import 'package:Media_Player/constant/string_constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:Media_Player/routes.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Animation duration
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
    _getAppVersion();

    Future.delayed(Duration(seconds: 5), () {
      Get.offNamed(Routes.mediaList);
    });
  }

  Future<void> _getAppVersion() async {
    // Retrieve app version and build number
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    setState(() {
      this.version = 'Version: $version (Build: $buildNumber)';
    });
  }

  String version = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 36, 40),
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.38,
              ),
              Image.asset(
                StringConstant.instance.appLogo,
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Music App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                version,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
