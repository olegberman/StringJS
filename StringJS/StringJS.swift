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
    
    func charAt(index: Int) -> String? {
        return self.substr(index, length: 1)
    }
    
    func charCodeAt(index: Int) -> Int? {
        return Int((self as NSString).characterAtIndex(0))
    }
    
    func concat(strings: String...) -> String {
        var result = self
        for str in strings {
            result += str
        }
        return result;
    }
    
    func fromCharCode() -> String {
        return String(NSString(format: "%c", self))
    }
    
    func indexOf(string: String, startFrom: Int = 0) -> Int? {
        var str = self
        if startFrom != 0 {
            str = str.substring(startFrom, endIndex: self.length)
        }
        var index = str.bridgeToObjectiveC().rangeOfString(string).location
        if index == NSNotFound {
            return nil
        }
        return index + startFrom
    }
    
    func lastIndexOf(string: String) -> Int? {
        // first check to get the first optional (starts with 0 index)
        if var lastIndex:Int? = self.indexOf(string) {
            var lastSafeIndex:Int? = lastIndex!
            while lastIndex {
                if var lastLoopIndex:Int? = self.indexOf(string, startFrom: lastIndex! + string.length) {
                    lastIndex = lastLoopIndex
                    lastSafeIndex = lastLoopIndex
                } else {
                    lastIndex = nil
                }
            }
            return lastSafeIndex
        } else {
            return nil
        }
    }
    
    func localeCompare() {
        // not implemented yet
    }
    
    func match() { }
    
    func replace() { }
    
    func search() { }
    
    func splice() { }
    
    func split() { }
    
    func substr(var index: Int, var length: Int = 0) -> String {
        // TODO: implement the JS behaviour when length param is not specified
        length = abs(length)
        if index < 0 {
            index = self.length - abs(index)
        }
        return self.bridgeToObjectiveC().substringWithRange(NSMakeRange(index, length))
    }
    
    func substring(var startIndex: Int, var endIndex: Int) -> String {
        if startIndex < 0 {
            startIndex = 0
        }
        if endIndex < 0 {
            endIndex = 0
        }
        if startIndex > endIndex {
            let tmpForSwap = startIndex
            startIndex = endIndex
            endIndex = startIndex
        }
        endIndex = endIndex - startIndex
        return self.bridgeToObjectiveC().substringWithRange(NSMakeRange(startIndex, endIndex))
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
    
    func trim() { }
    
}