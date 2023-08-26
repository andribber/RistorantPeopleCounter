import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Jacquin Ristorant Counter',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              )
          ),
          backgroundColor: Colors.yellow,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        drawer: const Drawer(
          backgroundColor: Colors.yellow,
        ),
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(isFull ? 'assets/img/full.jpg' : 'assets/img/empty.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  border: Border(),
                ),
                child: Text(
                    isFull ? 'Tá cheio, espera vergonha da pofisson' : 'Tá livre, pode entrar',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    border: Border(),
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 100,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        fixedSize: const Size(110, 110),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(width: 32),
                  TextButton(
                    onPressed: isFull ? null: increment,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      fixedSize: const Size(110, 110),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}

