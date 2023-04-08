import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(232, 92, 142, 236),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                cursorColor: Colors.blueGrey[800],
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Enter City Name",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black87,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  ),
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                onChanged: (value) {
                  cityName = value;
                },
              ),
            ),
            TextButton(
                child: const Text(
                  "Get Weather",
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context, cityName);
                }),
          ],
        ),
      ),
    );
  }
}
