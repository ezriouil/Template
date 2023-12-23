class LocationAddress {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  final int id;
  final String fullName,
      fullAddress,
      nearby,
      city,
      state,
      zipCode,
      country,
      phone;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  LocationAddress(
      {this.id = 0,
      this.fullName = "",
      this.fullAddress = "",
      this.nearby = "",
      this.city = "",
      this.state = "",
      this.zipCode = "",
      this.country = "",
      this.phone = ""});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        COLUMN_FULL_NAME: fullName,
        COLUMN_FULL_ADDRESS: fullAddress,
        COLUMN_NEARBY: nearby,
        COLUMN_CITY: city,
        COLUMN_STATE: state,
        COLUMN_ZIP_CODE: zipCode,
        COLUMN_COUNTRY: country,
        COLUMN_PHONE: phone,
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON- - - - - - - - - - - - - - - - - -  //
  static LocationAddress fromJson(Map<String,dynamic> json) {
    return LocationAddress(
        id: json[COLUMN_ID],
        fullName: json[COLUMN_FULL_NAME],
        fullAddress: json[COLUMN_FULL_ADDRESS],
        nearby: json[COLUMN_NEARBY],
        city: json[COLUMN_CITY],
        state: json[COLUMN_STATE],
        zipCode: json[COLUMN_ZIP_CODE],
        country: json[COLUMN_COUNTRY],
        phone: json[COLUMN_PHONE]);
  }

  // - - - - - - - - - - - - - - - - - - TABLE COLUMNS - - - - - - - - - - - - - - - - - -  //
  static const String COLUMN_ID = "id";
  static const String COLUMN_FULL_NAME = "fullName";
  static const String COLUMN_FULL_ADDRESS = "fullAddress";
  static const String COLUMN_NEARBY = "nearby";
  static const String COLUMN_CITY = "city";
  static const String COLUMN_STATE = "state";
  static const String COLUMN_ZIP_CODE = "zipCode";
  static const String COLUMN_COUNTRY = "country";
  static const String COLUMN_PHONE = "phone";

  static const String TABLE_NAME = "LocalizationAddresses";

  static const String CREATE_TABLE = "CREATE TABLE $TABLE_NAME ( "
      "$COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$COLUMN_FULL_NAME TEXT ,"
      "$COLUMN_FULL_ADDRESS TEXT ,"
      "$COLUMN_NEARBY TEXT ,"
      "$COLUMN_CITY TEXT ,"
      "$COLUMN_STATE TEXT ,"
      "$COLUMN_ZIP_CODE TEXT ,"
      "$COLUMN_COUNTRY TEXT ,"
      "$COLUMN_PHONE TEXT )";
}
