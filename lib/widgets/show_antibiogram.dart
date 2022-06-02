import 'package:flutter/material.dart';

class ShowAntibiogram extends StatelessWidget {
  const ShowAntibiogram({Key? key, required this.asset}) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Antibiograma',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  )
                ],
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: 700,
                  height: 500,
                  child: Image(
                    image: AssetImage(asset),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const Text(
        'Antibiograma Adjunto',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
