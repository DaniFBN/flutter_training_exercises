import 'task_model.dart';

class RoutineModel {
  final String name;
  final Set<TaskModel> tasks;

  /// Progress is 0 to 100
  double get progress {
    if (tasks.isEmpty) return 100;
    final tasksAmount = tasks.length;

    final doneTasks = tasks.where((e) => e.isDone).length;

    return doneTasks / tasksAmount;
  }

  const RoutineModel({
    required this.name,
    required this.tasks,
  });
}
