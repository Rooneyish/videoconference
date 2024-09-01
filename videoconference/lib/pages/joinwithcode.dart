import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './call.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';

class JoinWithCode extends StatelessWidget {
  final TextEditingController patientId = TextEditingController();
  final TextEditingController patientProblem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 237, 255),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                child: const Icon(Icons.arrow_back_ios_new_sharp, size: 25),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            const SizedBox(height: 150),
            const Text(
              "Enter Patient Id",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 48, 78, 111)),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  controller: patientId,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Your ID',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 65, 108, 153), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 48, 78, 111),
                        width: 3,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 237, 255), width: 2),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Problem Description",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 48, 78, 111)),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 250,
                child: TextField(
                  controller: patientProblem,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Your Problem',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 65, 108, 153), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 48, 78, 111),
                        width: 3,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 220, 237, 255), width: 2),
                    ),
                  ),
                  minLines: 4,
                  maxLines: null,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (patientId.text.isNotEmpty &&
                    patientProblem.text.isNotEmpty) {
                  Get.to(() => CallPage(
                        channelName: patientId.text,
                        role: ClientRole.Broadcaster,
                      ));
                } else {
                  // Handle case where the input is not provided
                  Get.snackbar(
                    "Error",
                    "Please enter both your ID and problem description",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 48, 78, 111),
              ),
              child: const Text(
                'Start Call',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 220, 237, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
