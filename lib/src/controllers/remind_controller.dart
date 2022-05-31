import 'package:get/get.dart';
import 'package:prophetic_prayers_for_children/src/db/db_helper.dart';
import 'package:prophetic_prayers_for_children/src/services/reminder.dart';

class RemindController extends GetxController {

  var remindersList = <Reminder>[].obs;

  Future<int>addReminder({Reminder? reminder}) async{
    return await DBHelper.insert(reminder!);
  }

  //get all the data from the table
  void getReminders() async {
    List<Map<String, dynamic>> reminder = await DBHelper.query();
    return remindersList.assignAll(reminder.map((data) => Reminder.fromJson(data)).toList());
  }

  void delete(Reminder reminder) {
    DBHelper.delete(reminder);
  }
}