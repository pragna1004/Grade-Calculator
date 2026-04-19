import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(mee());
}

class mee extends StatefulWidget {
  const mee({super.key});

  @override
  State<mee> createState() => _meeState();
}

class _meeState extends State<mee> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration.zero);

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
        
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: MediaQuery.of(context).size.width>1000?AssetImage("assets/o(1)c.png"):AssetImage("assets/o(1)p.png"),fit: BoxFit.cover)
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height:100+30,
                ),
                Text("H i  T h e r e !",style: GoogleFonts.ebGaramond(
                  fontSize: 40,

                  color: Colors.white,
                ),),
                SizedBox(
                  height:100-30,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,10,0),
                  child: Container(
                    height: 40,
                    width:double.infinity,
                    decoration:BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(100),
                      border:Border.all(
                        color:Colors.white54,
                      )

                    ) ,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,0,3),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                         border: InputBorder.none,



                            prefix: Container(
                              width: 50,
                              child: Row(
                                  children: [
                                    Icon(Icons.email_outlined,color: Colors.white70),
                                    SizedBox(width: 10,),
                                    Text("|"),
                                  ]
                              ),
                            ),
                          hintText: "Enter your Email id",
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Lottie.asset(
                                  "assets/otp.json",
                                  controller: _controller,
                                  onLoaded: (c) {
                                    _controller.duration = c.duration;
                                    _controller.forward();
                                    if(_controller.isCompleted){
                                    _controller.reset();}
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                      
                        child: Center(child: Text("SEND OTP",style: TextStyle(
                          color: Colors.white,
                        ),)),
                      ),
                    )

                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,10,0),
                  child: Container(
                    height: 40,
                    width:double.infinity,
                    decoration:BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(100),
                        border:Border.all(
                          color:Colors.white54,
                        )

                    ) ,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15,0,0,3),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,



                            prefix: Container(
                              width: 50,
                              child: Row(
                                children: [
                                  Icon(Icons.key,color: Colors.white70),
                                  SizedBox(width: 10,),
                                  Text("|"),
                                ]
                              ),
                            ),
                            hintText: "Enter your 4 Digit OTP",
                          hintStyle: TextStyle(
                            color: Colors.white70,
                          )
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
