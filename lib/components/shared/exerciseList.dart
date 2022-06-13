import 'exerciseItem.dart';
import 'exercise_handler.dart';

Map<String, Exercise> Exercises = {
  "squat": Exercise(
      exercise_image: 'assets/img/Squat.png',
      exercise_name: "squat",
      exercise_displayName: "Squat",
      reps: 1,
      sets: 1,
      handler: Squat()),
  "lateral_raise": Exercise(
      exercise_image: 'assets/img/Lateralraise.png',
      exercise_name: "lateral_raise",
      exercise_displayName: "Front lateral raise",
      reps: 1,
      sets: 1,
      handler: FrontLateralRaiseHandler()),
  "lunge": Exercise(
      exercise_image: 'assets/img/Lunge.png',
      exercise_name: "lunge",
      exercise_displayName: "Lunge",
      reps: 1,
      sets: 1,
      handler: Lunge()),
  "dumbbell_curl": Exercise(
      exercise_image: 'assets/img/Dumbbellcurl.png',
      exercise_name: "dumbbell_curl",
      exercise_displayName: "Dumbbell_curl",
      reps: 1,
      sets: 1,
      handler: DumbellCurlHandler()),
};
