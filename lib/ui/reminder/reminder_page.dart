import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_maths_tricks/theme/color_scheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

import '../../app/pref_data.dart';
import '../../model/color_model.dart';
import '../../model/model_reminder.dart';
import '../common/common.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPage createState() => _ReminderPage();
}

class _ReminderPage extends State<ReminderPage> {
  bool checkboxValueCity = true;
  List<String> allCities = ['Sun', 'Mon', 'Tue', "Wed", "Thu", "Fri", "Sat"];
  List<String> selectedCities = [];
  List<String> selectedCitiesTemp = [];
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  List<ModelReminder> reminderList = [];

  int orgRemindHour = 5;
  int orgRemindMinute = 30;
  int orgRemindSec = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  List<String> daysDateTimeList = [
    DateTime.sunday.toString(),
    DateTime.monday.toString(),
    DateTime.tuesday.toString(),
    DateTime.wednesday.toString(),
    DateTime.thursday.toString(),
    DateTime.friday.toString(),
    DateTime.saturday.toString()
  ];
  void backClicks() {
    Get.back();
  }

  getData() async {
    reminderList = await getReminderList();
    bool isAdded = await getAddReminder();

    if (reminderList.length <= 0 && isAdded) {
      daysDateTimeList.forEach((element) {
        _scheduleWeeklyMondayTenAMNotification(int.parse(element), 1);
      });

      addReminderData("09:00 AM", jsonEncode(allCities), "0").then((value1) {
        getData();
        setAddReminder();
      });
    }

    setState(() {});
  }

  ColorModel tuple3 = getRandomColor(0);

