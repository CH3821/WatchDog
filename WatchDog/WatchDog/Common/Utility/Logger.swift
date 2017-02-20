//
//  Logger.swift
//  WatchDog
//
//  Created by JackChan on 2017/2/17.
//  Copyright © 2017年 JackChan. All rights reserved.
//

import Foundation
import XCGLogger

let Log = Logger.defaultLogger

struct Logger {
    
    static let defaultLogger: XCGLogger = {
        // Create a logger object with no destinations
        let log = XCGLogger(identifier: "advancedLogger", includeDefaultDestinations: false)
        
        // Create a destination for the system console log (via NSLog)
        let systemDestination = AppleSystemLogDestination(identifier: "advancedLogger.systemDestination")
        
        // Optionally set some configuration options
        systemDestination.outputLevel = .debug
        systemDestination.showLogIdentifier = false
        systemDestination.showFunctionName = true
        systemDestination.showThreadName = true
        systemDestination.showLevel = true
        systemDestination.showFileName = true
        systemDestination.showLineNumber = true
        systemDestination.showDate = true
        
        // Add the destination to the logger
        log.add(destination: systemDestination)
        
        
        if let filepath = filepath {
            // Create a file log destination
            let fileDestination = FileDestination(writeToFile: filepath, identifier: "advancedLogger.fileDestination", shouldAppend: true)
            
            // Optionally set some configuration options
            fileDestination.outputLevel = .debug
            fileDestination.showLogIdentifier = false
            fileDestination.showFunctionName = true
            fileDestination.showThreadName = true
            fileDestination.showLevel = true
            fileDestination.showFileName = true
            fileDestination.showLineNumber = true
            fileDestination.showDate = true
            
            // Process this destination in the background
            fileDestination.logQueue = XCGLogger.logQueue
            
            // Add the destination to the logger
            log.add(destination: fileDestination)
        }
        
        
        // Add basic app info, version info etc, to the start of the logs
        log.logAppDetails()
        
        return log
    }()
}

extension Logger {
    
    /// 日志文件名称
    fileprivate static let filename: String = {
        /// 日期格式
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        return dateFormatter.string(from: Date())
    }()
    
    /// 日志文件路径
    fileprivate static let filepath: String? = {
        guard let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
            return nil
        }
        
        let path = "\(documentDir)/Logs"
        let filepath = "\(path)/\(filename).txt"
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
                return filepath
            } catch _  {
                return nil
            }
        } else {
            return filepath
        }
    }()
}
