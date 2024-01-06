enum TaskStatus { toDo, inProgress, done }

class TaskModel {
  final String name;
  final DateTime date;
  final TaskStatus status;

  bool get isDone => status == TaskStatus.done;

  const TaskModel({
    required this.name,
    required this.date,
    required this.status,
  });
}