  List<String> idList = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: getBackgroundColor(context),
        body: SafeArea(
          child: Column(
            children: [
              getCommonAppBar(
                  context: context,
                  function: () {
                    backClicks();
                  },
                  title: 'Reminder',
                  isSetting: true,
                  color: tuple3.darkColor),
              Expanded(
                  child: Container(
                color: getBackgroundColor(context),
                margin: EdgeInsets.all(5),
                child: reminderList.length > 0
                    ? ListView.builder(
                        primary: true,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: reminderList.length,
                        itemBuilder: (context, index) {
                          print("inrec1==true");
                          ModelReminder modelReminder = reminderList[index];

                          return Container(
                              decoration: getDefaultDecoration(
                                  isShadow: true,
                                  shadowColor: getShadowColor(context),
                                  radius: 18.r,
                                  bgColor: getCardColor(context)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: horSpace, vertical: 10.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 15.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomFont(modelReminder.time!, 20,
                                      getFontColor(context), 1,
                                      fontWeight: FontWeight.w600),
                                  7.verticalSpace,
                                  Row(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          getCustomFont('Repeat:', 13,
                                              getFontColor(context), 1,
                                              fontWeight: FontWeight.w400),
                                          getCustomFont(
                                              modelReminder.repeat!
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", "")
                                                  .replaceAll("\"", ""),
                                              13,
                                              getFontColor(context),
                                              1,
                                              fontWeight: FontWeight.w400),
                                        ],
                                      ),
                                      new Spacer(),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.delete,
                                          color: getPrimaryColor(context),
                                          size: 28.h,
                                        ),
                                        onTap: () {
                                          List list = jsonDecode(
                                              reminderList[index].idList!);

                                          for (int i = 0;
                                              i < list.length;
                                              i++) {
                                            flutterLocalNotificationsPlugin
                                                .cancel(list[i]);
                                          }

                                          reminderList
                                              .remove(reminderList[index]);
                                          setReminderArray(ModelReminder.encode(
                                              reminderList));

                                          getData();
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                ],
                              ));
                        },
                      )
                    : Center(
                        child: getCustomFont(
                            "No Data", 20, getFontColor(context), 1),
                      ),
              ))
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: getPrimaryColor(context),
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  List<String> selectedOrgDayList = [];

                  return _MyDialog(
                    cities: allCities,
                    selectedCities: selectedCities,
                    onSelectedCitiesListChanged: (cities) {
                      setState(() {
                        selectedCitiesTemp = cities;
                      });
                    },
                    onSelectedValue: (values) {
                      if (selectedCitiesTemp.length > 0) {
                        selectedOrgDayList = [];
                        selectedCitiesTemp.forEach((element) {
                          int i = selectedCitiesTemp.indexOf(element);
                          selectedOrgDayList.add(daysDateTimeList[i]);
                        });
                      }

                      showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                          builder: (BuildContext? contexts, Widget? child) {
                            return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: true),
                                child: Theme(
                                  data: ThemeData.dark().copyWith(
                                      colorScheme: ColorScheme.dark(
                                    primary: getPrimaryColor(context),
                                    onPrimary: Colors.white,
                                    surface: getCardColor(context),
                                    onSurface: getFontColor(context),
                                    onBackground: getPrimaryColor(context),
                                  )),
                                  child: child!,
                                ));
                          }).then((value) async {
                        if (values.length > 0) {
                          orgRemindHour = value!.hour;
                          orgRemindMinute = value.minute;

                          String amPm = "PM";
                          if (value.period == DayPeriod.am) {
                            amPm = "AM";
                          }
                          String time = (value.hourOfPeriod < 10 ? "0" : "") +
                              value.hourOfPeriod.toString() +
                              ":" +
                              (value.minute < 10 ? "0" : "") +
                              value.minute.toString() +
                              " " +
                              amPm;
                          String s = jsonEncode(values);
                          idList = [];
                          print("gteval===--$time==$s");

                          await saveData(selectedOrgDayList).then((value) {
                            print("idList====${idList.length}");
                            addReminderData(time, s, "1").then((value1) {
                              getData();
                              setState(() {});
                            });
                          });

                          setState(() {});
                        }

                        return value!;
                      });
                    },
                  );
                });
          },
        ),
      ),
      onWillPop: () async {
        onBackClick();
        return false;
      },
    );
  }

  Future<void> saveData(List<String> selectedOrgDayList) async {
    for (int i = 0; i < selectedOrgDayList.length; i++) {
      int id = await getId();
      _scheduleWeeklyMondayTenAMNotification(
          int.parse(selectedOrgDayList[i]), id);
      setId((id + 1));
      idList.add(id.toString());
    }
  }

  Future<void> _scheduleWeeklyMondayTenAMNotification(int day, int id) async {
    print("id====$id");

    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        'Maths Trick',
        '',
        _nextInstanceOfMondayTenAM(day),
        const NotificationDetails(
          android: AndroidNotificationDetails('com.example.flutter_maths_trick',
              'com.example.flutter_maths_trick channel',
              channelDescription: 'Maths Trick'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  }

  tz.TZDateTime _nextInstanceOfMondayTenAM(int day) {
    tz.TZDateTime scheduledDate = _nextInstanceOfTenAM();
    print("schedule===${scheduledDate.weekday}--${DateTime.monday}");

    while (scheduledDate.weekday != day) {
      print("schedule123===${scheduledDate.weekday}--${DateTime.monday}");
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, orgRemindHour, orgRemindMinute);
    print("schedule===$scheduledDate--$now--${scheduledDate.isBefore(now)}");
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<int> addReminderData(String time, String repeat, String ison) async {
    List<ModelReminder> list1 = await getReminderList();

    ModelReminder model = new ModelReminder();
    model.time = time;
    model.repeat = repeat;
    model.ison = ison;
    model.id = (list1.length + 1);
    model.idList = idList.toString();
    list1.add(model);

    setReminderArray(ModelReminder.encode(list1));

    return 0;
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  void onBackClick() {
    Navigator.of(context).pop();
  }
}

void checkReminderData() async {
  List<ModelReminder> list = [];
  DateTime currentTime = DateTime.now();
  DateFormat formatter = DateFormat('hh:mm a');
  DateFormat formatterDays = DateFormat('EEE');
  final String formatted = formatter.format(currentTime);
  final String formattedDay = formatterDays.format(currentTime);
  print("Hello, world");
  FlutterLocalNotificationsPlugin flip = new FlutterLocalNotificationsPlugin();

  var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
  var ios = new IOSInitializationSettings();

  // initialise settings for both Android and iOS device.
  var settings = new InitializationSettings(android: android, iOS: ios);
  flip.initialize(settings);

  list = await getReminderList();

  for (int i = 0; i < list.length; i++) {
    ModelReminder modelRemind = list[i];
    var getData = jsonDecode(modelRemind.repeat!);
    List<String> jsonDecodeTags = new List<String>.from(getData);
    print("chkremind===--${jsonDecodeTags.toString()}==$formattedDay");
  }

  print("eminder_notify==true$formatted===$formattedDay");
}

class _MyDialog extends StatefulWidget {
  _MyDialog(
      {this.cities,
      this.selectedCities,
      this.onSelectedCitiesListChanged,
      this.onSelectedValue});

  final List<String>? cities;
  final List<String>? selectedCities;
  final ValueChanged<List<String>>? onSelectedCitiesListChanged;
  final ValueChanged<List<String>>? onSelectedValue;

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
  List<String> _tempSelectedCities = [];

  @override
  void initState() {
    _tempSelectedCities = widget.selectedCities!;
    super.initState();
  }

  @override
  Widget build(BuildContext contextz) {
    return Dialog(
        backgroundColor: getCardColor(context),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.r))),
        insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          height: 500,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: getCustomFont(
                        'Select days', 22, getFontColor(context), 1,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.cities!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cityName = widget.cities![index];

                      return Container(
                        child: CheckboxListTile(
                            title: Text(cityName),
                            value: _tempSelectedCities.contains(cityName),
                            activeColor: getPrimaryColor(context),
                            onChanged: (bool? value) {
                              if (value!) {
                                if (!_tempSelectedCities.contains(cityName)) {
                                  setState(() {
                                    _tempSelectedCities.add(cityName);
                                  });
                                }
                              } else {
                                if (_tempSelectedCities.contains(cityName)) {
                                  setState(() {
                                    _tempSelectedCities.removeWhere(
                                        (String city) => city == cityName);
                                  });
                                }
                              }
                              widget.onSelectedCitiesListChanged!(
                                  _tempSelectedCities);
                            }),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(10.h),
                      child: getTextWidget("Ok", 20, getFontColor(context),
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      widget.onSelectedValue!(_tempSelectedCities);
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
