import 'package:board_paper/View/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Controller/neet_controller.dart';

class NeetPage extends StatefulWidget {
  const NeetPage({super.key});

  @override
  State<NeetPage> createState() => _NeetPageState();
}

class _NeetPageState extends State<NeetPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NeetController>().neetApiData();
    });
  }

  final bodyColor = const LinearGradient(
    colors: [Color(0x3394dcba), Color(0xFD63D19E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    final neetData = context.watch<NeetController>().neetData;
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
                  "assets/neetheader.png",
                  fit: BoxFit.fill,
                  width: mq.width,
                ),
              ),
              Positioned(
                top: mq.height * 0.22,
                left: mq.width * 0.2,
                child: Image.asset(
                  "assets/NEET.png",
                  height: 35,
                  width: mq.width,
                ),
              ),
              Positioned(
                top: mq.height * 0.27,
                left: 0,
                right: 0,
                bottom: 0,
                child: neetData.isEmpty
                    ? Center(child: const CircularProgressIndicator())
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: mq.width * 0.05,
                          vertical: mq.height * 0.02,
                        ),
                        itemCount: neetData.length,
                        itemBuilder: (context, index) {
                          final item = neetData[index];
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
                                    color: Color(0xFF5bb784),
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
