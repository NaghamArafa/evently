import 'package:evently/event/core/app_assets.dart';
import 'package:evently/event/core/app_colors.dart';
import 'package:evently/event/core/provider/user_provider.dart';
import 'package:evently/event/model/category_dm.dart';
import 'package:evently/event/model/event_dm.dart';
import 'package:evently/event/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventWidget extends StatelessWidget {
  final EventDM eventDM;

  EventWidget({super.key, required this.eventDM});

  late UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = context.userProvider;
    var size = MediaQuery.of(context).size;
    var category = CategoryDM.fromName(eventDM.category);
    return Stack(alignment: Alignment.bottomCenter, children: [
      buildCategoryImage(category),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(eventDM.name), buildFavIcon(context)],
        ),
      ),
      buildEventDate(size)
    ]);
  }

  Positioned buildEventDate(Size size) {
    return Positioned(
        left: size.width * 0.030,
        top: size.height * 0.018,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                eventDM.date.day.toString(),
                style: TextStyle(color: AppColors.purple),
              ),
              Text(DateFormat('MMMM').format(DateTime(0, eventDM.date.month)),
                  style: TextStyle(color: AppColors.purple)),
            ],
          ),
        ));
  }

  Widget buildFavIcon(BuildContext context) {
    var isFavorite = userProvider.currentUser.isFavoriteEvent(eventDM.id);
    return InkWell(
      onTap: () {
        if (isFavorite) {
          userProvider.removeEventFromFavorite(eventDM.id);
        } else {
          userProvider.addEventToFavorite(eventDM.id);
        }
      },
      child: isFavorite
          ? const ImageIcon(
              AssetImage(
                AppAssets.loveActive,
              ),
              color: AppColors.purple,
            )
          : const ImageIcon(
              AssetImage(
                AppAssets.loveIcon,
              ),
              color: AppColors.purple,
            ),
    );
  }

  Container buildCategoryImage(CategoryDM category) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      height: 200,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            category.image,
            fit: BoxFit.cover,
          )),
    );
  }
}
