import 'package:cartoon_app/character%20detail/screens/characterdetail_screen.dart';
import 'package:cartoon_app/character/screens/character_screen.dart';
import 'package:cartoon_app/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:(context) => const SplashScreen(),
        CharacterScreen.routeName:(context) => const CharacterScreen(),
        CharacterDetailScreen.routeName:(context) {
          Object? args=ModalRoute.of(context)!.settings.arguments;
          if (args==null){
            print('argument is null');
            return const SizedBox();
          }
          else{
           var argument=args as Map;
          var cartoon=argument['cartoon'];
          return CharacterDetailScreen(
            cartoon: cartoon,
          );
          }
        }
      },
   
    );
  }
}

