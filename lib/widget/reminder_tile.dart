import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prophetic_prayers_for_children/src/services/reminder.dart';
import 'package:prophetic_prayers_for_children/utils/dimensions.dart';

class ReminderTile extends StatelessWidget {
  final Reminder? reminder;
  ReminderTile(this.reminder);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:Dimensions.width10, bottom: Dimensions.height4*3),
      width: 300,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width8*2, vertical: Dimensions.height4*4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.size16),
          color: _getBGClr(reminder?.color??0),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reminder?.title??"",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: Dimensions.size16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height6*2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey[200],
                      size: Dimensions.size18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${reminder!.time} - ${reminder!.date}",
                      style: GoogleFonts.lato(
                        textStyle:
                        TextStyle(fontSize: Dimensions.size13, color: Colors.grey[100]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height6*2),
                Text(
                  reminder?.note??"",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: Dimensions.size15, color: Colors.grey[100]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            height: Dimensions.height60,
            width: Dimensions.width05,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              reminder!.isCompleted == 1 ? "COMPLETED" : "Reminder",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: Dimensions.width10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return Colors.deepOrangeAccent;
      case 1:
        return Colors.purple;
      case 2:
        return Colors.lightBlue;
      default:
        return Colors.deepOrangeAccent;
    }
  }
}