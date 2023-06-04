class AlbumFeed {
  Feed? feed;

  AlbumFeed({this.feed});

  AlbumFeed.fromJson(Map<String, dynamic> json) {
    feed = json['feed'] != null ? Feed.fromJson(json['feed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (feed != null) {
      data['feed'] = feed!.toJson();
    }
    return data;
  }
}

class Feed {
  Author? author;
  List<AlbumModel>? entry;
  Name? updated;
  Name? rights;
  Name? title;
  Name? icon;
  // List<Link>? link;
  Name? id;

  Feed(
      {this.author,
      this.entry,
      this.updated,
      this.rights,
      this.title,
      this.icon,
      // this.link,
      this.id});

  Feed.fromJson(Map<String, dynamic> json) {
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    if (json['entry'] != null) {
      entry = <AlbumModel>[];
      json['entry'].forEach((v) {
        entry!.add(AlbumModel.fromJson(v));
      });
    }
    updated = json['updated'] != null ? Name.fromJson(json['updated']) : null;
    rights = json['rights'] != null ? Name.fromJson(json['rights']) : null;
    title = json['title'] != null ? Name.fromJson(json['title']) : null;
    icon = json['icon'] != null ? Name.fromJson(json['icon']) : null;
    // if (json['link'] != null) {
    //   link = <Link>[];
    //   json['link'].forEach((v) {
    //     link!.add(new Link.fromJson(v));
    //   });
    // }
    id = json['id'] != null ? Name.fromJson(json['id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (entry != null) {
      data['entry'] = entry!.map((v) => v.toJson()).toList();
    }
    if (updated != null) {
      data['updated'] = updated!.toJson();
    }
    if (rights != null) {
      data['rights'] = rights!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (icon != null) {
      data['icon'] = icon!.toJson();
    }
    // if (this.link != null) {
    //   data['link'] = this.link!.map((v) => v.toJson()).toList();
    // }
    if (id != null) {
      data['id'] = id!.toJson();
    }
    return data;
  }
}

class Author {
  Name? name;
  Name? uri;

  Author({this.name, this.uri});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    uri = json['uri'] != null ? Name.fromJson(json['uri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (uri != null) {
      data['uri'] = uri!.toJson();
    }
    return data;
  }
}

class Name {
  String? label;

  Name({this.label});

  Name.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    return data;
  }
}

class AlbumModel {
  Name? imName;
  List<ImImage>? imImage;
  Name? imItemCount;
  ImImage? imPrice;
  ImContentType? imContentType;
  Name? rights;
  Name? title;
  ImContentTypeAttributes? link;
  Name? id;
  ImImage? imArtist;
  ImContentType? category;
  ImImage? imReleaseDate;

  AlbumModel(
      {this.imName,
      this.imImage,
      this.imItemCount,
      this.imPrice,
      this.imContentType,
      this.rights,
      this.title,
      this.link,
      this.id,
      this.imArtist,
      this.category,
      this.imReleaseDate});

  AlbumModel.fromJson(Map<String, dynamic> json) {
    imName = json['im:name'] != null ? Name.fromJson(json['im:name']) : null;
    if (json['im:image'] != null) {
      imImage = <ImImage>[];
      json['im:image'].forEach((v) {
        imImage!.add(ImImage.fromJson(v));
      });
    }
    imItemCount = json['im:itemCount'] != null
        ? Name.fromJson(json['im:itemCount'])
        : null;
    imPrice =
        json['im:price'] != null ? ImImage.fromJson(json['im:price']) : null;
    imContentType = json['im:contentType'] != null
        ? ImContentType.fromJson(json['im:contentType'])
        : null;
    rights = json['rights'] != null ? Name.fromJson(json['rights']) : null;
    title = json['title'] != null ? Name.fromJson(json['title']) : null;
    link = json['link'] != null
        ? ImContentTypeAttributes.fromJson(json['link'])
        : null;
    id = json['id'] != null ? Name.fromJson(json['id']) : null;
    imArtist =
        json['im:artist'] != null ? ImImage.fromJson(json['im:artist']) : null;
    category = json['category'] != null
        ? ImContentType.fromJson(json['category'])
        : null;
    imReleaseDate = json['im:releaseDate'] != null
        ? ImImage.fromJson(json['im:releaseDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (imName != null) {
      data['im:name'] = imName!.toJson();
    }
    if (imImage != null) {
      data['im:image'] = imImage!.map((v) => v.toJson()).toList();
    }
    if (imItemCount != null) {
      data['im:itemCount'] = imItemCount!.toJson();
    }
    if (imPrice != null) {
      data['im:price'] = imPrice!.toJson();
    }
    if (imContentType != null) {
      data['im:contentType'] = imContentType!.toJson();
    }
    if (rights != null) {
      data['rights'] = rights!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (link != null) {
      data['link'] = link!.toJson();
    }
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (imArtist != null) {
      data['im:artist'] = imArtist!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (imReleaseDate != null) {
      data['im:releaseDate'] = imReleaseDate!.toJson();
    }
    return data;
  }
}

class ImImage {
  String? label;
  Attributesamount? attributes;

  ImImage({this.label, this.attributes});

  ImImage.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    attributes = json['attributes'] != null
        ? Attributesamount.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? height;

  Attributes({this.height});

  Attributes.fromJson(Map<String, dynamic> json) {
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    return data;
  }
}

class Attributesamount {
  String? amount;
  String? currency;

  Attributesamount({this.amount, this.currency});

  Attributesamount.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}

class ImContentType {
  ImContentType? imContentType;
  Attributeslabel? attributes;

  ImContentType({this.imContentType, this.attributes});

  ImContentType.fromJson(Map<String, dynamic> json) {
    imContentType = json['im:contentType'] != null
        ? ImContentType.fromJson(json['im:contentType'])
        : null;
    attributes = json['attributes'] != null
        ? Attributeslabel.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (imContentType != null) {
      data['im:contentType'] = imContentType!.toJson();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class ImContentTypeCategory {
  Attributesscheme? attributes;

  ImContentTypeCategory({this.attributes});

  ImContentTypeCategory.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? Attributesscheme.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class ImContentTypeAttributes {
  Attributestype? attributes;

  ImContentTypeAttributes({this.attributes});

  ImContentTypeAttributes.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? Attributestype.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributeslabel {
  String? term;
  String? label;

  Attributeslabel({this.term, this.label});

  Attributeslabel.fromJson(Map<String, dynamic> json) {
    term = json['term'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['term'] = term;
    data['label'] = label;
    return data;
  }
}

class Attributestype {
  String? rel;
  String? type;
  String? href;

  Attributestype({this.rel, this.type, this.href});

  Attributestype.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    type = json['type'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rel'] = rel;
    data['type'] = type;
    data['href'] = href;
    return data;
  }
}

class AttributesimId {
  String? imId;

  AttributesimId({this.imId});

  AttributesimId.fromJson(Map<String, dynamic> json) {
    imId = json['im:id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['im:id'] = imId;
    return data;
  }
}

class Attributeshref {
  String? href;

  Attributeshref({this.href});

  Attributeshref.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}

class Attributesscheme {
  String? imId;
  String? term;
  String? scheme;
  String? label;

  Attributesscheme({this.imId, this.term, this.scheme, this.label});

  Attributesscheme.fromJson(Map<String, dynamic> json) {
    imId = json['im:id'];
    term = json['term'];
    scheme = json['scheme'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['im:id'] = imId;
    data['term'] = term;
    data['scheme'] = scheme;
    data['label'] = label;
    return data;
  }
}
