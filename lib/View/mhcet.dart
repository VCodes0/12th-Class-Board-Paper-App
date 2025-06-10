import 'package:board_paper/View/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Controller/mh_cet_controller.dart';

class MhCetPage extends StatefulWidget {
  const MhCetPage({super.key});

  @override
  State<MhCetPage> createState() => _MhCetPageState();
}

class _MhCetPageState extends State<MhCetPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MhCetController>().mhCetAPIData();
    });
  }

  final bodyColor = const LinearGradient(
    colors: [Color(0x338EDFF7), Color(0xFF55BBEB)],
    begin: Alignment.topCenter, // Or topLeft/topRight depending on exact angle
    end: Alignment.bottomCenter, // Or bottomRight/bottomLeft
  );

  @override
  Widget build(BuildContext context) {
    final mhCetData = context.watch<MhCetController>().mhCetData;
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: bodyColor),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  "assets/mhcet.png",
                  fit: BoxFit.fill,
                  width: mq.width,
                ),
              ),
              Positioned(
                top: mq.height * 0.22,
                left: mq.width * 0.2,
                child: Image.asset(
                  "assets/mhcettitle.png",
                  height: 35,
                  width: mq.width,
                ),
              ),
              Positioned(
                top: mq.height * 0.27,
                left: 0,
                right: 0,
                bottom: 0,
                child: mhCetData.isEmpty
                    ? Center(child: const CircularProgressIndicator())
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: mq.width * 0.05,
                          vertical: mq.height * 0.02,
                        ),
                        itemCount: mhCetData.length,
                        itemBuilder: (context, index) {
                          final item = mhCetData[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: mq.height * 0.01,
                            ),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: mq.width * 0.05,
                                  vertical: mq.height * 0.01,
                                ),
                                title: Text(
                                  "${item.year}",
                                  style: TextStyle(
                                    fontSize: mq.width * 0.05,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                trailing: SizedBox(
                                  height: mq.height * 0.08,
                                  width: mq.width * 0.15,
                                  child: Image.asset(
                                    "assets/download.png",
                                    color: Color(0xFF55BBEB),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                onTap: () {
                                  Get.to(PdfViewerPage(pdfUrl: "${item.file}"));
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
