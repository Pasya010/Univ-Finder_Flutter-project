import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:univ_finder_app/blocs/article/article_event.dart';
import 'package:univ_finder_app/blocs/article/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<LoadArticleItems>(
      (event, emit) async {
        emit(ArticleLoading());
        await Future.delayed(Duration(seconds: 1));
        final items = [
          {
            'title': 'Columbia University',
            'image': 'assets/images/columbia.jpg',
            'description':
                'Columbia University, continuing its tradition as a preeminent world center of learning, hosts more than 23,000 international students, faculty, researchers and visiting scholars from 162 countries plus family members who accompany them.'
          },
          {
            'title': 'Oxford University',
            'image': 'assets/images/oxford.jpg',
            'description':
                'Oxford University, continuing its tradition as a preeminent world center of learning, hosts more than 23,000 international students, faculty, researchers and visiting scholars from 162 countries plus family members who accompany them.'
          },
          {
            'title': 'Florida University',
            'image': 'assets/images/florida.jpg',
            'description':
                'Florida University, continuing its tradition as a preeminent world center of learning, hosts more than 23,000 international students, faculty, researchers and visiting scholars from 162 countries plus family members who accompany them.'
          },
        ];
        emit(ArticleLoaded(items));
      },
    );
  }
}
