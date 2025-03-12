import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column
          (
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(       // opacity 0 - 1   only set on requerd
              opacity: 0.8,
              child: Image.asset("assets/images/flutter_logo.png",
              width: 100,
              height: 100,
              color: const Color.fromARGB(150, 250, 250, 250),),
            ),
            const SizedBox(height: 10,),

            Opacity(
              opacity: 0.7,
              child: Image.asset("assets/images/abcd.png",
              height: 150,
              width: 150,),
            ),
            const SizedBox(height: 65,),
            Text("Learn Flutter The Fun Way!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 23,),
            OutlinedButton.icon(onPressed: (){
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: const Color.fromARGB(215, 250, 250, 250),),
                icon: const Icon(Icons.keyboard_double_arrow_right,),
                label: const Text(
                    "Start Quiz")
            )
          ],
        ),
    );
  }
}
