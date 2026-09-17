import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchBtn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: AppBar(
        elevation: 100,
        backgroundColor: Color(0xff1C2135),
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              fontSize: 20,
              fontWeight: .w600,
              color: Colors.white,
            ),
          ),
        ),
        leading: Switch(
          value: switchBtn,
          onChanged: (value) {
            switchBtn = value;
            setState(() {});
          },
          activeColor: Color(0xff3D81E8),
          inactiveThumbColor: Colors.grey,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Color(0xff24263B),
                  borderRadius:BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Image.asset("assets/icons/male-icon.png"),
                      Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: .w400,
                          color: Color(0xff8B8C9E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(child: Container()),

          Expanded(child: Row(children: [])),
        ],
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {},
        color: Color(0xff3D81E8),
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Text(
          "Calculater",
          style: TextStyle(
            fontSize: 32,
            fontWeight: .w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
