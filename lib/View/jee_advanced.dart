import 'package:board_paper/View/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Controller/jeemains_controller.dart';

class JeeAdvanced extends StatefulWidget {
  const JeeAdvanced({super.key});

  @override
  State<JeeAdvanced> createState() => _JeeAdvancedState();
}

class _JeeAdvancedState extends State<JeeAdvanced> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<JeeMainsController>().getJeeMainsAPIData();
    });
  }

  final bodyColor = const LinearGradient(
    colors: [Color(0xFFF69B9B), Color(0xFFEB6A71)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    final jeeAdvancedData = context
        .watch<JeeMainsController>()
        .jeeMainsUserData;
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: bodyColor),
          child: Stack(
            children: [
              // Header Image
              Positioned(
                child: Image.asset(
                  "assets/jeeaheader.png",
                  fit: BoxFit.fill,
                  width: mq.width,
                ),
              ),
              Positioned(
                top: mq.height * 0.22,
                left: mq.width * 0.2,
                child: Image.asset(
                  "assets/jeea.png",
                  height: 80,
                  width: mq.width,
                ),
              ),
              // List of Data
              Positioned(
                top: mq.height * 0.32,
                left: 0,
                right: 0,
                bottom: 0,
                child: jeeAdvancedData.isEmpty
                    ? Center(child: const CircularProgressIndicator())
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: mq.width * 0.05,
                          vertical: mq.height * 0.02,
                        ),
                        itemCount: jeeAdvancedData.length,
                        itemBuilder: (context, index) {
                          final item = jeeAdvancedData[index];
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
                                    color: const Color(0xFFEB6A71),
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
