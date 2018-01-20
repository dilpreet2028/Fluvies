import 'dart:async';

import 'package:fluvies/data/db_helper.dart';
import 'package:fluvies/data/models/Movie.dart';
import 'package:fluvies/data/network/network_data.dart';

class Injector {

  static final Injector injector = new Injector._injector();
  NetworkData _networkData;
  DbHelper _dbHelper;

  Injector._injector(){
    _networkData = new NetworkData();
    _dbHelper = new DbHelper();
  }

  factory Injector() {
    return injector;
  }

  NetworkData get networkData => _networkData;

  DbHelper get dbHelper => _dbHelper;

}