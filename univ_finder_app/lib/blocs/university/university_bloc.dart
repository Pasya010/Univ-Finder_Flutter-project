import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univ_finder_app/blocs/university/university_event.dart';
import 'package:univ_finder_app/blocs/university/university_state.dart';
import 'package:univ_finder_app/models/university.dart';
import 'package:univ_finder_app/repositories/api_repository.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final ApiRepository repository;
  final List<University> _collection = [];

  UniversityBloc(this.repository) : super(UniversityInitial()) {
    on<FetchUniversityApi>(
      (event, emit) async {
        emit(UniversityLoading());
        try {
          final data =
              await repository.searchUniversityByCountry(event.country);

          emit(UniversityLoaded(data));
        } catch (e) {
          emit(UniverSityError());
        }
      },
    );

    on<AddToCollection>(
      (event, emit) {
        _collection.add(event.university);
      },
    );

    on<LoadCollection>(
      (event, emit) {
        emit(UniversityCollectionLoaded(List.unmodifiable((_collection))));
      },
    );
  }
}
