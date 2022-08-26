import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/module/blogs/blogs_screen.dart';
import 'package:lavei/shared/component/components.dart';
import 'package:lavei/shared/style/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodeScreen extends StatefulWidget {
  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  var qrKey = GlobalKey();
  bool scannedSuccessfully=false;
  QRViewController? controller;

  @override
  void reassemble() async {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ConditionalBuilder(
          condition: !scannedSuccessfully,
          builder: (context)=> Stack(
            children: [
              QRView(
                key: qrKey,
                onQRViewCreated: onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    cutOutSize: MediaQuery.of(context).size.width * 0.8,
                    borderWidth: 10.0,
                    borderRadius: 10.0,
                    borderLength: 60.0,
                    borderColor: Colors.white),
              )
            ],
          ),
          fallback: (context)=>Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
              height:  double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/scan-background.png'),
                    fit: BoxFit.cover,),
                color:HexColor('#00000066'),
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Row(
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Image(image: AssetImage('assets/images/sun.png'),width: 20.0,height: 20.0,),
                          ),
                          const SizedBox(width: 20.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('78',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 22.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                                  Text('%',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                                ],
                              ),
                              Text('Sun light',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                            ],
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image(image: AssetImage('assets/images/humidety.png'),width: 20.0,height: 20.0,),
                        ),
                        const SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('10',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 22.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                                Text('%',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                              ],
                            ),
                            Text('Water Capacity',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                          ],
                        ),

                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image(image: AssetImage('assets/images/humidety.png'),width: 20.0,height: 20.0,),
                        ),
                        const SizedBox(width: 20.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('10',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 22.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                                Text('%',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 16.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                              ],
                            ),
                            Text('Water Capacity',style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.normal,color: Colors.white)),),
                          ],
                        ),

                      ],
                    ),
                    Spacer(),
                    Container(
                    padding: const EdgeInsets.all(10.0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: lightGrey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                      child: Row(
                        mainAxisSize:MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize:MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Snake Plant (sansevieria)'.toUpperCase(),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600)),
                              ),
                              const SizedBox(height: 5.0,),
                              Text(
                                ' Native to southern Afica',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.normal),),
                              ),

                            ],
                          ),
                          const SizedBox(width: 30.0,),
                          InkWell(
                            child:  CircleAvatar(
                              backgroundColor: lightGreen,
                              child:const Image(
                                image: AssetImage('assets/images/left-arrow.png'),width: 20.0,
                              ),
                            ),
                            onTap: (){
                              plantDetails(context);
                            },
                          )
                        ],
                      )),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState((){
      this.controller = controller;
    this.controller!.resumeCamera();
    });
    controller.scannedDataStream.listen((event) {
      setState((){
        scannedSuccessfully=true;
      });
    });
  }

  Future plantDetails(BuildContext context){
    return showModalBottomSheet(
      context: context,
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft:Radius.circular(40.0),
            topRight:Radius.circular(40.0),
        ),
      ),
      builder: (context) {
        return Container(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20.0,),
                  Text(
                    'SNAKE PLANT (SANSEVIERIA)'.toUpperCase(),
                    style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    'Native to southern Africa, snake blogs are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer',
                    style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: textColor)),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    'Common Snake Plant Diseases',
                    style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,)),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    "A widespread problem with snake blogs is root rot. This results from over-watering the soil of the plant and is most common in the colder months of the year. When room rot occurs, the plant roots can die due to a lack of oxygen and an overgrowth of fungus within the soil. If the snake plant's soil is soggy, certain microorganisms such as Rhizoctonia and Pythium can begin to populate and multiply, spreading disease throughout th",
                    style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: textColor)),
                  ),
                  const SizedBox(height: 10.0,),
                  defaultButton(function: (){
                    navigateTo(context, BlogsScreen());
                  }, text: 'Go To Blog'),
                ],
              ),
            )
        );
      },
    );
  }
}
