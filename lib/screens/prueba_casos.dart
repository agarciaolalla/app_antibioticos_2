import 'package:app_antibioticos/models/models.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:app_antibioticos/request/case_peticion.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  // ignore: prefer_final_fields
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<Case> usuarios = [];

  @override
  void initState() {
    _cargarUsuarios();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola'),
      ),
      //este SmartRefresher me permite recargar o refrescar la pagina actulizando
      body: ListView.separated(
          itemBuilder: (_, i) => _usuarioLisTitle(usuarios[i]),
          separatorBuilder: (_, i) => const Divider(),
          itemCount: usuarios.length),
    );
  }

  ListTile _usuarioLisTitle(Case usuario) {
    return ListTile(
      title: Text(usuario.numero),
    );
  }

  _cargarUsuarios() async {
    usuarios = await listCasos();

    setState(() {});
    // monitor network fetch
    //await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
