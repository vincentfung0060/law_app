import 'package:law_app/model/law.dart';

List<Law> getLawsContent(){
return [
  Law(
    id:'0',
    name:'Police & Crime',
    subTitle: [
      'Criminal liability and types of penalties',
      'Criminal records and the Rehabilitation of Offenders Ordinance',
      'Police powers',
    ],
    content: [
      'test1',
      'test2',
    ],
    imageURL: 'http://www.clic.org.hk/en/images/topic_photo01.jpg'
  )
];
}

List<String> getFavoritesIDs()
{
  return [
    '0'
  ];
}