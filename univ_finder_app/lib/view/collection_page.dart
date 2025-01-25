import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univ_finder_app/blocs/university/university_bloc.dart';
import 'package:univ_finder_app/blocs/university/university_event.dart';
import 'package:univ_finder_app/blocs/university/university_state.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UniversityBloc>().add(LoadCollection());

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<UniversityBloc, UniversityState>(
        builder: (context, state) {
          if (state is UniversityCollectionLoaded) {
            if (state.collection.isEmpty) {
              return const Center(
                child: Text('No universities in collection'),
              );
            }
            return ListView.builder(
              itemCount: state.collection.length,
              itemBuilder: (context, index) {
                final data = state.collection[index];
                return ListTile(
                  leading: Text((index + 1).toString()),
                  title: Text(data.name),
                  subtitle: Text(data.country),
                  trailing: Text(data.alphaTwoCode),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
