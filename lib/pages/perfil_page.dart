// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'component/profile_menu.dart';
import 'component/profile_pic.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Minha Conta",
            icon: "images/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notificação",
            icon: "images/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Configurações",
            icon: "images/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Ajuda",
            icon: "images/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "images/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    ),
    );
  }
}
