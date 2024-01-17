import 'package:flutter/material.dart';
import 'package:TranquilApp/screens/sidebar_screen.dart';

enum TaskStatus { Pending, InProgress, Success }

class TodoTask {
  final String text;
  TaskStatus status;

  TodoTask({required this.text, this.status = TaskStatus.Pending});
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TextEditingController _taskController = TextEditingController();
  List<TodoTask> tasks = [
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      drawer: SidebarScreen(), // Assuming you have a SidebarScreen implementation
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'My To-Do List',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildTaskList(),
            _buildAddTaskInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TodoItem(
            task: tasks[index],
            onStatusChanged: (task, newStatus) {
              setState(() {
                task.status = newStatus;
              });

              if (newStatus == TaskStatus.Success) {
                _moveToNextStatus(task);
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildAddTaskInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _taskController,
            decoration: InputDecoration(
              hintText: 'Enter task...',
            ),
          ),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            _addTask();
          },
          child: Text('Add Task'),
        ),
      ],
    );
  }

  void _addTask() {
    String newTaskText = _taskController.text.trim();
    if (newTaskText.isNotEmpty) {
      setState(() {
        tasks.add(TodoTask(text: newTaskText));
        _taskController.clear();
      });
    }
  }

  void _moveToNextStatus(TodoTask task) {
    TaskStatus nextStatus = TaskStatus.values[task.status.index + 1];
    if (nextStatus != TaskStatus.Success) {
      setState(() {
        task.status = nextStatus;
      });
    }
  }
}

class TodoItem extends StatelessWidget {
  final TodoTask task;
  final Function(TodoTask, TaskStatus) onStatusChanged;

  TodoItem({required this.task, required this.onStatusChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _buildStatusIcon(task.status),
          SizedBox(width: 8.0),
          Text(task.text),
          SizedBox(width: 8.0),
          if (task.status != TaskStatus.Success)
            _buildChangeStatusButton(context),
        ],
      ),
    );
  }

  Widget _buildStatusIcon(TaskStatus status) {
    IconData icon;
    Color color;

    switch (status) {
      case TaskStatus.Pending:
        icon = Icons.schedule;
        color = Colors.blue;
        break;
      case TaskStatus.InProgress:
        icon = Icons.hourglass_bottom;
        color = Colors.orange;
        break;
      case TaskStatus.Success:
        icon = Icons.check_circle;
        color = Colors.green;
        break;
    }

    return Icon(
      icon,
      color: color,
    );
  }

  Widget _buildChangeStatusButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showStatusChangeDialog(context);
      },
      child: Text('Change Status'),
    );
  }

  void _showStatusChangeDialog(BuildContext context) {
    // Show a dialog with options to change the status
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStatusOption(context, TaskStatus.Pending),
              _buildStatusOption(context, TaskStatus.InProgress),
              _buildStatusOption(context, TaskStatus.Success),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusOption(BuildContext context, TaskStatus newStatus) {
    return ListTile(
      title: Text(newStatus.toString().split('.').last),
      onTap: () {
        // Show confirmation dialog for changing status
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Confirm Status Change'),
              content: Text('Are you sure you want to change the status to $newStatus?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onStatusChanged(task, newStatus);
                  },
                  child: Text('Confirm'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}


void main() {
  runApp(
    MaterialApp(
      home: TodoListScreen(),
    ),
  );
}
