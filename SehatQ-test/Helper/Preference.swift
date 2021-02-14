//
//  Preference.swift
//  SehatQ-test
//
//  Created by user on 13/02/21.
//
import Foundation

 struct Preference {
    
    static let pref = UserDefaults.standard
    
     static func commit(){
        pref.synchronize()
    }
    
     static func remove(key:String) {
        pref.removeObject(forKey: key)
    }
    
     static func saveBool(key:String,value:Bool){
        pref.set(value, forKey: key)
        commit()
    }
    
     static func saveDouble(key:String,value:Double){
        pref.set(value, forKey: key)
        commit()
    }
     static func saveInt(key:String,value:Int) {
        pref.set(value, forKey: key)
        commit()
    }
    
     static func saveString(key:String,value:String) {
        pref.set(value, forKey: key)
        commit()
    }
    
     static func saveObjectEncodable<T: Encodable>(dataModel: T, key: String){
        pref.set(try? PropertyListEncoder().encode(dataModel), forKey: key)
        commit()
    }
    
     static func getObjectDecodable<T: Decodable>(key: String)-> T? {
        if let data = pref.value(forKey: key) as? Data {
            let obj = try? PropertyListDecoder().decode(T.self, from: data)
            return obj
        }
        return nil
    }
    
     static func getString(key:String) -> String{
        if let string = pref.string(forKey: key) {
            return string
        }else{
            return ""
        }
    }
    
     static func getBool(key:String) -> Bool {
        if pref.bool(forKey: key) {
            return pref.bool(forKey: key)
        }else {
            return false
        }
    }
    
     static func getDouble(key:String) -> Double {
        return pref.double(forKey:key)
    }
    
     static func getInt(key:String) -> Int {
        return pref.integer(forKey: key)
    }
    
    
}
