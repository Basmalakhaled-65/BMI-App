import 'dart:math';

import 'package:bmi_app/model/user_bmi_model.dart';
import 'package:bmi_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String route = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool switchBtn = false;
  bool isMale = true;
  int height = 150;
  int weight = 99;
  int age = 5;
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              children: [
                GenderWidget(
                  isSelected: isMale,
                  onTap: () {
                    isMale = true;
                    setState(() {});
                  },
                  image: "assets/icons/male-icon.png",
                  title: "Male",
                ),
                GenderWidget(
                  isSelected: !isMale,
                  onTap: () {
                    isMale = false;
                    setState(() {});
                  },
                  image: "assets/icons/female-icon.png",
                  title: "Female",
                ),
              ],
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .w400,
                        color: Color(0xff8B8C9E),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .end,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: .w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: .w400,
                            color: Color(0xff8B8C9E),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      min: 50,
                      max: 250,
                      value: height.toDouble(),
                      activeColor: Color(0xff3D81E8),
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                spacing: 10,
                children: [
                  infoUserWidget(
                    title: "Weight",
                    value: weight,
                    add: () {
                      if (weight <= 100) {
                        weight++;
                        setState(() {});
                      }
                    },
                    remove: () {
                      if (weight >= 2) {
                        weight--;
                        setState(() {});
                      }
                    },
                  ),
                  infoUserWidget(
                    title: "Age",
                    value: age,
                    add: () {
                      if (age <= 50) {
                        age++;
                        setState(() {});
                      }
                    },
                    remove: () {
                      if (age >= 1) {
                        age--;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBMI(
        title: "Calculate",
        onPressed: () {
          //double calculateBmi = (weight / pow(height / 100, 2)).roundToDouble();
          //print(calculateBmi);
          var user = UserBmiModel(
            gender: isMale ? "Male" : "Female",
            height: height,
            weight: weight,
            age: age,
          );
          Navigator.of(context).pushNamed(ResultScreen.route, arguments: user);
        },
      ),
    );
  }
}

class CustomBottomBMI extends StatelessWidget {
  const CustomBottomBMI({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff3D81E8),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Text(
        title,
        style: TextStyle(fontSize: 32, fontWeight: .w600, color: Colors.white),
      ),
    );
  }
}

class infoUserWidget extends StatelessWidget {
  const infoUserWidget({
    super.key,
    required this.title,
    required this.value,
    required this.add,
    required this.remove,
  });

  final String title;
  final int value;
  final void Function() add;
  final void Function() remove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff24263B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w300,
                color: Color(0xff8B8C9E),
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: .bold,
                color: Color(0xffFFFFFF),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xff8B8C9E),
                    elevation: 5,
                    shadowColor: Colors.grey,
                  ),
                  onPressed: add,
                  icon: Icon(Icons.add, color: Colors.white, size: 35),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xff8B8C9E),
                    elevation: 5,
                    shadowColor: Colors.grey,
                  ),
                  onPressed: remove,
                  icon: Icon(Icons.remove, color: Colors.white, size: 35),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String image;
  final String title;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xff24263B) : Color(0xff333244),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Image.asset(image),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .w400,
                  color: Color(0xff8B8C9E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
