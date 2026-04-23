import 'package:flutter/material.dart';
import '../models/stock_model.dart';

class StockTile extends StatelessWidget {
  final StockModel stock;
  const StockTile({super.key, required this.stock});
  @override
  Widget build(BuildContext context) {
    final isPositive = stock.change >= 0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  (stock.type == null || stock.type!.isEmpty)
                      ? stock.exchange
                      : "${stock.exchange} | ${stock.type}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                stock.price.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isPositive ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${stock.change.toStringAsFixed(2)} (${stock.percent}%)",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
