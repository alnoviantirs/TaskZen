import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:todo_apps/db/db.helper.dart';
import 'package:todo_apps/models/task.dart';
import 'package:todo_apps/services/api_services.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task!);
  }

  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void fetchData() async {
    ApiServices api = ApiServices();
    try {
      Iterable<Task>? catatanList = await api.getAllCatatan();

      if (catatanList != null) {
        List<Map<String, dynamic>> tasksData =
            catatanList.map((catatan) => catatan.toJson()).toList();
        taskList
            .assignAll(tasksData.map((data) => Task.fromJson(data)).toList());
        for (Task task in taskList) {
          print(task.toJson());
        }
      } else {
        print('Failed to fetch catatan data.');
      }
    } catch (e) {
      print('Error in fetchData: $e');
    }
  }

  void deleteTask(int id) async {
    await DBHelper.delete(id);
    await ApiServices().deleteCatatan(id);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.cancel(id);
    fetchData();
  }

  void markTaskAsCompleted(int id, bool isCompleted) async {
    await DBHelper.updateTask(id, isCompleted);
    ApiServices api = ApiServices();
    await api.putStatusCatatan(id, isCompleted);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    if (isCompleted) {
      flutterLocalNotificationsPlugin.cancel(id);
    }
    fetchData();
  }

  Future<void> updateTaskInfo(Task task) async {
    await DBHelper.updateTaskInfo(task);
    fetchData();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    fetchData(); // Fetch all tasks when the controller is ready
  }
}
