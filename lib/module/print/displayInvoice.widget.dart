import 'dart:typed_data';

import 'package:flutter/material.dart';

class DisplayInvoice extends StatelessWidget {
  final List<int> bytes;
  const DisplayInvoice(
    this.bytes, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Invoice'),
      ),
      body: SingleChildScrollView(
          child: Column(children: [Image.memory(Uint8List.fromList(bytes))])),
    );
  }
}
