import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app/screens/home/views/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(children: [
          Image.asset(
            'assets/8.png',
            scale: 14,
          ),
          const SizedBox(width: 10),
          Text(
            'Pizza',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          )
          ,
        ],),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(CupertinoIcons.cart)
          ),
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
              
            },
            icon: Icon(CupertinoIcons.arrow_right_to_line),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 9/16
            ),
          itemCount: 8,
          itemBuilder: (context, int i){
            return Material(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const DetailScreen(),
                    )
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/1.png'
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                              child: Text(
                                "NON-VEG",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10
                                )
                              ),
                            )
                          ),
                          SizedBox(width: 8,),
                              
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8.0),
                              child: Text(
                                "🌶 BALANCE",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 10
                                )
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Chessy Marve",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Crafting joy: your pizza, your ",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w300,
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$ 12.00",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.w700,
                                  )
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "\$ 12.00",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.lineThrough,
                                  )
                                ),
                                
                              ],
                            ),
                            IconButton(
                                  onPressed: (){},
                                  icon: Icon(CupertinoIcons.add_circled_solid))
                          ],
                        ),
                    ),
                              
                  ],                
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}