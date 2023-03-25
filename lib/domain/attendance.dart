class Attendance{
   String? name;
   String? uid;
   double? latitude;
   double? longitude;
   String? requestId;

   Attendance({this.name, this.uid, this.latitude, this.longitude, this.requestId});

   Map<String,dynamic> toJson() => {
     'name':name,
     'uid':uid,
     'latitude':latitude,
     'longitude':longitude,
     'request_id':requestId,
   };
}