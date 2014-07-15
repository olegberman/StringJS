//
//  StringJS.swift
//  A set of swift string functions that behave as JavaScript functions
//
//  Created by Oleg Berman on 2014-07-05.
//  Copyright (c) 2014 Oleg Berman. All rights reserved.
//

import Foundation

extension String {
    
    var length: Int { return self.bridgeToObjectiveC().length }
    
    func charAt(index: Int) -> String {
        return String(Array(self)[index])
    }
    
    func charCodeAt(index: Int) -> Int {
        return Int((self as NSString).characterAtIndex(index))
    }
    
    func concat(strings: String...) -> String {
        var out = self
        for str in strings {
            out += str
        }
        return out
    }
    
    func fromCharCode() -> String {
        return String(NSString(format: "%c", self))
    }
    
    func indexOf(string: String, startFrom: Int = 0) -> Int? {
        var str = self
        if startFrom != 0 {
            str = str.substring(startFrom, end: self.length)
        }
        var index = str.bridgeToObjectiveC().rangeOfString(string).location
        if index == NSNotFound {
            return nil
        }
        return index + startFrom
    }
    
    func lastIndexOf(string: String) -> Int? {
        // first check to get the first optional (starts with 0 index)
        if var index:Int? = self.indexOf(string) {
            var lastIndex:Int? = index!
            while index {
                if var loopIndex:Int? = self.indexOf(string, startFrom: index! + string.length) {
                    index = loopIndex
                    lastIndex = loopIndex
                } else {
                    index = nil
                }
            }
            return lastIndex
        } else {
            return nil
        }
    }
    
    func localeCompare() {
        
    }
    
    func match(searchPattern:String) -> Array<String>? {
        var regex = NSRegularExpression(pattern: searchPattern, options: nil, error: nil)
        var matches:[AnyObject] = regex.matchesInString(self, options: nil, range: NSRange(location: 0, length: self.length))
        if matches.count > 0 {
            var result:[String] = []
            for match:NSTextCheckingResult in matches as [NSTextCheckingResult] {
                result.append(self.substr(match.range.location, length: match.range.length))
            }
            return result
        } else {
            return nil
        }
    }
    
    func replace(what:String, with:String) -> String {
        var exp = NSRegularExpression(pattern: what, options: nil, error: nil)
        return exp.stringByReplacingMatchesInString(self, options: nil, range: NSMakeRange(0, self.length), withTemplate: with)
    }
    
    func search(what:String) -> Int? {
        var exp = NSRegularExpression(pattern: what, options: nil, error: nil)
        var match = exp.firstMatchInString(self, options: nil, range: NSMakeRange(0, self.length))
        return match.range.location
    }
    
    func splice(start: Int) -> String? {
        return self.substring(start, end: self.length)
    }
    
    func splice(start: Int, end: Int) -> String {
        return self.substring(start, end: end)
    }
    
    func split(withWhat:String) -> NSArray {
        return self.bridgeToObjectiveC().componentsSeparatedByString(withWhat)
    }
    
    func substr(var index: Int) -> String {
        if index < 0 {
            index = self.length - abs(index)
        }
        return self.bridgeToObjectiveC().substringWithRange(NSMakeRange(index, self.length))
    }
    
    func substr(var start: Int, var length: Int) -> String {
        length = abs(length)
        if start < 0 {
            start = self.length - abs(start)
        }
        return self.bridgeToObjectiveC().substringWithRange(NSMakeRange(start, length))
    }
    
    func substring(var start: Int, var end: Int) -> String {
        if start < 0 { start = 0 }
        if end < 0 { end = 0 }
        if start > end {
            let _start = start
            start = end
            end = _start
        }
        end = end - start
        return self.bridgeToObjectiveC().substringWithRange(NSMakeRange(start, end))
    }
    
    func toLocaleLowerCase() -> String {
        return self.lowercaseStringWithLocale(NSLocale.currentLocale())
    }
    
    func toLocaleUpperCase() -> String {
        return self.uppercaseStringWithLocale(NSLocale.currentLocale())
    }
    
    func toLowerCase() -> String {
        return self.lowercaseString
    }
    
    func toUpperCase() -> String {
        return self.uppercaseString
    }
    
    func trim() -> String {
        var tmp = self
        while tmp.substr(0, length: 1) == " " {
            tmp = tmp.substring(1, end: tmp.length)
        }
        while tmp.substr(0, length: 1) ==  " " {
            tmp = tmp.substring(0, end: tmp.length - 1)
        }
        return tmp
    }
    
}