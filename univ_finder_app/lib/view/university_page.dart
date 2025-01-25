import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univ_finder_app/blocs/university/university_bloc.dart';
import 'package:univ_finder_app/blocs/university/university_event.dart';
import 'package:univ_finder_app/blocs/university/university_state.dart';

class UniversityPage extends StatelessWidget {
  const UniversityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('UNIVERSITY LIST'),
      ),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<UniversityBloc, UniversityState>(
              builder: (context, state) {
            if (state is UniversityLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is UniversityLoaded) {
              return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    final data = state.data[index];
                    String webPage = data.webPages.isNotEmpty
                        ? data.webPages[0]
                        : 'No Website Page';

                    return ListTile(
                      leading: Text(data.alphaTwoCode),
                      title: Text(data.name),
                      subtitle: Text(webPage),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(data.country),
                          IconButton(
                            icon: Icon(Icons.bookmark_add),
                            onPressed: () {
                              context
                                  .read<UniversityBloc>()
                                  .add(AddToCollection(data));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        '${data.name} added to collection')),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  });
            }
            return SizedBox.shrink();
          })),
        ],
      ),
    );
  }
}
