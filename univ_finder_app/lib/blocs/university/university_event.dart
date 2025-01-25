import 'package:univ_finder_app/models/university.dart';

abstract class UniversityEvent {}

class FetchUniversityApi extends UniversityEvent {
  final String country;

  FetchUniversityApi(this.country);
}

class AddToCollection extends UniversityEvent {
  final University university;

  AddToCollection(this.university);
}

class LoadCollection extends UniversityEvent {}
