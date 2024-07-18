import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_app/components/macro_badge.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,

      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow (
                    color: Colors.grey,
                    offset: Offset(3, 3),
                    blurRadius: 5,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage(
                    'assets/1.png'
                  )
                  ),
                
                )
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow (
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Truffle Temptation Extravagan",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$12.00",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  Text(
                                    "\$15.00",
                                    
                                    style: TextStyle(
                                      
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          MyMacroBadgeWidget(
                            title: "Calories",
                            value: 267,
                            icon: FontAwesomeIcons.fire,
                          ),
                          const SizedBox(width: 10,),
                          MyMacroBadgeWidget(
                            title: "Protein",
                            value: 207,
                            icon: FontAwesomeIcons.dumbbell,

                          ),
                          const SizedBox(width: 10,),
                          MyMacroBadgeWidget(
                            title: "Fat",
                            value: 21,
                            icon: FontAwesomeIcons.oilWell,

                          ),
                          const SizedBox(width: 10,),
                          MyMacroBadgeWidget(
                            title: "Carbs",
                            value: 38,
                            icon: FontAwesomeIcons.breadSlice,

                          ),
                        ],
                        ),
                        const SizedBox(height: 40,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width ,
                          height: 50,
                          child: TextButton(
                            onPressed: (){

                            },
                            child: Text(
                              'Buy now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            style: TextButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                            ),
                            ),
                          )
                        )
                    ],),
                ),
              ),
          ],
          ),
      )
    );
  }
}