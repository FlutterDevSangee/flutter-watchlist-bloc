import '../models/stock_model.dart';

abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<StockModel> stocks;

  WatchlistLoaded(this.stocks);
}

class NavigateToEditScreenState extends WatchlistState {}
