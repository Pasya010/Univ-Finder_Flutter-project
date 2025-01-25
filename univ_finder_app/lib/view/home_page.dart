import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univ_finder_app/blocs/article/article_bloc.dart';
import 'package:univ_finder_app/blocs/article/article_state.dart';
import 'package:univ_finder_app/blocs/university/university_bloc.dart';
import 'package:univ_finder_app/blocs/university/university_event.dart';
import 'package:univ_finder_app/models/article.dart';
import 'package:univ_finder_app/view/university_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController countryController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    countryController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                // Textfield
                TextField(
                  controller: countryController,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    labelText: 'Enter Country',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),

                SizedBox(height: 10),

                // search button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () {
                          final country = countryController.text.trim();
                          if (country.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Please enter a country!'),
                              duration: Duration(seconds: 1),
                            ));
                          } else if (country.isNotEmpty) {
                            context
                                .read<UniversityBloc>()
                                .add(FetchUniversityApi(country));

                            countryController.clear();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UniversityPage()));
                          }
                        },
                        child: Text(
                          'Search Universities',
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),

                SizedBox(
                  height: 25,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Articles',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'LibreBaskerville'),
                  ),
                ),

                // Articles
                BlocBuilder<ArticleBloc, ArticleState>(
                    builder: (context, state) {
                  if (state is ArticleLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is ArticleLoaded) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];

                          return Column(
                            children: [
                              Article(
                                  no: index + 1,
                                  title: item['title'],
                                  description: item['description'],
                                  image: item['image'])
                            ],
                          );
                        });
                  }
                  return SizedBox.shrink();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
