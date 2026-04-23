import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/stock_model.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitial()) {
    on<LoadWatchlist>(_onLoad);
    on<ReorderWatchlist>(_onReorder);
    on<DeleteStock>(_onDelete);
    on<NavigateToEditScreen>(_onNavigate);
  }

  final List<StockModel> _stocks = [
    StockModel(
      id: "1",
      name: "RELIANCE",
      exchange: "NSE",
      price: 1374.10,
      change: -4.40,
      percent: -0.32,
      type: "EQ",
    ),
    StockModel(
      id: "2",
      name: "HDFCBANK",
      exchange: "NSE",
      price: 966.95,
      change: 0.95,
      percent: 0.10,
      type: "EQ",
    ),
    StockModel(
      id: "3",
      name: "ASIANPAINT",
      exchange: "NSE",
      price: 2537.40,
      change: 6.60,
      percent: 0.26,
      type: "EQ",
    ),
    StockModel(
      id: "4",
      name: "NIFTY IT",
      exchange: "IDX",
      price: 35185.65,
      change: 875.21,
      percent: 2.55,
      type: "",
    ),
    StockModel(
      id: "5",
      name: "RELIANCE SEPT 1880 CE",
      exchange: "NSE",
      price: 0.00,
      change: 0.00,
      percent: 0.00,
      type: "Monthly",
    ),
    StockModel(
      id: "6",
      name: "RELIANCE SEPT 1370 PE",
      exchange: "NSE",
      price: 19.20,
      change: 1.00,
      percent: 5.49,
      type: "Monthly",
    ),
    StockModel(
      id: "7",
      name: "MRF",
      exchange: "NSE",
      price: 147625.00,
      change: 550.00,
      percent: 0.37,
      type: "EQ",
    ),
    StockModel(
      id: "8",
      name: "MRF",
      exchange: "BSE",
      price: 147439.45,
      change: 463.80,
      percent: 0.32,
      type: "EQ",
    ),
  ];

  void _onLoad(LoadWatchlist event, Emitter emit) {
    emit(WatchlistLoaded(List.from(_stocks)));
  }

  void _onReorder(ReorderWatchlist event, Emitter emit) {
    if (state is WatchlistLoaded) {
      final current = List<StockModel>.from(_stocks);

      int newIndex = event.newIndex;
      if (newIndex > event.oldIndex) newIndex--;

      final item = current.removeAt(event.oldIndex);
      current.insert(newIndex, item);

      _stocks
        ..clear()
        ..addAll(current);

      emit(WatchlistLoaded(List.from(_stocks)));
    }
  }

  void _onDelete(DeleteStock event, Emitter emit) {
    _stocks.removeWhere((e) => e.id == event.id);
    emit(WatchlistLoaded(List.from(_stocks)));
  }

  void _onNavigate(NavigateToEditScreen event, Emitter emit) {
    emit(NavigateToEditScreenState());

    if (_stocks.isNotEmpty) {
      emit(WatchlistLoaded(List.from(_stocks)));
    }
  }
}
