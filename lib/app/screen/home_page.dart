import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:maa_samprak/app/app_data/component/textfiled.dart';
import 'package:maa_samprak/app/utils/colors.dart';
import '../app_data/component/service_card.dart';
import '../controller/home_ctrl.dart';



class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeCtrl = Get.put(HomeCtrl());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          backgroundColor:Colors.transparent,
          centerTitle: true,
          title:  Image.asset(
            "assets/images/maa_samprak.png",
            scale: 2.5,
          ),

          bottom:  TabBar(
            labelPadding: EdgeInsets.only(left: 10, right: 10),
              indicatorWeight: 2,
            splashBorderRadius: BorderRadius.circular(20),
            isScrollable: false,
            labelColor: Colors.orangeAccent,
            indicatorColor:   Theme.of(context).focusColor,
            physics: const BouncingScrollPhysics(),

            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                text: 'Home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Mothers',
                icon: Icon(Icons.diversity_3),
              ),
              Tab(
                text: 'Doctors',
                icon:FaIcon(FontAwesomeIcons.userDoctor),
              ),    Tab(
                text: 'Activity',
                icon: Icon(Icons.nature_people),
              ),
              Tab(
                text: 'Shopping',
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),

        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Obx(() => SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   physics: const BouncingScrollPhysics(),
                //   child: Row(
                //     children: List.generate(homeCtrl.charList.length, (index) {
                //       return Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           homeCtrl.charList[index],
                //           style: const TextStyle(
                //             fontSize: 16, fontWeight: FontWeight.bold),
                //         ),
                //       );
                //     }),
                //   ),
                // )),

                Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomTextFormField(
                    isBorder: true,
                    controller: homeCtrl.searchTextEditCtrl.value,
                    hintText: 'Search',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.search,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.tune),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                Obx(() {
                  if (homeCtrl.items.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Expanded(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: homeCtrl.items.length,
                      itemBuilder: (context, index) {
                        final item = homeCtrl.items[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(item.subtitle, style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600,

                                color: Colors.grey,
                                )),
                              const SizedBox(height: 12),
                              Image.network(item.image, fit: BoxFit.cover),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
                              SizedBox(height: 8),

                const Align(
                  alignment: Alignment.centerLeft,

                  child: Text("Book Service", style: TextStyle(fontSize: 20,
                  color: AppColors.success,
                   fontWeight: FontWeight.bold))),
                Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(homeCtrl.charList.length, (index) {
                      return  Padding(
                        padding: const EdgeInsets.only(right: 8.0, bottom: 5),
                         child:ServiceCard()
                      );

                    }),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






