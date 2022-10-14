import 'package:flutter/material.dart';
import 'ClaunsModel.dart';
import 'package:provider/provider.dart';

class CrosswordClauns extends StatelessWidget {
  const CrosswordClauns({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ClaunsModel>(builder: (context, claunsModel, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 600,
              decoration: BoxDecoration(border: Border.all()),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: claunsModel.claunses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                            claunsModel.claunses[index].answer.toUpperCase()),
                        subtitle: Text(claunsModel.claunses[index].clue),
                        trailing: Text(claunsModel.claunses[index].date
                            .toString()
                            .substring(0, 11)),
                        onLongPress: () {
                          claunsModel.deleteClaunsAt(index);
                        });
                  },
                  separatorBuilder: (context, int) => Divider(
                      color: Colors.black, thickness: 1.0, height: 1.0))),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ElevatedButton(
                        onPressed: () => claunsModel.sortByDate(),
                        child: const Text('Sort By Date'))),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ElevatedButton(
                        onPressed: () => claunsModel.sortByClue(),
                        child: const Text('Sort By Clue')))
              ],
            ),
          )
        ],
      );
    });
  }
}
