import 'package:equatable/equatable.dart';
import '../travel.dart';


abstract class TravelState extends Equatable {
  TravelState([List props = const []]) : super(props);
}

class TravelUninitialized extends TravelState {
  @override
  String toString() => 'TravelUninitialized';
}

class TravelError extends TravelState {
  @override
  String toString() => 'TravelError';
}

class TravelLoaded extends TravelState {
  final List<Travel> travels;
  final bool hasReachedMax;

  TravelLoaded({
    this.travels,
    this.hasReachedMax,
  }) : super([travels, hasReachedMax]);

  TravelLoaded copyWith({
    List<Travel> travels,
    bool hasReachedMax,
  }) {
    return TravelLoaded(
      travels: travels ?? this.travels,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() =>
      'TravelLoaded { posts: ${travels.length}, hasReachedMax: $hasReachedMax }';
}
