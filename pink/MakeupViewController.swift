//
//  MakeupViewController.swift
//  pink
//
//  Created by Gianne Flores on 2/11/17.
//  Copyright © 2017 Gianne Flores. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SWXMLHash
import SHXMLParser

let AWSDateISO8601DateFormat3 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

class MakeupViewController: UIViewController {

    @IBOutlet weak var makeUpQuestion: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
  
    var wearMakeup = Bool();
    
    @IBAction func chooseYes(_ sender: Any) {
        wearMakeup = true
    }
    
    @IBAction func chooseNo(_ sender: Any) {
        wearMakeup = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        

    }
    override func viewDidAppear(_ animated: Bool) {
        /*
        var canonicalStringArray = [String]()
        
        // alphabetize
        let sortedKeys = Array(mutableParameters.keys).sort {$0 < $1}
        
        for key in sortedKeys {
            canonicalStringArray.append("\(key)=\(mutableParameters[key]!)")
        }
        
        let canonicalString = canonicalStringArray.joinWithSeparator("&")
        let encodedCanonicalString = CFURLCreateStringByAddingPercentEscapes(
            nil,
            canonicalString,
            nil,
            ":,",//"!*'();:@&=+$,/?%#[]",
            CFStringBuiltInEncodings.UTF8.rawValue
        )
        
        let method = req.URLRequest.HTTPMethod
        
        let signature = "\(method)\n\(self.region)\n\(self.formatPath)\n\(encodedCanonicalString)"
        
        let encodedSignatureData = signature.hmacSHA256(self.secret)
        var encodedSignatureString = encodedSignatureData.base64EncodedString()
        
        encodedSignatureString = CFURLCreateStringByAddingPercentEscapes(
            nil,
            encodedSignatureString,
            nil,
            "+=",//"!*'();:@&=+$,/?%#[]",
            CFStringBuiltInEncodings.UTF8.rawValue
            ) as String
        
        let newCanonicalString = "\(encodedCanonicalString)&\(AmazonProductAdvertising.SignatureKey.rawValue)=\(encodedSignatureString)"
        
        Alamofire.request("https://webservices.amazon.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyId=AKIAJY7D2Z56TUY5EKUQ&AssociateTag=gianneflores-20&Operation=ItemSearch&Keywords=the%20hunger%20games&SearchIndex=Books&Timestamp=2017-02-13", method: .post).response{ response in
           // if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }
            var json = JSON(response.data)
            var xml = SWXMLHash.parse(response.data!)
            print(response as? [[String:String]])
            
            
            print(xml)
            print(json)
            print("po")
        }
 */
        /*
        let associate_tag_default = "gianneflores-20"
        let aws_key_default = "AKIAJY7D2Z56TUY5EKUQ"
        let aws_secret_default = "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"
        
        let asin = "B00DVDMRX6" // an amazon id to search for
        let serializer = AmazonSerializer(key: aws_key_default, secret: aws_secret_default)
        
        let amazonParams = [
            "Service" : "AWSECommerceService",
            "Operation" : "ItemLookup",
            "ResponseGroup" : "Images,ItemAttributes",
            "IdType" : "ASIN",
            "ItemId" : asin,
            "AssociateTag" : associate_tag_default,
            "Condition" : "All"
        ]
        
        amazonRequest(parameters: amazonParams as [String : AnyObject]?, serializer: serializer).responseXML { (req, res, data, error) -> Void in
            print("Got results! \(data)")
        }*/
        
        let amazonAccessID = "AKIAJY7D2Z56TUY5EKUQ"
        let secretKey = "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"
        let associateTag = "gianneflores-20"
        
        var parameters = [String]();
        
        let timestamp = ISO8601FormatStringFromDate(date: NSDate())
        
        parameters.append("AWSAccessKeyId=" + amazonAccessID);
        parameters.append("Keywords=" + "boots");
        parameters.append("Operation=ItemSearch");
        parameters.append("Service=AWSECommerceService");
        parameters.append("Timestamp=" + (timestamp as String));
        parameters.append("Version=2013-08-01");
        parameters.append("AssociateTag=" + associateTag);
        
        parameters.sort {$0 < $1}
        let paramString = parameters.joined(separator: "&")
        
        let method = NSMutableURLRequest().httpMethod
        
        var signingKey = "\(method)\n" + "webservices.amazon.com\n" + "/onca/xml\n" + paramString
        //signingKey=HMAC(HMAC(HMAC(HMAC("AWS4" + secretKey,"20150830"),"us-east-1"),"iam"),"aws4_request")
        var signature=sha256(StringToSign: signingKey, secretKey: secretKey)
        //var signature=("AWS4" + secretKey).hmac(algorithm: .SHA256, key: "20150830").hmac(algorithm: .SHA256, key: "us-east-1").hmac(algorithm: .SHA256, key: "aws4_request")
        //signature="20150830".hmac(algorithm: .SHA256, key: "AWS4" + secretKey).hmac(algorithm: .SHA256, key: "us-east-1").hmac(algorithm: .SHA256, key: "aws4_request")
        //signature=
        //let signature = sha256(StringToSign: signingKey, secretKey: secretKey)
        //signature="j7bZM0LXZ9eXeZruTqWm2DIvDYVUU3wxPPpp%2BiXxzQc%3D"
        let finalString = signature//.encodeURIComponent()
        //signature.encode
        
        let amazonUrl =  "http://webservices.amazon.com/onca/xml?" + paramString + "&Signature=" + finalString
        
        print("AmazonURL!!! : ", amazonUrl)
        /*
        $request = "AWSAccessKeyId=" . $this->Access_Key_ID
        . "&AssociateTag=" . $this->Associate_tag
        . "&ItemId=1401224687"
        . "&Operation=ItemLookup"
        . "&ResponseGroup=ItemIds"
        . "&Service=AWSECommerceService"
        . "&Timestamp=" . $Timestamp
        . "&Version=" . $this->Version;*/
        Alamofire.request("https://webservices.amazon.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyId=AKIAJY7D2Z56TUY5EKUQ&Keywords=the%20hunger%20games&SearchIndex=Books&Operation=ItemSearch&AssociateTag=gianneflores-20&Service=AWSECommerceService&Timestamp=\(timestamp)&Version=2013-08-01&Signature=\(signature)", method: .post).response{ response in
            let xml = SHXMLParser().parseData(response.data!)
            print(xml)// output the FilmID element.
        }
        
        Alamofire.request("https://webservices.amazon.com/onca/xml?AWSAccessKeyId=AKIAJY7D2Z56TUY5EKUQ&Keywords=boots&Operation=ItemSearch&AssociateTag=gianneflores-20&Service=AWSECommerceService&Timestamp=\(timestamp)&Version=2013-08-01&Signature=\(signature)", method: .get).response{ response in
            let xml = SHXMLParser().parseData(response.data!)
            print(xml)// output the FilmID element.
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sha256(StringToSign : String, secretKey : String) -> String{
        
        var hex = StringToSign.hmac(algorithm: .SHA256, key: secretKey)
        //var string=
        let hexData = hex.data(using: String.Encoding.utf8)
        let finalString = hexData?.base64EncodedString(options: .lineLength64Characters)
        
        return finalString!
        
    }
    private func ISO8601FormatStringFromDate(date: NSDate) -> NSString {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "GMT") as TimeZone!
        dateFormatter.dateFormat = AWSDateISO8601DateFormat3//"YYYY-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        return dateFormatter.string(from: date as Date) as NSString
    }
    
    
        
    
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

enum CryptoAlgorithm {
    case MD5, SHA1, SHA224, SHA256, SHA384, SHA512
    
    var HMACAlgorithm: CCHmacAlgorithm {
        var result: Int = 0
        switch self {
        case .MD5:      result = kCCHmacAlgMD5
        case .SHA1:     result = kCCHmacAlgSHA1
        case .SHA224:   result = kCCHmacAlgSHA224
        case .SHA256:   result = kCCHmacAlgSHA256
        case .SHA384:   result = kCCHmacAlgSHA384
        case .SHA512:   result = kCCHmacAlgSHA512
        }
        return CCHmacAlgorithm(result)
    }
    
    var digestLength: Int {
        var result: Int32 = 0
        switch self {
        case .MD5:      result = CC_MD5_DIGEST_LENGTH
        case .SHA1:     result = CC_SHA1_DIGEST_LENGTH
        case .SHA224:   result = CC_SHA224_DIGEST_LENGTH
        case .SHA256:   result = CC_SHA256_DIGEST_LENGTH
        case .SHA384:   result = CC_SHA384_DIGEST_LENGTH
        case .SHA512:   result = CC_SHA512_DIGEST_LENGTH
        }
        return Int(result)
    }
}

extension String {
    
    func hmac(algorithm: CryptoAlgorithm, key: String) -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = Int(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = algorithm.digestLength
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        let keyStr = key.cString(using: String.Encoding.utf8)
        let keyLen = Int(key.lengthOfBytes(using: String.Encoding.utf8))
        
        CCHmac(algorithm.HMACAlgorithm, keyStr!, keyLen, str!, strLen, result)
        
        let digest = stringFromResult(result: result, length: digestLen)
    
        
        result.deallocate(capacity: digestLen)
        
        return digest
}
    private func stringFromResult(result: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String {
        var hash = NSMutableString()
        for i in 0..<length {
            hash.appendFormat("%02x", result[i])
        }
        return String(hash)
    }
    func encodeURIComponent() -> String? {
        var characterSet = NSMutableCharacterSet.alphanumeric()
        characterSet.addCharacters(in: "-_.!~*'()")
        
        return self.addingPercentEncoding(withAllowedCharacters: characterSet as CharacterSet)
    }
}
