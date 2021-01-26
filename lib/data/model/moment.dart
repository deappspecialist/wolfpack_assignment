import 'package:wolfpack_assign/data/enum/icon_enum.dart';
import 'package:wolfpack_assign/service/log/logger_service.dart';
import 'package:wolfpack_assign/util/injection/locator.dart';

import 'medicine.dart';

class Moment {
  final _log = locator<LoggerService>().getLogger('Moment');
  final String title;
  final IconEnum icon;
  final List<Medicine> medicineList;
  final DateTime date;
  bool isCollapsed;
  bool _isOpen;

  Moment({this.title, this.icon, this.medicineList, this.date, this.isCollapsed});

  bool isOpen() {
    _isOpen = true;
    for (Medicine medicine in this.medicineList) {
      if (!medicine.isTaken) {
        _isOpen = false;
        break;
      }
    }
    return _isOpen;
  }
}
