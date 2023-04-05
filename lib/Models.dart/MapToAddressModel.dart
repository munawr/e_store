class MapToAddress {
  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  int? placeRank;
  String? category;
  String? type;
  String? addresstype;
  String? name;
  String? displayName;
  Address? address;
  // List<String>? boundingbox;

  MapToAddress(
      {this.placeId,
      this.licence,
      this.osmType,
      this.osmId,
      this.lat,
      this.lon,
      this.placeRank,
      this.category,
      this.type,
      this.addresstype,
      this.name,
      this.displayName,
      this.address,
      // this.boundingbox
      });

  MapToAddress.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    licence = json['licence'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    lat = json['lat'];
    lon = json['lon'];
    placeRank = json['place_rank'];
    category = json['category'];
    type = json['type'];
    addresstype = json['addresstype'];
    name = json['name'];
    displayName = json['display_name'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    // boundingbox = json['boundingbox'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_id'] = this.placeId;
    data['licence'] = this.licence;
    data['osm_type'] = this.osmType;
    data['osm_id'] = this.osmId;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['place_rank'] = this.placeRank;
    data['category'] = this.category;
    data['type'] = this.type;
    data['addresstype'] = this.addresstype;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    // data['boundingbox'] = this.boundingbox;
    return data;
  }
}

class Address {
  String? building;
  String? tourism;
  String? road;
  String? suburb;
  String? city;
  String? county;
  String? stateDistrict;
  String? state;
  String? iSO31662Lvl4;
  String? postcode;
  String? country;
  String? countryCode;

  Address(
      {this.building,
      this.tourism,
      this.road,
      this.suburb,
      this.city,
      this.county,
      this.stateDistrict,
      this.state,
      this.iSO31662Lvl4,
      this.postcode,
      this.country,
      this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    building = json['building'];
    tourism = json['tourism'];
    road = json['road'];
    suburb = json['suburb'];
    city = json['city'];
    county = json['county'];
    stateDistrict = json['state_district'];
    state = json['state'];
    iSO31662Lvl4 = json['ISO3166-2-lvl4'];
    postcode = json['postcode'];
    country = json['country'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['building'] = this.building;
    data['tourism'] = this.tourism;
    data['road'] = this.road;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    data['county'] = this.county;
    data['state_district'] = this.stateDistrict;
    data['state'] = this.state;
    data['ISO3166-2-lvl4'] = this.iSO31662Lvl4;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    return data;
}
}