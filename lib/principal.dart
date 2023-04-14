import 'package:flutter/material.dart';

void main() => runApp(Principal());

class Principal extends StatefulWidget {
  @override
  _MyAplicacion createState() => _MyAplicacion();
}

class _MyAplicacion extends State<Principal> {
  int _paginaActual = 0;

  List<Widget> _paginas = [
    PaginaHome(),
    PaginaServicio(),
    PaginaActividades(),
    PaginaPedidos(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIDROCOMPRAS',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("HIDROCOMPRAS"),
          //color de fondo
          backgroundColor: Color.fromARGB(255, 0, 5, 77),
          // Establecer la imagen de la pantalla frontal
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),

          // Coloca el icono detrás
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).pushNamed('/six');
              },
            ),
            IconButton(
              icon: Icon(Icons.logout_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed('/one');
              },
            ),
          ],
        ),
        body: _paginas[_paginaActual],
        //backgroundColor: Color.fromARGB(255, 214, 214, 214),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 0, 5, 77),
          selectedItemColor: Color.fromARGB(255, 126, 236, 255),
          unselectedItemColor: Color.fromARGB(255, 224, 224, 224),
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.build_circle,
              ),
              label: 'Servicios',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
              ),
              label: 'Actividades',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_shipping,
              ),
              label: 'Pedidos',
            ),
          ],
        ),
      ),
    );
  }
}

class PaginaHome extends StatelessWidget {
  const PaginaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Image(
            width: double.infinity,
            image: AssetImage("images/Ahorra.jpg"),
          ),
        ),
        Expanded(
          child: Image(
            width: double.infinity,
            image: AssetImage("images/Producto.jpg"),
          ),
        ),
      ],
    );
  }
}

class PaginaServicio extends StatelessWidget {
  const PaginaServicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.settings_suggest_rounded,
                  size: 50,
                ),
                Text(
                  'Servicios',
                  style: TextStyle(
                    color: Color.fromARGB(255, 27, 27, 27),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              height: 94.0,
              width: 114.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/two');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings_suggest_rounded,
                      size: 60,
                    ),
                    Text('Trabajos'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              height: 94.0,
              width: 114.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/two');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.local_shipping,
                      size: 60,
                    ),
                    Text('Envíos'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              height: 94.0,
              width: 114.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/two');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.calendar_month,
                      size: 60,
                    ),
                    Text('Reservar'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaginaActividades extends StatelessWidget {
  const PaginaActividades({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.pending_actions,
                  size: 50,
                ),
                Text(
                  'Actividades',
                  style: TextStyle(
                    color: Color.fromARGB(255, 27, 27, 27),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaginaPedidos extends StatelessWidget {
  const PaginaPedidos({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.trolley,
                  size: 40,
                ),
                Text(
                  'Productos',
                  style: TextStyle(
                    color: Color.fromARGB(255, 27, 27, 27),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
