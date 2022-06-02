import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prophetic_prayers_for_children/src/controllers/remind_controller.dart';
import 'package:prophetic_prayers_for_children/src/pages/main_page.dart';
import 'package:prophetic_prayers_for_children/src/pages/set_reminders.dart';
import 'package:prophetic_prayers_for_children/utils/dimensions.dart';
import 'package:prophetic_prayers_for_children/utils/ui.dart';
import 'package:prophetic_prayers_for_children/widget/my_button.dart';

import '../../widget/big_text.dart';
import '../../widget/reminder_tile.dart';
import '../controllers/remind_controller.dart';
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
    print("build method called");
    return Scaffold(
      appBar: _appBar(context),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent
              ),
                child: Container(
                  height: Dimensions.height60,
                  width: Dimensions.width30*2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("img/logo.jpg")
                    )
                  ),
                ))
          ],
        ),
      ),
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
                  _remindController.getReminders();
                  }, child: const MyButton(label: "Add Reminder",),
                )
              ],
            ),
            BigText(text: "Today", color: Colors.black, size: Dimensions.width30,),
            SizedBox(height: Dimensions.height10,),
            _showReminders(),

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
          Get.to(()=>MainPage());
        },
        child: const Icon(Icons.arrow_back_ios, color: Colors.deepOrangeAccent,),
      ),
      title: BigText(text: "Prophetic Prayers For Children", color: Colors.deepOrangeAccent, size: 18,),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: (){
            _drawer();
          },
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.deepOrangeAccent,),
          ),
        )
      ],
    );
  }

  _drawer(){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
                height: Dimensions.height60,
                width: Dimensions.width30*2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "img/logo.jpg"
                    ), fit: BoxFit.cover
                  ),
                  shape: BoxShape.circle
                ),
              )
          ),
          ListTile(
            trailing: Icon(Icons.message),
            title: Text("Notifications", style: listHeadingStyle,),
          ),
          ListTile(
            trailing: Icon(Icons.person),
            title: Text("Profile", style: listHeadingStyle,),
          )
        ],
      ),
    );
  }
  _showReminders(){
    return Expanded(
        child: Obx((){
          return ListView.builder(
              itemCount: _remindController.reminderList.length,
              itemBuilder: (_, index) {
                print(_remindController.reminderList.length);
                Reminder reminder = _remindController.reminderList[index];
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                _showBottomSheet(context, reminder);
                              },
                              child: ReminderTile(reminder)
                            )
                          ],
                        ),
                      ),
                    ),
                );
              });
        })
    );
  }


  _showBottomSheet(BuildContext context, Reminder reminder){
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(top: Dimensions.height4),
        height: reminder.isCompleted==1?
        MediaQuery.of(context).size.height*0.24:
        MediaQuery.of(context).size.height*0.32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: Dimensions.height6,
              width: Dimensions.width120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]
              ),
            ),
            Spacer(),
            reminder.isCompleted==1?Container():_bottomSheetButton(
                label: "Task Completed",
                onTap: (){
                  _remindController.markTaskCompleted(reminder.id!);
                  _remindController.getReminders();
                  Get.back();},
                color: Colors.blue, context: context),
            _bottomSheetButton(
                label: "Delete Reminder",
                onTap: (){
                  _remindController.deleteReminders(reminder);
                  _remindController.getReminders();
                  Get.back();},
                color: Colors.red[300]!,
                context: context),
            SizedBox(height: Dimensions.height20,),
            _bottomSheetButton(
                label: "Close",
                isClosed: true,
                onTap: (){Get.back();},
                color: Colors.red[300]!, context: context),
            SizedBox(height: Dimensions.height10,),

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
        child: Center(child: Text(label, style: isClosed?listHeadingStyle.copyWith(color: Colors.grey[600]):listHeadingStyle.copyWith(color: Colors.white),)),
      ),
    );
}
}
