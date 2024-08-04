import 'package:flutter/material.dart';
import '../widgets/customappbar_widget.dart';
import '../widgets/customfloatingactionbutton_widget.dart';
import '../widgets/dialpad_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Favorites',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Handle add action
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(9, (index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            child: Text('A${index + 1}'),
                          ),
                          const Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.phone,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('Person ${index + 1}'),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
