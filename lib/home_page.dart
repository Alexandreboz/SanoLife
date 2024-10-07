import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Données des médicaments pour l'exemple
  List<Map<String, String>> medications = [
    {'time': '08:00', 'name': 'Doliprane', 'dose': 'Prendre 1 Pilule(s)'},
    {'time': '20:00', 'name': 'Doliprane', 'dose': 'Prendre 1 Pilule(s)'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person),
            ),
            SizedBox(width: 10),
            Text('Alexandre'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'lun.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '7',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: List.generate(6, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Text(
                                [
                                  'mar.',
                                  'mer.',
                                  'jeu.',
                                  'ven.',
                                  'sam.',
                                  'dim.'
                                ][index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${8 + index}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Aujourd\'hui, 7 oct.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.circle_outlined),
                      title: Text(medications[index]['name']!),
                      subtitle: Text(medications[index]['dose']!),
                      trailing: Text(
                        medications[index]['time']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action pour ajouter un nouveau médicament
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Domicile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Mises à jour',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Médicaments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Plus',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
