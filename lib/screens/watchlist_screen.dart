import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlistappsangeerth/controllers/watchlist_event.dart';
import 'package:watchlistappsangeerth/screens/edit_watchlist_screen.dart';
import '../controllers/watchlist_bloc.dart';
import '../controllers/watchlist_state.dart';
import '../widgets/stock_tile.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<WatchlistBloc, WatchlistState>(
      listener: (context, state) {
        if (state is NavigateToEditScreenState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const EditWatchlistScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _marketHeader(context),
              _searchBar(),
              _tabs(),
              _sortButton(),
              const Divider(height: 1),
              Expanded(
                child: BlocBuilder<WatchlistBloc, WatchlistState>(
                  builder: (context, state) {
                    if (state is WatchlistLoaded) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.stocks.length,
                        separatorBuilder: (_, __) =>
                            Divider(height: 1, color: Colors.grey.shade200),
                        itemBuilder: (_, i) =>
                            StockTile(stock: state.stocks[i]),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _bottomNav(),
      ),
    );
  }

//------------------------------
  ///  HEADER
  Widget _marketHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          context.read<WatchlistBloc>().add(NavigateToEditScreen());
        },
        child: Row(
          children: [
            Expanded(
              child: _marketBlock(
                title: "SENSEX 18TH SEP 8120",
                exchange: "BSE",
                value: "1,225.55",
                change: "144.50 (13.3%)",
                isPositive: true,
              ),
            ),
            Container(width: 1, height: 40, color: Colors.grey.shade300),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: _marketBlock(
                  title: "NIFTY BANK",
                  exchange: "",
                  value: "54,173.40",
                  change: "-13.50 (-0.02%)",
                  isPositive: false,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _marketBlock({
    required String title,
    required String exchange,
    required String value,
    required String change,
    required bool isPositive,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              exchange,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                change,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  ///  SEARCH
  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            SizedBox(width: 12),
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 10),
            Text(
              "Search for instruments",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  /// TABS
  Widget _tabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Column(
            children: [
              const Text(
                "Watchlist 1",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Container(
                height: 2,
                width: 70,
                color: Colors.black,
              )
            ],
          ),
          const SizedBox(width: 24),
          const Text("Watchlist 5", style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 24),
          const Text("Watchlist 6", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  /// SORT
  Widget _sortButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.tune, size: 18),
            SizedBox(width: 6),
            Text("Sort by"),
          ],
        ),
      ),
    );
  }

  ///  BOTTOM NAV
  Widget _bottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border), label: "Watchlist"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: "Orders"),
        BottomNavigationBarItem(
            icon: Icon(Icons.flash_on_outlined), label: "GTT+"),
        BottomNavigationBarItem(
            icon: Icon(Icons.work_outline), label: "Portfolio"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined), label: "Funds"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: "Profile"),
      ],
    );
  }
}
