//
//  Entry.swift
//  Money Keeper (project3)
//
//  Created by Abdullah Alsayari on 11/26/18.
//  Copyright © 2018 Abdullah Alsayari. All rights reserved.
//

import Foundation

let appversion = "appVersion"
let defaultID = "com.MoneyKeeper"
let data = "data"
let dTime = "dateAndTime"
let numberLaunches = "numberlaunches"


struct EntryItem: Codable, Equatable{
    var amount : String
    var name : String
}

class Entry{
    
    static let sharedData = Entry()
    
    let defaults = UserDefaults(suiteName: defaultID)!
    
    var EntryList = [EntryItem] (){
        didSet{
            save()
        }
    }
    init(){
        load()
    }
    
    
    func addEntry(amount:String , name:String){
        let entryitem = EntryItem(amount: amount, name: name)
        EntryList.insert(entryitem, at: 0)
    }
    
    func deleteEntry(at index:Int){
        if let _ = EntryList[index] as EntryItem? {
            EntryList.remove(at: index)
        }
    }
    
    
    // save and load entries functions here.
    
    func save(){
        if let encoded = try? JSONEncoder().encode(EntryList) {
            defaults.set(encoded, forKey: data)
            defaults.synchronize()
        } else { fatalError("Couldn't save the data") }
    }
    
    func load(){
        if let savedData = defaults.data(forKey: data){
            let decoded = JSONDecoder()
            do{
                EntryList = try decoded.decode([EntryItem].self, from: savedData)
            }catch{ fatalError(error.localizedDescription) }
        }
        else {
            save()
        }
    }
    
}


