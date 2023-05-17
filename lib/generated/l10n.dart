// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get orContinueWith {
    return Intl.message(
      'Or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message(
      'Sign up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your registration`
  String get yourRegistration {
    return Intl.message(
      'Your registration',
      name: 'yourRegistration',
      desc: '',
      args: [],
    );
  }

  /// `successfully`
  String get successfully {
    return Intl.message(
      'successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `You will receive an activate account email to`
  String get receivedEmail {
    return Intl.message(
      'You will receive an activate account email to',
      name: 'receivedEmail',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address to search for your`
  String get enterResetEmail {
    return Intl.message(
      'Please enter your email address to search for your',
      name: 'enterResetEmail',
      desc: '',
      args: [],
    );
  }

  /// `Send reset link`
  String get sendResetLink {
    return Intl.message(
      'Send reset link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Go back to Sign in`
  String get goBackSignIn {
    return Intl.message(
      'Go back to Sign in',
      name: 'goBackSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Check your mail`
  String get checkYourMail {
    return Intl.message(
      'Check your mail',
      name: 'checkYourMail',
      desc: '',
      args: [],
    );
  }

  /// `We just send an email to you with a link to reset your password`
  String get sendEmail {
    return Intl.message(
      'We just send an email to you with a link to reset your password',
      name: 'sendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Tutors`
  String get tutors {
    return Intl.message(
      'Tutors',
      name: 'tutors',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming lesson`
  String get upcomingLesson {
    return Intl.message(
      'Upcoming lesson',
      name: 'upcomingLesson',
      desc: '',
      args: [],
    );
  }

  /// `You have no upcoming lesson.`
  String get noUpcomingLesson {
    return Intl.message(
      'You have no upcoming lesson.',
      name: 'noUpcomingLesson',
      desc: '',
      args: [],
    );
  }

  /// `starts in`
  String get startsIn {
    return Intl.message(
      'starts in',
      name: 'startsIn',
      desc: '',
      args: [],
    );
  }

  /// `classes in`
  String get classesIn {
    return Intl.message(
      'classes in',
      name: 'classesIn',
      desc: '',
      args: [],
    );
  }

  /// `Enter lesson room`
  String get enterLessonRoom {
    return Intl.message(
      'Enter lesson room',
      name: 'enterLessonRoom',
      desc: '',
      args: [],
    );
  }

  /// `Total lesson time is`
  String get totalLessonTime {
    return Intl.message(
      'Total lesson time is',
      name: 'totalLessonTime',
      desc: '',
      args: [],
    );
  }

  /// `Enter tutor name`
  String get enterTutorName {
    return Intl.message(
      'Enter tutor name',
      name: 'enterTutorName',
      desc: '',
      args: [],
    );
  }

  /// `Select tutor nationality`
  String get selectTutorNationality {
    return Intl.message(
      'Select tutor nationality',
      name: 'selectTutorNationality',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get noneNationality {
    return Intl.message(
      'None',
      name: 'noneNationality',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vietnamNationality {
    return Intl.message(
      'Vietnamese',
      name: 'vietnamNationality',
      desc: '',
      args: [],
    );
  }

  /// `Native`
  String get nativeNationality {
    return Intl.message(
      'Native',
      name: 'nativeNationality',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get allSpeciality {
    return Intl.message(
      'All',
      name: 'allSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `STARTERS`
  String get startersSpeciality {
    return Intl.message(
      'STARTERS',
      name: 'startersSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `MOVERS`
  String get moversSpeciality {
    return Intl.message(
      'MOVERS',
      name: 'moversSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `FLYERS`
  String get flyersSpeciality {
    return Intl.message(
      'FLYERS',
      name: 'flyersSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `KET`
  String get ketSpeciality {
    return Intl.message(
      'KET',
      name: 'ketSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `PET`
  String get petSpeciality {
    return Intl.message(
      'PET',
      name: 'petSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `IELTS`
  String get ieltsSpeciality {
    return Intl.message(
      'IELTS',
      name: 'ieltsSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `TOEFL`
  String get toeflSpeciality {
    return Intl.message(
      'TOEFL',
      name: 'toeflSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `TOEIC`
  String get toeicSpeciality {
    return Intl.message(
      'TOEIC',
      name: 'toeicSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `Business English`
  String get businessEnglish {
    return Intl.message(
      'Business English',
      name: 'businessEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Conversational English`
  String get conversationalEnglish {
    return Intl.message(
      'Conversational English',
      name: 'conversationalEnglish',
      desc: '',
      args: [],
    );
  }

  /// `English for Kids`
  String get englishForKids {
    return Intl.message(
      'English for Kids',
      name: 'englishForKids',
      desc: '',
      args: [],
    );
  }

  /// `For Studying Abroad`
  String get forStudyingAbroad {
    return Intl.message(
      'For Studying Abroad',
      name: 'forStudyingAbroad',
      desc: '',
      args: [],
    );
  }

  /// `English For Traveling`
  String get englishForTraveling {
    return Intl.message(
      'English For Traveling',
      name: 'englishForTraveling',
      desc: '',
      args: [],
    );
  }

  /// `English For Beginner`
  String get englishForBeginner {
    return Intl.message(
      'English For Beginner',
      name: 'englishForBeginner',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutes {
    return Intl.message(
      'minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Select tutor nationality`
  String get enterNationality {
    return Intl.message(
      'Select tutor nationality',
      name: 'enterNationality',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interests {
    return Intl.message(
      'Interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Specialities`
  String get specialities {
    return Intl.message(
      'Specialities',
      name: 'specialities',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Reserved`
  String get reserved {
    return Intl.message(
      'Reserved',
      name: 'reserved',
      desc: '',
      args: [],
    );
  }

  /// `Booked`
  String get booked {
    return Intl.message(
      'Booked',
      name: 'booked',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Rating and Comment`
  String get ratingAndComment {
    return Intl.message(
      'Rating and Comment',
      name: 'ratingAndComment',
      desc: '',
      args: [],
    );
  }

  /// `Help us understand what's happening`
  String get helpUsUnderstand {
    return Intl.message(
      'Help us understand what\'s happening',
      name: 'helpUsUnderstand',
      desc: '',
      args: [],
    );
  }

  /// `Please let us know details about your problem`
  String get reportReasonHint {
    return Intl.message(
      'Please let us know details about your problem',
      name: 'reportReasonHint',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try later!`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong, please try later!',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Booking details`
  String get bookingDetail {
    return Intl.message(
      'Booking details',
      name: 'bookingDetail',
      desc: '',
      args: [],
    );
  }

  /// `Booking time`
  String get bookingTime {
    return Intl.message(
      'Booking time',
      name: 'bookingTime',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get note {
    return Intl.message(
      'Notes',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `You have`
  String get youHave {
    return Intl.message(
      'You have',
      name: 'youHave',
      desc: '',
      args: [],
    );
  }

  /// `lessons left`
  String get lessonLeft {
    return Intl.message(
      'lessons left',
      name: 'lessonLeft',
      desc: '',
      args: [],
    );
  }

  /// `lesson`
  String get lesson {
    return Intl.message(
      'lesson',
      name: 'lesson',
      desc: '',
      args: [],
    );
  }

  /// `Booking success`
  String get bookingSuccess {
    return Intl.message(
      'Booking success',
      name: 'bookingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Report successfully`
  String get reportSuccess {
    return Intl.message(
      'Report successfully',
      name: 'reportSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courseTitle {
    return Intl.message(
      'Courses',
      name: 'courseTitle',
      desc: '',
      args: [],
    );
  }

  /// `Books`
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
      desc: '',
      args: [],
    );
  }

  /// `Search Courses`
  String get searchCourses {
    return Intl.message(
      'Search Courses',
      name: 'searchCourses',
      desc: '',
      args: [],
    );
  }

  /// `Select level`
  String get selectLevel {
    return Intl.message(
      'Select level',
      name: 'selectLevel',
      desc: '',
      args: [],
    );
  }

  /// `Select category`
  String get selectCategory {
    return Intl.message(
      'Select category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Search Books`
  String get bookSearch {
    return Intl.message(
      'Search Books',
      name: 'bookSearch',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Go to meeting`
  String get goToMeeting {
    return Intl.message(
      'Go to meeting',
      name: 'goToMeeting',
      desc: '',
      args: [],
    );
  }

  /// `Edit request`
  String get editRequest {
    return Intl.message(
      'Edit request',
      name: 'editRequest',
      desc: '',
      args: [],
    );
  }

  /// `Request for lesson`
  String get requestForLesson {
    return Intl.message(
      'Request for lesson',
      name: 'requestForLesson',
      desc: '',
      args: [],
    );
  }

  /// `Currently there are no requests for this class. Please write down any requests for the teacher.`
  String get hintRequest {
    return Intl.message(
      'Currently there are no requests for this class. Please write down any requests for the teacher.',
      name: 'hintRequest',
      desc: '',
      args: [],
    );
  }

  /// `Lesson Time`
  String get lessonTime {
    return Intl.message(
      'Lesson Time',
      name: 'lessonTime',
      desc: '',
      args: [],
    );
  }

  /// `What was the reason you cancel this booking`
  String get whatReasonTitle {
    return Intl.message(
      'What was the reason you cancel this booking',
      name: 'whatReasonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Additional notes`
  String get additionalNotes {
    return Intl.message(
      'Additional notes',
      name: 'additionalNotes',
      desc: '',
      args: [],
    );
  }

  /// `The reason cannot be empty!`
  String get reasonNotEmpty {
    return Intl.message(
      'The reason cannot be empty!',
      name: 'reasonNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Delete booking successfully!`
  String get deleteBookingSuccess {
    return Intl.message(
      'Delete booking successfully!',
      name: 'deleteBookingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule at another time`
  String get rescheduleAtAnotherTime {
    return Intl.message(
      'Reschedule at another time',
      name: 'rescheduleAtAnotherTime',
      desc: '',
      args: [],
    );
  }

  /// `Busy at that time`
  String get busyAtThatTime {
    return Intl.message(
      'Busy at that time',
      name: 'busyAtThatTime',
      desc: '',
      args: [],
    );
  }

  /// `Asked by the tutor`
  String get askedByTheTutor {
    return Intl.message(
      'Asked by the tutor',
      name: 'askedByTheTutor',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Type a question`
  String get typeAQuestion {
    return Intl.message(
      'Type a question',
      name: 'typeAQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for response`
  String get waitingForResponse {
    return Intl.message(
      'Waiting for response',
      name: 'waitingForResponse',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Advanced Settings`
  String get advancedSettings {
    return Intl.message(
      'Advanced Settings',
      name: 'advancedSettings',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verified`
  String get verified {
    return Intl.message(
      'Verified',
      name: 'verified',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `My level`
  String get myLevel {
    return Intl.message(
      'My level',
      name: 'myLevel',
      desc: '',
      args: [],
    );
  }

  /// `Want to learn`
  String get wantToLearn {
    return Intl.message(
      'Want to learn',
      name: 'wantToLearn',
      desc: '',
      args: [],
    );
  }

  /// `Study schedule`
  String get studySchedule {
    return Intl.message(
      'Study schedule',
      name: 'studySchedule',
      desc: '',
      args: [],
    );
  }

  /// `Note the time of the week you want to study on LetTutor`
  String get studyScheduleHint {
    return Intl.message(
      'Note the time of the week you want to study on LetTutor',
      name: 'studyScheduleHint',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile successfully`
  String get editProfileSuccess {
    return Intl.message(
      'Edit profile successfully',
      name: 'editProfileSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `No request for lesson`
  String get requestHint {
    return Intl.message(
      'No request for lesson',
      name: 'requestHint',
      desc: '',
      args: [],
    );
  }

  /// `Tutor have not reviewed yet`
  String get reviewHint {
    return Intl.message(
      'Tutor have not reviewed yet',
      name: 'reviewHint',
      desc: '',
      args: [],
    );
  }

  /// `Add a rating`
  String get addARating {
    return Intl.message(
      'Add a rating',
      name: 'addARating',
      desc: '',
      args: [],
    );
  }

  /// `Review from tutor`
  String get reviewFromTutor {
    return Intl.message(
      'Review from tutor',
      name: 'reviewFromTutor',
      desc: '',
      args: [],
    );
  }

  /// `Session`
  String get session {
    return Intl.message(
      'Session',
      name: 'session',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message(
      'Vietnamese',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark {
    return Intl.message(
      'Dark mode',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light mode`
  String get light {
    return Intl.message(
      'Light mode',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Waiting room`
  String get waitingRoom {
    return Intl.message(
      'Waiting room',
      name: 'waitingRoom',
      desc: '',
      args: [],
    );
  }

  /// `until lesson start`
  String get untilLessonStart {
    return Intl.message(
      'until lesson start',
      name: 'untilLessonStart',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
