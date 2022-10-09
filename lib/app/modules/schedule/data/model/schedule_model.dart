class ScheduleModel {
  final int id;
  final String title;
  final int spots;
  final int price;
  final String placeName;
  final String date;
  final dynamic cancelledAt;
  final List<Images> images;
  final dynamic paymentMethod;
  final Community community;
  final Tag tag;
  final bool isJoined;
  final int joinedUsersCount;

  ScheduleModel({
    required this.id,
    required this.title,
    required this.spots,
    required this.price,
    required this.placeName,
    required this.date,
    required this.images,
    required this.cancelledAt,
    required this.paymentMethod,
    required this.community,
    required this.tag,
    required this.isJoined,
    required this.joinedUsersCount,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        id: json['id'],
        title: json['title'],
        spots: json['spots'],
        price: json['price'],
        placeName: json['placeName'],
        cancelledAt: json['cancelled_at'],
        date: json['date'],
        paymentMethod: json['paymentMethod'],
        tag: Tag.fromJson(json['tag']),
        isJoined: json['isJoined'],
        joinedUsersCount: json['joinedUsersCount'],
        images: ((json['images'] as List?) ?? [])
            .map((e) => Images.fromJson(e as Map<String, dynamic>))
            .toList(),
        community: Community.fromJson(json['community']),
      );
}

class Images {
  final String url;

  Images({required this.url});

  factory Images.fromJson(Map<String, dynamic> json) =>
      Images(url: json['url']);
}

class Community {
  final int id;
  final String title;
  final String image;

  Community({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json['id'],
        title: json['title'],
        image: json['image'] ?? '',
      );
}

class Tag {
  final int id;
  final String title;
  final String icon;

  Tag({required this.id, required this.title, required this.icon});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json['id'],
        title: json['title'],
        icon: json['icon'],
      );
}
