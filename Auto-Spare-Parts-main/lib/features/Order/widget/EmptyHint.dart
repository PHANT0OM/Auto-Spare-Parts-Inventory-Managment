import 'package:flutter/material.dart';
class EmptyHint extends StatelessWidget {
  const EmptyHint({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Icon(Icons.add_circle_outline, size: 32, color: Colors.grey),
          SizedBox(height: 6),
          Text('Click “Add Product” to select more items'),
        ],
      ),
    );
  }
}
