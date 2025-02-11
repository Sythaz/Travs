import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/text_style_helper.dart';

class Cards extends StatelessWidget {
  final String? title;
  final String? location;
  final String? cover;

  const Cards({
    super.key,
    required this.title,
    required this.location,
    required this.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(30),
          shadowColor: Colors.black,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox.expand(
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  Image.network(
                    cover!,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment(0.85, -0.9),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.bookmark_add_outlined,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.9),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 70,
                      width: double.infinity,
                      child: Column(
                        // spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: TextStyleHelper.getTextStyle(
                                context, 'rMedium16Name'),
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Icon(Icons.location_on_outlined, size: 20),
                              Text(
                                location!,
                                style: TextStyleHelper.getTextStyle(
                                    context, 'rRegular14'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
