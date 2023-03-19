import 'package:flutter/material.dart';

class grid extends StatelessWidget {
  grid(this.number, this.onclick, {super.key});
  Function onclick;
  var number = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.9,
      child: GridView.builder(
          itemCount: number.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            return number[index] != 0
                ? GestureDetector(
                    onTap: () {
                      onclick(index);
                    },
                    child: Card(
                      color: Colors.blue.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      elevation: 30,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(9)),
                        height: 30,
                        width: 30,
                        child: Center(
                            child: FittedBox(
                                child: Text(number[index].toString()))),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          }),
    );
  }
}
