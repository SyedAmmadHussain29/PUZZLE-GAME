import 'package:flutter/material.dart';
import 'package:puzzle_game/widget/grid.dart';

class board extends StatefulWidget {
  const board({super.key});

  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  var number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int noofmove = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text(
          "PUZZLE GAME",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
                child: Text(
              noofmove.toString() + " Moves  |  15 Tiles",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(
            height: 40,
          ),
          // Align(
          // alignment: Alignment.center,
          // child: imageDisplay("images/logo1.png")),
          Center(child: grid(number, onClick)),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(10),
              ),
              onPressed: () {
                setState(() {
                  number.shuffle();
                });
              },
              child: const Text("   Shuffle   "))
        ],
      ),
    );
  }

  void onClick(index) {
    if (index - 1 >= 0 && number[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && number[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4) >= 0 && number[index - 4] == 0 ||
        (index + 4 < 16 && number[index + 4] == 0)) {
      setState(() {
        number[number.indexOf(0)] = number[index];
        number[index] = 0;
        noofmove++;
      });
    }
    checkWinner();
  }

  bool issorted(List numberList) {
    int first = numberList.first;
    for (int i = 1; i < numberList.length; i++) {
      int nextNumber = numberList[i];
      if (first > nextNumber) return false;
      first = numberList[i];
    }
    return true;
  }

  void checkWinner() {
    bool isWinner = issorted(number);
    if (isWinner) {
      print("Winner");
    } else {
      print("Not Shorted");
    }
  }
}
