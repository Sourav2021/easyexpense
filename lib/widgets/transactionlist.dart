import 'package:easy_expense/model/Trnsaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transactionlist extends StatelessWidget {
  Transactionlist({Key? key, required this.userTransaction}) : super(key: key);

  final List<Transaction> userTransaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: userTransaction.isEmpty
          ? Center(
              child: Text(
                'No Transactions, add...',
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          : ListView.builder(
              itemCount: userTransaction.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                        ),
                        child: Text(
                          '₹ ${userTransaction[index].amount.toString()}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${userTransaction[index].title}',
                              style: Theme.of(context).textTheme.headline6),
                          Text(
                            DateFormat('EEEE, d MMMM, yyyy')
                                .format(userTransaction[index].date),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
            ),
    );
  }
}
