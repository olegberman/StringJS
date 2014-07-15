//
//  main.swift
//  Tests for StringJS extension
//
//  Created by Oleg Berman on 2014-07-05.
//  Copyright (c) 2014 Oleg Berman. All rights reserved.
//

import Foundation


// get the length of a string

NSLog(String("Some Awesome String".length)) // 19


// get the character in a string by its index

NSLog("More Awesomeness!".charAt(7)) // e


// get the character index at specific index

NSLog(String("A little more awesomeness!".charCodeAt(3))) // 105


// concatenate strings as in JavaScript

NSLog("string 1, ".concat("string 2, ", "string 3, ", "string 4")) // string 1, string 2, string 3, string 4


// convert from charcode into a character

NSLog("99".fromCharCode()) // à


// get index of a substring within a string

if let dolphinIndex = "cat dog dolphin".indexOf("dolphin", startFrom: 4) {
    NSLog(String(dolphinIndex)) // 8
}


// get the last index of substring within a string

if let catLastIndex = "cat dog dolphin cat".indexOf("cat", startFrom: 4) {
    NSLog(String(catLastIndex)) // 16
}


// returns all found matches based on regular expression pattern

let matches:[String] = "ABCDABAC".match("\\w{4}")! // [ABCD, ABAC]


// replaces a substring with another substring and returns modified string

NSLog("I love tea!".replace("tea", with: "coffee")) // I love coffee!


// searches a string with a pattern and returns index of the match

NSLog(String("I love California".search("California")!)) // 7


// extracts a substring from string by start index and length

NSLog("iPhone or Android".splice(0, end: 6)) // iPhone


// makes an array by splitting a string with delimiter

let companies:[AnyObject] = "apple,htc,lg,google".split(",")


// extract substring by start index and the length of substring

NSLog("Yet Another String".substr(0, length: 3)) // Yet


// extract substring by index by start index and end index

NSLog("Yet Another String".substring(4, end: 11)) // Another


// locale uppercase

NSLog("привет".toLocaleUpperCase()) // ПРИВЕТ


// locale lowercase

NSLog("ПРИВЕТ".toLocaleLowerCase()) // привет


// to uppercase

NSLog("hello".toUpperCase()) // HELLO


// to lowercase

NSLog("HELLO".toLowerCase()) // hello


// removes whitespaces in the start and in the end of string

NSLog("        test         ".trim())



