import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prophetic_prayers_for_children/src/controllers/remind_controller.dart';
import 'package:prophetic_prayers_for_children/src/pages/set_reminders.dart';
import 'package:prophetic_prayers_for_children/utils/ui.dart';
import 'package:prophetic_prayers_for_children/widget/my_button.dart';

import '../../widget/big_text.dart';
import '../../widget/reminder_tile.dart';
import '../services/reminder.dart';
import 'auth/sign_in_page.dart';

class SavedReminders extends StatefulWidget {
  const SavedReminders({Key? key}) : super(key: key);

  @override
  State<SavedReminders> createState() => _SavedRemindersState();
}

class _SavedRemindersState extends State<SavedReminders> {
  final RemindController _remindController = Get.put(RemindController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(DateFormat.yMMMd().format(DateTime.now()), style: titleHeadingStyle, )
                  ],
                ),
                GestureDetector(onTap: () async {
                  await Get.to(()=>const SetReminders());
                  _remindController.getReminders();}, child: const MyButton(label: "Add Task",),
                )
              ],
            ),
            BigText(text: "Today", color: Colors.black, size: 30,),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back_ios, color: Colors.deepOrangeAccent,),
      ),
      title: BigText(text: "Prophetic Prayers For Children", color: Colors.deepOrangeAccent, size: 18,),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: ()=>Get.to(const SignInPage()),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.deepOrangeAccent,),
          ),
        )
      ],
    );
  }
  _showReminders() {
    return Expanded(
        child:Obx((){
          return ListView.builder(
              itemCount: _remindController.remindersList.length,
              itemBuilder: (_, index) {
                return Container(

                );
              });
        }));
  }

  _showBottomSheet(BuildContext context, Reminder reminder){
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(top: 4),
        height: reminder.isCompleted==1?
        MediaQuery.of(context).size.height*0.24:
        MediaQuery.of(context).size.height*0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]
              ),
            ),
            Spacer(),
            reminder.isCompleted==1?Container():_bottomSheetButton(
                label: "Task Completed", 
                onTap: (){Get.back();}, 
                color: Colors.blue, context: context),
            _bottomSheetButton(
                label: "Delete Reminder",
                onTap: (){
                  _remindController.delete(reminder);
                  _remindController.getReminders();
                  Get.back();},
                color: Colors.red[300]!,
                context: context),
            SizedBox(height: 20,),
            _bottomSheetButton(
                label: "Close",
                isClosed: true,
                onTap: (){Get.back();},
                color: Colors.red[300]!, context: context),
            SizedBox(height: 10,),
                
          ],
        ),
      )
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color color,
    bool isClosed = false,
    required BuildContext context
}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width*0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClosed==true?Colors.grey:color,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClosed==true?Colors.transparent:color,
        ),
        child: Center(child: Text(label, style: isClosed?titleHeadingStyle:titleHeadingStyle.copyWith(color: Colors.white),)),
      ),
    );
}
}
