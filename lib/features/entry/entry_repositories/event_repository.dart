import 'package:dartz/dartz.dart';
import 'package:neta_event_mvvm/features/events/models_events/event_model.dart';

abstract class EntryRepository {
  Future<String> gettokenformpref();

  //Future<bool> checktoken();
}
