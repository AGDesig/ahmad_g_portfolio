part of 'values.dart';
//https://api.github.com/repos/david-legend/agportfolio/stargazers
//https://api.github.com/repos/david-legend/agportfolio/forks
SkillController _skillController = Get.find<SkillController>();

class MenuData {
  MenuData({
    required this.title,
    required this.routeName,
  });

  final String title;
  final String routeName;
}

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class ProjectDetails {
  ProjectDetails({
    required this.projectImage,
    required this.projectName,
    required this.projectDescription,
    this.technologyUsed,
    this.isPublic,
    this.isLive,
    this.isOnPlayStore,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectImage;
  final String projectName;
  final String projectDescription;
  final bool? isPublic;
  final bool? isOnPlayStore;
  final bool? isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

// PortfolioData class
class PortfolioData {
  PortfolioData({
    required this.title,
    required this.image,
    required this.coverImage,
    required this.imageSize,
    required this.subtitle,
    required this.portfolioDescription,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.webUrl = "",
  });

  final String image;
  final String coverImage;
  final String portfolioDescription;
  final double imageSize;
  final String title;
  final String subtitle;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;

  // Factory method to create an instance from Firestore DocumentSnapshot
  factory PortfolioData.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    return PortfolioData(
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      coverImage: json['coverImage'] ?? '',
      imageSize: (json['imageSize'] as double).toDouble(),
      subtitle: json['subtitle'] ?? '',
      portfolioDescription: json['portfolioDescription'] ?? '',
      technologyUsed: json['technologyUsed'],
      isPublic: json['isPublic'] ?? false,
      isOnPlayStore: json['isOnPlayStore'] ?? false,
      isLive: json['isLive'] ?? false,
      gitHubUrl: json['gitHubUrl'] ?? '',
      hasBeenReleased: json['hasBeenReleased'] ?? true,
      playStoreUrl: json['playStoreUrl'] ?? '',
      webUrl: json['webUrl'] ?? '',
    );
  }

  // Method to convert the instance to Firestore document format
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'image': image,
      'coverImage': coverImage,
      'imageSize': imageSize,
      'subtitle': subtitle,
      'portfolioDescription': portfolioDescription,
      'technologyUsed': technologyUsed,
      'isPublic': isPublic,
      'isOnPlayStore': isOnPlayStore,
      'isLive': isLive,
      'gitHubUrl': gitHubUrl,
      'hasBeenReleased': hasBeenReleased,
      'playStoreUrl': playStoreUrl,
      'webUrl': webUrl,
    };
  }
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    this.company,
    this.companyUrl,
  });

  final String? company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;

  // Factory method to create an instance from Firestore DocumentSnapshot
  factory ExperienceData.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    return ExperienceData(
      position: json['position'] ?? '',
      roles: List<String>.from(json['roles'] ?? []),
      location: json['location'] ?? '',
      duration: json['duration'] ?? '',
      company: json['company'],
      companyUrl: json['companyUrl'],
    );
  }

  // Method to convert the instance to Firestore document format
  Map<String, dynamic> toFirestore() {
    return {
      'position': position,
      'roles': roles,
      'location': location,
      'duration': duration,
      'company': company,
      'companyUrl': companyUrl,
    };
  }
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;

  // Factory method to create an instance from Firestore DocumentSnapshot
  factory SkillData.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;

    return SkillData(
      skillName: json['skillName'] ?? '',
      skillLevel: json['skillLevel']?.toDouble() ?? 0.0,
    );
  }

  // Method to convert the instance to Firestore document format
  Map<String, dynamic> toFirestore() {
    return {
      'skillName': skillName,
      'skillLevel': skillLevel,
    };
  }
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
  static List<MenuData> menuList = [
    MenuData(title: StringConst.HOME, routeName: HomePage.homePageRoute),
    MenuData(title: StringConst.ABOUT_ME, routeName: AboutPage.aboutPageRoute),
    MenuData(
      title: StringConst.PORTFOLIO,
      routeName: PortfolioPage.portfolioPageRoute,
    ),
//    MenuData(
//      title: StringConst.CONTACT,
//      routeName: ContactPage.contactPageRoute,
//    ),
    MenuData(
      title: StringConst.EXPERIENCE,
      routeName: ExperiencePage.experiencePageRoute,
    ),
    MenuData(title: StringConst.RESUME, routeName: StringConst.RESUME),
    MenuData(
      title: StringConst.CERTIFICATIONS,
      routeName: CertificationPage.certificationPageRoute,
    ),
  ];


  static List<SubMenuData> subMenuData = [
    SubMenuData(
      title: StringConst.KEY_SKILLS,
      isSelected: true,
      isAnimation: true,
      skillData: _skillController.skillData,
    ),
    SubMenuData(
      title: StringConst.EDUCATION,
      isSelected: false,
      content: StringConst.EDUCATION_TEXT,
    ),
  ];



  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.ASSOCIATE_ANDROID_DEV,
      url: StringConst.ASSOCIATE_ANDROID_DEV_URL,
      image: ImagePath.ASSOCIATE_ANDROID_DEV,
      imageSize: 0.30,
      awardedBy: StringConst.GOOGLE,
    ),
    CertificationData(
      title: StringConst.DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_CERT_URL,
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.ANDROID_BASICS,
      url: StringConst.ANDROID_BASICS_CERT_URL,
      image: ImagePath.ANDROID_BASICS_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.UDACITY,
    ),
  ];

  // static List<ExperienceData> experienceData = [
  //   ExperienceData(
  //     company: StringConst.COMPANY_4,
  //     position: StringConst.POSITION_4,
  //     companyUrl: StringConst.COMPANY_4_URL,
  //     roles: [
  //       StringConst.COMPANY_4_ROLE_1,
  //       StringConst.COMPANY_4_ROLE_2,
  //       StringConst.COMPANY_4_ROLE_3,
  //       StringConst.COMPANY_4_ROLE_4,
  //     ],
  //     location: StringConst.LOCATION_4,
  //     duration: StringConst.DURATION_4,
  //   ),
  //   ExperienceData(
  //     company: StringConst.COMPANY_3,
  //     position: StringConst.POSITION_3,
  //     companyUrl: StringConst.COMPANY_3_URL,
  //     roles: [
  //       StringConst.COMPANY_3_ROLE_1,
  //       StringConst.COMPANY_3_ROLE_2,
  //       StringConst.COMPANY_3_ROLE_3,
  //       StringConst.COMPANY_3_ROLE_4,
  //     ],
  //     location: StringConst.LOCATION_3,
  //     duration: StringConst.DURATION_3,
  //   ),
  //   ExperienceData(
  //     company: StringConst.COMPANY_2,
  //     position: StringConst.POSITION_2,
  //     companyUrl: StringConst.COMPANY_2_URL,
  //     roles: [
  //       StringConst.COMPANY_2_ROLE_1,
  //       StringConst.COMPANY_2_ROLE_2,
  //       StringConst.COMPANY_2_ROLE_3,
  //       StringConst.COMPANY_2_ROLE_4,
  //     ],
  //     location: StringConst.LOCATION_2,
  //     duration: StringConst.DURATION_2,
  //   ),
  //   ExperienceData(
  //     company: StringConst.COMPANY_1,
  //     position: StringConst.POSITION_1,
  //     companyUrl: StringConst.COMPANY_1_URL,
  //     roles: [
  //       StringConst.COMPANY_1_ROLE_1,
  //       StringConst.COMPANY_1_ROLE_2,
  //       StringConst.COMPANY_1_ROLE_3,
  //     ],
  //     location: StringConst.LOCATION_1,
  //     duration: StringConst.DURATION_1,
  //   ),
  // ];
}
