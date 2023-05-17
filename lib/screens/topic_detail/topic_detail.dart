import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TopicDetailScreen extends StatelessWidget {
  const TopicDetailScreen({
    Key? key,
    required this.pdfLink,
    required this.topicName
  }) : super(key: key);
  final String pdfLink;
  final String topicName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.navigate_before,size: 30,)
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Text(topicName,),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SfPdfViewer.network(pdfLink),
    );
  }
}
