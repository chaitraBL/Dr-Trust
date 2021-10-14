//
//  PhoneVerification.swift
//  Gluco App
//
//  Created by Anjali on 9/6/21.
//

import Foundation

struct PhoneVerification {
    var email : String?
    var phoneNumber: String?
    
    
    init(myEmail:String,myNumber:String) {
        self.email = myEmail
        self.phoneNumber = myNumber
        
    }
    
}

struct OTPVerification {
    var otp:String?
    var token:String?
    var number:String?
    
    init(myotp:String) {
        self.otp = myotp
    }
    
    init(myphone:String)
    {
        self.number = myphone
    }
}


struct userDetails {
    var email:String?
//    var password:String?
    var gender:String?
    var mobile:String?
    var weight:String?
    var lname:String?
    var b_group:String?
    var fname:String?
    var dob:String?
    var region:String?
    var uid:String?
    var token:String?
    var refreshToken:String?
    var inches:String?
    var feet:String?
    var userid:String?
    init(myEmail:String,myGender:String,myMobile:String,myWeight:String,myLname:String,myB_group:String,myFname:String,mydob:String,myRegion:String,uid:String,token:String,refreshToken:String,userId:String) {
        self.email = myEmail
        self.gender = myGender
        self.mobile = myMobile
        self.weight = myWeight
        self.lname = myLname
        self.b_group = myB_group
        self.fname = myFname
        self.dob = mydob
        self.region = myRegion
        self.uid = uid
        self.token = token
        self.refreshToken = refreshToken
        self.userid = userId
    }
    init(myInches:String, myFeet:String)
    {
        self.feet = myFeet
        self.inches = myInches
    }
    init(myEmail:String,myGender:String,myMobile:String,myWeight:String,myLname:String,myB_group:String,myFname:String,mydob:String,myRegion:String) {
        self.email = myEmail
        self.gender = myGender
        self.mobile = myMobile
        self.weight = myWeight
        self.lname = myLname
        self.b_group = myB_group
        self.fname = myFname
        self.dob = mydob
        self.region = myRegion
//        self.userid = userId
    }
}

struct height {
    var feet:String?
    var inch:String?
    init(myFeet:String, myInch:String){
        feet = myFeet
        inch = myInch
    }
}
struct userMessage {
    var message:String?
    var data:String?
    init(myMessage:String, myData:String) {
        message = myMessage
        data = myData
    }
}

struct contactDetails {
    var id:Int?
    var uid:String?
    var name:String?
    var type1:Int?
    var email:String?
    var mobile:String?
    var cc:String?
    var address1:String?
    var address2:String?
    var pincode:Int?
    
    init(myId:Int, myUid:String, myName:String, myType:Int, myEmail:String, myMobile:String, mycc:String, myAddress1:String, myAddress2:String, myPincode:Int) {
        id = myId
        uid = myUid
        name = myName
        type1 = myType
        email = myEmail
        mobile = myMobile
        cc = mycc
        address1 = myAddress1
        address2 = myAddress2
        pincode = myPincode
        
    }
}

struct remainderDetails {
    var name:String?
    var time:Int?
    var sun:Int?
    var mon:Int?
    var tue:Int?
    var wed:Int?
    var thur:Int?
    var fri:Int?
    var sat:Int?
    var id:Int?
    var uid:String?
    var type:Int
    init(myName:String,myTime:Int,mySun:Int,myMon:Int,myTue:Int,mywed:Int,myThu:Int,myFri:Int,mySat:Int,myid:Int,uuid:String,type1:Int) {
        name = myName
        time = myTime
        sun = mySun
        mon = myMon
        tue = myTue
        wed = mywed
        thur = myThu
        fri = myFri
        sat = mySat
        id = myid
        uid = uuid
        type = type1
    }
}

struct readingList {
    var uid:String?
    var readingType:Int?
    var value:Int?
    var status:String?
    var date:String?
    var time:String?
    
    init(uuid:String,myType:Int,myValue:Int,myStatus:String,myDate:String,myTime:String){
        uid = uuid
        readingType = myType
        value = myValue
        status = myStatus
        date = myDate
        time = myTime
    }
    init(myType:Int,myValue:Int,myStatus:String,myDate:String,myTime:String){
//        uid = uuid
        readingType = myType
        value = myValue
        status = myStatus
        date = myDate
        time = myTime
    }
}

class readingData:NSObject
{
    var uid:String?
    var readingType:Int?
    var value:Int?
    var status:String?
    var date:String?
    var time:String?
    
    var name:String?
    var time1:Int?
    var sun:Int?
    var mon:Int?
    var tue:Int?
    var wed:Int?
    var thur:Int?
    var fri:Int?
    var sat:Int?
    var id:Int?
//    var uid:String?
    var type:Int?
    var type1:String?


    func remainderList(data:[String:Any]) -> readingData {
        let obj = readingData()
        for (key,val) in data
        {
            switch key {
            
            case "label_name":
                obj.name = val as? String ?? ""
            case "time":
                obj.time1 = val as? Int ?? 0
            case "sun":
                obj.sun = val as? Int ?? 0
            case "mon":
                obj.mon = val as? Int ?? 0
            case "tue":
                obj.tue = val as? Int ?? 0
            case "wed":
                obj.wed = val as? Int ?? 0
            case "thu":
                obj.thur = val as? Int ?? 0
            case "fri":
                obj.fri = val as? Int ?? 0
            case "sat":
                obj.sat = val as? Int ?? 0
            case "id":
                obj.id = val as? Int ?? 0
            case "uid":
                obj.uid = val as? String ?? ""
            case "type":
                obj.type = val as? Int ?? 0
            default:
                break
            }
        }
        return obj
    }
    
    func readingList(data:[String:Any]) -> readingData {
        let obj = readingData()
        for (key,val) in data
        {
            switch key {
            

            case "created_at":
                obj.date = val as? String ?? ""
            case "reading_type":
                obj.readingType = val as? Int ?? 0
            case "value":
                obj.value = val as? Int ?? 0
            case "status":
                obj.status = val as? String ?? ""
            case "reading_time":
                obj.time = val as? String ?? ""
            case "uid":
                obj.uid = val as? String ?? ""
                
            default:
                break
            }
        }
        return obj
    }
}

struct prescriptionData {
    var id:Int?
    var uid:String?
    var imgFile:String?
    var time:String?
    init(myid:Int, uuid:String,imagefile:String,time1:String) {
        id = myid
        uid = uuid
        imgFile = imagefile
        time = time1
    }
    
    
}

struct filteredDate
{
    var uid:String?
    var readingType:Int?
    var value:Int?
    var status:String?
    var date:String?
    var time:String?
    
    init(myType:Int,myValue:Int,myStatus:String,myDate:String,myTime:String){
//        uid = uuid
        readingType = myType
        value = myValue
        status = myStatus
        date = myDate
        time = myTime
    }
    
    init(mydate:String) {
        date = mydate
    }
    
}

struct profilepic {
    var pic:String?
    init(myPic:String) {
        pic = myPic
    }
}

struct latestAvgReading{
    var value:Int
    var avgValue:Int
    init(myVal:Int, myAvgVal:Int) {
        value = myVal
        avgValue = myAvgVal
    }
}


