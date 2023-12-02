import 'package:flutter/material.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocumentPage'),
      ),
      body: Center(
        child: Text('ドキュメントページ!', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
