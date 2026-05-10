import 'package:flutter/material.dart';

class ImageGridViewScreen extends StatelessWidget {
  const ImageGridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Local Asset Images
    final List<Map<String, String>> items = [
      {"name": "Travelbag", "image": "assets/images/travelbag.jpg"},
      {"name": "shirt", "image": "assets/images/shirt.jpg"},
      {"name": "checkshirt", "image": "assets/images/checkshirt.jpg"},
      {"name": "Formal shirt", "image": "assets/images/formalshirt.jpg"},
      {"name": "Travelbag", "image": "assets/images/travelbag.jpg"},
      {"name": "shirt", "image": "assets/images/shirt.jpg"},
      {"name": "checkshirt", "image": "assets/images/checkshirt.jpg"},
      {"name": "Formal shirt", "image": "assets/images/formalshirt.jpg"},
      {"name": "Travelbag", "image": "assets/images/travelbag.jpg"},
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

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
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
                children: [
                  // Asset Image
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),

                      child: Image.asset(
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
