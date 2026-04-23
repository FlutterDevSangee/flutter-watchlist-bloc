abstract class WatchlistEvent {}

class LoadWatchlist extends WatchlistEvent {}

class ReorderWatchlist extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;

  ReorderWatchlist(this.oldIndex, this.newIndex);
}

class DeleteStock extends WatchlistEvent {
  final String id;

  DeleteStock(this.id);
}

class NavigateToEditScreen extends WatchlistEvent {}
