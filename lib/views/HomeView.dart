import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ochma2/views/SearchView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
        
         Colors. transparent,
         leading: InkWell(
          onTap: () {
            setState(() {
              
            });
          },
           child: Icon(
            
            Icons.near_me,
           size: 40,
           ),
         ),

         actions: [IconButton(onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: ((context) =>SearchView()  )));

           
         }), icon: Icon(Icons.location_city,
         size: 60,
         ),
         
         ),
         SizedBox(
          width: 25,
         )
         
         ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage('assets/images/cabin-g91ebe98b0_1920.jpg'),
          fit: BoxFit.cover),
          
        ),
        child:  
         Stack(children: [
      
        
                  Positioned(
                    top: 250,
                    left: 40,
                    child:  Text('13°C'.toUpperCase(),style: TextStyle(fontSize:55, fontWeight: FontWeight.bold),)),
                    
                   Positioned(
                    top: 180,
                    left: 205,
                    child: Text('⛅'.toUpperCase(),style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),

                    Positioned(
                      top: 400,
                      left: 300,
                      child: Text('You\'ll',
                    
                       style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),)),
                       Positioned(
                        top: 20,
                        left: 220,
                        child: Text('Osh',style: TextStyle(fontSize:35, fontWeight: FontWeight.bold),)),
   Positioned(
    top:500 ,
    left: 150,
    child: Text('need',style: TextStyle(fontSize:80, fontWeight: FontWeight.bold))),
        
        Positioned(
          top: 490,
          left: 350,
          child: Text('🍦', style: TextStyle(fontSize: 100,fontWeight: FontWeight.bold),)),
        Positioned(
          top: 600,
          left: 210,
          child: Text('and', style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),))
        ],)

   

   






   
      ),
    );
  }
}