import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavei/shared/component/components.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Notification',style: GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 19.0)),)),),
      body: Container(
        child: ListView.separated(
            itemBuilder: (context, index)=>Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildNotificationItem(context),
            ),
            separatorBuilder: (context, index)=>myDivider(),
            itemCount:10,
        ),
      ),
    );
  }

  Widget buildNotificationItem(BuildContext context){
    return Row(
      children: [
        CircleAvatar(child: Image(image: AssetImage('assets/images/user_avatar.png'),),),
        const SizedBox(width: 10.0,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width-85,
              child: Text(
                'Joy Arnold left 6 comments on your post',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14.0,color: HexColor('#1A1F36'),fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 4.0,),
            Text(
              'Yesterday at 11:42 PM',
              style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14.0,color: HexColor('#A5ACB8'))),
            ),
          ],
        ),
      ],
    );
  }
}

