class ScheduleModel {
  int? id;
  String? title;
  String? description;
  int? spots;
  int? price;
  double? lat;
  double? lon;
  String? placeName;
  String? featuredImage;
  String? deeplink;
  String? date;
  int? tagId;
  int? createdBy;
  int? communityId;
  String? whatsappLink;
  List<Images>? images;
  String? finishDate;
  int? locationId;
  Null? cancelledAt;
  bool? isPrivate;
  Null? lockedAt;
  Null? minimumMembers;
  Null? paymentMethod;
  bool? receiveUpdates;
  String? state;
  bool? isCheckedIn;
  bool? isFeatured;
  int? viewersCount;
  Community? community;
  List<Users>? users;
  Tag? tag;
  bool? isWaiting;
  bool? isJoined;
  int? joinedUsersCount;
  int? checkedInCount;
  int? paidAmount;
  int? ownerEarnings;

  ScheduleModel(
      {this.id,
        this.title,
        this.description,
        this.spots,
        this.price,
        this.lat,
        this.lon,
        this.placeName,
        this.featuredImage,
        this.deeplink,
        this.date,
        this.tagId,
        this.createdBy,
        this.communityId,
        this.whatsappLink,
        this.images,
        this.finishDate,
        this.locationId,
        this.cancelledAt,
        this.isPrivate,
        this.lockedAt,
        this.minimumMembers,
        this.paymentMethod,
        this.receiveUpdates,
        this.state,
        this.isCheckedIn,
        this.isFeatured,
        this.viewersCount,
        this.community,
        this.users,
        this.tag,
        this.isWaiting,
        this.isJoined,
        this.joinedUsersCount,
        this.checkedInCount,
        this.paidAmount,
        this.ownerEarnings});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    spots = json['spots'];
    price = json['price'];
    lat = json['lat'];
    lon = json['lon'];
    placeName = json['placeName'];
    featuredImage = json['featuredImage'];
    deeplink = json['deeplink'];
    date = json['date'];
    tagId = json['tagId'];
    createdBy = json['createdBy'];
    communityId = json['communityId'];
    whatsappLink = json['whatsapp_link'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    finishDate = json['finish_date'];
    locationId = json['location_id'];
    cancelledAt = json['cancelled_at'];
    isPrivate = json['is_private'];
    lockedAt = json['lockedAt'];
    minimumMembers = json['minimumMembers'];
    paymentMethod = json['paymentMethod'];
    receiveUpdates = json['receiveUpdates'];
    state = json['state'];
    isCheckedIn = json['isCheckedIn'];
    isFeatured = json['isFeatured'];
    viewersCount = json['viewersCount'];
    community = json['community'] != null
        ? Community.fromJson(json['community'])
        : null;
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    tag = json['tag'] != null ? Tag.fromJson(json['tag']) : null;
    isWaiting = json['isWaiting'];
    isJoined = json['isJoined'];
    joinedUsersCount = json['joinedUsersCount'];
    checkedInCount = json['checkedInCount'];
    paidAmount = json['paidAmount'];
    ownerEarnings = json['ownerEarnings'];
  }

}

class Images {
  String? url;

  Images({this.url});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

}

class Community {
  int? id;
  String? title;
  String? image;
  String? bio;
  int? points;
  int? ratingCount;
  int? connectionCount;
  int? eventCount;
  String? profilePicture;
  String? deeplink;
  String? linkExpiry;
  String? state;

  Community(
      {this.id,
        this.title,
        this.image,
        this.bio,
        this.points,
        this.ratingCount,
        this.connectionCount,
        this.eventCount,
        this.profilePicture,
        this.deeplink,
        this.linkExpiry,
        this.state});

  Community.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    bio = json['bio'];
    points = json['points'];
    ratingCount = json['rating_count'];
    connectionCount = json['connection_count'];
    eventCount = json['event_count'];
    profilePicture = json['profile_picture'];
    deeplink = json['deeplink'];
    linkExpiry = json['link_expiry'];
    state = json['state'];
  }

}

class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? bio;
  String? profilePicture;
  int? points;
  String? mobile;
  String? countryCode;
  bool? isVerified;
  bool? isTrusted;

  Users(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.bio,
        this.profilePicture,
        this.points,
        this.mobile,
        this.countryCode,
        this.isVerified,
        this.isTrusted});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    bio = json['bio'];
    profilePicture = json['profile_picture'];
    points = json['points'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    isVerified = json['is_verified'];
    isTrusted = json['isTrusted'];
  }

}
class Tag {
  int? id;
  String? title;
  String? icon;

  Tag({this.id, this.title, this.icon});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
  }
}