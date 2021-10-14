//
//  Networking.swift
//  Gluco App
//
//  Created by Anjali on 9/6/21.
//

import UIKit
import Alamofire
import AlamofireImage

class Networking: NSObject {
    var model:[PhoneVerification] = []
    var messageObj:[userMessage] = []
    var OTPData:[OTPVerification] = []
    var userObj:[userDetails] = []
    var heightObj:[height] = []
    func phineNumberVerification(email:String, phoneNumber:String, callback: @escaping ResponseHandlerBlock)
    {
       
//        print("email \(email)")
//        print("phone \(phoneNumber)")
//        let parameters = " {\n\t\t\t\n\t\"email\":\"sjaishwal@outlook.com)\",\n   \"phone_number\":\"+917979041716\"\n}\n"
////        " {\n\t\t\t\n\t\"email\":\"sjaishwal@outlook.com\",\n   \"phone_number\":\"+917979041716\"\n}\n"
//        let postData = parameters.data(using: .utf8)
//
//        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/phone-number-check/")!,timeoutInterval: Double.infinity)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

//        request.httpMethod = "POST"
//        request.httpBody = postData
       
        
//        Alamofire.request(request).responseJSON { (response) in
//            print("response \(response)")
//            if let data = response.result.value{
//                if let castdata = data.self as? NSDictionary
//                {
////                    print("message = \(castdata["data"] as? NSDictionary)")
//                    if let castdata1 = castdata["data"] as? NSDictionary {
////                        print("message1 = \(castdata1["message"] as? String)")
//                        callback(castdata1, nil)
//                    }
////                    let message = castdata["message"] as? String ?? ""
//
////                    if message == "Success"
////                    {
////
////                    }
////                    else{
////                        print("Email already exists")
////                    }
//                }
//
//                }
//
//
//
//        }
        let parameters = ["email": email, "phone_number": phoneNumber]
        let urlString = "https://glucometer.fabritronix.com/api/v1/auth/phone-number-check/"
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            print("response \(response)")
            if let data = response.result.value{
                            if let castdata = data.self as? NSDictionary
                            {
            //                    print("message = \(castdata["data"] as? NSDictionary)")
                                if let castdata1 = castdata["data"] as? NSDictionary {
            //                        print("message1 = \(castdata1["message"] as? String)")
                                    callback(castdata1, nil)
                                }
                                
                            }
            
                            }
        }

        
//        callback(<#T##AnyObject#>, <#T##NSError?#>)
    }

    func getOTPNumber(number:String, callback: @escaping ResponseHandlerBlock)
    {
//        let parameters = "{\n\t\t\t\n   \"phone_number\":\"\(number)\"\n}\n"
//        let postData = parameters.data(using: .utf8)
//
//        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/phone/register/")!,timeoutInterval: Double.infinity)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
        
        
        
//        Alamofire.request(request).responseJSON { (response) in
        let parameters = ["phone_number": number]
        let urlString = "https://glucometer.fabritronix.com/api/v1/phone/register/"
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        
//            print(response)
            if let data = response.result.value{
                if let castdata = data.self as? NSDictionary
                {
                    
                    callback(castdata, nil)
                }
            }
            
                }
                
    }
    
    func otpVerify(number:String, otpNumber:String, token:String, callback: @escaping ResponseHandlerBlock)
    {
//        let parameters = "{\n\t\t\t\"phone_number\": \"\(number)\",\n\t\t\t\"session_token\": \"\(token)\",\n\t\t\t\"security_code\": \"\(otpNumber)\"\n}\n"
//        let postData = parameters.data(using: .utf8)
//
//        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/phone/verify/")!,timeoutInterval: Double.infinity)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        Alamofire.request(request).responseJSON { (response) in
        let parameters = ["phone_number": number,"session_token":token,"security_code":otpNumber ]
        let urlString = "https://glucometer.fabritronix.com/api/v1/phone/register/"
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            print(response)
            if let data = response.result.value{
                if let castdata = data as? NSDictionary
                {
                    callback(castdata, nil)
                }
                
            }
            
                }
    }
    
    
    func userRegister(email:String, password:String, mobile:String, feet:String, inches:String, weight:String, fname:String, lname:String, b_group:String, gender:String, dob:String, region:String, is_parent:String, callback: @escaping ResponseHandlerBlock)
    {
        let parameters = "{\n   \t\t\t\"email\": \"\(email)\",\n   \t\t\t\"password\": \"\(password)\",\n  \t\t\t\"profile\": {\n       \t\t\t\t\"mobile\": \"\(mobile)\",\n       \t\t\t\t\"height\": {\n           \t\t\t\t\t\t\"feet\": \(feet),\n           \t\t\t\t\t\t\"inches\": \(inches)\n       \t\t\t\t\t\t},\n      \t\t\t\t\t\"weight\": \"\(weight)\",\n       \t\t\t\t\"fname\": \"\(fname)\",\n       \t\t\t\t\"lname\": \"\(lname)\",\n\t\t\t\t\t\"b_group\": \"\(b_group)\",\n      \t\t\t\t\"gender\": \"\(gender)\",\n       \t\t\t\t\"dob\": \"\(dob)\",\n       \t\t\t\t\"region\": \"\(region)\",\n       \t\t\t\t\"is_parent\": true\n   \t\t\t\t\t}\n}\n"
//        let parameters = "{\n   \t\t\t\"email\": \"sunny.fabritronix@gmail.com\",\n   \t\t\t\"password\": \"Pass@1122\",\n  \t\t\t\"profile\": {\n       \t\t\t\t\"mobile\": \"+918125909437\",\n       \t\t\t\t\"height\": {\n           \t\t\t\t\t\t\"feet\": 5,\n           \t\t\t\t\t\t\"inches\": 10\n       \t\t\t\t\t\t},\n      \t\t\t\t\t\"weight\": \"89\",\n       \t\t\t\t\"fname\": \"Sunny\",\n       \t\t\t\t\"lname\": \"Kumar\",\n\t\t\t\t\t\"b_group\": \"AB+\",\n      \t\t\t\t\"gender\": \"Male\",\n       \t\t\t\t\"dob\": \"12/12/1996\",\n       \t\t\t\t\"region\": \"India\",\n       \t\t\t\t\"is_parent\": true\n   \t\t\t\t\t}\n}\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/user-registration/")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData
        
        Alamofire.request(request).responseJSON { (response) in
//            print(response)
            if let data = response.result.value{
                if let castdata = data as? NSDictionary
                {
//                    let message = castdata["message"] as? String ?? ""
//                    let data = castdata["data"] as? String ?? ""
//                    let obj = userMessage(myMessage: message, myData: data)
//                    self.messageObj.append(obj)
                    callback(castdata, nil)
                }
                
            }
            
                }

    }
    
    
    func userLogin(username:String, password:String, callback: @escaping ResponseHandlerBlock)
    {
//        var localHeightModel:[Model] = []
        let parameters = "{\n   \t\t\"email\": \"\(username)\",\n   \t\t\"password\": \"\(password)\"\n}\n\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/user-login/")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData
        Alamofire.request(request).responseJSON { (response) in
            print(response)
            if let data = response.result.value{
                if let castdata = data as? NSDictionary
                {
                    if let castdata1 = castdata["data"] as? NSDictionary
                    {
//                        let email = castdata["email"] as? String ?? ""
//                        let password = castdata["password"] as? String ?? ""
                        
                        if let castdata2 = castdata1["height"] as? NSDictionary
                        {
                            callback(castdata2, nil)
                        }
//                            print("mobile \(castdata2["mobile"] as? String ?? "")")
                            
//                             let castdata3 = castdata2["height"]
////                            {
////                                let feet = castdata3["feet"] as? String ?? ""
////                                let inches = castdata3["inches"] as? String ?? ""
////                                let obj = height(myFeet: feet, myInch: inches)
////                                localHeightModel.append(obj)
//                                let cast = castdata3 as? [String:Any]
//                                let obj = Model().heightData(data: cast!)
                        
//                                callback("localHeightModel", nil)
                                
//                            }
                            callback(castdata1, nil)
                            
//                        }
//                        callback(userObj, nil)
                    }
                }
                

            }
//            callback(localHeightModel, nil)
            
                }
        
    }
    
    func resetPassword(email:String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/password-reset-email/?email=\(email)")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
//            print(response)
            if let data = response.result.value{
                if let castdata = data as? NSDictionary
                {
                    
                        callback(castdata, nil)
                    
                }

            }
        }
    }
    
    func readingType(callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/gluco/reading-type/")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
//            print(response)
            if let data = response.result.value{
                                
                            if let castdata = data.self as? NSDictionary
                            {
//                                print("message \(castdata["message"] as? String ?? "")")
                                
                                if let castdata1 = castdata["data"] as? NSArray
                                {
                                    for mydata in castdata1
                                    {
                                        if let castdata2 = mydata as? NSDictionary
                                        {
                                            callback(castdata2, nil)
                                        }
                                    }
                                }

//                                if  (castdata as? NSArray) != nil{
//
//                                    if let mydata = data as? NSArray
//                                    {
//                                        for mydata1 in mydata
//                                        {
//                                callback(castdata, nil)
                            }
//                        }
//                    }
//                }
            }
        }
    }
    func profileData(token:String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/profile/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")
//        ("eyJhbGciOiJSUzI1NiIsImtpZCI6ImRjNGQwMGJjM2NiZWE4YjU0NTMzMWQxZjFjOTZmZDRlNjdjNTFlODkiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZmFicml0cm9uaXgiLCJhdWQiOiJmYWJyaXRyb25peCIsImF1dGhfdGltZSI6MTYyMzc0NzE5OSwidXNlcl9pZCI6IkpPb2JBNFBmZ2ZRMmszT21UMkJJanFQb2IyWDIiLCJzdWIiOiJKT29iQTRQZmdmUTJrM09tVDJCSWpxUG9iMlgyIiwiaWF0IjoxNjIzNzU2MzE0LCJleHAiOjE2MjM3NTk5MTQsImVtYWlsIjoic3VubnkuZmFicml0cm9uaXhAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbInN1bm55LmZhYnJpdHJvbml4QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.Vu-_LskvD86x6A10Ok_u5w8vqGrHztJuZoZHIbvIQNeD7EFlm8EZH695lxpMc1OklspsCnr7aslJCmaqG_8ePJjAHptAEfjwn3tk3kHuip5-9WlUDvB2zEyA_ekQWQS6lSGOH6hgRmaO5ZNB39g4RjXZfk10_Jx173QV6iVy1YkE3Tu4dIOXikOF0if2hAuwzfgHSrqKVa83wdfogx4hsSo1ULFimDD5r_ujARUwIGIrKmjqXN1PsKIIAt5JDHQSeiy1T-j9ufMgWBMPAWVsCXJcIOso171fGgqRYFDRZmWG6ZWOEmdcKFFfw_Mz9OwAO30EMhct2Gv99Ky4hSNjFg", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
//            print("response \(response)")
            if let data = response.result.value{
                if let mydata = data as? NSDictionary
                {
                    if let castdata = mydata["data"] as? NSDictionary
                    {
                        callback(castdata, nil)
                    }
                }
            }
        }
        
    }
    
    func readingList(token:String, callback: @escaping ResponseHandlerBlock)
    {
        var localmodel:[readingData] = []
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/gluco/reading-list/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
            print("reading response \(response)")
            if let data = response.result.value
            {
                if let mydata = data as? NSDictionary
                {
                    if let castdata = mydata["data"] as? NSArray
                    {
                        for mydata1 in castdata
                        {
                            if let castdata1 = mydata1 as? [String:Any]
                            {
                              //  let castval = castdata1 as? [String:Any]
                              //  let obj1 = readingData().readingList(data: castval!)
                                let myobj = readingData().readingList(data: castdata1)
                                localmodel.append(myobj)

                            }
                        }
                        callback(localmodel as AnyObject, nil)
                    }
                    
                }
            }
        }

    }
    
    func refreshToken(refreshToken:String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/new-token/")!,timeoutInterval: Double.infinity)
        request.addValue(refreshToken, forHTTPHeaderField: "Authorization")

        request.httpMethod = "POST"
        Alamofire.request(request).responseJSON { (response) in
//            print("token response \(response)")
            if let data = response.result.value{
                if let myData = data as? NSDictionary
                {
                    callback(myData, nil)
                }
            }
        }

    }
    
    func addContacts(name:String,type:Int,cc:String,mobile:String,email:String,address:String,address2:String,pincode:Int,token:String,callback: @escaping ResponseHandlerBlock)
    {
        let parameters = "{\n\t\"name\":\"\(name)\",\n\t\"type\":\(type),\n\t\"cc\":\"\(cc)\",\n\t\"mobile\":\"\(mobile)\",\n\t\"email\":\"\(email)\",\n\t\"address1\":\"\(address)\",\n\t\"address2\":\"\(address2)\",\n\t\"pinCode\":\(pincode)\n}\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/user/contact/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData
        Alamofire.request(request).responseJSON { (response) in
//            print("contact response \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    callback(castdata, nil)
                }
            }
            
        }
    }
    
    func deviceType(callback: @escaping ResponseHandlerBlock) {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/user/contact-type/")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
//            print("contact type response \(response)")
            if let data = response.result.value
            {
                if let mydata = data as? NSDictionary
                {
                    if let castdata = mydata["data"] as? NSArray
                    {
                        for mydata1 in castdata
                        {
                            if let castdata1 = mydata1 as? NSDictionary
                            {
                                callback(castdata1, nil)
                            }
                        }
                    }
                }
            }
        }

    }
    
    func allContacts(token:String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/user/contact/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
//            print("contact response \(response)")
            if let data = response.result.value {
                if let mydata = data as? NSDictionary
                {
                    if let castdata = mydata["data"] as? NSArray
                    {
                        for mydata1 in castdata
                        {
                            if let castdata1 = mydata1 as? NSDictionary
                            {
                                callback(castdata1, nil)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func addRemainder(token:String, name:String, time:Int, mon:Int, tue:Int, wed:Int, thu:Int, fri:Int, sat:Int, sun:Int, type:Int, callback: @escaping ResponseHandlerBlock)
    {
        let parameters = "{\n   \"label_name\": \"\(name)\",\n   \"time\" : \(time),\n   \"mon\" : \(mon),\n   \"tue\" : \(tue),\n   \"wed\" : \(wed),\n   \"thu\" : \(thu),\n   \"fri\" : \(fri),\n   \"sat\" : \(sat),\n   \"sun\" : \(sun),\n   \"type\":\(type)\n}\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/schedule/alert-reminder/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData
        Alamofire.request(request).responseJSON { (response) in
//            print("remainder response \(response)")
            if let data = response.result.value
            {
                if let cast = data as? NSDictionary
                {
                    callback(cast, nil)
                }
            }
        }
    }
    
    func viewRemainder(token:String, callback: @escaping ResponseHandlerBlock)
    {
        var remainderData:[readingData] = []
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/schedule/alert-reminder/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
            print("remainder response \(response)")
            if let data = response.result.value {
                if let mydata = data as? NSDictionary
                {
                    if let castdata = mydata["data"] as? NSArray
                    {
                        for mydata1 in castdata
                        {
                            if let castdata1 = mydata1 as? [String:Any]
                            {
                              //  let castval = castdata1 as? [String:Any]
                              //  let obj1 = readingData().readingList(data: castval!)
                                let myobj = readingData().remainderList(data: castdata1)
                                remainderData.append(myobj)

                            }
                        }
                        callback(remainderData as AnyObject, nil)
                    }
                }
            }
        }
    }
    
    func deleteContacts(id:Int, token:String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/user/contact-details/\(id)/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "DELETE"
        Alamofire.request(request).responseJSON { (response) in
//            print("deelte contacts \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    callback(castdata, nil)
                }
            }
        }
    }
    
    func deleteRemainders(id:Int, token:String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/schedule/alert-details/\(id)/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "DELETE"
        Alamofire.request(request).responseJSON { (response) in
//            print("deelte contacts \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    callback(castdata, nil)
                }
            }
        }
    }
    
    func addPrescriptionImg(url:String,img:UIImage,token:String,callback: @escaping ResponseHandlerBlock)
        {
        let locationURL = self.constructUrl(endPoint: url)
            //Parameter HERE
            let parameters = [
                "key": "file",
                    "src": img,
//                        "/Users/anjali/Downloads/invisible.png",
                    "type": "file"
            ] as [String : Any]
            //Header HERE
            let headers = [
                "token" : "eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg4ZGYxMzgwM2I3NDM2NjExYWQ0ODE0NmE4ZGExYjA3MTg2ZmQxZTkiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZmFicml0cm9uaXgiLCJhdWQiOiJmYWJyaXRyb25peCIsImF1dGhfdGltZSI6MTYyNDYxNDUwNiwidXNlcl9pZCI6IjZBNndrYW0zZm1iMnUxYVpiYmhNYjU3M1pMMTMiLCJzdWIiOiI2QTZ3a2FtM2ZtYjJ1MWFaYmJoTWI1NzNaTDEzIiwiaWF0IjoxNjI0NjE0NTA4LCJleHAiOjE2MjQ2MTgxMDgsImVtYWlsIjoiY2hhaXRyYS5iQGZhYnJpdHJvbml4LmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJjaGFpdHJhLmJAZmFicml0cm9uaXguY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.pXlL5XFN4AvYxH2PO4teLZLsWLULEqmOlIQ7bKOp_VogSjna8Xyv8JETgZZdlb4C_mCvlhDDB3Yzi1N3PmoO44bJEKCCjHtJPXM2g8QpwgPHifdUBZ7TMkEY9BwVnUaDsnInCrknOTAGd9MHD18DZFf_9JpYIEj_waq2oXYhDc1sYOFghU9XyoueYTP1wKjfFWqa01fN9ai7eq-ebmU9NUwmHYhHt1FE5qzFwP0As0O5ZdeAb1b5M9Givaxt65IzkGWFnvDgeVzXcjaRISjehEbxoaEQnDiisHKzz3GOIEfs6nYgwo0jjQ8nRQ_4g7NIGRmc6VCB9p7gi2hFodZgvw",
                "Content-type": "multipart/form-data",
                "Content-Disposition" : "form-data"
            ]
            
//            let image = UIImage(named: img)
//        print("image2 \(img)")
//        print("image3 \(image)")
//        let imgData = image?.jpegData(compressionQuality: 0.7)
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                //Parameter for Upload files
                let imageData1 = img.pngData()
                let now = Date()

                    let formatter = DateFormatter()

                    formatter.timeZone = TimeZone.current

                    formatter.dateFormat = "yyyy-MM-dd HH:mm"

                    let dateString = formatter.string(from: now)

                multipartFormData.append((imageData1)!, withName: "file",fileName: dateString , mimeType: "image/png")
                
//                for (key, value) in parameters
//                {
//                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                }
                
            }, usingThreshold:UInt64.init(),
               to: locationURL, //URL Here
                method: .post,
                headers: headers, //pass header dictionary here
                encodingCompletion: { (result) in
                    
//                    switch result {
//                    case .success(let upload, _, _):
//                        print("the status code is :")
//
//                        upload.uploadProgress(closure: { (progress) in
//                            print("something")
//                        })
//
//                        upload.responseJSON { response in
//                            print("the prescription resopnse code is : \(response.response?.statusCode)")
//                            print("the prescription response is : \(response)")
//                        }
//                        break
//                    case .failure(let encodingError):
//                        print("the error is  : \(encodingError.localizedDescription)")
//                        break
//                    }
                    switch result{

                    case .success(let upload,_,_):
                        upload.responseJSON { (response) in
                            
                            if let jsonResponse = response.result.value as? [String:Any]{
                                print("the prescription response is : \(jsonResponse)")
//                                callback(jsonResponse, nil)
                            }
//
                        }

//                        upload.response{(response) in
//                            let returnData = String(data: response.data!, encoding: .utf8)
//                            print("Response=",returnData!)
//
//                            if response.response?.statusCode == 200 {
//
//                                do {
//                                    let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:Any]
//                                    print(json)
//                                    let res = json["response"] as! [String:Any]
//                                    let data = res["data"] as! [String:Any]
//        //                            completionHandler(json, nil)
//                                    //let fileuploadValue = Mapper<FileUploadResponse>().map(JSON: data)
//                                    //Completion?(fileuploadValue, nil)
//
//                                } catch let error as NSError {
//                                    print(error)
//                                }
//
//                            }else{
//        //                        completionHandler(nil,"fail")
//                            }
//
//                        }
                        //                upload.responseObject { (response: DataResponse<FileUploadResponse>) in
                        //
                        //                    let returnData = String(data: response.data!, encoding: .utf8)
                        //                    print("uploadfile=", returnData!)
                        //                    //                    print("error=", response.error!)
                        //                    print("status code",response.response?.statusCode as Any)
                        //
                        //                    if response.response?.statusCode == 200 {
                        //                        Completion?(response.value,nil)
                        //
                        //                    }else{
                        //                        Completion?(nil,response.error)
                        //
                        //                    }
                        //
                    //                }
                    case .failure(let error):
                        print("Error in upload: \(error.localizedDescription)")
                        //onError?(error)
                    }
            })
        }
    
    func constructUrl(endPoint: String) -> URLComponents
    {
        let endPointString = endPoint
        print("\(endPointString)")
        //        let url = NSURL(string: endPointString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        
        // let url = NSURL(string: endPointString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
        let urlStr  = endPointString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let searchURL = URL(string: urlStr as String)!
        // let url = NSURL(string: endPointString.addingPercentEncoding(withAllowedCharacters: ))
        //let url = NSURL(string: endPointString)
        
        //let url = NSURL(string: endPointString.addingPercentEscapes(using: String.Encoding.utf8)!)
        
        //print("urlB=",url)
        //return NSURLComponents(URL: url! as NSURL, resolvingAgainstBaseURL: true)!
        return URLComponents(url: searchURL as URL, resolvingAgainstBaseURL: true)!
    }
    
     func postImageRequestWithURL(withUrl strURL: String,withParam postParam: Dictionary<String, Any>?, imageArray:UIImage,imgparamname:String,header:[String:String],completion:@escaping (_ isError: NSError?, _ response:NSDictionary?) -> Void)
        
        {
          
            Alamofire.upload(multipartFormData: { (MultipartFormData) in
                
                


                
                // Here is your Image Array
            print("the self.pickedImage.count = \(imageArray)")
//                for i in 0..<imageArray.count {
                
                        
                   //Mark here compressing the images
                    MultipartFormData.append(imageArray.jpegData(compressionQuality: 0.5)!, withName: imgparamname, fileName: "image.png", mimeType: "image/jpeg")

                          
//                }
                
                
             
                
                if let postParam = postParam
                {
                    // Here is your Post paramaters
                    for (key, value) in postParam
                    {
                        MultipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                    }
                }
                
                print("MultipartFormData = \(String(describing: MultipartFormData.contentType))")
                
            }, usingThreshold: UInt64.init(), to: strURL, method: .post,headers: header) { (result) in
                
                switch result {
                case .success(let upload, _, _):
                    
                    upload.uploadProgress(closure: { (progress) in
                        print("Upload Progress: \(progress.fractionCompleted)")
                    })
                    
                    upload.responseJSON { response in
//                        print("response = \(String(describing: response.response))")
                        if response.response?.statusCode == 200
                        {
                            let json = response.result.value as? NSDictionary
                            
                            if json != nil
                            {
                                completion(nil,json!);
                            }else
                            {
                                let error =   BackendError.objectSerialization(reason: "Could Not Upload..")
                                completion(error as NSError,nil);
                            }
                            
                            
                        }
                        else
                        {
                            let error =   BackendError.objectSerialization(reason: "Could Not Upload..")
                            completion(error as NSError,nil);
                        }
                    }
                    
                case .failure(let encodingError):
                    print(encodingError)
                    let error =   BackendError.objectSerialization(reason: "Could Not Upload..")
                    completion(error as NSError,nil);
                }
                
            }
        }
        
        enum BackendError: Error {
            case objectSerialization(reason: String)
            case errorCode_Info(errorCode: String,information:String)
        }
        
    func downloadPrescriptionImg(token:String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/user/prescription/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
//            print("download response \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    if let castdata = castdata["data"] as? NSArray
                    {
                        for mydata1 in castdata
                        {
                            if let castdata1 = mydata1 as? NSDictionary
                            {
                                print("here...")
                                callback(castdata1, nil)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func updateContacts(uid:String,name:String,type:Int,mobile:String,email:String,address:String,id:Int, token:String, callback: @escaping ResponseHandlerBlock)
    {
        let parameters = "{\n  \"uid\":\"\(uid)\",\n  \"name\":\"\(name)\",\n  \"type\":\(type)),\n  \"mobile\":\"\(mobile)\",\n  \"email\":\"\(email)\",\n  \"address\":\"\(address)\"\n}\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/user/contact-details/\(id)/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "PUT"
        request.httpBody = postData
        Alamofire.request(request).responseJSON { (response) in
//            print("updatecontact \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    callback(castdata, nil)
                }
            }
        }
    }
    
    func updateProfile(parameter:[String:Any],token:[String:String], callback: @escaping ResponseHandlerBlock)
    {
//        let parameters = parameter
//            "{\n\"\(parameter)\":\"\(value)\"\n}\n"
//        let postData = parameters.data(using: .utf8)
        
        let parameters = parameter
        let urlString = "https://glucometer.fabritronix.com/api/v1/auth/profile/"
        Alamofire.request(urlString, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: token).responseJSON { (response) in
            print("profile response \(response)")
            if let data = response.result.value
            {
                if let mydata = data as? NSDictionary
                {
                    callback(mydata, nil)
                }
            }
        }

//        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/profile/")!,timeoutInterval: Double.infinity)
//        request.addValue(token, forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "PATCH"
////        request.httpBody = postData
//        Alamofire.request(request).responseJSON { (response) in
//            print("update profile \(response)")
//            if let data = response.result.value
//            {
//                if let mydata = data as? NSDictionary
//                {
//                    callback(mydata, nil)
//                }
//            }
//        }
    }
    
    func profilePic(profile:String, token:String, callback: @escaping ResponseHandlerBlock)
    {
        let parameters = "{\n   \"file\":\"\(profile)\"\n}\n"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/profile-picture-upload/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData
        Alamofire.request(request).responseJSON { (response) in
//            print("profile response \(response)")
            if let castdata = response.result.value
            {
                if let data = castdata as? NSDictionary{
                    callback(data, nil)
                }
            }
        }
    }
    
    func getProfilePic(token:String,callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/profile-picture-upload/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
//            print("profile response \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    if let castdata = castdata["data"] as? NSArray
                    {
                        for mydata1 in castdata
                        {
                            if let castdata1 = mydata1 as? NSDictionary
                            {
                                callback(castdata1, nil)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func notification(token:String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/notification/notification-list/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
//            print("notification response \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    if let castdata = castdata["data"] as? NSArray
                    {
                        for mydata1 in castdata
                        {
                            if let castdata1 = mydata1 as? NSDictionary
                            {
                                callback(castdata1, nil)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func viewPrescriptionImg(id:Int, token: String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/user/prescription-details/?pk=\(id)")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        Alamofire.request(request).responseJSON { (response) in
            print("presc response \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    if let castdata1 = castdata["data"] as? NSDictionary
                    {
//                        for mydata1 in castdata
//                        {
//                            if let castdata1 = mydata1 as? NSDictionary
//                            {
                                callback(castdata1, nil)
//                            }
//                        }
                    }
                }
            }
        }
    }
    
    func deletePrescriptionImg(id:Int,token:String,callback:@escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/user/prescription-details/?pk=\(id)")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "DELETE"
        Alamofire.request(request).responseJSON { (response) in
    //            print("deelte contacts \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    callback(castdata, nil)
                }
            }
        }

    }
    
    func deleteProfileImg(token:String,callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/auth/profile-picture-upload/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "DELETE"
        Alamofire.request(request).responseJSON { (response) in
//            print("deelte contacts \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    callback(castdata, nil)
                }
            }
        }
    }
    
    func latestReading(token: String, callback: @escaping ResponseHandlerBlock)
    {
        var request = URLRequest(url: URL(string: "https://glucometer.fabritronix.com/api/v1/gluco/reading/latest/")!,timeoutInterval: Double.infinity)
        request.addValue(token, forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"

        Alamofire.request(request).responseJSON { (response) in
            print("presc response \(response)")
            if let data = response.result.value
            {
                if let castdata = data as? NSDictionary
                {
                    if let castdata1 = castdata["data"] as? NSDictionary
                    {
//                        for mydata1 in castdata
//                        {
//                            if let castdata1 = mydata1 as? NSDictionary
//                            {
                                callback(castdata1, nil)
//                            }
//                        }
                    }
                }
            }
        }
    }
    }
