import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlistappsangeerth/controllers/watchlist_bloc.dart';
import 'package:watchlistappsangeerth/controllers/watchlist_event.dart';
import 'package:watchlistappsangeerth/screens/watchlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchlistBloc()..add(LoadWatchlist()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WatchList App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WatchlistScreen(),
      ),
    );
  }
}
