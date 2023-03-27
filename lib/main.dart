import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Dice"),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

//StatefulWidget' i stful diyip enter yaptığında iki tane class otomatik olarak geliyor.
//Class' lar DicePage ve _DicePageState
//StatfulWidget' lerde hot reload yapamazsın. Bir değişiklik yaptığında run' laman gerekir

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);
  @override
  State<DicePage> createState() => _DicePageState();
}


class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void ChangeDicePage(){
    setState(() {   //Setstate yapılmasaydı yani sadece leftDiceNumber olsaydı değişiklik olmazdı, onu hot reload yaparak değiştirebilirdik. setState leftDiceNumber' da yazan degeri build cevresinde uyarak değişiklik olmasını sagladi ve bu sayede hot reload yapmadan kendisi değişiklik yapabiliyor.
      leftDiceNumber = Random().nextInt(6) + 1;    //Random().nextInt(6) denseydi sadece 0 ile 5 arasında olurdu. Ama zar 1 ile 6 arasında oldugu icin 1 ekledik.
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            //flex : 1 ==> flex bütüp küçültmeye yaraıyor. Ornegin burada 2 tane resim var. Birine flex:1, diğeri 2 dersek birbirinin 2 katı olur. Flex buraya yazılıyor.
            child: TextButton
              (
              onPressed: (){
                ChangeDicePage();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),

          Expanded(
            child: TextButton
              (
              onPressed: (){
                ChangeDicePage();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}



