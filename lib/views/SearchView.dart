import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({ Key? key }) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.location_city,size: 40
          ),
          ),
        ),
       body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage('assets/images/cabin-g91ebe98b0_1920.jpg'),
            fit: BoxFit.cover),
            
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,),
              child: TextField(
      obscureText: false,
      decoration: InputDecoration(
        
      suffixIcon: IconButton(icon:  Icon(Icons.arrow_forward_ios_outlined
      
      ),
      onPressed: (){
        Navigator.pop(context);
      }),
      
      hintText:'Search Region' ,
      
      border: OutlineInputBorder(
        
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey,width: 4)
      ),
      
      
      labelText: 'Region',
      labelStyle: TextStyle(
        color: Colors.black,
        
        
      ),
      focusColor: Colors.black,
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.black)
      )
      
      ),
    ),
            ),
          ),
        
      )),
    );
  }
}