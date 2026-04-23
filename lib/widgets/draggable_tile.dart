import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/stock_model.dart';
import '../controllers/watchlist_bloc.dart';
import '../controllers/watchlist_event.dart';

class DraggableTile extends StatelessWidget {
  final StockModel stock;
  const DraggableTile({
    super.key,
    required this.stock,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.drag_handle, color: Colors.black87),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    stock.name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.black),
                  onPressed: () {
                    context.read<WatchlistBloc>().add(
                          DeleteStock(stock.id),
                        );
                  },
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
