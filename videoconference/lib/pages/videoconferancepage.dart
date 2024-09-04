import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videoconference/pages/joinwithcode.dart';

class Doctor {
  final String name;
  final String specialization;
  final String status;

  const Doctor({
    required this.name,
    required this.specialization,
    required this.status,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final List<Doctor> doctors = const [
    Doctor(name: 'Ronish', specialization: 'Neurologist', status: 'Yes'),
    Doctor(name: 'Shishir', specialization: 'Cardiologist', status: 'No'),
    Doctor(name: 'Kebal', specialization: 'Dermatologist', status: 'Yes'),
  ];

  final List<Doctor> otherDoctors = const [
    Doctor(name: 'Harry', specialization: 'Neurologist', status: 'Yes'),
    Doctor(name: 'Krishna', specialization: 'Cardiologist', status: 'No'),
    Doctor(name: 'Vishnu', specialization: 'Dermatologist', status: 'Yes'),
    Doctor(name: 'Shiva', specialization: 'Endocrinologist', status: 'Yes'),
    Doctor(name: 'Ganesh', specialization: 'Rheumatologist', status: 'Yes'),
    Doctor(name: 'Buddha', specialization: 'Hematologist', status: 'No'),
    Doctor(name: 'Parvati', specialization: 'Dermatologist', status: 'No'),
  ];

  void _onDoctorPressed(String name) {
    print('$name button pressed');
    Get.to(JoinWithCode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 95, 152),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 215, 198),
        title: const Text(
          'Video Conference',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 41, 95, 152),
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                    child: Text(
                      'Your Doctors',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 234, 228, 221),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Divider(
                      color: Color.fromARGB(255, 234, 228, 221),
                      thickness: 2,
                    ),
                  ),
                  _buildDoctorTable(doctors, screenWidth),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                    child: Text(
                      'Other Doctors',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 234, 228, 221),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Divider(
                      color: Color.fromARGB(255, 234, 228, 221),
                      thickness: 2,
                    ),
                  ),
                  _buildDoctorTable(otherDoctors, screenWidth),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDoctorTable(List<Doctor> doctors, double screenWidth) {
    bool isSmallScreen = screenWidth < 600;

    return Table(
      border: TableBorder.all(color: Colors.transparent),
      columnWidths: isSmallScreen
          ? null
          : {
              0: const FlexColumnWidth(1),
              1: const FlexColumnWidth(2),
              2: const FlexColumnWidth(1),
            },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 196, 225, 255),
            border: Border.all(
              color: const Color.fromARGB(255, 48, 78, 111),
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          children: const [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(9.0),
                child: Center(
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 48, 78, 111),
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(9.0),
                child: Center(
                  child: Text(
                    'Specialization',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 48, 78, 111),
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(9.0),
                child: Center(
                  child: Text(
                    'Status',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 48, 78, 111),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ...doctors.map((doctor) => TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => _onDoctorPressed(doctor.name),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 220, 237, 255),
                      ),
                      child: Flexible(
                        child: Text(
                          doctor.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 48, 78, 111),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Flexible(
                        child: Text(
                          doctor.specialization,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 220, 237, 255),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        doctor.status,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 220, 237, 255),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}