//
//  Quotzzy.swift
//  QuotzzyKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Anatoliy Gatt <anatoliy.gatt@aol.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public enum Language: String {
    case English = "en"
    case Russian = "ru"
}

public class Quotzzy {

    // MARK: - Private Properties

    private static let quotzzy = Quotzzy()

    private let VERSION: String = Bundle(for: Quotzzy.self).object(forInfoDictionaryKey: "CFBundleShortVersionString")! as! String
    private let dateFormatter: DateFormatter = DateFormatter()
    private let myURLSession: URLSession

    // MARK: - Lifecycle

    private init() {
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale!
        dateFormatter.timeZone = NSTimeZone(name: "GMT") as TimeZone!
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss z"

        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = [
            "Accept": "application/json",
            "Accept-Charset": "utf-8",
            "Accept-Encoding": "*",
            "Accept-Language": "en-US, ru-RU",
            "Accept-Datetime": "Thu, 31 May 2007 20:35:00 GMT",
            "Cache-Control": "no-cache",
            "Pragma": "no-cache",
            "TE": "trailers, deflate",
            "User-Agent": "QuotzzyKit/\(VERSION)"
        ]
        sessionConfiguration.httpCookieAcceptPolicy = .never
        sessionConfiguration.httpCookieStorage = nil
        sessionConfiguration.httpShouldSetCookies = false
        sessionConfiguration.urlCredentialStorage = nil
        sessionConfiguration.urlCache = nil
        #if os(iOS) || os(watchOS) || os(tvOS)
            sessionConfiguration.sessionSendsLaunchEvents = false
        #endif

        myURLSession = URLSession(configuration: sessionConfiguration)
        //myURLSession= URLSession(
        myURLSession.sessionDescription = "QuotzzyKit URL Session"
    }

    // MARK: - Singleton

    public class func sharedClient() -> Quotzzy {
        return quotzzy
    }

    // MARK: - Endpoints

    public func getQuote(lang: Language?, key: Int?, completionHandler: @escaping (_ quote: Quote?, _ error: NSError?) -> Void) {
        let quoteRequestURLComponents: NSURLComponents = NSURLComponents()
        quoteRequestURLComponents.scheme = "http"
        quoteRequestURLComponents.host = "www.quotzzy.co"
        quoteRequestURLComponents.path = "/api/quote"

        var queryItems: [NSURLQueryItem] = []
        if let language = lang, !language.rawValue.isEmpty {
            queryItems.append(NSURLQueryItem(name: "lang", value: language.rawValue))
        }
        if let numericKey = key, numericKey != -1 {
            queryItems.append(NSURLQueryItem(name: "key", value: String(numericKey)))
        }

        quoteRequestURLComponents.queryItems = queryItems as [URLQueryItem]?

        let quoteRequest: NSMutableURLRequest = NSMutableURLRequest(url: quoteRequestURLComponents.url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        quoteRequest.addValue(dateFormatter.string(from: NSDate() as Date), forHTTPHeaderField: "Date")
        quoteRequest.httpMethod = "GET"

        myURLSession.downloadTask(with: quoteRequest as URLRequest, completionHandler: { (url: URL?, response: URLResponse?, error: Error?) -> Void in
            if error == nil {
                let responseData = NSData(contentsOf: url!)
                if responseData != nil {
                    let parsedResponse: Dictionary<String, AnyObject>?
                    do {
                        parsedResponse = try JSONSerialization.jsonObject(with: responseData! as Data, options: .mutableContainers) as? Dictionary<String, AnyObject>
                    } catch let parsingError as NSError {
                        parsedResponse = nil
                        completionHandler(nil, parsingError)
                    }
                    completionHandler(Quote(quote: parsedResponse!), nil)
                }
            } else {
                completionHandler(nil, error as NSError?)
            }
        }).resume()
    }
}
