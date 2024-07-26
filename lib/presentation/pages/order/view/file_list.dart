import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfPreview extends StatefulWidget {
  const PdfPreview({super.key,});


  @override
  State<PdfPreview> createState() => _PdfPreviewState();
}

class _PdfPreviewState extends State<PdfPreview> {
   @override
  void initState() {
     Future.delayed(Duration(milliseconds: 1500),(){
       isCircular = false;
       setState(() {
       });
     });
     super.initState();
  }

   Future<void> copyPdfFile(String sourceFilePath, String fileName) async {

     var status = await Permission.storage.status;
     if (status.isGranted) {

       Directory appDocDir = await getApplicationDocumentsDirectory();
       String appDocPath = appDocDir.path;

       String destinationFilePath = '$appDocPath/$fileName';

       try {

         File sourceFile = File(sourceFilePath);
         await sourceFile.copy(destinationFilePath);
         print('File copied successfully to $destinationFilePath');
       } catch (e) {
         print('Error copying file: $e');
       }
     }
     if (status.isPermanentlyDenied) {
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           content: Text('Storage permission permanently denied'),
         ),
       );
     } else {
       status = await Permission.storage.request();
       if (status.isGranted) {

         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             content: Text('Storage permission granted'),
           ),
         );

         Directory appDocDir = await getApplicationDocumentsDirectory();
         String appDocPath = appDocDir.path;

         String destinationFilePath = '$appDocPath/$fileName';

         try {

           File sourceFile = File(sourceFilePath);
           await sourceFile.copy(destinationFilePath);
           print('File copied successfully to $destinationFilePath');
         } catch (e) {
           print('Error copying file: $e');
         }
       } else {
         print('done');
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             content: Text('Storage permission denied'),
           ),
         );
       }
     }
   }


   bool isCircular = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               isCircular == false ? Expanded(
                   child: PDF(
                 enableSwipe: true,
                 swipeHorizontal: false,
                 autoSpacing: false,
                 pageFling: false,
               ).fromAsset("assets/pdf/apple.pdf")): Center(child: CircularProgressIndicator(
                 strokeWidth: 3,
                 color: AppColors.black,))
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.white,
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: MediaQuery.of(context).viewPadding.top <= 52
                      ? 20.h
                      : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(onBack: () {
                    context.pop();
                  }),
                  GestureDetector(
                    onTap: () async{
                      await copyPdfFile("assets/pdf/apple.pdf", DateTime.now().toString());
                    },
                    child: Row(
                      children: [
                        Text(
                          "Скачать",
                          style: AppTextStyles.body14GeologicaLight,
                        ),
                        SizedBox(width: 5,),
                        SvgPicture.asset(
                          Assets.iconsUpload,
                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
