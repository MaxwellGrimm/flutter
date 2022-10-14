import 'package:flutter/material.dart';
import 'ClaunsModel.dart';
import 'package:provider/provider.dart';

class AddClaunWidget extends StatelessWidget {
  const AddClaunWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var clueController = TextEditingController();
    var answerController = TextEditingController();
    return Consumer<ClaunsModel>(builder: (context, claunsModel, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
                controller: answerController,
                onChanged: null,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Answer Here',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10))),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
                controller: clueController,
                onChanged: null,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Clue Here',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10))),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //add button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () => claunsModel.addClauns(
                            clue: clueController.text,
                            answer: answerController.text),
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.lightBlue),
                            shadowColor:
                                MaterialStatePropertyAll<Color>(Colors.grey),
                            fixedSize: MaterialStatePropertyAll<Size>(
                                Size.fromWidth(100))),
                        child: const Text('Add',
                            style: const TextStyle(color: Colors.white))),
                  ),
                  //clear button
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () =>
                            {clueController.clear(), answerController.clear()},
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.lightBlue),
                            shadowColor:
                                MaterialStatePropertyAll<Color>(Colors.grey),
                            fixedSize: MaterialStatePropertyAll<Size>(
                                Size.fromWidth(100))),
                        child: const Text('Clear',
                            style: const TextStyle(color: Colors.white))),
                  ),
                ],
              ))
        ],
      );
    });
  }
}
