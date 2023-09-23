import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final txtUserController = TextEditingController();
  final txtPasswordController = TextEditingController();

  Future<void> _login() async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: txtUserController.text, password: txtPasswordController.text);
      if(userCredential.user == null){
        print("Acceso no valido");


      }else{
        print('acceso correcto ${userCredential.user?.email}');
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: 'Felicidades los datos son correctos!',
        );
      }
    }catch(e){
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Sorry, something went wrong',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body:Column(
        children: [Image.network("https://www.iconpacks.net/icons/1/free-user-login-icon-305-thumb.png") ,
          TextField(
            controller: txtUserController,
          decoration:  InputDecoration(
            border: OutlineInputBorder(), hintText: "Usuario"
          ),
        ),
           TextField(
            controller: txtPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: "Contraseña"
          ),
        ),
          TextButton(onPressed: (){
            _login();
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
            child: const Text("Acceder"),
          )
        ],
      ),
    );
  }
}
