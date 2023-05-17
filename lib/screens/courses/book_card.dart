import 'package:advanced_mobile/config/level.dart';
import 'package:advanced_mobile/models/course/book_model.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    required this.book
  }) : super(key: key);
  final Ebook book;
  @override
  Widget build(BuildContext context) {
    return                   GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.transparent,
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          children: [
             SizedBox(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(book.imageUrl),),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 40),
                    child: Text(book.description,
                      style: const TextStyle(color: Color(0xff808080)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Text(levelsMap[book.level]!, style: const TextStyle(fontSize: 16),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
