import 'package:equatable/equatable.dart';

abstract class TravelEvent extends Equatable {}

class Fetch extends TravelEvent {
  @override
  String toString() => 'Fetch';
}