
import 'package:flutter/material.dart';
import 'package:lap_english/ui/widgets/other/progress_bar.dart';

import '../../../../data/model/vocabulary.dart';

class LearnWidget {

  static Widget topic(BuildContext context, MainVocabularyTopic mainTopicList) {
    return SizedBox(
      child: Column(
        children: [
          buildMainTopic1(context, mainTopicList),
          Expanded(
              child: ListView(
                children: _buildSubTopic(context, mainTopicList.subTopics),
              )
          )
        ],
      )
    );
  }

  static Widget buildMainTopic1(BuildContext context, MainVocabularyTopic mainTopicList) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Card(
        child: Stack(
          children: [
            Positioned(top: 20, left: 10, child: Text(mainTopicList.name)),

            const Positioned(
              bottom: 10,
                left: 10,
                child: WdgAnimatedProgressBar(value: 0.3, label: "Đã học 3/9", duration: Duration(milliseconds: 500))
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildMainTopic(BuildContext context, List<MainVocabularyTopic> mainTopicList) {
    return ListView.builder(
        itemCount: mainTopicList.length,
        itemBuilder: (context, index) {
          final topic = mainTopicList[index];
          return ExpansionTile(
            title: SizedBox(
              height: 150,
                child: Stack(
                  children: [
                    Positioned(
                        top: 10,
                        left: 10,
                        child: Text(topic.name)
                    ),

                    const Positioned(
                      bottom: 10,
                      left: 10,
                      child: WdgAnimatedProgressBar(
                          value: 0.5,
                          label: 'Đã học 3/9',
                          duration: Duration(milliseconds: 500),
                      ),
                    ),

                    Positioned(
                      right: 10,
                      child: Image.network(
                        "https://images2.thanhnien.vn/Uploaded/tuyendtb/2022_07_19/5-hyomin2-657.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            children: _buildSubTopic(context, topic.subTopics),
          );
        });
  }

  static List<Widget> _buildSubTopic(BuildContext context, List<SubVocabularyTopic> subTopicList) {
    return subTopicList.map((subTopic) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft,
              child: LearnWidget._buildSubItem(
                context,
                subTopic.name,
                "https://static.tramdoc.vn/image/img.news/0/0/0/275.jpg?v=1&w=480&h=295&nocache=1",
                subTopicList.indexOf(subTopic) < 3,
              ),
            ),
          ],
        );
      }).toList();
  }

  //ITEM  sub ------------------------------------------------------------------
  static Widget _buildSubItem(BuildContext context, String text, String imageUrl, bool state) {
    return InkWell(
      child: Column(
        children: [
          Row(
            children: [
              //ICON  ----------------------------------------------------------
              Center(
                  child: Column(
                    children: [
                      //ẢNH   --------------------------------------------------
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: state ? Theme.of(context).primaryColor : Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ),
                      ),

                      //CONTAINER thanh nối ----------------------------------------
                      Container(
                        height: 25,
                        width: 5,
                        color: state ? Theme.of(context).primaryColor : Colors.grey,
                      )
                    ],
                  )
              ),

              const SizedBox(width: 20),

              //TEXT  ----------------------------------------------------------
              Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
