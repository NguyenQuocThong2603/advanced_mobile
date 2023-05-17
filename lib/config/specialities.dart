import 'package:advanced_mobile/generated/l10n.dart';

List<Map<String,String>> specialities(context)=> [
  {
    "key": "",
    "name": S.of(context).allSpeciality
  },
  {
    "key": "starters",
    "name": S.of(context).startersSpeciality
  },
  {
    "key": "movers",
    "name": S.of(context).moversSpeciality
  },
  {
    "key": "flyers",
    "name": S.of(context).flyersSpeciality
  },
  {
    "key": "ket",
    "name": S.of(context).ketSpeciality
  },
  {
    "key": "pet",
    "name": S.of(context).petSpeciality
  },
  {
    "key": "ielts",
    "name": S.of(context).ieltsSpeciality
  },
  {
    "key": "toefl",
    "name": S.of(context).toeflSpeciality
  },
  {
    "key": "toeic",
    "name": S.of(context).toeicSpeciality
  },
  {
    "key": "business-english",
    "name": S.of(context).businessEnglish
  },
  {
    "key": "conversational-english",
    "name": S.of(context).conversationalEnglish
  },
  {
    "key": "english-for-kids",
    "name": S.of(context).englishForKids
  },
];

Map<String,String> mappingSpecialities(context) => {
  "starters": S.of(context).startersSpeciality,
  "movers": S.of(context).moversSpeciality,
  "flyers": S.of(context).flyersSpeciality,
  "ket": S.of(context).ketSpeciality,
  "pet": S.of(context).petSpeciality,
  "ielts": S.of(context).ieltsSpeciality,
  "toefl": S.of(context).toeflSpeciality,
  "toeic": S.of(context).toeicSpeciality,
  "business-english": S.of(context).businessEnglish,
  "english-for-kids": S.of(context).englishForKids,
  "conversational-english": S.of(context).conversationalEnglish,
};

const testPreparationMapping = [
  {
    "id": 1,
    "key": "starters",
    "name": "STARTERS"
  },
  {
    "id": 2,
    "key": "movers",
    "name": "MOVERS"
  },
  {
    "id": 3,
    "key": "flyers",
    "name": "FLYERS"
  },
  {
    "id": 4,
    "key": "ket",
    "name": "KET"
  },
  {
    "id": 5,
    "key": "pet",
    "name": "PET"
  },
  {
    "id": 6,
    "key": "ielts",
    "name": "IELTS"
  },
  {
    "id": 7,
    "key": "toefl",
    "name": "TOEFL"
  },
  {
    "id": 8,
    "key": "toeic",
    "name": "TOEIC"
  },
];

const learnTopicsMapping = [
  {
    "id": 4,
    "key": "business-english",
    "name": "Business English"
  },
  {
    "id": 5,
    "key": "conversational-english",
    "name": "Conversational English"
  },
  {
    "id": 3,
    "key": "english-for-kids",
    "name": "English for Kids"
  },
];

Map<String, String> categoryMapping(context) => {
  '968e7e18-10c0-4742-9ec6-6f5c71c517f5': S.of(context).forStudyingAbroad,
  'd95b69f7-b810-4cdf-b11d-49faaa71ff4b': S.of(context).englishForTraveling,
  'c4e7f418-4006-40f2-ba13-cbade54c1fd0': S.of(context).conversationalEnglish,
  '488cc5f8-a5b1-45cd-8d3a-47e690f9298e': S.of(context).englishForBeginner,
  'f01cf003-25d1-432f-aaab-bf0e8390e14f': S.of(context).businessEnglish,
  '975f83f6-30c5-465d-8d98-65e4182369ba': S.of(context).startersSpeciality,
  'fb92cf24-1736-4cd7-a042-fa3c37921cf8': S.of(context).englishForKids,
  '0b89ead7-0e92-4aec-abce-ecfeba10dea5': S.of(context).petSpeciality,
  '248ca9f5-b46d-4a55-b81c-abafebff5876': S.of(context).ketSpeciality,
  '534a94f1-579b-497d-b891-47d8e28e1b2c': S.of(context).moversSpeciality,
  'df9bd876-c631-413c-9228-cc3d6a5c34fa': S.of(context).flyersSpeciality,
  'd87de7ba-bd4c-442c-8d58-957acb298f57': S.of(context).toeflSpeciality,
  '1e662753-b305-47ad-a319-fa52340f5532': S.of(context).toeicSpeciality,
  '255c96b6-fd6f-4f43-8dbd-fec766e361e0': S.of(context).ieltsSpeciality,
};