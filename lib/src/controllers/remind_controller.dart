import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prophetic_prayers_for_children/src/db/db_helper.dart';
import 'package:prophetic_prayers_for_children/src/services/reminder.dart';

class RemindController extends GetxController{
  @override
  void onReady(){
    super.onReady();
  }

  var reminderList = <Reminder>[].obs;

  Future<int> addReminder({Reminder? reminder}) async{
    return await DBHelper.insert(reminder);
  }

  Future<void> getReminders() async {
    List<Map<String, dynamic>> reminders = await DBHelper.query();
    reminderList.assignAll(reminders.map((data) => new Reminder.fromJson(data)).toList());
  }

  Future<void> deleteReminders(Reminder reminder) async {
    return await DBHelper.delete(reminder);
  }

  Future<void> markTaskCompleted (int id) async {
    return await DBHelper.update(id);
  }
}