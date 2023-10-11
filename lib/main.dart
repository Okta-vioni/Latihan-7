import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Retrieve Text Input"),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: "Show me the value!",
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Masukkan Email",
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              maxLines: 1,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Masukkan Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => submit(
                context,
                _emailController.text,
                _passwordController.text,
              ),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

void submit(BuildContext context, String email, String password) {
  if (email.isEmpty || password.isEmpty) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text("Email dan Password harus diisi"),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
  }
  AlertDialog alert = AlertDialog(
    title: Text("Login Berhasil"),
    content: Container(
      child: Text("Selamat Anda Berhasil Login"),
    ),
    actions: [
      TextButton(
        child: Text("Ok"),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );
  showDialog(context: context, builder: (context) => alert);
  return;
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text("Yay! A SnackBar!"),
            action: SnackBarAction(
              label: "Undo",
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Show SnackBar"),
      ),
    );
  }
}

class MyToast extends StatefulWidget {
  const MyToast({super.key});

  @override
  State<MyToast> createState() => _toastState();
}

class _toastState extends State<MyToast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toast"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "The Toast Message",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                fontSize: 16.0,
              );
            },
            child: const Text(
              "Show Toast Message",
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
