import 'package:flutter/material.dart';

class ListTileItem extends StatefulWidget {
  final String title;
  final String cantidadMaxima;
  const ListTileItem(
      {Key? key, required this.title, required this.cantidadMaxima})
      : super(key: key);
  @override
  _ListTileItemState createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  bool _isDisable = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: SizedBox(
        height: 150,
        width: 150,
        child: Row(
          children: <Widget>[
            _itemCount != 0
                ? IconButton(
                    icon: const Icon(Icons.remove),
                    //onPressed: () => setState(() => _itemCount--),
                    onPressed: () {
                      if (!_isDisable) {
                        setState(() {
                          _itemCount--;
                        });
                      }
                    },
                  )
                : Container(),
            Text(_itemCount.toString()),
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => setState(() {
                      if (!_isDisable &&
                          _itemCount != int.parse(widget.cantidadMaxima)) {
                        _itemCount++;
                      }
                    })),
            IconButton(
                icon: const Icon(Icons.check_circle),
                onPressed: () {
                  //if (!_isDisable) {
                  //  _isDisable = true;
                  //} else {
                  //  _isDisable = false;
                  //}
                })
          ],
        ),
      ),
    );
  }
}
