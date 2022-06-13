// import 'dart:convert';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';

import '../components/shared/json_handler.dart';

class SetupRoutine extends StatefulWidget {
  SetupRoutine({Key? key}) : super(key: key);

  @override
  State<SetupRoutine> createState() => _SetupRoutineState();
}

class _SetupRoutineState extends State<SetupRoutine> {
  late JsonHandler jsonHandler;

  String selectedWorkout = "Workout 1";

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  initAsync() async {
    jsonHandler = JsonHandler();
    await jsonHandler.init();
    jsonHandler.fetchWorkouts();
    setState(() {
      jsonHandler.weekFileExists
          ? jsonHandler.fetchWeekSchedule()
          : jsonHandler.createWeekFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: jsonHandler.workouts.length > 0
          ? Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/exercise.jpg'),
            fit: BoxFit.cover
          )
        ),
              child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("Routine",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                    alignment: Alignment.centerLeft,
                    child: Text("Select workout:")),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 4)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<dynamic>(
                        value: selectedWorkout,
                        items: jsonHandler.workouts.map(buildMenuItem).toList(),
                        onChanged: (workout) => setState(() {
                              selectedWorkout = workout;
                            })),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                    alignment: Alignment.centerLeft,
                    child: Text("Select days:")),
                SizedBox(
                  height: 30,
                ),
                buildWeekRow()
              ],
            ))
          : Center(
              child: Text(
                "No workouts available, please create one first",
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  DropdownMenuItem buildMenuItem(workout) => DropdownMenuItem(
      value: workout["workout_no"], child: Text(workout["workout_no"]));

  Row buildWeekRow() => Row(
        children: [
          SizedBox(width: 5),
          for (String day in [
            "Sun",
            "Mon",
            "Tues",
            "Wed",
            "Thurs",
            "Fri",
            "Sat"
          ])
            Column(
              children: [
                Center(child: Text(day)),
                InkWell(
                  onTap: jsonHandler.weekSchedule[day] == selectedWorkout
                      ? () => setState(() {
                            jsonHandler.writeToWeekFile("", day);
                          })
                      : () => setState(() {
                            jsonHandler.writeToWeekFile(selectedWorkout, day);
                          }),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    color: jsonHandler.weekSchedule[day] == selectedWorkout
                        ? Colors.green
                        : jsonHandler.weekSchedule[day] == ""
                            ? Colors.grey
                            : Colors.red,
                    height: 40,
                    width: 40,
                  ),
                )
              ],
            ),
        ],
      );
}
