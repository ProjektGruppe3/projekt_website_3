// ignore_for_file: non_constant_identifier_names

part of 'values.dart';

// class CertificationData {
//   CertificationData({
//     required this.title,
//     required this.image,
//     required this.imageSize,
//     required this.url,
//     required this.awardedBy,
//   });
//
//   final String image;
//   final double imageSize;
//   final String url;
//   final String title;
//   final String awardedBy;
// }

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ImprintData {
  ImprintData({
    this.title,
    required this.content,
  });

  final String? title;
  final String content;
}

class ExperienceData {
  ExperienceData({
    required this.duration,
    required this.name,
    required this.position,
    required this.roles,
    required this.location,
    this.image,
  });

  final String duration;
  final String name;
  final String position;
  final List<String> roles;
  final String? location;
  final String? image;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<TopNavigationItemData> menuItems = <TopNavigationItemData>[
    TopNavigationItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    TopNavigationItemData(
        name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    // TopNavigationItemData(name: StringConst.WORK, route: StringConst.WORK_PAGE),
    TopNavigationItemData(
      name: StringConst.TEAM,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    // NavItemData(
    //   name: StringConst.CERTIFICATIONS,
    //   route: StringConst.CERTIFICATION_PAGE,
    // ),
    TopNavigationItemData(
        name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<String> programmingLanguages = <String>[
    "Dart",
    "Flutter",
    "C/C++",
    "Python",
    "Solidity",
    "Matlab",
    "Java",
  ];

  static List<String> applications = <String>[
    "Unreal Engine",
    "Android Studio",
    "Visual Studio Code",
    "Remix Ethereum IDE",
    "Matlab",
    "TwinCAT",
    "OBS Studio",
    "Adobe Photoshop",
    "Adobe Illustrator",
    "Microsoft Word",
    "Microsoft Excel",
    "Microsoft PowerPoint",
  ];

  static List<String> otherSoftware = <String>[
    "Firebase",
    "Git",
    "Hardhat",
    "Auto GPT",
    "YOLOv8",
    "MidJourney",
    "Stable Diffusion",
    "Wordpress",
  ];

  static List<NoteWorthyProjectDetails> noteworthyProjects =
      <NoteWorthyProjectDetails>[
    NoteWorthyProjectDetails(
      projectName: StringConst.UDAGRAM_IMAGE_FILTERING,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.UDAGRAM_IMAGE_FILTERING_TECH,
      projectDescription: StringConst.UDAGRAM_IMAGE_FILTERING_DETAIL,
      gitHubUrl: StringConst.UDAGRAM_IMAGE_FILTERING_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SERVERLESS_TODO,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.SERVERLESS_TODO_TECH,
      projectDescription: StringConst.SERVERLESS_TODO_DETAIL,
      gitHubUrl: StringConst.SERVERLESS_TODO_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PYTHON_ALGORITHMS,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PYTHON_ALGORITHMS_DETAIL,
      gitHubUrl: StringConst.PYTHON_ALGORITHMS_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PROGRAMMING_FOR_DATA_SCIENCE,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_DETAIL,
      gitHubUrl: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.ONBOARDING_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.ONBOARDING_APP_DETAIL,
      gitHubUrl: StringConst.ONBOARDING_APP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.FINOPP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.FINOPP_DETAIL,
      gitHubUrl: StringConst.FINOPP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.AMOR_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.AMOR_APP_DETAIL,
      gitHubUrl: StringConst.AMOR_APP_GITHUB_URL,
      webUrl: StringConst.AMOR_APP_WEB_URL,
      isLive: true,
    ),
  ];

  // static List<CertificationData> certificationData = [];

  static List<ExperienceData> experienceData = <ExperienceData>[
    ExperienceData(
      name: StringConst.Name,
      position: StringConst.COMPANY_4_POSITION,
      image: ImagePath.DanielGramsfoto,
      roles: <String>[
        // StringConst.COMPANY_4_ROLE_1,
        // StringConst.COMPANY_4_ROLE_2,
        // StringConst.COMPANY_4_ROLE_3,
        // StringConst.COMPANY_4_ROLE_4,
        // StringConst.COMPANY_4_ROLE_5,
      ],
      location: StringConst.COMPANY_4_LOCATION,
      duration: StringConst.Name_Seitenleiste,
    ),
    ExperienceData(
      name: StringConst.COMPANY_3,
      position: StringConst.COMPANY_3_POSITION,
      image: ImagePath.NiklasBenskifoto,
      roles: <String>[
        // StringConst.COMPANY_3_ROLE_1,
        // StringConst.COMPANY_3_ROLE_2,
        // StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.COMPANY_3_LOCATION,
      duration: StringConst.COMPANY_3_DURATION,
    ),
    ExperienceData(
      name: StringConst.COMPANY_2,
      position: StringConst.COMPANY_2_POSITION,
      image: ImagePath.JurijKuvaevfoto,
      roles: <String>[
        // StringConst.COMPANY_2_ROLE_1,
        // StringConst.COMPANY_2_ROLE_2,
        // StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.COMPANY_2_LOCATION,
      duration: StringConst.COMPANY_2_DURATION,
    ),
  ];

  static final List<ImprintData> imprintData = <ImprintData>[
    ImprintData(title: 'Angaben gemäß § 5 TMG', content: ''),
    ImprintData(
        title: 'Haftung für Inhalte',
        content:
            'Die Inhalte unserer Seiten wurden mit größter Sorgfalt erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der Inhalte können wir jedoch keine Gewähr übernehmen. Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.'),
    ImprintData(
        title: 'Haftung für Links',
        content:
            'Unser Angebot enthält Links zu externen Webseiten Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.'),
    ImprintData(
        title: 'Urheberrecht',
        content:
            'Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet. Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen.'),
    ImprintData(
        title: 'Datenschutz',
        content:
            'Der Nutzung von im Rahmen der Impressumspflicht veröffentlichten Kontaktdaten durch Dritte zur Übersendung von nicht ausdrücklich angeforderter Werbung und Informationsmaterialien wird hiermit ausdrücklich widersprochen. Die Betreiber der Seiten behalten sich ausdrücklich rechtliche Schritte im Falle der unverlangten Zusendung von Werbeinformationen, etwa durch Spam-Mails, vor.'),
    ImprintData(content: 'Deutschland'),
    ImprintData(title: 'Kontakt', content: StringConst.IMPRINT_Line),
  ];
}
