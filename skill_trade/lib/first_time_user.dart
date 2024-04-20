import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/screens/home_page.dart';
import 'package:skill_trade/presentation/themes.dart';

void main() {
  runApp(const FirstTimeUserPage());
}

class FirstTimeUserPage extends StatefulWidget {
  const FirstTimeUserPage({super.key});

  @override
  State<FirstTimeUserPage> createState() => _FirstTimeUserPageState();
}

class _FirstTimeUserPageState extends State<FirstTimeUserPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp( 
      debugShowCheckedModeBanner: false,
      title: "SkillTrade Hub",
      theme: lightMode,
      home: HomeScreen(),
    );
  }
}

