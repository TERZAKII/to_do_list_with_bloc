import 'package:flutter/material.dart';
import '../models/task.dart';
import '../blocs/bloc_exports.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return ListTile(
              title: Text(task.title, style: TextStyle(
                decoration: task.isDone! ? TextDecoration.lineThrough:null,
              ),),
              trailing: Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                },
              ),
              onLongPress: () =>
                  context.read<TasksBloc>().add(DeleteTask(task: task)),
            );
          }),
    );
  }
}
