import 'package:flutter/material.dart';
import '/models/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import '/util/colors.dart';
import '/config/styles.dart';
import 'package:intl/intl.dart';

final now = DateTime.now();
final firstDay = DateTime(now.year, now.month - 3, now.day);
final lastDay = DateTime(now.year, now.month, now.day);

class MonthGrid extends StatefulWidget {
  final Calendar cal;

  const MonthGrid(this.cal, {Key? key}) : super(key: key);

  @override
  _MonthGridState createState() => _MonthGridState();
}

class _MonthGridState extends State<MonthGrid> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      calendarStyle: CalendarStyle(
        todayTextStyle:
            _defaultTextStyle(color: hexToColor(widget.cal.colorHex)),
        todayDecoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7), shape: BoxShape.circle),
        selectedDecoration: BoxDecoration(
            color: hexToColor(widget.cal.colorHex), shape: BoxShape.circle),
        selectedTextStyle: _defaultTextStyle(color: Colors.white),
        weekendTextStyle: _defaultTextStyle(),
        defaultTextStyle: _defaultTextStyle(color: Styles.primaryTextColor),
        outsideTextStyle: _defaultTextStyle(color: Styles.tertiaryTextColor),
        disabledTextStyle: _defaultTextStyle(color: Styles.tertiaryTextColor),
      ),
      focusedDay: DateTime.now(),
      startingDayOfWeek: StartingDayOfWeek.sunday,
      headerStyle: HeaderStyle(
          leftChevronVisible: false,
          rightChevronVisible: false,
          // NOTE left padding takes cell size into account, in order to be left
          // flush aligned with calendar title above
          headerPadding: const EdgeInsets.fromLTRB(3.0, 20.0, 0.0, 20.0),
          titleTextFormatter: (date, locale) =>
              DateFormat.yMMMM(locale).format(date).toUpperCase(),
          titleTextStyle: _defaultTextStyle(color: Styles.tertiaryTextColor),
          formatButtonVisible: false,
          titleCentered: false),
      daysOfWeekHeight: 40.0,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: _defaultTextStyle(color: Styles.primaryTextColor),
        weekendStyle: _defaultTextStyle(color: Styles.primaryTextColor),
        dowTextFormatter: (date, locale) =>
            DateFormat.E(locale).format(date)[0],
      ),
      selectedDayPredicate: (day) =>
          (widget.cal.dates != null && widget.cal.dates!.containsKey(day.hashCode)),
    );
  }

  TextStyle _defaultTextStyle({Color? color}) {
    return TextStyle(
        fontFamily: Styles.secondaryFontRegular,
        fontSize: Styles.smallTextFontSize,
        color: color);
  }
}
