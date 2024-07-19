class Hospital {
  int? srNo;
  String? locationCoordinates;
  String? location;
  String? hospitalName;
  String? hospitalCategory;
  String? hospitalCareType;
  String? disciplineSystemsOfMedicine;
  String? addressOriginalFirstLine;
  String? state;
  String? district;
  String? subdistrict;
  String? pincode;
  String? telephone;
  String? mobileNumber;
  String? emergencyNum;
  String? ambulancePhoneNo;
  String? bloodbankPhoneNo;
  String? foreignPcare;
  String? tollfree;
  String? helpline;
  String? hospitalFax;
  String? hospitalPrimaryEmailId;
  String? hospitalSecondaryEmailId;
  String? website;
  String? specialties;
  String? facilities;
  String? accreditation;
  String? hospitalRegisNumber;
  String? registrationNumberScan;
  String? nodalPersonInfo;
  String? nodalPersonTele;
  String? nodalPersonEmailId;
  String? town;
  String? subtown;
  String? village;
  String? establishedYear;
  String? ayush;
  String? miscellaneousFacilities;
  String? numberDoctor;
  String? numMediconsultantOrExpert;
  String? totalNumBeds;
  String? numberPrivateWards;
  String? numBedForEcoWeakerSec;
  String? empanelmentOrCollaborationWith;
  String? emergencyServices;
  String? tariffRange;
  int? stateId;
  int? districtId;

  Hospital({
    this.srNo,
    this.locationCoordinates,
    this.location,
    this.hospitalName,
    this.hospitalCategory,
    this.hospitalCareType,
    this.disciplineSystemsOfMedicine,
    this.addressOriginalFirstLine,
    this.state,
    this.district,
    this.subdistrict,
    this.pincode,
    this.telephone,
    this.mobileNumber,
    this.emergencyNum,
    this.ambulancePhoneNo,
    this.bloodbankPhoneNo,
    this.foreignPcare,
    this.tollfree,
    this.helpline,
    this.hospitalFax,
    this.hospitalPrimaryEmailId,
    this.hospitalSecondaryEmailId,
    this.website,
    this.specialties,
    this.facilities,
    this.accreditation,
    this.hospitalRegisNumber,
    this.registrationNumberScan,
    this.nodalPersonInfo,
    this.nodalPersonTele,
    this.nodalPersonEmailId,
    this.town,
    this.subtown,
    this.village,
    this.establishedYear,
    this.ayush,
    this.miscellaneousFacilities,
    this.numberDoctor,
    this.numMediconsultantOrExpert,
    this.totalNumBeds,
    this.numberPrivateWards,
    this.numBedForEcoWeakerSec,
    this.empanelmentOrCollaborationWith,
    this.emergencyServices,
    this.tariffRange,
    this.stateId,
    this.districtId,
  });
  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      srNo: json['Sr_No'],
      locationCoordinates:
          json['Location_Coordinates'] == 0 ? '' : json['Location_Coordinates'],
      location: json['Location'] == 0 ? '' : json['Location'].toString(),
      hospitalName: json['Hospital_Name'] == 0 ? '' : json['Hospital_Name'],
      hospitalCategory:
          json['Hospital_Category'] == 0 ? '' : json['Hospital_Category'],
      hospitalCareType:
          json['Hospital_Care_Type'] == 0 ? '' : json['Hospital_Care_Type'],
      disciplineSystemsOfMedicine: json['Discipline_Systems_of_Medicine'] == 0
          ? ''
          : json['Discipline_Systems_of_Medicine'],
      addressOriginalFirstLine: json['Address_Original_First_Line'] == 0
          ? ''
          : json['Address_Original_First_Line'].toString(),
      state: json['State'] == 0 ? '' : json['State'],
      district: json['District'] == 0 ? '' : json['District'],
      subdistrict: json['Subdistrict'].toString(),
      pincode: json['Pincode'].toString(),
      telephone: json['Telephone'] == 0
          ? ''
          : json['Telephone'].toString().isNotEmpty
              ? json['Telephone'].toString()
              : json['Mobile_Number'].toString().isNotEmpty
                  ? json['Mobile_Number'].toString()
                  : json['Emergency_Num'].toString().isNotEmpty
                      ? json['Emergency_Num'].toString()
                      : json['Ambulance_Phone_No'].toString(),
      mobileNumber:
          json['Mobile_Number'] == 0 ? '' : json['Mobile_Number'].toString(),
      emergencyNum:
          json['Emergency_Num'] == 0 ? '' : json['Emergency_Num'].toString(),
      ambulancePhoneNo: json['Ambulance_Phone_No'] == 0
          ? ''
          : json['Ambulance_Phone_No'].toString(),
      bloodbankPhoneNo:
          json['Bloodbank_Phone_No'] == 0 ? '' : json['Bloodbank_Phone_No'],
      foreignPcare: json['Foreign_pcare'] == 0 ? '' : json['Foreign_pcare'],
      tollfree: json['Tollfree'] == 0 ? '' : json['Tollfree'].toString(),
      helpline: json['Helpline'] == 0 ? '' : json['Helpline'].toString(),
      hospitalFax:
          json['Hospital_Fax'] == 0 ? '' : json['Hospital_Fax'].toString(),
      hospitalPrimaryEmailId: json['Hospital_Primary_Email_Id'] == 0
          ? ''
          : json['Hospital_Primary_Email_Id'],
      hospitalSecondaryEmailId: json['Hospital_Secondary_Email_Id'] == 0
          ? ''
          : json['Hospital_Secondary_Email_Id'],
      website: json['Website'] == 0 ? '' : json['Website'],
      specialties: json['Specialties'] == 0 ? '' : json['Specialties'],
      facilities: json['Facilities'] == 0 ? '' : json['Facilities'],
      accreditation: json['Accreditation'] == 0 ? '' : json['Accreditation'],
      hospitalRegisNumber: json['Hospital_Regis_Number'] == 0
          ? ''
          : json['Hospital_Regis_Number'],
      registrationNumberScan: json['Registeration_Number_Scan'] == 0
          ? ''
          : json['Registeration_Number_Scan'],
      nodalPersonInfo:
          json['Nodal_Person_Info'] == 0 ? '' : json['Nodal_Person_Info'],
      nodalPersonTele: json['Nodal_Person_Tele'] == 0
          ? ''
          : json['Nodal_Person_Tele'].toString(),
      nodalPersonEmailId: json['Nodal_Person_Email_Id'] == 0
          ? ''
          : json['Nodal_Person_Email_Id'].toString(),
      town: json['Town'] == 0 ? '' : json['Town'].toString(),
      subtown: json['Subtown'] == 0 ? '' : json['Subtown'].toString(),
      village: json['Village'] == 0 ? '' : json['Village'].toString(),
      establishedYear: json['Establised_Year'].toString(),
      ayush: json['Ayush'].toString(),
      miscellaneousFacilities: json['Miscellaneous_Facilities'] == 0
          ? ''
          : json['Miscellaneous_Facilities'],
      numberDoctor: json['Number_Doctor'].toString(),
      numMediconsultantOrExpert:
          json['Num_Mediconsultant_or_Expert'].toString(),
      totalNumBeds: json['Total_Num_Beds'].toString(),
      numberPrivateWards: json['Number_Private_Wards'].toString(),
      numBedForEcoWeakerSec: json['Num_Bed_for_Eco_Weaker_Sec'].toString(),
      empanelmentOrCollaborationWith:
          json['Empanelment_or_Collaboration_with'] == 0
              ? ''
              : json['Empanelment_or_Collaboration_with'],
      emergencyServices: json['Emergency_Services'].toString(),
      tariffRange: json['Tariff_Range'] == 0 ? '' : json['Tariff_Range'],
      stateId: json['State_ID'],
      districtId: json['District_ID'],
    );
  }
}
