abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Map<String, dynamic>> items;

  ArticleLoaded(this.items);
}

class ArticleError extends ArticleState {}
