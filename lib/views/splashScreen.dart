import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';
import 'homePage.dart';  // Importe sua HomePage

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navega para a HomePage após 3 segundos
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(HomePage());  // Redireciona para a HomePage
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF509CFC),  // Definindo a cor de fundo
      body: Center(
        child: SizedBox(
          width: 300,  // Largura desejada para a animação
          height: 300, // Altura desejada para a animação
          child: RiveAnimation.asset(
            'assets/animation.riv',  // Caminho para o arquivo Rive
            fit: BoxFit.contain,      // Ajusta a animação para se encaixar no tamanho
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
