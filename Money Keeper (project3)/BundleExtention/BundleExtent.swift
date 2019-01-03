//
//  BundleExtent.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 11/28/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import Foundation

extension Bundle{
    var appName:String?{
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    var Version:String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    var Build:String? {
        return object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
    var copyRights:String?{
        return object(forInfoDictionaryKey: "NSHumanReadableCopyright") as? String
    }
}
