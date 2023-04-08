import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'profile.dart';

class editProfile extends StatefulWidget{
 const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {

  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon (Icons.arrow_back_outlined)),
        title: Text('Profile',style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4,color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541'),

                          )
                        ),
                      ),
                      Positioned(child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white
                          ),
                          color: Colors.blue,
                        ),
                        child: Icon(Icons.edit),
                        color: Colors.white,
                       ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                buildTextField("Full Name","Demon",false),
                buildTextField("Email", "demon@gmail.com", false),
                buildTextField("Password", "*********", true),
                buildTextField("Phone Number","0123456789",false),
                SizedBox(height:30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: (){},
                      child: Text("CANCEL", style: TextStyle(fontSize: 15,letterSpacing: 2,color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    ElevatedButton(
                        onPressed:(){},
                        child: Text("SAVE", style: TextStyle(fontSize: 15,letterSpacing: 2,color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                    ),
                  ],

                )
              ],
            ),

          ),

          ),
          
        ),
      );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
              IconButton(
                icon: Icon(Icons.remove_red_eye,color: Colors.grey),
                onPressed: (){},
              ): null,
              contentPadding: EdgeInsets.only(bottom:5),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),

        ),
      ),
    );
  }

}


