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

class ExperienceData {
  ExperienceData({
    required this.duration,
    required this.company,
    required this.position,
    required this.roles,
    required this.location,
    this.companyUrl,
  });

  final String duration;
  final String company;
  final String position;
  final List<String> roles;
  final String? location;
  final String? companyUrl;
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
    TopNavigationItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    // TopNavigationItemData(name: StringConst.WORK, route: StringConst.WORK_PAGE),
    TopNavigationItemData(
      name: StringConst.TEAM,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    // NavItemData(
    //   name: StringConst.CERTIFICATIONS,
    //   route: StringConst.CERTIFICATION_PAGE,
    // ),
    TopNavigationItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
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

  static List<NoteWorthyProjectDetails> noteworthyProjects = <NoteWorthyProjectDetails>[
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
      company: StringConst.Name,
      position: StringConst.COMPANY_4_POSITION,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: <String>[
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
        StringConst.COMPANY_4_ROLE_3,
        StringConst.COMPANY_4_ROLE_4,
        StringConst.COMPANY_4_ROLE_5,
      ],
      location: StringConst.COMPANY_4_LOCATION,
      duration: StringConst.Name_Seitenleiste,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.COMPANY_3_POSITION,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: <String>[
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.COMPANY_3_LOCATION,
      duration: StringConst.COMPANY_3_DURATION,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.COMPANY_2_POSITION,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: <String>[
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.COMPANY_2_LOCATION,
      duration: StringConst.COMPANY_2_DURATION,
    ),
  ];
}
