import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget courseSelectionCard(
  BuildContext context, {
  required IconData primaryIcon,
  required Color primaryIconColor,
  required String title,
  required String description,
  required Color cardColor,
  required IconData secondaryIcon,
  required Color secondaryIconColor,
}) {
  final mq = MediaQuery.of(context).size;
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    elevation: 5,
    child: Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              primaryIcon,
              size: mq.height * 0.04,
              color: primaryIconColor,
            ),
          ),
          SizedBox(width: mq.width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            secondaryIcon,
            size: mq.height * 0.07,
            color: secondaryIconColor,
          ),
        ],
      ),
    ),
  );
}
