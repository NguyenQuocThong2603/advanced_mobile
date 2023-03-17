import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TopicDetailScreen extends StatelessWidget {
  const TopicDetailScreen({Key? key}) : super(key: key);

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
                child: const Icon(Icons.arrow_back, color: Colors.black,size: 30,)
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: const Text('The Internet',style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SfPdfViewer.network('https://api.app.lettutor.com/file/be4c3df8-3b1b-4c8f-a5cc-75a8e2e6626afileThe Internet.pdf'),
      ),
    );
  }
}
