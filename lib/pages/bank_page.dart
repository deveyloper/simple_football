import 'package:flutter/material.dart';
import 'package:simple_football/Components/money_transfer_widget.dart';

class BankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFF6F7F8)),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text: 'Bills completed:',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(color: Colors.green),
                          ),
                          TextSpan(
                            text: '202',
                            style: TextStyle(color: Colors.green),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(color: Colors.green),
                          ),
                          TextSpan(
                            text: 'of 246',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                              text: 'for this month',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 15))))
                ],
              ),
              Divider(color: Color(0xFF19C8A9)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFFFFFFF)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Average payment delay',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(
                          Icons.info,
                          color: Colors.black26,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time, size: 50),
                            RichText(
                              text: TextSpan(
                                  text: '27h',
                                  style: TextStyle(
                                      fontSize: 45, color: Colors.black87)),
                            )
                          ],
                        ),
                        Icon(Icons.show_chart, size: 50)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Monthly Invoices',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Opacity(
                          opacity: 0.50,
                          child: Icon(
                            Icons.check_circle,
                            size: 50,
                            color: Colors.green,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Camelus IOS Development',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '17 paid',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12),
                                        ),
                                        TextSpan(text: ' '),
                                        TextSpan(
                                          text: 'month of 23',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text('\$123,456.78',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 15)),
                                Text('per month',
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 12)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Activity',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              MoneyTransferWidget(
                from: 'Ad Soyad',
                fromTitle: 'Developer',
                to: 'Alıcı Ad Soyad',
                amountSign: 'TRY',
                sendStatus: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
