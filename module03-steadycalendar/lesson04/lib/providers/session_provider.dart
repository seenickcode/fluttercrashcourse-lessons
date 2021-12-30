import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '/repositories/cal_repo_interface.dart';
import '/models/calendar.dart';

class SessionProvider extends ChangeNotifier {
  List<Calendar> _cals = [];
  List<Calendar> get cals => _cals;
  CalRepoInterface calRepo;

  SessionProvider(this.calRepo);

  refreshCalendars() async {
    _cals = await calRepo.refreshCalendars();

    notifyListeners();
  }

  saveCalendar(Calendar cal) async {
    return calRepo.saveCalendar(cal);
  }

  deleteCalendar(Calendar cal) async {
    return calRepo.deleteCalendar(cal);
  }

  saveDate(Calendar cal, DateTime date) async {
    return calRepo.saveDate(cal, date);
  }

  deleteDate(Calendar cal, DateTime date) async {
    return deleteDate(cal, date);
  }
}
