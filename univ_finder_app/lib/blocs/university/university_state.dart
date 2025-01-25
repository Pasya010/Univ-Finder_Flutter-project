import 'package:univ_finder_app/models/university.dart';

abstract class UniversityState {}

class UniversityInitial extends UniversityState {}

class UniversityLoading extends UniversityState {}

class UniversityLoaded extends UniversityState {
  final List<University> data;

  UniversityLoaded(this.data);
}

class UniversityCollectionLoaded extends UniversityState {
  final List<University> collection;

  UniversityCollectionLoaded(this.collection);
}

class UniverSityError extends UniversityState {}
