import 'package:fluvies/Injector.dart';


class DbPath {

  static final DbPath dbPath = new DbPath._init();
  String _path;

  DbPath._init();

  factory DbPath() {
    return dbPath;
  }

  String get path => _path;

  set path(String value) {
    _path = value;
    new Injector();
  }

}