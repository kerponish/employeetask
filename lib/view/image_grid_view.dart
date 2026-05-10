import 'package:flutter/material.dart';

class ImageGridViewScreen extends StatelessWidget {
  const ImageGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Image + Name Data
    final List<Map<String, String>> items = [
      {"name": "Mountain", "image": "https://picsum.photos/id/1018/300/300"},
      {"name": "Nature", "image": "https://picsum.photos/id/1015/300/300"},
      {"name": "Beach", "image": "https://picsum.photos/id/1011/300/300"},
      {"name": "River", "image": "https://picsum.photos/id/1016/300/300"},
      {"name": "Forest", "image": "https://picsum.photos/id/1020/300/300"},
      {"name": "City", "image": "https://picsum.photos/id/1025/300/300"},
      {"name": "Road", "image": "https://picsum.photos/id/1035/300/300"},
      {"name": "Flowers", "image": "https://picsum.photos/id/1040/300/300"},
      {"name": "Sunset", "image": "https://picsum.photos/id/1050/300/300"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Grid View"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: GridView.builder(
          itemCount: items.length,

          // 3 × 3 Grid
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),

          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.network(
                        items[index]["image"]!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Name
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index]["name"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
