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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Behind every \nsstrong woman\nare strong\n women`
  String get onboardingPageOneTitle {
    return Intl.message(
      'Behind every \nsstrong woman\nare strong\n women',
      name: 'onboardingPageOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `We are here to empower women\nwith refugee and migration\nexperience and \to live fempowerment.`
  String get onboardingPageOneBody {
    return Intl.message(
      'We are here to empower women\nwith refugee and migration\nexperience and \to live fempowerment.',
      name: 'onboardingPageOneBody',
      desc: '',
      args: [],
    );
  }

  /// `Find the perfect\nTandem-\n partner.`
  String get onboardingPageTwoTitle {
    return Intl.message(
      'Find the perfect\nTandem-\n partner.',
      name: 'onboardingPageTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `The Female Fellows Tandem Project\nconnects women with and without\nrefugee and migration experience.`
  String get onboardingPageTwoBody {
    return Intl.message(
      'The Female Fellows Tandem Project\nconnects women with and without\nrefugee and migration experience.',
      name: 'onboardingPageTwoBody',
      desc: '',
      args: [],
    );
  }

  /// `Take part in\nexciting\nevents.`
  String get onboardingPageThreeTitle {
    return Intl.message(
      'Take part in\nexciting\nevents.',
      name: 'onboardingPageThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a variety of\nevents organized by women\n anf for women. You\n can take part in live events \n and digital activities.`
  String get onboardingPageThreeBody {
    return Intl.message(
      'Enjoy a variety of\nevents organized by women\n anf for women. You\n can take part in live events \n and digital activities.',
      name: 'onboardingPageThreeBody',
      desc: '',
      args: [],
    );
  }

  /// `Become a part of our\nFemale Fellows\nCommunity.`
  String get onboardingPageFourTitle {
    return Intl.message(
      'Become a part of our\nFemale Fellows\nCommunity.',
      name: 'onboardingPageFourTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dive into our theme groups\n, to exchange ideas and \nnetwork with like-minded people.n\nLBe inspired by the success stories\nof other tandems.`
  String get onboardingPageFourBody {
    return Intl.message(
      'Dive into our theme groups\n, to exchange ideas and \nnetwork with like-minded people.n\nLBe inspired by the success stories\nof other tandems.',
      name: 'onboardingPageFourBody',
      desc: '',
      args: [],
    );
  }

  /// `Become a member`
  String get buttonRegistration {
    return Intl.message(
      'Become a member',
      name: 'buttonRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Back to the introduction`
  String get intro {
    return Intl.message(
      'Back to the introduction',
      name: 'intro',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get skip {
    return Intl.message('Cancel', name: 'skip', desc: '', args: []);
  }

  /// `Start`
  String get start {
    return Intl.message('Start', name: 'start', desc: '', args: []);
  }

  /// `Start now`
  String get startnow {
    return Intl.message('Start now', name: 'startnow', desc: '', args: []);
  }

  /// `Login`
  String get loginPageTitle {
    return Intl.message('Login', name: 'loginPageTitle', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Sign in`
  String get signin {
    return Intl.message('Sign in', name: 'signin', desc: '', args: []);
  }

  /// `Not registered yet?`
  String get signinTextup {
    return Intl.message(
      'Not registered yet?',
      name: 'signinTextup',
      desc: '',
      args: [],
    );
  }

  /// `Click here!`
  String get signinTextdown {
    return Intl.message(
      'Click here!',
      name: 'signinTextdown',
      desc: '',
      args: [],
    );
  }

  /// `Already registered?`
  String get loginTextup {
    return Intl.message(
      'Already registered?',
      name: 'loginTextup',
      desc: '',
      args: [],
    );
  }

  /// `Click here!`
  String get loginTextdown {
    return Intl.message(
      'Click here!',
      name: 'loginTextdown',
      desc: '',
      args: [],
    );
  }

  /// `Continue without login`
  String get loginContinue {
    return Intl.message(
      'Continue without login',
      name: 'loginContinue',
      desc: '',
      args: [],
    );
  }

  /// `Log in with your email and password`
  String get loginPageBody {
    return Intl.message(
      'Log in with your email and password',
      name: 'loginPageBody',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verificationTitle {
    return Intl.message(
      'Verification',
      name: 'verificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email\nand your passwort here`
  String get verficationBody {
    return Intl.message(
      'Enter your Email\nand your passwort here',
      name: 'verficationBody',
      desc: '',
      args: [],
    );
  }

  /// `How old are you?`
  String get authenticationAge {
    return Intl.message(
      'How old are you?',
      name: 'authenticationAge',
      desc: '',
      args: [],
    );
  }

  /// `Click on the picture`
  String get authenticationAgeImage {
    return Intl.message(
      'Click on the picture',
      name: 'authenticationAgeImage',
      desc: '',
      args: [],
    );
  }

  /// `Your birthday:`
  String get authenticationAgeBirthday {
    return Intl.message(
      'Your birthday:',
      name: 'authenticationAgeBirthday',
      desc: '',
      args: [],
    );
  }

  /// `How would you \nlike to meet?`
  String get authenticationConnection {
    return Intl.message(
      'How would you \nlike to meet?',
      name: 'authenticationConnection',
      desc: '',
      args: [],
    );
  }

  /// `Locally`
  String get authenticationConnectionPlace {
    return Intl.message(
      'Locally',
      name: 'authenticationConnectionPlace',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get authenticationConnectionOnline {
    return Intl.message(
      'Online',
      name: 'authenticationConnectionOnline',
      desc: '',
      args: [],
    );
  }

  /// `Locally & Online`
  String get authenticationConnectionOnlinePlace {
    return Intl.message(
      'Locally & Online',
      name: 'authenticationConnectionOnlinePlace',
      desc: '',
      args: [],
    );
  }

  /// `Become a member`
  String get authenticationTitle {
    return Intl.message(
      'Become a member',
      name: 'authenticationTitle',
      desc: '',
      args: [],
    );
  }

  /// `How did you become\naware of us?`
  String get authenticationHow {
    return Intl.message(
      'How did you become\naware of us?',
      name: 'authenticationHow',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get authenticationInstagram {
    return Intl.message(
      'Instagram',
      name: 'authenticationInstagram',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get authenticationFacebook {
    return Intl.message(
      'Facebook',
      name: 'authenticationFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Linkedin`
  String get authenticationLinkedin {
    return Intl.message(
      'Linkedin',
      name: 'authenticationLinkedin',
      desc: '',
      args: [],
    );
  }

  /// `Press/Newspaper`
  String get authenticationPresse {
    return Intl.message(
      'Press/Newspaper',
      name: 'authenticationPresse',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get authenticationFreunde {
    return Intl.message(
      'Friends',
      name: 'authenticationFreunde',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get authenticationSonstiges {
    return Intl.message(
      'Other',
      name: 'authenticationSonstiges',
      desc: '',
      args: [],
    );
  }

  /// `How can we \nreach out to you?`
  String get authenticationNotificationTitle {
    return Intl.message(
      'How can we \nreach out to you?',
      name: 'authenticationNotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get authenticationCall {
    return Intl.message('Call', name: 'authenticationCall', desc: '', args: []);
  }

  /// `Whatsapp`
  String get authenticationWhatsApp {
    return Intl.message(
      'Whatsapp',
      name: 'authenticationWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get authenticationEmail {
    return Intl.message(
      'Email',
      name: 'authenticationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number *`
  String get authenticationHandy {
    return Intl.message(
      'Mobile number *',
      name: 'authenticationHandy',
      desc: '',
      args: [],
    );
  }

  /// `Where do you live?`
  String get authenticationPlace {
    return Intl.message(
      'Where do you live?',
      name: 'authenticationPlace',
      desc: '',
      args: [],
    );
  }

  /// `Street and house number`
  String get authenticationStreet {
    return Intl.message(
      'Street and house number',
      name: 'authenticationStreet',
      desc: '',
      args: [],
    );
  }

  /// `Postcode and city`
  String get authenticationPostcode {
    return Intl.message(
      'Postcode and city',
      name: 'authenticationPostcode',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy\nand Newsletter`
  String get authenticationSafetyTitle {
    return Intl.message(
      'Privacy policy\nand Newsletter',
      name: 'authenticationSafetyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I would like to subscribe to the newsletter`
  String get authenticationNewsletter {
    return Intl.message(
      'Yes, I would like to subscribe to the newsletter',
      name: 'authenticationNewsletter',
      desc: '',
      args: [],
    );
  }

  /// `Yes, I have read the data protection\nagreement and the TERMS AND CONDITIONS\nof Female Fellows e.V. and I agree with them.`
  String get authenticationAGBS {
    return Intl.message(
      'Yes, I have read the data protection\nagreement and the TERMS AND CONDITIONS\nof Female Fellows e.V. and I agree with them.',
      name: 'authenticationAGBS',
      desc: '',
      args: [],
    );
  }

  /// `Who are you`
  String get authenticationWho {
    return Intl.message(
      'Who are you',
      name: 'authenticationWho',
      desc: '',
      args: [],
    );
  }

  /// `Choose /nyour Profile picture or Avatar`
  String get authenticationPicture {
    return Intl.message(
      'Choose /nyour Profile picture or Avatar',
      name: 'authenticationPicture',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get authenticationFirstname {
    return Intl.message(
      'First name',
      name: 'authenticationFirstname',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get authenticationLastname {
    return Intl.message(
      'Last name',
      name: 'authenticationLastname',
      desc: '',
      args: [],
    );
  }

  /// `I am a newcomer`
  String get authenticationNewcomerTitle {
    return Intl.message(
      'I am a newcomer',
      name: 'authenticationNewcomerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to have more contact\nwith women who know their way around Germany?`
  String get authenticationNewcomer {
    return Intl.message(
      'Would you like to have more contact\nwith women who know their way around Germany?',
      name: 'authenticationNewcomer',
      desc: '',
      args: [],
    );
  }

  /// `I am a local`
  String get authenticationLocalTitle {
    return Intl.message(
      'I am a local',
      name: 'authenticationLocalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you looking for a cultural exchange\nand would you like to make a contribution to \ngood coexistence??`
  String get authenticationLocal {
    return Intl.message(
      'Are you looking for a cultural exchange\nand would you like to make a contribution to \ngood coexistence??',
      name: 'authenticationLocal',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get homeWelcomeTextOne {
    return Intl.message(
      'Hello',
      name: 'homeWelcomeTextOne',
      desc: '',
      args: [],
    );
  }

  /// `Nice to have you with us!`
  String get homeWelcomeTextTwo {
    return Intl.message(
      'Nice to have you with us!',
      name: 'homeWelcomeTextTwo',
      desc: '',
      args: [],
    );
  }

  /// `Discover Events, find your \nperfect tandem partner\nund get inspired by our \ntandem stories.`
  String get homeInfo {
    return Intl.message(
      'Discover Events, find your \nperfect tandem partner\nund get inspired by our \ntandem stories.',
      name: 'homeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Tandem stories`
  String get homeTandemstoriesTitle {
    return Intl.message(
      'Tandem stories',
      name: 'homeTandemstoriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Erfahrungsbericht der Tandems`
  String get homeTandemstoryOneSubTitle {
    return Intl.message(
      'Erfahrungsbericht der Tandems',
      name: 'homeTandemstoryOneSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `A tandem with a woman from another country is an enriching experience that I wouldn't want to do without.Makai had initially been looking for a woman who lived here primarily to learn German. But even learning together was usually accompanied by drinking chai, eating something, chatting and laughing a lot together. I think you get a thousand times the time back in the form of interesting insights, new contacts and very practical cultural learning. A tandem with a woman from another country is an enriching experience that I wouldn't want to do without.Makai had initially been looking for a woman who lived here primarily to learn German. But even learning together was usually accompanied by drinking chai, eating something, chatting and laughing a lot together. I think you get a thousand times the time back in the form of interesting insights, new contacts and very practical cultural learning.`
  String get homeTandemstoryOneBodyOne {
    return Intl.message(
      'A tandem with a woman from another country is an enriching experience that I wouldn\'t want to do without.Makai had initially been looking for a woman who lived here primarily to learn German. But even learning together was usually accompanied by drinking chai, eating something, chatting and laughing a lot together. I think you get a thousand times the time back in the form of interesting insights, new contacts and very practical cultural learning. A tandem with a woman from another country is an enriching experience that I wouldn\'t want to do without.Makai had initially been looking for a woman who lived here primarily to learn German. But even learning together was usually accompanied by drinking chai, eating something, chatting and laughing a lot together. I think you get a thousand times the time back in the form of interesting insights, new contacts and very practical cultural learning.',
      name: 'homeTandemstoryOneBodyOne',
      desc: '',
      args: [],
    );
  }

  /// `It was an opportunity for both of us to get to know each other: I wasn't the only one who taught Makai German and something about life here - I was also able to learn a lot from her and her family about Afghanistan, the way of life there and also about the conditions for refugees here in Germany. I think it's really important as a woman to encourage other women to take advantage of all the opportunities we have. We also did lots of leisure activities together in Stuttgart, went swimming, to the park or the library. I was able to get to know my city through completely different eyes and show what I appreciate here. The association also offers mega fun and varied activities for the whole community, where you can spend an interesting time with other women, and I can only encourage every interested woman to take advantage of this meaningful opportunity and support other women!`
  String get homeTandemstoryOneBodyTwo {
    return Intl.message(
      'It was an opportunity for both of us to get to know each other: I wasn\'t the only one who taught Makai German and something about life here - I was also able to learn a lot from her and her family about Afghanistan, the way of life there and also about the conditions for refugees here in Germany. I think it\'s really important as a woman to encourage other women to take advantage of all the opportunities we have. We also did lots of leisure activities together in Stuttgart, went swimming, to the park or the library. I was able to get to know my city through completely different eyes and show what I appreciate here. The association also offers mega fun and varied activities for the whole community, where you can spend an interesting time with other women, and I can only encourage every interested woman to take advantage of this meaningful opportunity and support other women!',
      name: 'homeTandemstoryOneBodyTwo',
      desc: '',
      args: [],
    );
  }

  /// `Find your perfect \ntandem partner `
  String get homeTandemTeaser {
    return Intl.message(
      'Find your perfect \ntandem partner ',
      name: 'homeTandemTeaser',
      desc: '',
      args: [],
    );
  }

  /// `Stop by at our events`
  String get homeEventsTeaserTitle {
    return Intl.message(
      'Stop by at our events',
      name: 'homeEventsTeaserTitle',
      desc: '',
      args: [],
    );
  }

  /// `About the association`
  String get homeVereinInfoTitle {
    return Intl.message(
      'About the association',
      name: 'homeVereinInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Our mission`
  String get homeVereinInfoOneTitle {
    return Intl.message(
      'Our mission',
      name: 'homeVereinInfoOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `The Female Fellows e.V. association is currently particularly committed to empowering women who have refugee and migration experience. Under the motto ‘Behind every strong woman are strong women’, we want to contribute to empowerment and thus to a society that embraces its diversity and in which everyone has an equal say. The volunteer Tandem projects in Stuttgart, Bietigheim-Bissingen and Tübingen are therefore characterised not only by language and everyday support, but above all by events and activities of all kinds - because encounters are the key to inspiring, helpful, open and horizon-broadening interaction with one another.`
  String get homeVereinInfoOneBody {
    return Intl.message(
      'The Female Fellows e.V. association is currently particularly committed to empowering women who have refugee and migration experience. Under the motto ‘Behind every strong woman are strong women’, we want to contribute to empowerment and thus to a society that embraces its diversity and in which everyone has an equal say. The volunteer Tandem projects in Stuttgart, Bietigheim-Bissingen and Tübingen are therefore characterised not only by language and everyday support, but above all by events and activities of all kinds - because encounters are the key to inspiring, helpful, open and horizon-broadening interaction with one another.',
      name: 'homeVereinInfoOneBody',
      desc: '',
      args: [],
    );
  }

  /// `According to a recent study by the OECD, female refugees are less well integrated into German society. The reason for this is the low level of participation in integration programmes and little contact with locals. Only 12% of refugee women in Germany have daily contact with locals. Female Fellows aims to counteract this phenomenon through the tandem project and take a big first step towards successful interaction. The tandem project also facilitates and promotes cultural exchange - these women have the potential, the capacity and the ability to act! It's about utilising the potential of women, empowering and encouraging them!`
  String get homeVereinInfoTwoBody {
    return Intl.message(
      'According to a recent study by the OECD, female refugees are less well integrated into German society. The reason for this is the low level of participation in integration programmes and little contact with locals. Only 12% of refugee women in Germany have daily contact with locals. Female Fellows aims to counteract this phenomenon through the tandem project and take a big first step towards successful interaction. The tandem project also facilitates and promotes cultural exchange - these women have the potential, the capacity and the ability to act! It\'s about utilising the potential of women, empowering and encouraging them!',
      name: 'homeVereinInfoTwoBody',
      desc: '',
      args: [],
    );
  }

  /// `Cooperation\npartner`
  String get homeVereinInfoThreeTitle {
    return Intl.message(
      'Cooperation\npartner',
      name: 'homeVereinInfoThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thank you very much! We would like to thank all our volunteers and hard-working helpers for their time, patience and enthusiasm. A big thank you also goes to all our donors and supporters who believe in us and support the project. We would also like to thank our many participants for their trust, their openness and their joie de vivre! Without all of you, the project would have remained just an idea!`
  String get homeVereinInfoThreeBody {
    return Intl.message(
      'Thank you very much! We would like to thank all our volunteers and hard-working helpers for their time, patience and enthusiasm. A big thank you also goes to all our donors and supporters who believe in us and support the project. We would also like to thank our many participants for their trust, their openness and their joie de vivre! Without all of you, the project would have remained just an idea!',
      name: 'homeVereinInfoThreeBody',
      desc: '',
      args: [],
    );
  }

  /// `About the cooperation partners`
  String get homeVereinInfoThreeButton {
    return Intl.message(
      'About the cooperation partners',
      name: 'homeVereinInfoThreeButton',
      desc: '',
      args: [],
    );
  }

  /// `Become part of our colourful team`
  String get homeLinkOneTitle {
    return Intl.message(
      'Become part of our colourful team',
      name: 'homeLinkOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Become a supporter`
  String get homeLinkTwoTitle {
    return Intl.message(
      'Become a supporter',
      name: 'homeLinkTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get homeNewsTitle {
    return Intl.message('News', name: 'homeNewsTitle', desc: '', args: []);
  }

  /// `Overview`
  String get profilOverview {
    return Intl.message('Overview', name: 'profilOverview', desc: '', args: []);
  }

  /// `Progress`
  String get profilProgress {
    return Intl.message('Progress', name: 'profilProgress', desc: '', args: []);
  }

  /// `Member since\nDays`
  String get profilProgressMember {
    return Intl.message(
      'Member since\nDays',
      name: 'profilProgressMember',
      desc: '',
      args: [],
    );
  }

  /// `Attended \n events`
  String get profilProgressEvents {
    return Intl.message(
      'Attended \n events',
      name: 'profilProgressEvents',
      desc: '',
      args: [],
    );
  }

  /// `Apply for proof of honour`
  String get profilProgressQualification {
    return Intl.message(
      'Apply for proof of honour',
      name: 'profilProgressQualification',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get profilSettingsMainTitle {
    return Intl.message(
      'Settings',
      name: 'profilSettingsMainTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get profilSettingFieldOne {
    return Intl.message(
      'Notifications',
      name: 'profilSettingFieldOne',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get profilSettingFieldTwo {
    return Intl.message(
      'About us',
      name: 'profilSettingFieldTwo',
      desc: '',
      args: [],
    );
  }

  /// `App Review`
  String get profilSettingFieldThree {
    return Intl.message(
      'App Review',
      name: 'profilSettingFieldThree',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get profilSettingFieldFour {
    return Intl.message(
      'Feedback',
      name: 'profilSettingFieldFour',
      desc: '',
      args: [],
    );
  }

  /// `Data privacy policy`
  String get profilSettingFieldFive {
    return Intl.message(
      'Data privacy policy',
      name: 'profilSettingFieldFive',
      desc: '',
      args: [],
    );
  }

  /// `Legal notice`
  String get profilSettingFieldSix {
    return Intl.message(
      'Legal notice',
      name: 'profilSettingFieldSix',
      desc: '',
      args: [],
    );
  }

  /// `No events available`
  String get eventsPageAllState {
    return Intl.message(
      'No events available',
      name: 'eventsPageAllState',
      desc: '',
      args: [],
    );
  }

  /// `You have not yet registered for any events`
  String get eventsPageEventState {
    return Intl.message(
      'You have not yet registered for any events',
      name: 'eventsPageEventState',
      desc: '',
      args: [],
    );
  }

  /// `You have not favoured any events yet `
  String get eventsPageFavorits {
    return Intl.message(
      'You have not favoured any events yet ',
      name: 'eventsPageFavorits',
      desc: '',
      args: [],
    );
  }

  /// `Your location`
  String get eventsPageGetLocation {
    return Intl.message(
      'Your location',
      name: 'eventsPageGetLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select a date`
  String get eventsPageAllFilter {
    return Intl.message(
      'Select a date',
      name: 'eventsPageAllFilter',
      desc: '',
      args: [],
    );
  }

  /// `Search for ...`
  String get eventsPageAllSearchFieldPlaceholder {
    return Intl.message(
      'Search for ...',
      name: 'eventsPageAllSearchFieldPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get eventsPageAllDefaultSection {
    return Intl.message(
      'All',
      name: 'eventsPageAllDefaultSection',
      desc: '',
      args: [],
    );
  }

  /// `Signed up`
  String get eventsPageAllSectionTwo {
    return Intl.message(
      'Signed up',
      name: 'eventsPageAllSectionTwo',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get eventsPageAllSectionThree {
    return Intl.message(
      'Favorites',
      name: 'eventsPageAllSectionThree',
      desc: '',
      args: [],
    );
  }

  /// `Show more events`
  String get eventsPageAllButtonOne {
    return Intl.message(
      'Show more events',
      name: 'eventsPageAllButtonOne',
      desc: '',
      args: [],
    );
  }

  /// `Propose events`
  String get eventsPageAllTitle {
    return Intl.message(
      'Propose events',
      name: 'eventsPageAllTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can organise your own events or\n you can suggest events from other organisations.`
  String get eventsPageAllSubtitle {
    return Intl.message(
      'You can organise your own events or\n you can suggest events from other organisations.',
      name: 'eventsPageAllSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get eventsFiltersTitleFilterThree {
    return Intl.message(
      'Categories',
      name: 'eventsFiltersTitleFilterThree',
      desc: '',
      args: [],
    );
  }

  /// `Submit your Female-Fellows\nEvent idea`
  String get eventsPageAllMailtoButtonOne {
    return Intl.message(
      'Submit your Female-Fellows\nEvent idea',
      name: 'eventsPageAllMailtoButtonOne',
      desc: '',
      args: [],
    );
  }

  /// `Share events of other\norganisations`
  String get eventsPageAllMailtoButtonTwo {
    return Intl.message(
      'Share events of other\norganisations',
      name: 'eventsPageAllMailtoButtonTwo',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get eventsFiltersTitleFilterOne {
    return Intl.message(
      'Location',
      name: 'eventsFiltersTitleFilterOne',
      desc: '',
      args: [],
    );
  }

  /// `Frequency of the events`
  String get eventsFiltersTitleFilterTwo {
    return Intl.message(
      'Frequency of the events',
      name: 'eventsFiltersTitleFilterTwo',
      desc: '',
      args: [],
    );
  }

  /// `Event description`
  String get createEventsDescription {
    return Intl.message(
      'Event description',
      name: 'createEventsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Create Events`
  String get createEventsTitle {
    return Intl.message(
      'Create Events',
      name: 'createEventsTitle',
      desc: '',
      args: [],
    );
  }

  /// `What to bring along`
  String get createEventsMaterialTitle {
    return Intl.message(
      'What to bring along',
      name: 'createEventsMaterialTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the materials`
  String get createEventsMaterial {
    return Intl.message(
      'Enter the materials',
      name: 'createEventsMaterial',
      desc: '',
      args: [],
    );
  }

  /// `Organisation of the event`
  String get createEventOrga {
    return Intl.message(
      'Organisation of the event',
      name: 'createEventOrga',
      desc: '',
      args: [],
    );
  }

  /// `Event organiser`
  String get createEventsHost {
    return Intl.message(
      'Event organiser',
      name: 'createEventsHost',
      desc: '',
      args: [],
    );
  }

  /// `Contact person`
  String get createEventsContactPerson {
    return Intl.message(
      'Contact person',
      name: 'createEventsContactPerson',
      desc: '',
      args: [],
    );
  }

  /// `Contact person`
  String get createEventsContactPerson2 {
    return Intl.message(
      'Contact person',
      name: 'createEventsContactPerson2',
      desc: '',
      args: [],
    );
  }

  /// `Event Title`
  String get createEventTitle {
    return Intl.message(
      'Event Title',
      name: 'createEventTitle',
      desc: '',
      args: [],
    );
  }

  /// `Event Date`
  String get createEventDate {
    return Intl.message(
      'Event Date',
      name: 'createEventDate',
      desc: '',
      args: [],
    );
  }

  /// `Event Date`
  String get createEventDate2 {
    return Intl.message(
      'Event Date',
      name: 'createEventDate2',
      desc: '',
      args: [],
    );
  }

  /// `Event email`
  String get createEventMail {
    return Intl.message(
      'Event email',
      name: 'createEventMail',
      desc: '',
      args: [],
    );
  }

  /// `Event mobile number`
  String get createEventHandy {
    return Intl.message(
      'Event mobile number',
      name: 'createEventHandy',
      desc: '',
      args: [],
    );
  }

  /// `Event WhatsApp group link`
  String get createEventWhatsApp {
    return Intl.message(
      'Event WhatsApp group link',
      name: 'createEventWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Event WhatsApp group link`
  String get createEventWhatsApp2 {
    return Intl.message(
      'Event WhatsApp group link',
      name: 'createEventWhatsApp2',
      desc: '',
      args: [],
    );
  }

  /// `Event has been successfully created`
  String get createEventSuccess {
    return Intl.message(
      'Event has been successfully created',
      name: 'createEventSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Open Date Picker`
  String get createEventDatePicker {
    return Intl.message(
      'Open Date Picker',
      name: 'createEventDatePicker',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get createEventPlace {
    return Intl.message('City', name: 'createEventPlace', desc: '', args: []);
  }

  /// `street`
  String get createEventStreet {
    return Intl.message(
      'street',
      name: 'createEventStreet',
      desc: '',
      args: [],
    );
  }

  /// `Postal code`
  String get createEventZipCode {
    return Intl.message(
      'Postal code',
      name: 'createEventZipCode',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get snackbarFailure {
    return Intl.message('Error', name: 'snackbarFailure', desc: '', args: []);
  }

  /// `You have successfully registered for this event`
  String get snackbarEventSuccess {
    return Intl.message(
      'You have successfully registered for this event',
      name: 'snackbarEventSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Event application`
  String get eventButtonSignup {
    return Intl.message(
      'Event application',
      name: 'eventButtonSignup',
      desc: '',
      args: [],
    );
  }

  /// `Register now`
  String get eventOneButton {
    return Intl.message(
      'Register now',
      name: 'eventOneButton',
      desc: '',
      args: [],
    );
  }

  /// `About the event`
  String get eventOneTitleOne {
    return Intl.message(
      'About the event',
      name: 'eventOneTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get eventOneTitleTwo {
    return Intl.message(
      'Categories',
      name: 'eventOneTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Pictures from the latest events`
  String get eventOneTitleThree {
    return Intl.message(
      'Pictures from the latest events',
      name: 'eventOneTitleThree',
      desc: '',
      args: [],
    );
  }

  /// `What do I need to bring`
  String get eventOneTitleFour {
    return Intl.message(
      'What do I need to bring',
      name: 'eventOneTitleFour',
      desc: '',
      args: [],
    );
  }

  /// `Notes and pencils`
  String get eventOneSubtitleOne {
    return Intl.message(
      'Notes and pencils',
      name: 'eventOneSubtitleOne',
      desc: '',
      args: [],
    );
  }

  /// `To capture new words or sentences \nand to take notes.`
  String get eventOneSubtitleOneBodyOne {
    return Intl.message(
      'To capture new words or sentences \nand to take notes.',
      name: 'eventOneSubtitleOneBodyOne',
      desc: '',
      args: [],
    );
  }

  /// `Culinary delights`
  String get eventOneSubtitleTwo {
    return Intl.message(
      'Culinary delights',
      name: 'eventOneSubtitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Each participant could bring a small\n dish or snacks from their home country\n order to explore the cultural diversity of the country\n a culinary way.`
  String get eventOneSubtitleTwoBodyTwo {
    return Intl.message(
      'Each participant could bring a small\n dish or snacks from their home country\n order to explore the cultural diversity of the country\n a culinary way.',
      name: 'eventOneSubtitleTwoBodyTwo',
      desc: '',
      args: [],
    );
  }

  /// `clothes`
  String get eventOneSubtitleThree {
    return Intl.message(
      'clothes',
      name: 'eventOneSubtitleThree',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get eventOneSubtitleFour {
    return Intl.message(
      'Other',
      name: 'eventOneSubtitleFour',
      desc: '',
      args: [],
    );
  }

  /// `Event address`
  String get eventAdress {
    return Intl.message(
      'Event address',
      name: 'eventAdress',
      desc: '',
      args: [],
    );
  }

  /// `If you are from another country, you could share interesting information about your culture or traditions.`
  String get eventOneSubtitleThreeBodyThree {
    return Intl.message(
      'If you are from another country, you could share interesting information about your culture or traditions.',
      name: 'eventOneSubtitleThreeBodyThree',
      desc: '',
      args: [],
    );
  }

  /// `Register bindingly`
  String get eventButtonSignin {
    return Intl.message(
      'Register bindingly',
      name: 'eventButtonSignin',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw your registration`
  String get eventButtonSignout {
    return Intl.message(
      'Withdraw your registration',
      name: 'eventButtonSignout',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get buttonNext {
    return Intl.message('Continue', name: 'buttonNext', desc: '', args: []);
  }

  /// `Back`
  String get buttonBack {
    return Intl.message('Back', name: 'buttonBack', desc: '', args: []);
  }

  /// `Do you need an \ninterpreter at the event?`
  String get eventRegistrationOneTitle {
    return Intl.message(
      'Do you need an \ninterpreter at the event?',
      name: 'eventRegistrationOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language:`
  String get eventRegistrationOneFilterThree {
    return Intl.message(
      'Language:',
      name: 'eventRegistrationOneFilterThree',
      desc: '',
      args: [],
    );
  }

  /// `Do you need\nchildcare`
  String get eventRegistrationTwoTitle {
    return Intl.message(
      'Do you need\nchildcare',
      name: 'eventRegistrationTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get eventRegistrationTwoFilterOne {
    return Intl.message(
      'No',
      name: 'eventRegistrationTwoFilterOne',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get eventRegistrationTwoFilterTwo {
    return Intl.message(
      'Yes',
      name: 'eventRegistrationTwoFilterTwo',
      desc: '',
      args: [],
    );
  }

  /// `Number of children:`
  String get eventRegistrationTwoFieldOne {
    return Intl.message(
      'Number of children:',
      name: 'eventRegistrationTwoFieldOne',
      desc: '',
      args: [],
    );
  }

  /// `Child's age`
  String get eventRegistrationTwoFieldTwo {
    return Intl.message(
      'Child\'s age',
      name: 'eventRegistrationTwoFieldTwo',
      desc: '',
      args: [],
    );
  }

  /// `age`
  String get eventRegistrationTwoFieldTwo1 {
    return Intl.message(
      'age',
      name: 'eventRegistrationTwoFieldTwo1',
      desc: '',
      args: [],
    );
  }

  /// `Event application`
  String get eventRegistrationThreeSubtitle {
    return Intl.message(
      'Event application',
      name: 'eventRegistrationThreeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Photo consent\nat the eventt`
  String get eventRegistrationThreeTitle {
    return Intl.message(
      'Photo consent\nat the eventt',
      name: 'eventRegistrationThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `I agree that Female Fellows e.V.\n (hereinafter referred to as ‘Association’)\nfilm recordings/photographs of me may be processed and published for the purpose of\npress and public relations work, fundraising\nmarketing, internal use of\nadvertising measures and any\nfundraising campaigns. I also agree that my data may be stored for the purpose of the organisation of the association. I also agree that my data may be stored for the purpose of the organisation of the association.`
  String get eventRegistrationThreeFilterTwo {
    return Intl.message(
      'I agree that Female Fellows e.V.\n (hereinafter referred to as ‘Association’)\nfilm recordings/photographs of me may be processed and published for the purpose of\npress and public relations work, fundraising\nmarketing, internal use of\nadvertising measures and any\nfundraising campaigns. I also agree that my data may be stored for the purpose of the organisation of the association. I also agree that my data may be stored for the purpose of the organisation of the association.',
      name: 'eventRegistrationThreeFilterTwo',
      desc: '',
      args: [],
    );
  }

  /// `You've done it in a minute!`
  String get eventNotMemberEventTitle {
    return Intl.message(
      'You\'ve done it in a minute!',
      name: 'eventNotMemberEventTitle',
      desc: '',
      args: [],
    );
  }

  /// `Our events are only accessible to members of the association. You are not yet a member.`
  String get eventNotMemberEventBody {
    return Intl.message(
      'Our events are only accessible to members of the association. You are not yet a member.',
      name: 'eventNotMemberEventBody',
      desc: '',
      args: [],
    );
  }

  /// `Become a member for free`
  String get eventNotMemberEventButton {
    return Intl.message(
      'Become a member for free',
      name: 'eventNotMemberEventButton',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get eventOneRegisteredTitle {
    return Intl.message(
      'Congratulations!',
      name: 'eventOneRegisteredTitle',
      desc: '',
      args: [],
    );
  }

  /// `Contact person`
  String get eventOneRegisteredPerson {
    return Intl.message(
      'Contact person',
      name: 'eventOneRegisteredPerson',
      desc: '',
      args: [],
    );
  }

  /// `You take part in the language café: Arabic/German.`
  String get eventOneRegisteredTitle2 {
    return Intl.message(
      'You take part in the language café: Arabic/German.',
      name: 'eventOneRegisteredTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Go to the Event Chat`
  String get eventOneRegisteredButtonOne {
    return Intl.message(
      'Go to the Event Chat',
      name: 'eventOneRegisteredButtonOne',
      desc: '',
      args: [],
    );
  }

  /// `Go back to Events`
  String get eventOneRegisteredButtonTwo {
    return Intl.message(
      'Go back to Events',
      name: 'eventOneRegisteredButtonTwo',
      desc: '',
      args: [],
    );
  }

  /// `Edit the event`
  String get updateEventTitle {
    return Intl.message(
      'Edit the event',
      name: 'updateEventTitle',
      desc: '',
      args: [],
    );
  }

  /// `Update Event`
  String get updateEventButton {
    return Intl.message(
      'Update Event',
      name: 'updateEventButton',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp group link`
  String get updateEventWhatsApp {
    return Intl.message(
      'WhatsApp group link',
      name: 'updateEventWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Tandem matching`
  String get tandemMatchingAnmeldungOverlayOneSubtitle {
    return Intl.message(
      'Tandem matching',
      name: 'tandemMatchingAnmeldungOverlayOneSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tell us something about yourself?`
  String get tandemMatchingAnmeldungOverlayOneTitle {
    return Intl.message(
      'Tell us something about yourself?',
      name: 'tandemMatchingAnmeldungOverlayOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `E.g. I am from Syria and am\n interested in cultural exchange and\n professional orientation in\n Germany.`
  String get tandemMatchingAnmeldungOverlayOneFieldPlaceholder {
    return Intl.message(
      'E.g. I am from Syria and am\n interested in cultural exchange and\n professional orientation in\n Germany.',
      name: 'tandemMatchingAnmeldungOverlayOneFieldPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `To match you with your perfect Tandem partner, we need to know a bit more about you.`
  String get tandemMatchingAnmeldungOverlayOneFieldPlaceholder2 {
    return Intl.message(
      'To match you with your perfect Tandem partner, we need to know a bit more about you.',
      name: 'tandemMatchingAnmeldungOverlayOneFieldPlaceholder2',
      desc: '',
      args: [],
    );
  }

  /// `Tandem Matching`
  String get tandemMatchingAnmeldungOverlayTwoSubtitle {
    return Intl.message(
      'Tandem Matching',
      name: 'tandemMatchingAnmeldungOverlayTwoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `What languages do you speak?`
  String get tandemMatchingAnmeldungOverlayTitle {
    return Intl.message(
      'What languages do you speak?',
      name: 'tandemMatchingAnmeldungOverlayTitle',
      desc: '',
      args: [],
    );
  }

  /// `Native language`
  String get tandemMatchingAnmeldungOverlayFilterOneTitle {
    return Intl.message(
      'Native language',
      name: 'tandemMatchingAnmeldungOverlayFilterOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Further anguages`
  String get tandemMatchingAnmeldungOverlayFilterThreePlaceholder {
    return Intl.message(
      'Further anguages',
      name: 'tandemMatchingAnmeldungOverlayFilterThreePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Your Tandem matches`
  String get tandemMatchingOverviewTitle {
    return Intl.message(
      'Your Tandem matches',
      name: 'tandemMatchingOverviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want a Tandem in your area or an online tandem?`
  String get tandemMatchingOverviewFilterTitle {
    return Intl.message(
      'Do you want a Tandem in your area or an online tandem?',
      name: 'tandemMatchingOverviewFilterTitle',
      desc: '',
      args: [],
    );
  }

  /// `All Matches`
  String get tandemMatchingOverviewFilterOptionOne {
    return Intl.message(
      'All Matches',
      name: 'tandemMatchingOverviewFilterOptionOne',
      desc: '',
      args: [],
    );
  }

  /// `Matches close by`
  String get tandemMatchingOverviewFilterOptionTwo {
    return Intl.message(
      'Matches close by',
      name: 'tandemMatchingOverviewFilterOptionTwo',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get tandemMatchingOverviewFilterOptionThree {
    return Intl.message(
      'Online',
      name: 'tandemMatchingOverviewFilterOptionThree',
      desc: '',
      args: [],
    );
  }

  /// `Enquire as a tandem partner`
  String get tandemMatchingOverviewButton {
    return Intl.message(
      'Enquire as a tandem partner',
      name: 'tandemMatchingOverviewButton',
      desc: '',
      args: [],
    );
  }

  /// `Remember, you have 24 hours to decide on a proposal before you receive a reply from your Tandem partner. Have fun getting to know each other and discovering new friendships!`
  String get tandemMatchingOverviewBody2 {
    return Intl.message(
      'Remember, you have 24 hours to decide on a proposal before you receive a reply from your Tandem partner. Have fun getting to know each other and discovering new friendships!',
      name: 'tandemMatchingOverviewBody2',
      desc: '',
      args: [],
    );
  }

  /// `From these matching suggestions, you can choose and request a suitable tandem partner. The matches are based on your location and age. Choose the suggestion that suits you best and let your journey together begin!`
  String get tandemMatchingOverviewBody1 {
    return Intl.message(
      'From these matching suggestions, you can choose and request a suitable tandem partner. The matches are based on your location and age. Choose the suggestion that suits you best and let your journey together begin!',
      name: 'tandemMatchingOverviewBody1',
      desc: '',
      args: [],
    );
  }

  /// `Unfortunately we could not find any tandems in your area (20km radius)`
  String get tandemMatchingFailure {
    return Intl.message(
      'Unfortunately we could not find any tandems in your area (20km radius)',
      name: 'tandemMatchingFailure',
      desc: '',
      args: [],
    );
  }

  /// `Go to Tandem`
  String get tandemMatchingRouting {
    return Intl.message(
      'Go to Tandem',
      name: 'tandemMatchingRouting',
      desc: '',
      args: [],
    );
  }

  /// `Please have some patience`
  String get tandemMatchingAngefragtTitle {
    return Intl.message(
      'Please have some patience',
      name: 'tandemMatchingAngefragtTitle',
      desc: '',
      args: [],
    );
  }

  /// `It can take up to 24 hours for the match to be approved. You will receive a message by email and in the app as to whether the matching request has been successful. If it didn't work out, you will receive your three new best matches.`
  String get tandemMatchingAngefragtBody {
    return Intl.message(
      'It can take up to 24 hours for the match to be approved. You will receive a message by email and in the app as to whether the matching request has been successful. If it didn\'t work out, you will receive your three new best matches.',
      name: 'tandemMatchingAngefragtBody',
      desc: '',
      args: [],
    );
  }

  /// `Match with Tandem now`
  String get tandemMatchingAngefragtButtonMatching {
    return Intl.message(
      'Match with Tandem now',
      name: 'tandemMatchingAngefragtButtonMatching',
      desc: '',
      args: [],
    );
  }

  /// `Back to the tandem page`
  String get tandemMatchingAngefragtButton {
    return Intl.message(
      'Back to the tandem page',
      name: 'tandemMatchingAngefragtButton',
      desc: '',
      args: [],
    );
  }

  /// `Request as a tandem partner`
  String get tandemMatchingAngefragtButton2 {
    return Intl.message(
      'Request as a tandem partner',
      name: 'tandemMatchingAngefragtButton2',
      desc: '',
      args: [],
    );
  }

  /// `1 | Become a member of our association`
  String get tandemFirstStep {
    return Intl.message(
      '1 | Become a member of our association',
      name: 'tandemFirstStep',
      desc: '',
      args: [],
    );
  }

  /// `Become a member now`
  String get tandemMemberSignin {
    return Intl.message(
      'Become a member now',
      name: 'tandemMemberSignin',
      desc: '',
      args: [],
    );
  }

  /// `Your journey begins by becoming a member with us. Only as a member can you register for tandem matching. This is the first step to becoming part of our growing community.`
  String get tandemFirstStepBody {
    return Intl.message(
      'Your journey begins by becoming a member with us. Only as a member can you register for tandem matching. This is the first step to becoming part of our growing community.',
      name: 'tandemFirstStepBody',
      desc: '',
      args: [],
    );
  }

  /// `2 | The Tandem-\nMatching process:`
  String get tandemSecondStep {
    return Intl.message(
      '2 | The Tandem-\nMatching process:',
      name: 'tandemSecondStep',
      desc: '',
      args: [],
    );
  }

  /// `2 | The tandem matching process:`
  String get tandemSecondStepnoslash {
    return Intl.message(
      '2 | The tandem matching process:',
      name: 'tandemSecondStepnoslash',
      desc: '',
      args: [],
    );
  }

  /// `After you register, you will receive three tandem proposals tailored to you. You have the choice and can select the tandem that best suits your interests and goals. Within 24 hours, you will receive a notification as to whether your tandem partner also agrees. This is the moment when your journey begins.`
  String get tandemSecondStepBody {
    return Intl.message(
      'After you register, you will receive three tandem proposals tailored to you. You have the choice and can select the tandem that best suits your interests and goals. Within 24 hours, you will receive a notification as to whether your tandem partner also agrees. This is the moment when your journey begins.',
      name: 'tandemSecondStepBody',
      desc: '',
      args: [],
    );
  }

  /// `3 | Getting to know each other`
  String get tandemThirdStep {
    return Intl.message(
      '3 | Getting to know each other',
      name: 'tandemThirdStep',
      desc: '',
      args: [],
    );
  }

  /// `Have you been living in Germany for a while and would like to work towards good coexistence for ALL and are interested in cultural exchange? Then you're just right for our tandem project. We are looking for a suitable tandem partner for you who will broaden your cultural horizons and is happy to receive your support in return. In additional monthly group events, you can exchange ideas with other tandems and take part in exciting events.`
  String get tandemThirdStepBody {
    return Intl.message(
      'Have you been living in Germany for a while and would like to work towards good coexistence for ALL and are interested in cultural exchange? Then you\'re just right for our tandem project. We are looking for a suitable tandem partner for you who will broaden your cultural horizons and is happy to receive your support in return. In additional monthly group events, you can exchange ideas with other tandems and take part in exciting events.',
      name: 'tandemThirdStepBody',
      desc: '',
      args: [],
    );
  }

  /// `Join as a newcomer`
  String get tandemThirdStepNewcomer {
    return Intl.message(
      'Join as a newcomer',
      name: 'tandemThirdStepNewcomer',
      desc: '',
      args: [],
    );
  }

  /// `Are you either new to Germany or have you been living in Germany for a while? Are you looking for a friend to exchange ideas with or contact with women who know Germany and your neighbourhood well? Then you've come to the right place! We are looking for a suitable tandem partner for you who will help you to feel at home in Germany. In additional monthly group events, you can exchange ideas with other tandems and take part in exciting events.`
  String get tandemThirdStepBody2 {
    return Intl.message(
      'Are you either new to Germany or have you been living in Germany for a while? Are you looking for a friend to exchange ideas with or contact with women who know Germany and your neighbourhood well? Then you\'ve come to the right place! We are looking for a suitable tandem partner for you who will help you to feel at home in Germany. In additional monthly group events, you can exchange ideas with other tandems and take part in exciting events.',
      name: 'tandemThirdStepBody2',
      desc: '',
      args: [],
    );
  }

  /// `Join as a local:`
  String get tandemThirdStepLocal {
    return Intl.message(
      'Join as a local:',
      name: 'tandemThirdStepLocal',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get tandemReady {
    return Intl.message('Ready', name: 'tandemReady', desc: '', args: []);
  }

  /// `I always have so many questions and Denise always helps me.`
  String get tandemQuotesOne {
    return Intl.message(
      'I always have so many questions and Denise always helps me.',
      name: 'tandemQuotesOne',
      desc: '',
      args: [],
    );
  }

  /// `I learn a lot about cultural differences.`
  String get tandemQuotesTwo {
    return Intl.message(
      'I learn a lot about cultural differences.',
      name: 'tandemQuotesTwo',
      desc: '',
      args: [],
    );
  }

  /// `Join as a Local or as a Newcomer at the Tandem project`
  String get tandemLocalOrNewcomer {
    return Intl.message(
      'Join as a Local or as a Newcomer at the Tandem project',
      name: 'tandemLocalOrNewcomer',
      desc: '',
      args: [],
    );
  }

  /// `The Female Fellows Tandem Project connects women with and without refugee and migration experience.`
  String get tandemSlogan {
    return Intl.message(
      'The Female Fellows Tandem Project connects women with and without refugee and migration experience.',
      name: 'tandemSlogan',
      desc: '',
      args: [],
    );
  }

  /// `The Female Fellows Tandem Project connects women with and without refugee and migration experience. In this voluntary integration project, women with refugee and migration experience are supported, for example, in language acquisition, dealing with authorities, in everyday life and in training and integration into the German labour market. This creates friendships, an exciting exchange between different cultures and lots of fun.`
  String get tandemSloganBody {
    return Intl.message(
      'The Female Fellows Tandem Project connects women with and without refugee and migration experience. In this voluntary integration project, women with refugee and migration experience are supported, for example, in language acquisition, dealing with authorities, in everyday life and in training and integration into the German labour market. This creates friendships, an exciting exchange between different cultures and lots of fun.',
      name: 'tandemSloganBody',
      desc: '',
      args: [],
    );
  }

  /// `Learn more`
  String get getMore {
    return Intl.message('Learn more', name: 'getMore', desc: '', args: []);
  }

  /// `Show less`
  String get getLess {
    return Intl.message('Show less', name: 'getLess', desc: '', args: []);
  }

  /// `How does it work?`
  String get tandemHowDoesItWork {
    return Intl.message(
      'How does it work?',
      name: 'tandemHowDoesItWork',
      desc: '',
      args: [],
    );
  }

  /// `Match with a Tandem now`
  String get tandemMatchNow {
    return Intl.message(
      'Match with a Tandem now',
      name: 'tandemMatchNow',
      desc: '',
      args: [],
    );
  }

  /// `Tandem stories`
  String get tandemStorys {
    return Intl.message(
      'Tandem stories',
      name: 'tandemStorys',
      desc: '',
      args: [],
    );
  }

  /// `Join as a Local at the Tandem project`
  String get tandemMatchLocal {
    return Intl.message(
      'Join as a Local at the Tandem project',
      name: 'tandemMatchLocal',
      desc: '',
      args: [],
    );
  }

  /// `Join as a Newcomer at the Tandem project`
  String get tandemMatchNewcomer {
    return Intl.message(
      'Join as a Newcomer at the Tandem project',
      name: 'tandemMatchNewcomer',
      desc: '',
      args: [],
    );
  }

  /// `1 | What do I have to do to get a tandem partner (German friend)?`
  String get tandemNewComerQuestion1 {
    return Intl.message(
      '1 | What do I have to do to get a tandem partner (German friend)?',
      name: 'tandemNewComerQuestion1',
      desc: '',
      args: [],
    );
  }

  /// `2 | What happens once I have found a Tandem partner?`
  String get tandemNewComerQuestion2 {
    return Intl.message(
      '2 | What happens once I have found a Tandem partner?',
      name: 'tandemNewComerQuestion2',
      desc: '',
      args: [],
    );
  }

  /// `3 | Approximately how much time is involved in a tandem partnership?`
  String get tandemNewComerQuestion3 {
    return Intl.message(
      '3 | Approximately how much time is involved in a tandem partnership?',
      name: 'tandemNewComerQuestion3',
      desc: '',
      args: [],
    );
  }

  /// `4 | I'm looking for a flat, can a Tandem partner help me?`
  String get tandemNewComerQuestion4 {
    return Intl.message(
      '4 | I\'m looking for a flat, can a Tandem partner help me?',
      name: 'tandemNewComerQuestion4',
      desc: '',
      args: [],
    );
  }

  /// `5 | I would like to get my driving licence and then do an apprenticeship, can a tandem partner help me?`
  String get tandemNewComerQuestion5 {
    return Intl.message(
      '5 | I would like to get my driving licence and then do an apprenticeship, can a tandem partner help me?',
      name: 'tandemNewComerQuestion5',
      desc: '',
      args: [],
    );
  }

  /// `6 | I can't speak German very well and I don't speak English either, how can I communicate with a tandem partner?`
  String get tandemNewComerQuestion6 {
    return Intl.message(
      '6 | I can\'t speak German very well and I don\'t speak English either, how can I communicate with a tandem partner?',
      name: 'tandemNewComerQuestion6',
      desc: '',
      args: [],
    );
  }

  /// `7 | I find it difficult to get around in Germany (authorities, doctor...?), can a tandem partner help me?`
  String get tandemNewComerQuestion7 {
    return Intl.message(
      '7 | I find it difficult to get around in Germany (authorities, doctor...?), can a tandem partner help me?',
      name: 'tandemNewComerQuestion7',
      desc: '',
      args: [],
    );
  }

  /// `8 | How can the tandem partner help me?`
  String get tandemNewComerQuestion8 {
    return Intl.message(
      '8 | How can the tandem partner help me?',
      name: 'tandemNewComerQuestion8',
      desc: '',
      args: [],
    );
  }

  /// `9 | My tandem partner is no longer contacting me. What should I do?`
  String get tandemNewComerQuestion9 {
    return Intl.message(
      '9 | My tandem partner is no longer contacting me. What should I do?',
      name: 'tandemNewComerQuestion9',
      desc: '',
      args: [],
    );
  }

  /// `The first step is to register: You can register either in Stuttgart, Bietigheim-Bissingen or Tübingen. In the next step, we will look for a suitable tandem partner for you. We usually look for people of a similar age and - if possible - close to where you live. Once a Tandem partner has been found, we will contact you. Finding a tandem partner can take some time, so patience is required. We will of course endeavour to find a suitable Tandem partner for you as quickly as possible.`
  String get tandemNewComerAnswer1 {
    return Intl.message(
      'The first step is to register: You can register either in Stuttgart, Bietigheim-Bissingen or Tübingen. In the next step, we will look for a suitable tandem partner for you. We usually look for people of a similar age and - if possible - close to where you live. Once a Tandem partner has been found, we will contact you. Finding a tandem partner can take some time, so patience is required. We will of course endeavour to find a suitable Tandem partner for you as quickly as possible.',
      name: 'tandemNewComerAnswer1',
      desc: '',
      args: [],
    );
  }

  /// `You can decide that together. At your first meeting, talk about what you hope to gain from your tandem. Be it learning the German language, exchanging cultural ideas or getting to know your new surroundings better. State your wishes clearly so that your partner can respond to them. Another important question is: What can you show her? For example, are you particularly good at cooking? Think together about how you would like to organise the exchange - whether with regular walks, over dinner or in the library. It is important that it is clear to both of you from the start. Our Welcome KIT, which you will receive as soon as you have been matched, offers you initial assistance. You can find further suggestions here on the website.`
  String get tandemNewComerAnswer2 {
    return Intl.message(
      'You can decide that together. At your first meeting, talk about what you hope to gain from your tandem. Be it learning the German language, exchanging cultural ideas or getting to know your new surroundings better. State your wishes clearly so that your partner can respond to them. Another important question is: What can you show her? For example, are you particularly good at cooking? Think together about how you would like to organise the exchange - whether with regular walks, over dinner or in the library. It is important that it is clear to both of you from the start. Our Welcome KIT, which you will receive as soon as you have been matched, offers you initial assistance. You can find further suggestions here on the website.',
      name: 'tandemNewComerAnswer2',
      desc: '',
      args: [],
    );
  }

  /// `That depends a bit on what you agree with your partner. First and foremost, the tandem should be fun and you should look forward to the meetings. So talk about what you want from the tandem at the start of your partnership and set yourselves goals. Our recommendation is to spend about an hour together once a week. If this doesn't fit into your schedule, arrange other dates. That's not a problem as long as you talk about it and it's okay for both of you.`
  String get tandemNewComerAnswer3 {
    return Intl.message(
      'That depends a bit on what you agree with your partner. First and foremost, the tandem should be fun and you should look forward to the meetings. So talk about what you want from the tandem at the start of your partnership and set yourselves goals. Our recommendation is to spend about an hour together once a week. If this doesn\'t fit into your schedule, arrange other dates. That\'s not a problem as long as you talk about it and it\'s okay for both of you.',
      name: 'tandemNewComerAnswer3',
      desc: '',
      args: [],
    );
  }

  /// `In principle, this is possible if your tandem partner is willing. We highly recommend that you set out your expectations at the start of your tandem partnership so that both parties know what to expect. You can also specify what you would like your tandem partner to do when you sign up under: What would you like to do with your tandem partner?`
  String get tandemNewComerAnswer4 {
    return Intl.message(
      'In principle, this is possible if your tandem partner is willing. We highly recommend that you set out your expectations at the start of your tandem partnership so that both parties know what to expect. You can also specify what you would like your tandem partner to do when you sign up under: What would you like to do with your tandem partner?',
      name: 'tandemNewComerAnswer4',
      desc: '',
      args: [],
    );
  }

  /// `We are happy for you to set goals. However, please discuss in advance with your tandem partner how much time and inclination she has to support you in your learning. Please note that everything our members do is voluntary, they are not paid for it and spend their free time with you.`
  String get tandemNewComerAnswer5 {
    return Intl.message(
      'We are happy for you to set goals. However, please discuss in advance with your tandem partner how much time and inclination she has to support you in your learning. Please note that everything our members do is voluntary, they are not paid for it and spend their free time with you.',
      name: 'tandemNewComerAnswer5',
      desc: '',
      args: [],
    );
  }

  /// `Our experience so far has shown that solutions can always be found for initial language barriers - you can still cook or go for a walk, for example. There are also always women at our events who are happy to translate. Simply ask them directly if they can help you translate. You can also find more tips on dealing with language challenges here.`
  String get tandemNewComerAnswer6 {
    return Intl.message(
      'Our experience so far has shown that solutions can always be found for initial language barriers - you can still cook or go for a walk, for example. There are also always women at our events who are happy to translate. Simply ask them directly if they can help you translate. You can also find more tips on dealing with language challenges here.',
      name: 'tandemNewComerAnswer6',
      desc: '',
      args: [],
    );
  }

  /// `In principle, this is possible if your tandem partner is willing. We highly recommend that you clarify your expectations at the start of your tandem partnership so that both parties know what to expect. You can also specify what you would like your tandem partner to do when you sign up under ‘What would you like to do with your tandem partner?`
  String get tandemNewComerAnswer7 {
    return Intl.message(
      'In principle, this is possible if your tandem partner is willing. We highly recommend that you clarify your expectations at the start of your tandem partnership so that both parties know what to expect. You can also specify what you would like your tandem partner to do when you sign up under ‘What would you like to do with your tandem partner?',
      name: 'tandemNewComerAnswer7',
      desc: '',
      args: [],
    );
  }

  /// `It is important to us that both sides benefit from our tandems and learn from each other. When you get to know each other, talk directly about what you need help with and what you are good at, for example.`
  String get tandemNewComerAnswer8 {
    return Intl.message(
      'It is important to us that both sides benefit from our tandems and learn from each other. When you get to know each other, talk directly about what you need help with and what you are good at, for example.',
      name: 'tandemNewComerAnswer8',
      desc: '',
      args: [],
    );
  }

  /// `It's no big deal if you realise after one or two meetings that you're not really compatible. The important thing is that you talk about it. If you don't want to talk to each other about it, feel free to contact us. We will be happy to mediate between the two parties and put you back on the ‘tandem seekers’ list. Even if you've already met several times and no longer have the time, let us know so that we can look after your partner.`
  String get tandemNewComerAnswer9 {
    return Intl.message(
      'It\'s no big deal if you realise after one or two meetings that you\'re not really compatible. The important thing is that you talk about it. If you don\'t want to talk to each other about it, feel free to contact us. We will be happy to mediate between the two parties and put you back on the ‘tandem seekers’ list. Even if you\'ve already met several times and no longer have the time, let us know so that we can look after your partner.',
      name: 'tandemNewComerAnswer9',
      desc: '',
      args: [],
    );
  }

  /// `1 | What do I have to do to get a tandem partner?`
  String get tandemLocalsQuestion1 {
    return Intl.message(
      '1 | What do I have to do to get a tandem partner?',
      name: 'tandemLocalsQuestion1',
      desc: '',
      args: [],
    );
  }

  /// `2 | A tandem project sounds quite simple, uncomplicated and flexible in terms of time management. That would be something I could easily do alongside my job. Is that true?`
  String get tandemLocalsQuestion2 {
    return Intl.message(
      '2 | A tandem project sounds quite simple, uncomplicated and flexible in terms of time management. That would be something I could easily do alongside my job. Is that true?',
      name: 'tandemLocalsQuestion2',
      desc: '',
      args: [],
    );
  }

  /// `3 | What happens once I've found a tandem partner?`
  String get tandemLocalsQuestion3 {
    return Intl.message(
      '3 | What happens once I\'ve found a tandem partner?',
      name: 'tandemLocalsQuestion3',
      desc: '',
      args: [],
    );
  }

  /// `4 | What good am I doing? Does it do any good? What are the effects of my commitment?`
  String get tandemLocalsQuestion4 {
    return Intl.message(
      '4 | What good am I doing? Does it do any good? What are the effects of my commitment?',
      name: 'tandemLocalsQuestion4',
      desc: '',
      args: [],
    );
  }

  /// `5 | My tandem partner no longer contacts me, what should I do?`
  String get tandemLocalsQuestion5 {
    return Intl.message(
      '5 | My tandem partner no longer contacts me, what should I do?',
      name: 'tandemLocalsQuestion5',
      desc: '',
      args: [],
    );
  }

  /// `6 | I'm moving. What happens to my tandem partnership?`
  String get tandemLocalsQuestion6 {
    return Intl.message(
      '6 | I\'m moving. What happens to my tandem partnership?',
      name: 'tandemLocalsQuestion6',
      desc: '',
      args: [],
    );
  }

  /// `7 | My tandem partner and I are not a good match. What should I do?`
  String get tandemLocalsQuestion7 {
    return Intl.message(
      '7 | My tandem partner and I are not a good match. What should I do?',
      name: 'tandemLocalsQuestion7',
      desc: '',
      args: [],
    );
  }

  /// `8 | Where does the donation money go at Female Fellows?`
  String get tandemLocalsQuestion8 {
    return Intl.message(
      '8 | Where does the donation money go at Female Fellows?',
      name: 'tandemLocalsQuestion8',
      desc: '',
      args: [],
    );
  }

  /// `9 | What has Female Fellows been able to achieve with donations so far?`
  String get tandemLocalsQuestion9 {
    return Intl.message(
      '9 | What has Female Fellows been able to achieve with donations so far?',
      name: 'tandemLocalsQuestion9',
      desc: '',
      args: [],
    );
  }

  /// `10 | Where should donations be invested in the future?`
  String get tandemLocalsQuestion10 {
    return Intl.message(
      '10 | Where should donations be invested in the future?',
      name: 'tandemLocalsQuestion10',
      desc: '',
      args: [],
    );
  }

  /// `11 | I need a donation receipt. Where can I get one?`
  String get tandemLocalsQuestion11 {
    return Intl.message(
      '11 | I need a donation receipt. Where can I get one?',
      name: 'tandemLocalsQuestion11',
      desc: '',
      args: [],
    );
  }

  /// `The first step is to register: You can register in either Stuttgart, Bietigheim-Bissingen or Tübingen. In the next step, we will look for a suitable tandem partner for you. We usually look for people of a similar age and - if possible - close to where you live. Once a Tandem partner has been found, we will contact you. Finding a tandem partner can take some time, so patience is required. We will of course endeavour to find a suitable Tandem partner for you as quickly as possible.`
  String get tandemLocalsAnswer1 {
    return Intl.message(
      'The first step is to register: You can register in either Stuttgart, Bietigheim-Bissingen or Tübingen. In the next step, we will look for a suitable tandem partner for you. We usually look for people of a similar age and - if possible - close to where you live. Once a Tandem partner has been found, we will contact you. Finding a tandem partner can take some time, so patience is required. We will of course endeavour to find a suitable Tandem partner for you as quickly as possible.',
      name: 'tandemLocalsAnswer1',
      desc: '',
      args: [],
    );
  }

  /// `That depends a bit on what you agree with your partner. But first and foremost, the tandem should be fun and you should look forward to the meetings. So talk about what you want from the tandem at the beginning and set yourselves goals. Our recommendation is to spend an hour together once a week. If that doesn't fit into your schedule, arrange other dates, that's not a problem as long as you talk about it.`
  String get tandemLocalsAnswer2 {
    return Intl.message(
      'That depends a bit on what you agree with your partner. But first and foremost, the tandem should be fun and you should look forward to the meetings. So talk about what you want from the tandem at the beginning and set yourselves goals. Our recommendation is to spend an hour together once a week. If that doesn\'t fit into your schedule, arrange other dates, that\'s not a problem as long as you talk about it.',
      name: 'tandemLocalsAnswer2',
      desc: '',
      args: [],
    );
  }

  /// `You can decide that together. At your first meeting, talk about what you hope to gain from your tandem. Be it learning the German language, exchanging cultural ideas or getting to know your new surroundings better. State your wishes clearly so that your partner can respond to them. Another important question is: What can you show her? For example, are you particularly good at cooking? Think together about how you would like to organise the exchange - whether with regular walks, over dinner or in the library. It is important that it is clear to both of you from the start. Our Welcome KIT, which you will receive as soon as you have been matched, offers you initial assistance. You can find further suggestions here on the website.`
  String get tandemLocalsAnswer3 {
    return Intl.message(
      'You can decide that together. At your first meeting, talk about what you hope to gain from your tandem. Be it learning the German language, exchanging cultural ideas or getting to know your new surroundings better. State your wishes clearly so that your partner can respond to them. Another important question is: What can you show her? For example, are you particularly good at cooking? Think together about how you would like to organise the exchange - whether with regular walks, over dinner or in the library. It is important that it is clear to both of you from the start. Our Welcome KIT, which you will receive as soon as you have been matched, offers you initial assistance. You can find further suggestions here on the website.',
      name: 'tandemLocalsAnswer3',
      desc: '',
      args: [],
    );
  }

  /// `According to a recent OECD study, female refugees are less well integrated into German society. The reason for this is the low level of participation in integration programmes and little contact with locals. Only 12% of refugee women have daily contact with Germans. Female Fellows aims to counteract this and take a big (first) step towards successful coexistence. It is about utilising the potential of women, empowering and encouraging them. This form of support contributes to an open and reflective society that embraces its diversity and discovers the potential for further development and co-creation. As a tandem partner, you could make an important contribution to these goals. In addition, you will broaden your personal horizons and perhaps not only get to know your own city better through joint activities, but also exciting other cultures and, above all, many interesting people.`
  String get tandemLocalsAnswer4 {
    return Intl.message(
      'According to a recent OECD study, female refugees are less well integrated into German society. The reason for this is the low level of participation in integration programmes and little contact with locals. Only 12% of refugee women have daily contact with Germans. Female Fellows aims to counteract this and take a big (first) step towards successful coexistence. It is about utilising the potential of women, empowering and encouraging them. This form of support contributes to an open and reflective society that embraces its diversity and discovers the potential for further development and co-creation. As a tandem partner, you could make an important contribution to these goals. In addition, you will broaden your personal horizons and perhaps not only get to know your own city better through joint activities, but also exciting other cultures and, above all, many interesting people.',
      name: 'tandemLocalsAnswer4',
      desc: '',
      args: [],
    );
  }

  /// `If your partner no longer responds to your calls or messages, please let us know. We'll then try to find out what's going on and mediate between you. Sometimes it's due to a lack of internet in the accommodation, sometimes she doesn't have the courage to end the tandem. In any case, we want to talk to you about it and give you the best possible support in your tandem.`
  String get tandemLocalsAnswer5 {
    return Intl.message(
      'If your partner no longer responds to your calls or messages, please let us know. We\'ll then try to find out what\'s going on and mediate between you. Sometimes it\'s due to a lack of internet in the accommodation, sometimes she doesn\'t have the courage to end the tandem. In any case, we want to talk to you about it and give you the best possible support in your tandem.',
      name: 'tandemLocalsAnswer5',
      desc: '',
      args: [],
    );
  }

  /// `Here too, it is important that you talk to both your partner and us about this. We will be happy to make sure that your partner finds a new tandem partner. Perhaps you have a friend who would like to take over the tandem?`
  String get tandemLocalsAnswer6 {
    return Intl.message(
      'Here too, it is important that you talk to both your partner and us about this. We will be happy to make sure that your partner finds a new tandem partner. Perhaps you have a friend who would like to take over the tandem?',
      name: 'tandemLocalsAnswer6',
      desc: '',
      args: [],
    );
  }

  /// `It's no problem at all if you realise after one or two meetings that it's not working out between you. The important thing is that you talk about it. If you don't want to talk to each other about it, please contact us and we will mediate between the two parties and put you back on the ‘tandem seekers’ register. Also let us know if you've already met several times but no longer have time so that we can take care of your partner.`
  String get tandemLocalsAnswer7 {
    return Intl.message(
      'It\'s no problem at all if you realise after one or two meetings that it\'s not working out between you. The important thing is that you talk about it. If you don\'t want to talk to each other about it, please contact us and we will mediate between the two parties and put you back on the ‘tandem seekers’ register. Also let us know if you\'ve already met several times but no longer have time so that we can take care of your partner.',
      name: 'tandemLocalsAnswer7',
      desc: '',
      args: [],
    );
  }

  /// `Most of the donations go directly to the tandem project. Events and workshops are then organised there, administrative processes such as tandem matching are made possible, contact persons for the tandems as well as locals and newcomers are acquired, networking with social institutions and social workers is established and much more.`
  String get tandemLocalsAnswer8 {
    return Intl.message(
      'Most of the donations go directly to the tandem project. Events and workshops are then organised there, administrative processes such as tandem matching are made possible, contact persons for the tandems as well as locals and newcomers are acquired, networking with social institutions and social workers is established and much more.',
      name: 'tandemLocalsAnswer8',
      desc: '',
      args: [],
    );
  }

  /// `The 2019 crowdfunding campaign, for example, made it possible to finance a 25% staff position for tandem matchers as well as the project costs in Stuttgart from July 2019 to July 2020. You can find more information about cooperation partners and donations and how they are used here. donations to date have also made a significant contribution to the fact that we have been able to bring together a total of 122 tandems (which corresponds to 244 women in total) and that great events can be organised and held again and again.`
  String get tandemLocalsAnswer9 {
    return Intl.message(
      'The 2019 crowdfunding campaign, for example, made it possible to finance a 25% staff position for tandem matchers as well as the project costs in Stuttgart from July 2019 to July 2020. You can find more information about cooperation partners and donations and how they are used here. donations to date have also made a significant contribution to the fact that we have been able to bring together a total of 122 tandems (which corresponds to 244 women in total) and that great events can be organised and held again and again.',
      name: 'tandemLocalsAnswer9',
      desc: '',
      args: [],
    );
  }

  /// `In the long term, we are aiming to finance an integration management centre in Stuttgart as well as permanent staff positions in Stuttgart, Bietigheim-Bissingen and Tübingen. We are also working on scaling up the Tandem project in Germany in general. We would also like to facilitate the integration of newcomers (women with a migration background) into the organisation team. Money is also needed for the DRC project (film project about Afghan women). Other projects such as workshops on Self-Reliance or Starting a career in Germany are also being planned.`
  String get tandemLocalsAnswer10 {
    return Intl.message(
      'In the long term, we are aiming to finance an integration management centre in Stuttgart as well as permanent staff positions in Stuttgart, Bietigheim-Bissingen and Tübingen. We are also working on scaling up the Tandem project in Germany in general. We would also like to facilitate the integration of newcomers (women with a migration background) into the organisation team. Money is also needed for the DRC project (film project about Afghan women). Other projects such as workshops on Self-Reliance or Starting a career in Germany are also being planned.',
      name: 'tandemLocalsAnswer10',
      desc: '',
      args: [],
    );
  }

  /// `For a donation receipt, simply contact us at: j.derbas@femalefellows.com`
  String get tandemLocalsAnswer11 {
    return Intl.message(
      'For a donation receipt, simply contact us at: j.derbas@femalefellows.com',
      name: 'tandemLocalsAnswer11',
      desc: '',
      args: [],
    );
  }

  /// `FRIENDSHIP AT FIRST SIGHT`
  String get tandemStory2Title {
    return Intl.message(
      'FRIENDSHIP AT FIRST SIGHT',
      name: 'tandemStory2Title',
      desc: '',
      args: [],
    );
  }

  /// `It's a pretty cold October day when Jana and I meet up with Yasna and Franziska. It's too noisy in the café, so we decide to go outside for the interview.\n It's already pretty chilly, but wrapped up warm and with tea and hot chocolate, Jana and I set about getting to know one of our tandems better. \nFranziska and Yasna tell me that their first meeting was really nice. They both went for a walk to get to know each other better.  \nWhen I ask the two women how much has changed since they last met, they tell me that a lot has happened. They both wondered whether they would fit together despite their different cultures.  But as they got to know each other better, these doubts quickly disappeared. \nYasna is originally from Afghanistan and lives in Germany with her brother and parents. Her great passion is dancing, which she continues to pursue in Stuttgart. At first, she was still very shy and reserved due to the different culture that Germany offers as a native Afghan.`
  String get tandemStory2Body {
    return Intl.message(
      'It\'s a pretty cold October day when Jana and I meet up with Yasna and Franziska. It\'s too noisy in the café, so we decide to go outside for the interview.\n It\'s already pretty chilly, but wrapped up warm and with tea and hot chocolate, Jana and I set about getting to know one of our tandems better. \nFranziska and Yasna tell me that their first meeting was really nice. They both went for a walk to get to know each other better.  \nWhen I ask the two women how much has changed since they last met, they tell me that a lot has happened. They both wondered whether they would fit together despite their different cultures.  But as they got to know each other better, these doubts quickly disappeared. \nYasna is originally from Afghanistan and lives in Germany with her brother and parents. Her great passion is dancing, which she continues to pursue in Stuttgart. At first, she was still very shy and reserved due to the different culture that Germany offers as a native Afghan.',
      name: 'tandemStory2Body',
      desc: '',
      args: [],
    );
  }

  /// `Franziska has only recently moved back to Stuttgart, she tells us that she moved here for the job and wanted to do something for women in particular. She came across Female Fellows on the internet. When I asked Franziska what she liked about Yasna, she told us that she admired Yasna for her strength and for what she had already achieved in her young life. Yasna smiled with emotion and then Yasna and Franziska gave us an insight into their meetings together and the problems they often encounter.\nYasna lived in shared accommodation with her parents for a long time and had no place to retreat to. Fortunately, things have changed now that she has her own flat, which she is very happy about. However, she had no internet there as she lived in the basement and had no reception. She really wishes she had the internet, because it would make it easier for her to communicate with her friends and relatives from Afghanistan and, of course, with her parents.`
  String get tandemStory2Body1 {
    return Intl.message(
      'Franziska has only recently moved back to Stuttgart, she tells us that she moved here for the job and wanted to do something for women in particular. She came across Female Fellows on the internet. When I asked Franziska what she liked about Yasna, she told us that she admired Yasna for her strength and for what she had already achieved in her young life. Yasna smiled with emotion and then Yasna and Franziska gave us an insight into their meetings together and the problems they often encounter.\nYasna lived in shared accommodation with her parents for a long time and had no place to retreat to. Fortunately, things have changed now that she has her own flat, which she is very happy about. However, she had no internet there as she lived in the basement and had no reception. She really wishes she had the internet, because it would make it easier for her to communicate with her friends and relatives from Afghanistan and, of course, with her parents.',
      name: 'tandemStory2Body1',
      desc: '',
      args: [],
    );
  }

  /// `Not only for this reason, but also for her German course, she often needs better internet than her mobile internet allows. She often has to look up words or would like to watch videos to help her learn German. Yasna is currently doing another German course and would very much like to do an apprenticeship later on. \nFranziska helps her to find an affordable internet provider, but it is not very easy. Both would like more support. \nI won't soon forget the atmosphere that this intimate conversation created. You can tell that Yasna and Franziska have grown very fond of each other and that they are both very happy to have met.\n Both women really enjoy meeting each other. All in all, it was a very nice meeting, Jana and I are already looking forward to seeing who we can meet next.`
  String get tandemStory2Body2 {
    return Intl.message(
      'Not only for this reason, but also for her German course, she often needs better internet than her mobile internet allows. She often has to look up words or would like to watch videos to help her learn German. Yasna is currently doing another German course and would very much like to do an apprenticeship later on. \nFranziska helps her to find an affordable internet provider, but it is not very easy. Both would like more support. \nI won\'t soon forget the atmosphere that this intimate conversation created. You can tell that Yasna and Franziska have grown very fond of each other and that they are both very happy to have met.\n Both women really enjoy meeting each other. All in all, it was a very nice meeting, Jana and I are already looking forward to seeing who we can meet next.',
      name: 'tandemStory2Body2',
      desc: '',
      args: [],
    );
  }

  /// `Zouzan and Sandra met at the beginning of the year. They were matched back in March, but were only able to meet in person in July due to the lockdown. They spent their first meeting on a bike tour 🚲through Bietigheim-Bissingen to get to know their city 🌃 a little better. It was one of their favourite meetings, according to both of them. Unfortunately, they don't see each other that often at the moment due to the corona crisis, but they still chat regularly to keep in touch.`
  String get tandemStory3Body1 {
    return Intl.message(
      'Zouzan and Sandra met at the beginning of the year. They were matched back in March, but were only able to meet in person in July due to the lockdown. They spent their first meeting on a bike tour 🚲through Bietigheim-Bissingen to get to know their city 🌃 a little better. It was one of their favourite meetings, according to both of them. Unfortunately, they don\'t see each other that often at the moment due to the corona crisis, but they still chat regularly to keep in touch.',
      name: 'tandemStory3Body1',
      desc: '',
      args: [],
    );
  }

  /// `Sandra tells us that it was only through the tandem project that she realised how many hurdles people who come to Germany 🇩🇪 have to overcome. She is always amazed at how well Zouzan copes with everyday life in Germany. They also enjoy cooking 🥘 together and get to know each other and each other's culture better as a result. Sandra says that Zouzan is a power woman 🦹‍♀️sei. Zouzan also learns German in the evenings and is currently doing an internship in a care home. Zouzan is alone in Germany and is happy to have Sandra by her side. When we ask both of them what they like most about their tandem partner, Zouzan replies that she has made a very good friend as a result. Sandra agrees with a smile.`
  String get tandemStory3Body2 {
    return Intl.message(
      'Sandra tells us that it was only through the tandem project that she realised how many hurdles people who come to Germany 🇩🇪 have to overcome. She is always amazed at how well Zouzan copes with everyday life in Germany. They also enjoy cooking 🥘 together and get to know each other and each other\'s culture better as a result. Sandra says that Zouzan is a power woman 🦹‍♀️sei. Zouzan also learns German in the evenings and is currently doing an internship in a care home. Zouzan is alone in Germany and is happy to have Sandra by her side. When we ask both of them what they like most about their tandem partner, Zouzan replies that she has made a very good friend as a result. Sandra agrees with a smile.',
      name: 'tandemStory3Body2',
      desc: '',
      args: [],
    );
  }

  /// `Your Tandem`
  String get tandemAftermatchedTitle {
    return Intl.message(
      'Your Tandem',
      name: 'tandemAftermatchedTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can do this together`
  String get tandemAftermatchedActivities {
    return Intl.message(
      'You can do this together',
      name: 'tandemAftermatchedActivities',
      desc: '',
      args: [],
    );
  }

  /// `You are welcome to drop by`
  String get tandemAftermatchedActivities2 {
    return Intl.message(
      'You are welcome to drop by',
      name: 'tandemAftermatchedActivities2',
      desc: '',
      args: [],
    );
  }

  /// `Events that you have both agreed to attend`
  String get tandemAftermatchedEvents {
    return Intl.message(
      'Events that you have both agreed to attend',
      name: 'tandemAftermatchedEvents',
      desc: '',
      args: [],
    );
  }

  /// `Important points of contact`
  String get tandemAftermatchedCheckpoints {
    return Intl.message(
      'Important points of contact',
      name: 'tandemAftermatchedCheckpoints',
      desc: '',
      args: [],
    );
  }

  /// `What can you do together as a tandem?`
  String get tandemActivitiesTitle {
    return Intl.message(
      'What can you do together as a tandem?',
      name: 'tandemActivitiesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Going to a café`
  String get tandemActivityOneTitle {
    return Intl.message(
      'Going to a café',
      name: 'tandemActivityOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `Many of our tandems like to go to cafés to chat, learn German or simply to exchange ideas. here is a small list of cool cafés:`
  String get tandemActivityOneBody {
    return Intl.message(
      'Many of our tandems like to go to cafés to chat, learn German or simply to exchange ideas. here is a small list of cool cafés:',
      name: 'tandemActivityOneBody',
      desc: '',
      args: [],
    );
  }

  /// `Picnic`
  String get tandemActivityTwoTitle {
    return Intl.message(
      'Picnic',
      name: 'tandemActivityTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `There's nothing like a picnic with your tandem partner. Find out here what you need for it.\n\nThe best locations in Stuttgart:\n1 | Max-Eyth-See:\nThe Max-Eyth-See is our favourite place for a picnic. Whether it's a barbecue, sporting activities, boating on the lake or just sitting together in a cosy atmosphere...\n2 | Schlossgarten\nThe Schlossgarten is the most central park to meet up for a picnic. You can also grab a quick coffee and snacks from the city and then sit comfortably in the park.\n3 | Teehaus\nOne of the most beautiful viewpoints over Stuttgart.\n4 | Santiago de Chile Platz\nPicnic with a view over Stuttgart. However, often very crowded and no green space.\n`
  String get tandemActivityTwoBody {
    return Intl.message(
      'There\'s nothing like a picnic with your tandem partner. Find out here what you need for it.\n\nThe best locations in Stuttgart:\n1 | Max-Eyth-See:\nThe Max-Eyth-See is our favourite place for a picnic. Whether it\'s a barbecue, sporting activities, boating on the lake or just sitting together in a cosy atmosphere...\n2 | Schlossgarten\nThe Schlossgarten is the most central park to meet up for a picnic. You can also grab a quick coffee and snacks from the city and then sit comfortably in the park.\n3 | Teehaus\nOne of the most beautiful viewpoints over Stuttgart.\n4 | Santiago de Chile Platz\nPicnic with a view over Stuttgart. However, often very crowded and no green space.\n',
      name: 'tandemActivityTwoBody',
      desc: '',
      args: [],
    );
  }

  /// `The best locations in Bietigheim-Bissingen:\n 1 | Stadtgarten Bietigheim\nBeautifully manicured green spaces between flower gardens and the River Enz. You can always find a place to relax and picnic here. If you want to get active, you can enjoy outdoor activities here. Whether it's a game of badminton, Viking chess, dancing or yoga - the beautiful park in Bietigheim offers the ideal opportunity. If you prefer to let off steam on the water, you can hire a kayak or SUP from the Zugvögel hire centre at Holzgartenstraße 18, 74321 Bietigheim-Bissingen and enjoy the cool water,`
  String get tandemActivityTwoBody2 {
    return Intl.message(
      'The best locations in Bietigheim-Bissingen:\n 1 | Stadtgarten Bietigheim\nBeautifully manicured green spaces between flower gardens and the River Enz. You can always find a place to relax and picnic here. If you want to get active, you can enjoy outdoor activities here. Whether it\'s a game of badminton, Viking chess, dancing or yoga - the beautiful park in Bietigheim offers the ideal opportunity. If you prefer to let off steam on the water, you can hire a kayak or SUP from the Zugvögel hire centre at Holzgartenstraße 18, 74321 Bietigheim-Bissingen and enjoy the cool water,',
      name: 'tandemActivityTwoBody2',
      desc: '',
      args: [],
    );
  }

  /// `The best locations in Tübingen:\n1 | Old Botanical Garden (‘Bota’)\nThe Bota is the place to be, especially in summer. Whether it's just for a cosy picnic, slacklining, playing frisbee or Viking chess - there's always something going on.\nWhat to bring along:\n1 | Games for sports\nWhether badminton, volleyball, table tennis or boul: exercise in the fresh air is good for everyone!\n2 | Music box \nNothing stands in the way of dancing together or discussing the latest favourite music! \n3 | Picnic blanket\n4 | Cutlery\nTakeaway snacks:\n1 | Tabule:\nThis delicious salad with fresh parsley is a refreshing treat, especially on hot days!\n2 | Pizza or puff pastry pockets:\nPizza and puff pastry pockets are particularly handy. Forgotten your cutlery? No problem!\n3 | Vegetables or (homemade) bread with dips:\nYoghurt, herbs, spices and feta, for example, can be used to conjure up a delicious, refreshing dip. Just chop up some bread or vegetables and you've got yourself a snack!`
  String get tandemActivityTwoBody3 {
    return Intl.message(
      'The best locations in Tübingen:\n1 | Old Botanical Garden (‘Bota’)\nThe Bota is the place to be, especially in summer. Whether it\'s just for a cosy picnic, slacklining, playing frisbee or Viking chess - there\'s always something going on.\nWhat to bring along:\n1 | Games for sports\nWhether badminton, volleyball, table tennis or boul: exercise in the fresh air is good for everyone!\n2 | Music box \nNothing stands in the way of dancing together or discussing the latest favourite music! \n3 | Picnic blanket\n4 | Cutlery\nTakeaway snacks:\n1 | Tabule:\nThis delicious salad with fresh parsley is a refreshing treat, especially on hot days!\n2 | Pizza or puff pastry pockets:\nPizza and puff pastry pockets are particularly handy. Forgotten your cutlery? No problem!\n3 | Vegetables or (homemade) bread with dips:\nYoghurt, herbs, spices and feta, for example, can be used to conjure up a delicious, refreshing dip. Just chop up some bread or vegetables and you\'ve got yourself a snack!',
      name: 'tandemActivityTwoBody3',
      desc: '',
      args: [],
    );
  }

  /// `2 You can find more beautiful places and excursion destinations for a picnic in the ‘Off to the countryside’ section. Have you discovered other great spots for picnics with your tandem partner or would you like to recommend recipes, ideas for games or similar? Send us an e-mail to info@femalefellows.com (a ref= mailto:infor@femalefellows.com) with the subject Picnicking`
  String get tandemActivityTwoBody4 {
    return Intl.message(
      '2 You can find more beautiful places and excursion destinations for a picnic in the ‘Off to the countryside’ section. Have you discovered other great spots for picnics with your tandem partner or would you like to recommend recipes, ideas for games or similar? Send us an e-mail to info@femalefellows.com (a ref= mailto:infor@femalefellows.com) with the subject Picnicking',
      name: 'tandemActivityTwoBody4',
      desc: '',
      args: [],
    );
  }

  /// `Make music`
  String get tandemActivityThreeTitle {
    return Intl.message(
      'Make music',
      name: 'tandemActivityThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `You play an instrument or can sing? Then share this passion with your tandem partner and/or connect with our FF musicians.\n\n1 | Start singing/playing\nThere are numerous playbacks and tutorials on YouTube that you can use to try out what your voice has to offer and what you feel like doing. The same applies to instruments, of course, if you have a guitar, for example. If one of you can already play an instrument, you can also show each other tips on how to learn it or simply sing or play songs together,`
  String get tandemActivityThreeBody {
    return Intl.message(
      'You play an instrument or can sing? Then share this passion with your tandem partner and/or connect with our FF musicians.\n\n1 | Start singing/playing\nThere are numerous playbacks and tutorials on YouTube that you can use to try out what your voice has to offer and what you feel like doing. The same applies to instruments, of course, if you have a guitar, for example. If one of you can already play an instrument, you can also show each other tips on how to learn it or simply sing or play songs together,',
      name: 'tandemActivityThreeBody',
      desc: '',
      args: [],
    );
  }

  /// `<p>2 | {chor}\n<span>h You like singing and would like to get a taste of choir life from time to time? Find out about the programmes at</span> {musikwerk} Stuttgart.\nThe {laboratorium}in Stuttgart East regularly organises open singing, information and dates can be found at.\nNon-binding and for everyone: the Ich-kann-nicht-singen-Chor.\n... also a fun group and perfect for spontaneous activities: {kneipchor}\n</p>`
  String tandemActivityThreeBody2(
    Object chor,
    Object laboratorium,
    Object musikwerk,
    Object kneipchor,
  ) {
    return Intl.message(
      '<p>2 | $chor\n<span>h You like singing and would like to get a taste of choir life from time to time? Find out about the programmes at</span> $musikwerk Stuttgart.\nThe ${laboratorium}in Stuttgart East regularly organises open singing, information and dates can be found at.\nNon-binding and for everyone: the Ich-kann-nicht-singen-Chor.\n... also a fun group and perfect for spontaneous activities: $kneipchor\n</p>',
      name: 'tandemActivityThreeBody2',
      desc: '',
      args: [chor, laboratorium, musikwerk, kneipchor],
    );
  }

  /// `3 | Listening to music together and exchanging tastes\nOn rainy days, but also during a picnic or walk together, you can exchange ideas about what music you like instead of a film or cooking evening. Maybe you'll come across some new music together that you both like\nInspiration from the review\nCozy get-together in Bietigheim-Bissingen\nIn September 2019, project coordinator Masooma Torfa organised a get-together for anyone interested in the Tandem project. Fatima enchanted us with her wonderful voice over delicious sweet treats./nYou play an instrument or can sing? Would you like to connect with other FF musicians? Would you like to recommend other ideas for making music? Or offer a music workshop? Then send us an e-mail to info@femalefellows.com with the subject ‘Making music`
  String get tandemActivityThreeBody3 {
    return Intl.message(
      '3 | Listening to music together and exchanging tastes\nOn rainy days, but also during a picnic or walk together, you can exchange ideas about what music you like instead of a film or cooking evening. Maybe you\'ll come across some new music together that you both like\nInspiration from the review\nCozy get-together in Bietigheim-Bissingen\nIn September 2019, project coordinator Masooma Torfa organised a get-together for anyone interested in the Tandem project. Fatima enchanted us with her wonderful voice over delicious sweet treats./nYou play an instrument or can sing? Would you like to connect with other FF musicians? Would you like to recommend other ideas for making music? Or offer a music workshop? Then send us an e-mail to info@femalefellows.com with the subject ‘Making music',
      name: 'tandemActivityThreeBody3',
      desc: '',
      args: [],
    );
  }

  /// `Being creative`
  String get tandemActivityFourTitle {
    return Intl.message(
      'Being creative',
      name: 'tandemActivityFourTitle',
      desc: '',
      args: [],
    );
  }

  /// `Retrospective Events\n1 | Making oilcloths yourself\n At group meetings in September 2019, we made oilcloths ourselves as a sustainable alternative to cling film.\n2 | Knitting makes you happy.\nThaera from Afghanistan taught our Stuttgart tandems how to knit together with her daughters.\n`
  String get tandemActivityFourBody {
    return Intl.message(
      'Retrospective Events\n1 | Making oilcloths yourself\n At group meetings in September 2019, we made oilcloths ourselves as a sustainable alternative to cling film.\n2 | Knitting makes you happy.\nThaera from Afghanistan taught our Stuttgart tandems how to knit together with her daughters.\n',
      name: 'tandemActivityFourBody',
      desc: '',
      args: [],
    );
  }

  /// `More ideas\n1 | Making cards / hand lettering\nWhether for a special occasion or simply to send a few greetings to someone close to your heart: Get inspiration for card motifs on Pinterest, for example, or try out different fonts or hand lettering techniques.\n2 | Photography\nAre you interested in beautiful motifs and/or do you like editing pictures? Show each other your tips and tricks. If you like to take photos outdoors (in nature or from a vantage point) and are looking for ideas for suitable spots, you can find inspiration in the ‘Out in the countryside’ section. The resulting pictures can of course also be used creatively (e.g. as card motifs).\n3 | Sewing\nOld towels can be used to make wonderful cosmetic tissues! You will need an old towel, fabric for the back (scraps of fabric are often enough, you can also use old jeans or other items of clothing made from woven fabric), an iron, some cardboard/thick paper for the templates, scissors and a sewing machine (if necessary, you can also use a needle and thread). You can find tips on how to proceed in the DIY video on the right-hand side.\n`
  String get tandemActivityFourBody2 {
    return Intl.message(
      'More ideas\n1 | Making cards / hand lettering\nWhether for a special occasion or simply to send a few greetings to someone close to your heart: Get inspiration for card motifs on Pinterest, for example, or try out different fonts or hand lettering techniques.\n2 | Photography\nAre you interested in beautiful motifs and/or do you like editing pictures? Show each other your tips and tricks. If you like to take photos outdoors (in nature or from a vantage point) and are looking for ideas for suitable spots, you can find inspiration in the ‘Out in the countryside’ section. The resulting pictures can of course also be used creatively (e.g. as card motifs).\n3 | Sewing\nOld towels can be used to make wonderful cosmetic tissues! You will need an old towel, fabric for the back (scraps of fabric are often enough, you can also use old jeans or other items of clothing made from woven fabric), an iron, some cardboard/thick paper for the templates, scissors and a sewing machine (if necessary, you can also use a needle and thread). You can find tips on how to proceed in the DIY video on the right-hand side.\n',
      name: 'tandemActivityFourBody2',
      desc: '',
      args: [],
    );
  }

  /// ` More tips &amp; inspiration to follow...\nDo you like crafting, sewing, knitting or crocheting; in short: do you like being creative? And would you like to meet up with other tandems? Or even offer a creative workshop?\n\nThen write us an email {mail} with the subject line ‘Be creative’’,`
  String tandemActivityFourBody3(Object mail) {
    return Intl.message(
      ' More tips &amp; inspiration to follow...\nDo you like crafting, sewing, knitting or crocheting; in short: do you like being creative? And would you like to meet up with other tandems? Or even offer a creative workshop?\n\nThen write us an email $mail with the subject line ‘Be creative’’,',
      name: 'tandemActivityFourBody3',
      desc: '',
      args: [mail],
    );
  }

  /// `Off into the countryside`
  String get tandemActivityFiveTitle {
    return Intl.message(
      'Off into the countryside',
      name: 'tandemActivityFiveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Whether on foot or by bike - your surroundings offer many great spots and views. Time to take a deep breath and enjoy good conversation!`
  String get tandemActivityFiveBody {
    return Intl.message(
      'Whether on foot or by bike - your surroundings offer many great spots and views. Time to take a deep breath and enjoy good conversation!',
      name: 'tandemActivityFiveBody',
      desc: '',
      args: [],
    );
  }

  /// `Surroundings Stuttgart:\n1 | Birkenkopf/Monte Scherbelino\nThe {birkenkopf} is the highest vantage point in Stuttgart. If you want, you can cover part of the route by train or bus and walk the last moderate ascent. If you still haven't had enough: The surrounding forest offers beautiful hiking and walking trails that also lead to {baerenschloss}, for example!`
  String tandemActivityFiveBody1(Object baerenschloss, Object birkenkopf) {
    return Intl.message(
      'Surroundings Stuttgart:\n1 | Birkenkopf/Monte Scherbelino\nThe $birkenkopf is the highest vantage point in Stuttgart. If you want, you can cover part of the route by train or bus and walk the last moderate ascent. If you still haven\'t had enough: The surrounding forest offers beautiful hiking and walking trails that also lead to $baerenschloss, for example!',
      name: 'tandemActivityFiveBody1',
      desc: '',
      args: [baerenschloss, birkenkopf],
    );
  }

  /// `2 | TV tower\nThe {fernsehturm}is one of Stuttgart's landmarks. From here you have a unique view over the city, the vineyards in and around Stuttgart - in good weather even as far as the Alb, the Black Forest and the Odenwald! The surrounding forest is ideal for long walks, and the nearest underground stops are ‘Ruhbank (Fernsehturm)’ and ‘{waldau}`
  String tandemActivityFiveBody2(Object fernsehturm, Object waldau) {
    return Intl.message(
      '2 | TV tower\nThe ${fernsehturm}is one of Stuttgart\'s landmarks. From here you have a unique view over the city, the vineyards in and around Stuttgart - in good weather even as far as the Alb, the Black Forest and the Odenwald! The surrounding forest is ideal for long walks, and the nearest underground stops are ‘Ruhbank (Fernsehturm)’ and ‘$waldau',
      name: 'tandemActivityFiveBody2',
      desc: '',
      args: [fernsehturm, waldau],
    );
  }

  /// `3 | Viewpoint Gaußstraße\nHere you not only have a great wide view over the city, but you are also very close to the {kraehenwald}, where you can explore beautiful routes for walking, jogging or cycling.`
  String tandemActivityFiveBody3(Object kraehenwald) {
    return Intl.message(
      '3 | Viewpoint Gaußstraße\nHere you not only have a great wide view over the city, but you are also very close to the $kraehenwald, where you can explore beautiful routes for walking, jogging or cycling.',
      name: 'tandemActivityFiveBody3',
      desc: '',
      args: [kraehenwald],
    );
  }

  /// `4 | Bismarck Tower\nThe {bismarckturm} is located in the north of Stuttgart. Climb 92 steps to reach a platform on the 20-metre-high tower, from where you can enjoy a fantastic panoramic view of the city. Are you afraid of heights or don't fancy the climb? Don't worry, you can enjoy a wonderful panoramic view from the foot of the tower,`
  String tandemActivityFiveBody4(Object bismarckturm) {
    return Intl.message(
      '4 | Bismarck Tower\nThe $bismarckturm is located in the north of Stuttgart. Climb 92 steps to reach a platform on the 20-metre-high tower, from where you can enjoy a fantastic panoramic view of the city. Are you afraid of heights or don\'t fancy the climb? Don\'t worry, you can enjoy a wonderful panoramic view from the foot of the tower,',
      name: 'tandemActivityFiveBody4',
      desc: '',
      args: [bismarckturm],
    );
  }

  /// `5 | Höhenpark Killesberg\nIn {killesbergpark} you can expect beautifully landscaped park areas with a large variety of different flowers, small ponds, an outdoor pool, a few animals that you can pet and even a beer garden. There are also cafés and an ice cream parlour next to the park. You should also not miss the Killesberg Tower in the centre of the park, which offers a view as far as Cannstatt.\n`
  String tandemActivityFiveBody5(Object killesbergpark) {
    return Intl.message(
      '5 | Höhenpark Killesberg\nIn $killesbergpark you can expect beautifully landscaped park areas with a large variety of different flowers, small ponds, an outdoor pool, a few animals that you can pet and even a beer garden. There are also cafés and an ice cream parlour next to the park. You should also not miss the Killesberg Tower in the centre of the park, which offers a view as far as Cannstatt.\n',
      name: 'tandemActivityFiveBody5',
      desc: '',
      args: [killesbergpark],
    );
  }

  /// `6 | Kriegsberg Tower\nYou also have a great view over Stuttgart from the foot of the tower as well as from the battlements. The {kriegsbergturm} can be easily incorporated into a longer walk, during which you can also stop by the nearby Chinese garden. stuttgart-tourist.de describes the Kriegsbergturm as a ‘little tower like from Rapunzel's fairy tale’ - one more reason to take a closer look!`
  String tandemActivityFiveBody6(Object kriegsbergturm) {
    return Intl.message(
      '6 | Kriegsberg Tower\nYou also have a great view over Stuttgart from the foot of the tower as well as from the battlements. The $kriegsbergturm can be easily incorporated into a longer walk, during which you can also stop by the nearby Chinese garden. stuttgart-tourist.de describes the Kriegsbergturm as a ‘little tower like from Rapunzel\'s fairy tale’ - one more reason to take a closer look!',
      name: 'tandemActivityFiveBody6',
      desc: '',
      args: [kriegsbergturm],
    );
  }

  /// `7 | Chinese garden\nThe {chinesischegarten} is located near the {kriegsbergturm} - you walk through a small gate and are then transported directly to the Far East. And in the centre of Stuttgart! The ‘Garden of Beautiful Melody’ is intended to reflect the world in miniature. You can expect southern Chinese architecture, the pavilion of the four cardinal points and - as is often the case in Stuttgart thanks to its location in a basin - a view into the distance,`
  String tandemActivityFiveBody7(
    Object kriegsbergturm,
    Object chinesischegarten,
  ) {
    return Intl.message(
      '7 | Chinese garden\nThe $chinesischegarten is located near the $kriegsbergturm - you walk through a small gate and are then transported directly to the Far East. And in the centre of Stuttgart! The ‘Garden of Beautiful Melody’ is intended to reflect the world in miniature. You can expect southern Chinese architecture, the pavilion of the four cardinal points and - as is often the case in Stuttgart thanks to its location in a basin - a view into the distance,',
      name: 'tandemActivityFiveBody7',
      desc: '',
      args: [kriegsbergturm, chinesischegarten],
    );
  }

  /// `8 | Bärenschlössle\nPure relaxation and nature await you here: the Bärenschlössle is located in the middle of the forest and is surrounded by a beautiful lake landscape. It is a wonderful place for a picnic, but there is also a restaurant, a kiosk and plenty of seating in and around the castle. From here, you can take a perfect walk to Solitude Castle or explore the surrounding red deer park.\n`
  String get tandemActivityFiveBody8 {
    return Intl.message(
      '8 | Bärenschlössle\nPure relaxation and nature await you here: the Bärenschlössle is located in the middle of the forest and is surrounded by a beautiful lake landscape. It is a wonderful place for a picnic, but there is also a restaurant, a kiosk and plenty of seating in and around the castle. From here, you can take a perfect walk to Solitude Castle or explore the surrounding red deer park.\n',
      name: 'tandemActivityFiveBody8',
      desc: '',
      args: [],
    );
  }

  /// `9 | Blaustrümpflerweg\nThe Blaustrümpflerweg actually starts at Marienplatz, but you can also start at other points along the route and only cover part of the 7.5 km route. You pass various viewpoints and sights and, despite longer sections in the countryside, you are close to the city centre and well connected to public transport. \n`
  String get tandemActivityFiveBody9 {
    return Intl.message(
      '9 | Blaustrümpflerweg\nThe Blaustrümpflerweg actually starts at Marienplatz, but you can also start at other points along the route and only cover part of the 7.5 km route. You pass various viewpoints and sights and, despite longer sections in the countryside, you are close to the city centre and well connected to public transport. \n',
      name: 'tandemActivityFiveBody9',
      desc: '',
      args: [],
    );
  }

  /// `10 | Take the train from the Kessel\nWith the {zacke} you can travel from Marienplatz to Degerloch. There you can expect a beautiful view, pretty villas and, after a walk, the television tower. Incidentally, the beautiful Schimmelhüttenweg trail leads from Degerloch back to the Kessel, which runs through the middle of the vineyards and offers a great view of Stuttgart all the way! Another railway tip: In Heslach, there is a funicular railway that takes you back to the 1920s. Carried by steel cables, you are pulled approx. 550 metres up to the forest cemetery,`
  String tandemActivityFiveBody10(Object zacke) {
    return Intl.message(
      '10 | Take the train from the Kessel\nWith the $zacke you can travel from Marienplatz to Degerloch. There you can expect a beautiful view, pretty villas and, after a walk, the television tower. Incidentally, the beautiful Schimmelhüttenweg trail leads from Degerloch back to the Kessel, which runs through the middle of the vineyards and offers a great view of Stuttgart all the way! Another railway tip: In Heslach, there is a funicular railway that takes you back to the 1920s. Carried by steel cables, you are pulled approx. 550 metres up to the forest cemetery,',
      name: 'tandemActivityFiveBody10',
      desc: '',
      args: [zacke],
    );
  }

  /// `11 | Weinberge\nStuttgart is criss-crossed and surrounded by vineyards, which offer wonderful {ausblicke} and walking routes. Many neighbourhoods along the Neckar, such as Unter- or Obertürkheim on the way to Esslingen or Münster on the way to Ludwigsburg, are surrounded by vineyards. Especially in autumn, you can enjoy a great variety of colours here.\n\nWeitere Tipps\n If you like to drive out a bit, you might also like it here: {siebenmuehlental}{grabkapelle} in Untertürkheim, castle {solitude}\n`
  String tandemActivityFiveBody11(
    Object ausblicke,
    Object siebenmuehlental,
    Object grabkapelle,
    Object solitude,
  ) {
    return Intl.message(
      '11 | Weinberge\nStuttgart is criss-crossed and surrounded by vineyards, which offer wonderful $ausblicke and walking routes. Many neighbourhoods along the Neckar, such as Unter- or Obertürkheim on the way to Esslingen or Münster on the way to Ludwigsburg, are surrounded by vineyards. Especially in autumn, you can enjoy a great variety of colours here.\n\nWeitere Tipps\n If you like to drive out a bit, you might also like it here: $siebenmuehlental$grabkapelle in Untertürkheim, castle $solitude\n',
      name: 'tandemActivityFiveBody11',
      desc: '',
      args: [ausblicke, siebenmuehlental, grabkapelle, solitude],
    );
  }

  /// `Surroundings Bietigheim-Bissingen \n1 | Historic old town Besigheim\nA beautiful cycle and footpath leads from Bietigheim to {besigheim} - along the extensive vineyards and the River Enz. Once you arrive in Besigheim, you can refresh yourself with an ice cream or cool drink and a cosy seat by the River Enz. A little tip: it's particularly nice for this at the Besigheim WineRiver - Enzweg, 74354 Besigheim or on the Enz terrace on Unnamed Road, 74354 Besigheim.\n`
  String tandemActivityFiveBody12(Object besigheim) {
    return Intl.message(
      'Surroundings Bietigheim-Bissingen \n1 | Historic old town Besigheim\nA beautiful cycle and footpath leads from Bietigheim to $besigheim - along the extensive vineyards and the River Enz. Once you arrive in Besigheim, you can refresh yourself with an ice cream or cool drink and a cosy seat by the River Enz. A little tip: it\'s particularly nice for this at the Besigheim WineRiver - Enzweg, 74354 Besigheim or on the Enz terrace on Unnamed Road, 74354 Besigheim.\n',
      name: 'tandemActivityFiveBody12',
      desc: '',
      args: [besigheim],
    );
  }

  /// `Surroundings Tübingen\n1 | Wurmlinger Kapelle\nOver the Spitzberg and with a wonderful view of the Hirschau valley, there is a marvellous hiking trail to the Wurmlinger {kapelle}. On hot summer days, you can really enjoy the shady and picturesque path through the forest. At the chapel itself there is a barbecue area where you can take a break after a successful hike.`
  String tandemActivityFiveBody13(Object kapelle) {
    return Intl.message(
      'Surroundings Tübingen\n1 | Wurmlinger Kapelle\nOver the Spitzberg and with a wonderful view of the Hirschau valley, there is a marvellous hiking trail to the Wurmlinger $kapelle. On hot summer days, you can really enjoy the shady and picturesque path through the forest. At the chapel itself there is a barbecue area where you can take a break after a successful hike.',
      name: 'tandemActivityFiveBody13',
      desc: '',
      args: [kapelle],
    );
  }

  /// `\n2 | Bad Urach Waterfall\nSomewhat outside of Tübingen, but easy to reach by train in around 30 minutes, is {badurach}. There is not only a thermal spa here, but also an impressive waterfall that attracts people from all over at any time of year. In addition to the waterfall, there are also the Hohenurach castle ruins, the slide rock with an impressive view and the foal farm of the Marbach stud farm,`
  String tandemActivityFiveBody14(Object badurach) {
    return Intl.message(
      '\n2 | Bad Urach Waterfall\nSomewhat outside of Tübingen, but easy to reach by train in around 30 minutes, is $badurach. There is not only a thermal spa here, but also an impressive waterfall that attracts people from all over at any time of year. In addition to the waterfall, there are also the Hohenurach castle ruins, the slide rock with an impressive view and the foal farm of the Marbach stud farm,',
      name: 'tandemActivityFiveBody14',
      desc: '',
      args: [badurach],
    );
  }

  /// `All the spots can of course be perfectly combined with a picnic, but you can also dance together or listen to music.” Have you discovered other beautiful excursion destinations or green spots with your tandem partner and would like to recommend them to others? Send us an email to {mail} with the subject line ‘Off to the countryside.`
  String tandemActivityFiveBody15(Object mail) {
    return Intl.message(
      'All the spots can of course be perfectly combined with a picnic, but you can also dance together or listen to music.” Have you discovered other beautiful excursion destinations or green spots with your tandem partner and would like to recommend them to others? Send us an email to $mail with the subject line ‘Off to the countryside.',
      name: 'tandemActivityFiveBody15',
      desc: '',
      args: [mail],
    );
  }

  /// `Learn german`
  String get tandemActivitySixTitle {
    return Intl.message(
      'Learn german',
      name: 'tandemActivitySixTitle',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to learn German together with your tandem partner or support them in doing so? Find tips, tricks and materials here.\nWe are currently working on a concept for an exchange between interested parties in small groups. More information will follow soon. But here you can already get an overview of sites and apps that you can use to take your first steps towards learning German with your tandem partner:\n1 | Placement test:\nWant to know your current language level? {checkteshier}.\n`
  String tandemActivitySixBody(Object checkteshier) {
    return Intl.message(
      'Would you like to learn German together with your tandem partner or support them in doing so? Find tips, tricks and materials here.\nWe are currently working on a concept for an exchange between interested parties in small groups. More information will follow soon. But here you can already get an overview of sites and apps that you can use to take your first steps towards learning German with your tandem partner:\n1 | Placement test:\nWant to know your current language level? $checkteshier.\n',
      name: 'tandemActivitySixBody',
      desc: '',
      args: [checkteshier],
    );
  }

  /// `2 | Free online material for practising\nThe Klett publishing house offers numerous materials (worksheets for {download} etc.) on the topic of literacy:\n The Goethe-Institut's {goethe} ”Deutsch für dich’ offers exercises for all language levels, a learning list for saving, a forum for exchanging ideas with others and much more.\n The YouTube channel ‘Deutsch lernen mit Ida’ deals with all kinds of different topics that are important for learning German. There are videos on grammar, vocabulary and German culture:\n If you like learning with videos, you will find numerous learning aids in the {youtubedeutsch}\n Podcasts and video material that are particularly suitable for learning vocabulary and that are prepared for different language levels can be found at ‘{deutschtrainer}\nA varied alternative to classic vocabulary and grammar practice can be found on this English-German {websites} for idioms. \nThe website also offers information on cultural issues, the German alphabet and many other languages and cultures - so it's worth clicking through for native speakers and German learners alike!`
  String tandemActivitySixBody2(
    Object download,
    Object goethe,
    Object youtubedeutsch,
    Object deutschtrainer,
    Object websites,
  ) {
    return Intl.message(
      '2 | Free online material for practising\nThe Klett publishing house offers numerous materials (worksheets for $download etc.) on the topic of literacy:\n The Goethe-Institut\'s $goethe ”Deutsch für dich’ offers exercises for all language levels, a learning list for saving, a forum for exchanging ideas with others and much more.\n The YouTube channel ‘Deutsch lernen mit Ida’ deals with all kinds of different topics that are important for learning German. There are videos on grammar, vocabulary and German culture:\n If you like learning with videos, you will find numerous learning aids in the $youtubedeutsch\n Podcasts and video material that are particularly suitable for learning vocabulary and that are prepared for different language levels can be found at ‘$deutschtrainer\nA varied alternative to classic vocabulary and grammar practice can be found on this English-German $websites for idioms. \nThe website also offers information on cultural issues, the German alphabet and many other languages and cultures - so it\'s worth clicking through for native speakers and German learners alike!',
      name: 'tandemActivitySixBody2',
      desc: '',
      args: [download, goethe, youtubedeutsch, deutschtrainer, websites],
    );
  }

  /// `3 | Apps\nThere are numerous apps for learning German, some of which take different approaches. Here we have listed the most important ones for you:\n ‘Unterwegs Deutsch lernen’ - The free German trainer A1 app from {goetheapp}\n {stadtderwoerter} - A1 and A2, Goethe-Institut (free)\n‘ {kennenlernen} - Interactive exercises for learning German from the Goethe-Institut (free)\n’{meinweg}’ - Free app from the Goethe-Institut for language levels A1 and B2, incl. Germany quiz. \nYou can find an overview of the vhs learning portal apps here.\nYour app store also offers apps on the following topics:\n ‘Alphabetisation’ with Serlo ABC\nYou can find lots of information about the Federal Office for Migration and Refugees (BAMF)\nOn the ‘halloDeutsch’ app, you can select your native language as the basis and the content is clearly visualised\n`
  String tandemActivitySixBody3(
    Object goetheapp,
    Object stadtderwoerter,
    Object kennenlernen,
    Object meinweg,
  ) {
    return Intl.message(
      '3 | Apps\nThere are numerous apps for learning German, some of which take different approaches. Here we have listed the most important ones for you:\n ‘Unterwegs Deutsch lernen’ - The free German trainer A1 app from $goetheapp\n $stadtderwoerter - A1 and A2, Goethe-Institut (free)\n‘ $kennenlernen - Interactive exercises for learning German from the Goethe-Institut (free)\n’$meinweg’ - Free app from the Goethe-Institut for language levels A1 and B2, incl. Germany quiz. \nYou can find an overview of the vhs learning portal apps here.\nYour app store also offers apps on the following topics:\n ‘Alphabetisation’ with Serlo ABC\nYou can find lots of information about the Federal Office for Migration and Refugees (BAMF)\nOn the ‘halloDeutsch’ app, you can select your native language as the basis and the content is clearly visualised\n',
      name: 'tandemActivitySixBody3',
      desc: '',
      args: [goetheapp, stadtderwoerter, kennenlernen, meinweg],
    );
  }

  /// `4| Further information\nYou want to know which German courses are on offer in your area? Find out {hier}.\nThe Goethe-Institut's German at Work online programme, for example, offers quiz questions and exercises for all language levels on the topic of {arbeitsplatzgoethe} \nFurther information about the workplace in Germany can be found here {link}`
  String tandemActivitySixBody4(
    Object link,
    Object hier,
    Object arbeitsplatzgoethe,
  ) {
    return Intl.message(
      '4| Further information\nYou want to know which German courses are on offer in your area? Find out $hier.\nThe Goethe-Institut\'s German at Work online programme, for example, offers quiz questions and exercises for all language levels on the topic of $arbeitsplatzgoethe \nFurther information about the workplace in Germany can be found here $link',
      name: 'tandemActivitySixBody4',
      desc: '',
      args: [link, hier, arbeitsplatzgoethe],
    );
  }

  /// `Cooking together`
  String get tandemActivitySevenTitle {
    return Intl.message(
      'Cooking together',
      name: 'tandemActivitySevenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to cook with your tandem partner? Get inspired here by delicious recipes that have been tried out exclusively by some tandems!\nInspiration from the review\nAfghan cuisine: ‘Bolani’ cooking evening at Caro\n In October 2018, we organised a cosy cooking evening at Caro's home. Our girls from Afghanistan taught us how to cook their speciality ‘Bolani’. Here is the recipe:\n1 | For the dough, put the flour in a large bowl. Add 175 ml water, 2-3 tsp salt and 1 tsp oil and knead until the dough becomes soft. Knead the dough for another 2 minutes and then cover with a cloth and leave to rest for approx. 1 hour.\n2 | For the filling, peel and quarter the potatoes and cook in salted water for approx. 15 minutes until soft.\n3 | Drain the potatoes, add 4 tsp of oil and mash. Clean, wash and finely chop the spring onions and coriander. Mix both with the potatoes and season with salt and pepper.\n4 | For the dip, place the yoghurt in a bowl. Peel and chop the garlic and add. Season with dill, coriander, salt and pepper.\n5 | Divide the dough into 6 pieces and roll out each piece into a round (approx. 20 cm in diameter). Spread the filling on one half of the dough, leaving a 1 cm border. Fold over the free side of the dough and press the edges down firmly. Fry the bolani in a pan with hot oil for 2-3 minutes on each side. Place on a piece of kitchen paper and leave to drain. Serve with yoghurt.\nGood appetite!`
  String get tandemActivitySevenBody {
    return Intl.message(
      'Would you like to cook with your tandem partner? Get inspired here by delicious recipes that have been tried out exclusively by some tandems!\nInspiration from the review\nAfghan cuisine: ‘Bolani’ cooking evening at Caro\n In October 2018, we organised a cosy cooking evening at Caro\'s home. Our girls from Afghanistan taught us how to cook their speciality ‘Bolani’. Here is the recipe:\n1 | For the dough, put the flour in a large bowl. Add 175 ml water, 2-3 tsp salt and 1 tsp oil and knead until the dough becomes soft. Knead the dough for another 2 minutes and then cover with a cloth and leave to rest for approx. 1 hour.\n2 | For the filling, peel and quarter the potatoes and cook in salted water for approx. 15 minutes until soft.\n3 | Drain the potatoes, add 4 tsp of oil and mash. Clean, wash and finely chop the spring onions and coriander. Mix both with the potatoes and season with salt and pepper.\n4 | For the dip, place the yoghurt in a bowl. Peel and chop the garlic and add. Season with dill, coriander, salt and pepper.\n5 | Divide the dough into 6 pieces and roll out each piece into a round (approx. 20 cm in diameter). Spread the filling on one half of the dough, leaving a 1 cm border. Fold over the free side of the dough and press the edges down firmly. Fry the bolani in a pan with hot oil for 2-3 minutes on each side. Place on a piece of kitchen paper and leave to drain. Serve with yoghurt.\nGood appetite!',
      name: 'tandemActivitySevenBody',
      desc: '',
      args: [],
    );
  }

  /// `Arabic cuisine: ”Auzi’ online cooking event with Baraa and Thaera\n In February 2021, we had a cosy online cooking event. Baraa and her mum Thaera taught us how to cook the Arabic dish ‘Auzi’. Here is the recipe (the respective quantities depend on the number of people eating):\n 1 | Boil chicken in salted water, after boiling bake in the oven at 250 degrees until golden brown (the water in which the chicken was cooked can later be used for the rice) - as a vegetarian variant, the chicken can be replaced by tofu (e.g. smoked tofu with almonds). smoked tofu with almonds), halloumi, falafel or similar \n2| Wash the basmati rice, peel the carrots and cook in boiling water until soft; if required: cook the peas \n3| Bring the (chicken) water to the boil (approx. double the amount of rice), add a little salt, pepper, vegetable stock and a little oil or butter (approx. 2 tbsp); add the washed rice. Once the rice has come to the boil, cover and leave to soak over a medium heat\n4| Heat a little oil or butter in a pan, cut the soft carrots into small cubes and add to the pan with the peas. Season to taste with salt, mint, pepper and any spices \n5| Pour oil into another pan and heat well, fry the peanuts until brown, add the almonds a little later and stir well (be careful, they can burn quickly!).    When the nuts have browned, add approx. 2 tbsp of sweetcorn\n6| Place the finished rice in a casserole dish, top with carrots and peas, then almond/peanut/corn mixture and chicken or meat substitute. Serve with yoghurt, add a little cinnamon to taste.\nGood appetite!`
  String get tandemActivitySevenBody2 {
    return Intl.message(
      'Arabic cuisine: ”Auzi’ online cooking event with Baraa and Thaera\n In February 2021, we had a cosy online cooking event. Baraa and her mum Thaera taught us how to cook the Arabic dish ‘Auzi’. Here is the recipe (the respective quantities depend on the number of people eating):\n 1 | Boil chicken in salted water, after boiling bake in the oven at 250 degrees until golden brown (the water in which the chicken was cooked can later be used for the rice) - as a vegetarian variant, the chicken can be replaced by tofu (e.g. smoked tofu with almonds). smoked tofu with almonds), halloumi, falafel or similar \n2| Wash the basmati rice, peel the carrots and cook in boiling water until soft; if required: cook the peas \n3| Bring the (chicken) water to the boil (approx. double the amount of rice), add a little salt, pepper, vegetable stock and a little oil or butter (approx. 2 tbsp); add the washed rice. Once the rice has come to the boil, cover and leave to soak over a medium heat\n4| Heat a little oil or butter in a pan, cut the soft carrots into small cubes and add to the pan with the peas. Season to taste with salt, mint, pepper and any spices \n5| Pour oil into another pan and heat well, fry the peanuts until brown, add the almonds a little later and stir well (be careful, they can burn quickly!).    When the nuts have browned, add approx. 2 tbsp of sweetcorn\n6| Place the finished rice in a casserole dish, top with carrots and peas, then almond/peanut/corn mixture and chicken or meat substitute. Serve with yoghurt, add a little cinnamon to taste.\nGood appetite!',
      name: 'tandemActivitySevenBody2',
      desc: '',
      args: [],
    );
  }

  /// `Do you have delicious recipes that you have perhaps already cooked together with your tandem partner and/or would like to recommend to others? Would you like to organise a cooking event? Send us an email to {mail} with the subject line ‘Cooking together`
  String tandemActivitySevenBody3(Object mail) {
    return Intl.message(
      'Do you have delicious recipes that you have perhaps already cooked together with your tandem partner and/or would like to recommend to others? Would you like to organise a cooking event? Send us an email to $mail with the subject line ‘Cooking together',
      name: 'tandemActivitySevenBody3',
      desc: '',
      args: [mail],
    );
  }

  /// `Tandem exchange`
  String get tandemActivityEightTitle {
    return Intl.message(
      'Tandem exchange',
      name: 'tandemActivityEightTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you interested in what other tandems are doing or would you simply like to go on an excursion or similar in a larger group? Then write us an email to {mail} with the subject ‘Tandem exchange’.\nOnce we have several interested parties, we will put you in touch with each other. You can then consider together what you hope to gain from the exchange (new ideas for joint activities, getting to know new people, doing something together, just having fun, ...) - and of course you can always share your experiences with us!`
  String tandemActivityEightBody(Object mail) {
    return Intl.message(
      'Are you interested in what other tandems are doing or would you simply like to go on an excursion or similar in a larger group? Then write us an email to $mail with the subject ‘Tandem exchange’.\nOnce we have several interested parties, we will put you in touch with each other. You can then consider together what you hope to gain from the exchange (new ideas for joint activities, getting to know new people, doing something together, just having fun, ...) - and of course you can always share your experiences with us!',
      name: 'tandemActivityEightBody',
      desc: '',
      args: [mail],
    );
  }

  /// `Dance together`
  String get tandemActivityNineTitle {
    return Intl.message(
      'Dance together',
      name: 'tandemActivityNineTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you like dancing? Then find out more here about a wide variety of dances such as Afghan dance or breakdancing.\nInspiration from the review\n1 | Traditional dance meets urban dance at the picnic\nWhen it's ‘Female-Fellows Picnic’ again, it's time to dance. At all our meetings, we start dancing as soon as our jukebox starts playing. Whether it's traditional dances from different cultures, modern dances or breakdancing, it doesn't matter. For us, it's all about having fun and exchanging ideas!\n2 | Afghan dance in the theatre\nIn October 2018, there was a great event on the topic of ‘different cultures’ at the Stuttgart Adult Education Centre. There were stands from different countries and cultures and, of course, lots of good food. The highlight of the day was a dance performance of various traditional dances, ranging from flamenco to traditional Afghan dance.\n3 | Afghan New Year\nOn the Afghan New Year, our Female Fellows were thrown in at the deep end. Without any introduction to traditional Afghan dance, each of them had to dance directly in the centre and the rest of the group formed a circle in which they all squatted. Then it was the next person's turn. We had a lot of fun together...`
  String get tandemActivityNineBody {
    return Intl.message(
      'Do you like dancing? Then find out more here about a wide variety of dances such as Afghan dance or breakdancing.\nInspiration from the review\n1 | Traditional dance meets urban dance at the picnic\nWhen it\'s ‘Female-Fellows Picnic’ again, it\'s time to dance. At all our meetings, we start dancing as soon as our jukebox starts playing. Whether it\'s traditional dances from different cultures, modern dances or breakdancing, it doesn\'t matter. For us, it\'s all about having fun and exchanging ideas!\n2 | Afghan dance in the theatre\nIn October 2018, there was a great event on the topic of ‘different cultures’ at the Stuttgart Adult Education Centre. There were stands from different countries and cultures and, of course, lots of good food. The highlight of the day was a dance performance of various traditional dances, ranging from flamenco to traditional Afghan dance.\n3 | Afghan New Year\nOn the Afghan New Year, our Female Fellows were thrown in at the deep end. Without any introduction to traditional Afghan dance, each of them had to dance directly in the centre and the rest of the group formed a circle in which they all squatted. Then it was the next person\'s turn. We had a lot of fun together...',
      name: 'tandemActivityNineBody',
      desc: '',
      args: [],
    );
  }

  /// `Go to the cinema`
  String get tandemActivityTenTitle {
    return Intl.message(
      'Go to the cinema',
      name: 'tandemActivityTenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Need a plan B for bad weather or want to see the latest films? You can find more information here.\nTuesday is cinema day at {cinemastuttgart}. You can see the next blockbuster for 6 euros.\nOn CinemaDIENday, you can get into the cinema at the {cinemaxX} at the Liederhalle for the lowest price! The price depends on which film you have chosen, but the offers start from €5 (3D films are included).\nCheck out {sneakkino} to find out which cinemas in Stuttgart (and other cities) will take you to the cinema cheaply or even for free.\nOlympia- und {paradieslichtspiele}\nSteigstrasse 1, 74321 Bietigheim-Bissingen\nThis small, cosy cinema in Bissingen is really ‘worth seeing’.  In addition to the mainstream blockbuster programme, it also offers extremely interesting films from the ‘Cinema and Church’ series. What's more, the drinks and snacks are cheaper than in the big city cinemas.`
  String tandemActivityTenBody(
    Object cinemastuttgart,
    Object cinemaxX,
    Object sneakkino,
    Object paradieslichtspiele,
  ) {
    return Intl.message(
      'Need a plan B for bad weather or want to see the latest films? You can find more information here.\nTuesday is cinema day at $cinemastuttgart. You can see the next blockbuster for 6 euros.\nOn CinemaDIENday, you can get into the cinema at the $cinemaxX at the Liederhalle for the lowest price! The price depends on which film you have chosen, but the offers start from €5 (3D films are included).\nCheck out $sneakkino to find out which cinemas in Stuttgart (and other cities) will take you to the cinema cheaply or even for free.\nOlympia- und $paradieslichtspiele\nSteigstrasse 1, 74321 Bietigheim-Bissingen\nThis small, cosy cinema in Bissingen is really ‘worth seeing’.  In addition to the mainstream blockbuster programme, it also offers extremely interesting films from the ‘Cinema and Church’ series. What\'s more, the drinks and snacks are cheaper than in the big city cinemas.',
      name: 'tandemActivityTenBody',
      desc: '',
      args: [cinemastuttgart, cinemaxX, sneakkino, paradieslichtspiele],
    );
  }

  /// `Enjoy art`
  String get tandemActivityElevenTitle {
    return Intl.message(
      'Enjoy art',
      name: 'tandemActivityElevenTitle',
      desc: '',
      args: [],
    );
  }

  /// `You want to see or hear what art your neighbourhood has to offer? Then find out here. \nArt in Stuttgart\n1 | Staatsgalerie \nOn Wednesdays, admission to the collection of the Stuttgart Staatsgalerie is free! The opening hours are 10 am to 6 pm. Free admission includes the Print Cabinet and the video box, but not special exhibitions.\n2 | Heat-free at the State Museum \nFrom 25 degrees, admission to the cool rooms of the State Museum in the Old Palace is free. The offer usually applies every year in August. There are many exciting exhibitions to discover\n3 | Free events at the Musikhochschule\nMany concerts and events at the centrally located Musikhochschule Stuttgart are free of charge.\n1 Art in Bietigheim-Bissingen\n1 | Stadtmuseum Hornmoldhaus 57 Hauptstraße, 74321 Bietigheim-Bissingen\nwww.stadtmuseum.bietigheim-bissingen.de\nThe Hornmoldhaus in Bietigheim is one of the best preserved Renaissance town houses in southern Germany. The house was built in 1535/36 by the Bietigheim bailiff Sebastian Hornmold the Elder. The interior paintings from the Renaissance period are particularly worth seeing.Die Ausstellungsthemen wechseln regelmäßig, der Eintritt ist kostenlos.\n2 | Städtische Galerie\nHauptstraße 60-64, 74321 Bietigheim-Bissingen\nwww.galerie.bietigheim-bissingen.de\nIn der Altstadt Bietigheims findet man die 1989 eröffnete und im Jahre 2000 erweiterte Städtische Galerie Bietigheim-Bissingen – eine gelungene Synthese aus historischer Bausubstanz und moderner Architektur. Mit ihren wechselnden Ausstellungen zur Klassischen Moderne und zur Gegenwartskunst sowie einer umfangreichen Sammlung künstlerischer Linolschnitte und Kunst der Region hat die Städtische Galerie eine anerkannte Position im Kulturgeschehen rund um Stuttgart.`
  String get tandemActivityElevenBody {
    return Intl.message(
      'You want to see or hear what art your neighbourhood has to offer? Then find out here. \nArt in Stuttgart\n1 | Staatsgalerie \nOn Wednesdays, admission to the collection of the Stuttgart Staatsgalerie is free! The opening hours are 10 am to 6 pm. Free admission includes the Print Cabinet and the video box, but not special exhibitions.\n2 | Heat-free at the State Museum \nFrom 25 degrees, admission to the cool rooms of the State Museum in the Old Palace is free. The offer usually applies every year in August. There are many exciting exhibitions to discover\n3 | Free events at the Musikhochschule\nMany concerts and events at the centrally located Musikhochschule Stuttgart are free of charge.\n1 Art in Bietigheim-Bissingen\n1 | Stadtmuseum Hornmoldhaus 57 Hauptstraße, 74321 Bietigheim-Bissingen\nwww.stadtmuseum.bietigheim-bissingen.de\nThe Hornmoldhaus in Bietigheim is one of the best preserved Renaissance town houses in southern Germany. The house was built in 1535/36 by the Bietigheim bailiff Sebastian Hornmold the Elder. The interior paintings from the Renaissance period are particularly worth seeing.Die Ausstellungsthemen wechseln regelmäßig, der Eintritt ist kostenlos.\n2 | Städtische Galerie\nHauptstraße 60-64, 74321 Bietigheim-Bissingen\nwww.galerie.bietigheim-bissingen.de\nIn der Altstadt Bietigheims findet man die 1989 eröffnete und im Jahre 2000 erweiterte Städtische Galerie Bietigheim-Bissingen – eine gelungene Synthese aus historischer Bausubstanz und moderner Architektur. Mit ihren wechselnden Ausstellungen zur Klassischen Moderne und zur Gegenwartskunst sowie einer umfangreichen Sammlung künstlerischer Linolschnitte und Kunst der Region hat die Städtische Galerie eine anerkannte Position im Kulturgeschehen rund um Stuttgart.',
      name: 'tandemActivityElevenBody',
      desc: '',
      args: [],
    );
  }

  /// `DISCOVER STUTTGART-CITY`
  String get tandemActivityTwelveTitle {
    return Intl.message(
      'DISCOVER STUTTGART-CITY',
      name: 'tandemActivityTwelveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to know what there is to see and do in Stuttgart city centre away from Königstrasse and the Schlosspark? Then find out here.\n1 | Enjoy the variety of markets\nIn addition to the weekly markets, there are numerous flea markets, such as the large spring or autumn flea market or the weekly flea market that takes place every Saturday on Karlsplatz. By the way: From Karlsplatz, it's always worth making a detour to the market hall!\n2 | Experience city history at the station\nIf you want to get information and an overview of Stuttgart 21 or simply a view of the city centre, you can do so from the 56-metre-high station tower. Admission is free and you can always go up via lifts that can be reached from the station concourse. The tower is open Monday to Wednesday and Friday from 9 a.m. to 7 p.m., Thursdays from 10 a.m. to 9 p.m. (your chance for a sunset with a view!), Saturdays and Sundays from 10 a.m. to 6 p.m.\nWould you like to recommend an interesting spot in the city centre? Send us an email to info@femalefellows.com with the subject line ‘Explore Stuttgart's city centre’, briefly describing what exactly your recommendation is about and what makes it special.`
  String get tandemActivityTwelveBody {
    return Intl.message(
      'Do you want to know what there is to see and do in Stuttgart city centre away from Königstrasse and the Schlosspark? Then find out here.\n1 | Enjoy the variety of markets\nIn addition to the weekly markets, there are numerous flea markets, such as the large spring or autumn flea market or the weekly flea market that takes place every Saturday on Karlsplatz. By the way: From Karlsplatz, it\'s always worth making a detour to the market hall!\n2 | Experience city history at the station\nIf you want to get information and an overview of Stuttgart 21 or simply a view of the city centre, you can do so from the 56-metre-high station tower. Admission is free and you can always go up via lifts that can be reached from the station concourse. The tower is open Monday to Wednesday and Friday from 9 a.m. to 7 p.m., Thursdays from 10 a.m. to 9 p.m. (your chance for a sunset with a view!), Saturdays and Sundays from 10 a.m. to 6 p.m.\nWould you like to recommend an interesting spot in the city centre? Send us an email to info@femalefellows.com with the subject line ‘Explore Stuttgart\'s city centre’, briefly describing what exactly your recommendation is about and what makes it special.',
      name: 'tandemActivityTwelveBody',
      desc: '',
      args: [],
    );
  }

  /// `Digital Activities`
  String get tandemActivityThirteenTitle {
    return Intl.message(
      'Digital Activities',
      name: 'tandemActivityThirteenTitle',
      desc: '',
      args: [],
    );
  }

  /// `The corona pandemic only allows online meetings? Get inspiration for online activities here.\n1 | Shifting ‘offline’ activities to online meetings\nSome activities work both in face-to-face meetings and online. You can find inspiration in the relevant sections and then arrange to meet via video chat (WhatsApp, Skype, Zoom, etc.). For example, this could be a good idea: Cooking together, being creative (handicrafts, sewing, knitting, ...), learning German, tandem exchanges, ...\n2 | Games\nMany games can also be played online. You can find some ideas, also for larger groups, here.you can use the whiteboard at Zoom, for example, to play Monday Painters.there are various websites where you can play online with friends.Taboo, Who am I, pantomime, puzzles, quizzes or Stadt-Land-Fluss can also be easily played in an analogue way via video chat.\n3 | Films/Series\nYou can talk about your favourite films and series. Then watch your tandem partner's favourite film and talk about it afterwards. Or you can arrange to meet up and watch something at the same time and talk about it afterwards.\n4 | Exercise ...\n... even in times of social distancing! Going for a walk is always a good solution. You can enjoy the fresh air, discover new parks and paths or find inspiration in the ‘Off to the countryside’ section. You can also keep your distance outside and wear a mask to minimise the risk of infection, and if walking together is too risky for you, you can arrange to do a workout, dance or yoga together, for example by watching the same workout video and video chatting with your tandem partner at the same time. You're often more motivated in pairs than alone!`
  String get tandemActivityThirteenBody {
    return Intl.message(
      'The corona pandemic only allows online meetings? Get inspiration for online activities here.\n1 | Shifting ‘offline’ activities to online meetings\nSome activities work both in face-to-face meetings and online. You can find inspiration in the relevant sections and then arrange to meet via video chat (WhatsApp, Skype, Zoom, etc.). For example, this could be a good idea: Cooking together, being creative (handicrafts, sewing, knitting, ...), learning German, tandem exchanges, ...\n2 | Games\nMany games can also be played online. You can find some ideas, also for larger groups, here.you can use the whiteboard at Zoom, for example, to play Monday Painters.there are various websites where you can play online with friends.Taboo, Who am I, pantomime, puzzles, quizzes or Stadt-Land-Fluss can also be easily played in an analogue way via video chat.\n3 | Films/Series\nYou can talk about your favourite films and series. Then watch your tandem partner\'s favourite film and talk about it afterwards. Or you can arrange to meet up and watch something at the same time and talk about it afterwards.\n4 | Exercise ...\n... even in times of social distancing! Going for a walk is always a good solution. You can enjoy the fresh air, discover new parks and paths or find inspiration in the ‘Off to the countryside’ section. You can also keep your distance outside and wear a mask to minimise the risk of infection, and if walking together is too risky for you, you can arrange to do a workout, dance or yoga together, for example by watching the same workout video and video chatting with your tandem partner at the same time. You\'re often more motivated in pairs than alone!',
      name: 'tandemActivityThirteenBody',
      desc: '',
      args: [],
    );
  }

  /// `\n5 | At least as important as in ‘normal’ times: Try to talk to each other regularly despite the difficult circumstances. Show your appreciation for each other by simply listening to each other and sharing what is currently on your minds or what ideas you have for your next meetings. Be there for each other and have the courage to admit your insecurities and weaknesses.\nInspiration from the review\nFemale Fellows online activities\nAlternatively, you can simply take part in the Female Fellows online activities. On 13 February 2021, for example, we had a wonderful yoga class for beginners and those interested with Sonja Schmid! On 13 February 2021, she held a beginners' course online with our Female Fellows. We all had so much fun! It was all about getting to grips with yoga, sport and movement and getting to know your own body better. And the best thing is: there will now be regular (online) yoga sessions with Sonja - so stay tuned to find out what online activities Female Fellows is planning. \nDo you have any other ideas for digital activities and would like to recommend them?Have you had good experiences with certain digital activities with your Tandem partner and would like to share them with the community? Write us an email to {mail} with the subject line ‘Digital activities’ in which you briefly describe what exactly your recommendation is about and what makes it special.’`
  String tandemActivityThirteenBody2(Object mail) {
    return Intl.message(
      '\n5 | At least as important as in ‘normal’ times: Try to talk to each other regularly despite the difficult circumstances. Show your appreciation for each other by simply listening to each other and sharing what is currently on your minds or what ideas you have for your next meetings. Be there for each other and have the courage to admit your insecurities and weaknesses.\nInspiration from the review\nFemale Fellows online activities\nAlternatively, you can simply take part in the Female Fellows online activities. On 13 February 2021, for example, we had a wonderful yoga class for beginners and those interested with Sonja Schmid! On 13 February 2021, she held a beginners\' course online with our Female Fellows. We all had so much fun! It was all about getting to grips with yoga, sport and movement and getting to know your own body better. And the best thing is: there will now be regular (online) yoga sessions with Sonja - so stay tuned to find out what online activities Female Fellows is planning. \nDo you have any other ideas for digital activities and would like to recommend them?Have you had good experiences with certain digital activities with your Tandem partner and would like to share them with the community? Write us an email to $mail with the subject line ‘Digital activities’ in which you briefly describe what exactly your recommendation is about and what makes it special.’',
      name: 'tandemActivityThirteenBody2',
      desc: '',
      args: [mail],
    );
  }

  /// `City walk`
  String get cityWalk {
    return Intl.message('City walk', name: 'cityWalk', desc: '', args: []);
  }

  /// `Be active`
  String get beActive {
    return Intl.message('Be active', name: 'beActive', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
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
