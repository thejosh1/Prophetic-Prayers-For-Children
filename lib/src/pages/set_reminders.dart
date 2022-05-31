import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prophetic_prayers_for_children/src/controllers/remind_controller.dart';
import 'package:prophetic_prayers_for_children/src/pages/saved_reminders.dart';
import 'package:prophetic_prayers_for_children/utils/ui.dart';
import 'package:prophetic_prayers_for_children/widget/big_text.dart';
import 'package:prophetic_prayers_for_children/widget/my_button.dart';
import 'package:prophetic_prayers_for_children/widget/input_field.dart';

import '../services/reminder.dart';
import 'auth/sign_in_page.dart';

class SetReminders extends StatefulWidget {
  const SetReminders({Key? key}) : super(key: key);

  @override
  State<SetReminders> createState() => _SetRemindersState();
}

class _SetRemindersState extends State<SetReminders> {
  final RemindController _remindController = Get.put(RemindController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final _currentDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _selectReminder = 5;
  List<int> reminderList = [
    5,
    10,
    15,
    20,
    25,
    30
  ];

  String _selectedRepeat = "Never";
  List<String> repeatList  = [
    "Never",
    "Hourly",
    "Daily"
  ];
  int _selectedColor=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add Task", style: HeadingStyle, ),
                  GestureDetector(onTap: ()=>Get.to(()=> SavedReminders()),child: const MyButton(label: "View Reminders", color: Colors.purple,))
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 20,),
                  InputField(title: "Title", hint: "Enter Your Title", controller: _titleController,),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 20,),
                  InputField(title: "Note", hint: "Enter Your Note", controller: _noteController,),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 20,),
                  InputField(title: "Time", hint: _selectedTime.format(context).toString(), widget: IconButton(onPressed: (){_getTimeOfDay();}, icon: Icon(Icons.access_time_rounded, size: 14, color: Colors.grey[600],)),),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 20,),
                  InputField(title: "Remind", hint: "$_selectReminder minutes early", widget: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey[700],),
                    iconSize: 24,
                    elevation: 4,
                    style: SubHeadingStyle,
                    underline: Container(height: 0,),
                    items: reminderList.map<DropdownMenuItem<String>>((int value){
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList(), onChanged: (String? value) {
                      setState(() {
                        _selectReminder = int.parse(value!);
                      });
                  },
                  ),),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 20,),
                  InputField(title: "Repeat", hint: "$_selectedRepeat ", widget: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey[700],),
                    iconSize: 24,
                    elevation: 4,
                    style: SubHeadingStyle,
                    underline: Container(height: 0,),
                    items: repeatList.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.grey[700]),),
                      );
                    }).toList(), onChanged: (String? value) {
                    setState(() {
                      _selectedRepeat = value!;
                    });
                  },
                  ),),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  GestureDetector(onTap: () {
                    _validateData();}, child: const MyButton(label: "Create Reminder",),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _validateData(){
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty){
      //add to database
      _addRemindersToDb();
      Get.to(()=>const SavedReminders());
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty){
      Get.snackbar("Required", "Please Fill in the required Fields!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red,
          icon: const Icon(Icons.warning_amber_rounded, color: Colors.red,));
    }
  }

  _addRemindersToDb() async {
    int value = await _remindController.addReminder(
        reminder:Reminder(
            title: _titleController.text,
            note: _noteController.text,
            time: _selectedTime.format(context).toString(),
            date: DateFormat.MMMd().format(_currentDate),
            remind: _selectReminder,
            repeat: _selectedRepeat,
            color: _selectedColor,
            isCompleted: 0
        )
    );
    print("my id is " "$value");

  }
  _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BigText(text: "Colors", color: Colors.deepOrangeAccent,),
        const SizedBox(height: 8.0,),
        Wrap(
          children: List<Widget>.generate(
              3, (index) =>
              GestureDetector(
                onTap: (){
                  setState(() {
                    _selectedColor = index;
                  });
                },
                child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index==0?Colors.deepOrangeAccent:index==1?Colors.purple:const Color(0xFF304FFE),
                      child: _selectedColor==index?const Icon(Icons.done_rounded, color: Colors.white, size: 16,):Container(),
                    )
                ),
              )
          ),
        )
      ],
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
  _getTimeOfDay() async {
    TimeOfDay? timePicker = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay.now()
    );
    if(_currentDate != DateTime.now()) {
      setState((){
        _selectedTime = timePicker!;
      });
    } else {
      print("for some reasons we couldn't keep the time");
    }
  }

}





