import 'package:flutter/material.dart';
import 'package:todolist/blocs/services/guide_generator.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                        title: titleController.text, id: GUIDGen.generate());
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: Text('Add')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel')),
            ],
          ),
        ],
      ),
    );
  }
}
