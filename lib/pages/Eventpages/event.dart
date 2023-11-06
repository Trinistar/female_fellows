import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Eventstart extends StatelessWidget {
  const Eventstart({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(241, 80, 60, 1),
      ),
      child: ListView(
        shrinkWrap: true,
     
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(241, 80, 60, 1),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(60))),
            height: 215,
            width: 1000,
            child: Stack(
                  clipBehavior: Clip.none,
              children: [
                    Positioned(
                  right: 0,
                  bottom: 0,
                  
                         child: Container(
                                         height: 26,
                                         width: 40,
                                         decoration: BoxDecoration(
                                             color:Theme.of(context).colorScheme.surfaceVariant),
                                       ),
                       ),
             
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Image.asset(
                    'lib/images/Mask group.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(
                        'Events',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 5,
                      indent: 40,
                      endIndent: 310,
                      color: Colors.white,
                    ),
                  ],
                  
                ),
             
                
              ],
              
            ),
          ),
             Container(
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.amber),//Theme.of(context).colorScheme.surfaceVariant),
                ),
        ],
      ),
    );
  }
}
