import 'package:flutter/material.dart';

class Article extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final int no;

  const Article({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.no,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 360,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  // number of article
                  Text(
                    no.toString().padLeft(2, '0'),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                    ),
                  ),

                  SizedBox(width: 15),

                  // Title of article
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      decorationColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Container(
                height: 180,
                width: 280,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    )),
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                textAlign: TextAlign.justify,
                description,
                maxLines: 3, // Batasi jumlah baris yang ditampilkan
                overflow: TextOverflow
                    .ellipsis, // Menambahkan "..." jika teks lebih panjang
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  decorationColor: Colors.black,
                ),
              ),
            ),

            // Read more
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Read more>>',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
