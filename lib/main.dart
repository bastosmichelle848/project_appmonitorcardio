import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            elevation: 5,
          ),
        ),
      ),
      title: 'HealthTrack', // Nome da sua aplicação
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('HealthTrack'), // Título da tela inicial
        actions: [
          IconButton(
            onPressed: () {
              // Implemente a funcionalidade do botão de menu aqui
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Implemente a navegação para a tela inicial aqui
              },
            ),
            ListTile(
              title: Text('Journal'),
              onTap: () {
                // Implemente a navegação para a tela de journal aqui
              },
            ),
            ListTile(
              title: Text('Activity'),
              onTap: () {
                // Implemente a navegação para a tela de activity aqui
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Implemente a navegação para a tela de profile aqui
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Monitoramento da Frequência Cardíaca',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            _buildOptionsList(context),
            SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Lista de opções
  Widget _buildOptionsList(BuildContext context) {
    List<Map<String, dynamic>> optionsList = [
      {
        "title": "Batimentos Cardíacos em Tempo Real",
        "icon": Icons.monitor_heart,
        "color": Colors.red,
        "screen": MonitoramentoScreen(),
      },
      {
        "title": "Medicações Prescritas",
        "icon": Icons.local_pharmacy,
        "color": Colors.blue,
        "screen": ConsultarScreen(),
      },
      {
        "title": "Alertas de Medicação",
        "icon": Icons.notifications,
        "color": Colors.black,
        "screen": AlertasScreen(),
      },
      {
        "title": "Entre em Contato Conosco",
        "icon": Icons.contact_support,
        "color": Colors.green,
        // Adicione aqui a tela de contato
      },
      {
        "title": "Sair",
        "icon": Icons.exit_to_app,
        "color": Colors.grey,
        // Adicione aqui a funcionalidade de sair
      },
    ];

    return Column(
      children: List.generate(
        optionsList.length,
            (index) => Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: Icon(
              optionsList[index]["icon"],
              color: optionsList[index]["color"],
            ),
            title: Text(
              optionsList[index]["title"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => optionsList[index]["screen"]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MonitoramentoScreen extends StatefulWidget {
  @override
  _MonitoramentoScreenState createState() => _MonitoramentoScreenState();
}

class _MonitoramentoScreenState extends State<MonitoramentoScreen> {
  double _batimentosCardiacos = 0.0; // Inicializando a variável para armazenar os batimentos cardíacos

  // Método para simular a leitura de batimentos cardíacos do dispositivo de vestível
  void _lerBatimentosCardiacos() {
    // Simulação de leitura de batimentos cardíacos (substitua isso com a lógica real de leitura do dispositivo de vestível)
    setState(() {
      _batimentosCardiacos = 75.0; // Valor simulado de batimentos cardíacos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoramento Cardíaco'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Batimentos Cardíacos:',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Text(
              '$_batimentosCardiacos BPM', // Exibindo os batimentos cardíacos obtidos
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                _lerBatimentosCardiacos(); // Simulando a leitura de batimentos cardíacos
              },
              child: Text('Ler Batimentos Cardíacos'),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsultarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Medicações'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lista de Medicações',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildAlertHistory(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertHistory(BuildContext context) {
    // Dados fictícios para o histórico de alertas
    List<Map<String, dynamic>> alertHistory = [
      {
        "medicacao": "Medicamento 1",
        "icone": Icons.medical_services,
        "cor": Colors.blue

      },
      {
        "medicacao": "Medicamento 2",
        "icone": Icons.medical_services,
        "cor": Colors.green

      },
      {
        "medicacao": "Medicamento 3",
        "icone": Icons.medical_services,
        "cor": Colors.orange

      },
      {
        "medicacao": "Medicamento 4",
        "icone": Icons.medical_services,
        "cor": Colors.red

      },
      {
        "medicacao": "Medicamento 5",
        "icone": Icons.medical_services,
        "cor": Colors.purple,

      },
      {
        "medicacao": "Medicamento 6",
        "icone": Icons.medical_services,
        "cor": Colors.teal

      },
      {
        "medicacao": "Medicamento 7",
        "icone": Icons.medical_services,
        "cor": Colors.yellow

      },
      {
        "medicacao": "Medicamento 8",
        "icone": Icons.medical_services,
        "cor": Colors.deepOrange

      },
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: alertHistory.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: Icon(
                alertHistory[index]["icone"],
                color: alertHistory[index]["cor"],
              ),
              title: Text(
                alertHistory[index]["medicacao"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                'Horário: ${alertHistory[index]["horario"]} - Dia: ${alertHistory[index]["dia"]}',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AlertasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas de Medicação'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lista de Alertas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildAlertList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertList(BuildContext context) {
    // Dados fictícios para os alertas preditivos
    List<Map<String, dynamic>> alertList = [
      {
        "medicamento": "Medicamento 1",
        "icone": Icons.local_pharmacy,
        "cor": Colors.blue,
        "instrucao": "Tomar medicação a cada 1 hora",
        "descricao": "Este medicamento é utilizado para tratar..."
      },
      {
        "medicamento": "Medicamento 2",
        "icone": Icons.local_pharmacy,
        "cor": Colors.green,
        "instrucao": "Tomar medicação a cada 2 horas",
        "descricao": "Este medicamento é utilizado para prevenir..."
      },
      {
        "medicamento": "Medicamento 3",
        "icone": Icons.local_pharmacy,
        "cor": Colors.orange,
        "instrucao": "Tomar medicação a cada 4 horas",
        "descricao": "Este medicamento é utilizado para aliviar..."
      },
      {
        "medicamento": "Medicamento 4",
        "icone": Icons.local_pharmacy,
        "cor": Colors.red,
        "instrucao": "Tomar medicação a cada 6 horas",
        "descricao": "Este medicamento é utilizado para controlar..."
      },
      {
        "medicamento": "Medicamento 5",
        "icone": Icons.local_pharmacy,
        "cor": Colors.purple,
        "instrucao": "Tomar medicação a cada 8 horas",
        "descricao": "Este medicamento é utilizado para..."
      },
      {
        "medicamento": "Medicamento 6",
        "icone": Icons.local_pharmacy,
        "cor": Colors.teal,
        "instrucao": "Tomar medicação a cada 12 horas",
        "descricao": "Este medicamento é utilizado para..."
      },
      {
        "medicamento": "Medicamento 7",
        "icone": Icons.local_pharmacy,
        "cor": Colors.yellow,
        "instrucao": "Tomar medicação a cada 24 horas",
        "descricao": "Este medicamento é utilizado para..."
      },
      {
        "medicamento": "Medicamento 8",
        "icone": Icons.local_pharmacy,
        "cor": Colors.deepOrange,
        "instrucao": "Tomar medicação a cada 48 horas",
        "descricao": "Este medicamento é utilizado para..."
      },
    ];

    return Column(
      children: List.generate(
        alertList.length,
            (index) => Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: ListTile(
            leading: Icon(
              alertList[index]["icone"],
              color: alertList[index]["cor"],
            ),
            title: Text(
              alertList[index]["medicamento"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              alertList[index]["instrucao"],
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
