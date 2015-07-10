//
//  main.swift
//  Tests for StringJS extension
//
//  Created by Oleg Berman on 2014-07-05.
//  Copyright (c) 2014 Oleg Berman. All rights reserved.
//

import Foundation

NSLog(String("Some Awesome String".length)) // 19

NSLog("More Awesomeness!".charAt(7)) // e

NSLog(String("A little more awesomeness!".charCodeAt(3))) // 105

NSLog("string 1, ".concat("string 2, ", "string 3, ", "string 4")) // string 1, string 2, string 3, string 4

NSLog("99".fromCharCode()) // à

if let dolphinIndex = "cat dog dolphin".indexOf("dolphin", startFrom: 4) {
    NSLog(String(dolphinIndex)) // 8
}

if let catLastIndex = "cat dog dolphin cat".indexOf("cat", startFrom: 4) {
    NSLog(String(catLastIndex)) // 16
}

let matches:[String] = "ABCDABAC".match("\\w{4}")! // [ABCD, ABAC]

NSLog("I love tea!".replace("tea", with: "coffee")) // I love coffee!

NSLog(String("I love California".search("California")!)) // 7

NSLog("iPhone or Android".splice(0, end: 6)!) // iPhone

let companies:[AnyObject] = "apple,htc,lg,google".split(",") as [AnyObject] // ["apple", "htc", "lg", "google"]

NSLog("Yet Another String".substr(0, length: 3)) // Yet

NSLog("Yet Another String".substring(4, end: 11)) // Another

NSLog("привет".toLocaleUpperCase()) // ПРИВЕТ

NSLog("ПРИВЕТ".toLocaleLowerCase()) // привет

NSLog("hello".toUpperCase()) // HELLO

NSLog("HELLO".toLowerCase()) // hello

NSLog("        test         ".trim()) // test



