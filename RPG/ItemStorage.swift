//
//  ItemStorage.swift
//  RPG
//
//  Created by goggle CL on 2024/04/28.
//

import Foundation

class ItemStorage {
    static var myBuki:[Int] = [
        1,
        0,
        0,
        0,
        0
    ]
    
    
    
    static var myBougu:[Int] = [
        1,
        0,
        0,
        0,
    ]
    
    
    
    static var bukiArray: [String] = [
        "tsurugi_bronze_sabi_red",
        "tsurugi_bronze_red",
        "sword_shortsword_brown",
        "sword_longsword_monochrome",
        "sword_longsword_brown"
    ]
    static var bukiNameArray: [String] = [
        "錆びたブロンズソード",
        "ブロンズソード",
        "ショートソード",
        "ロングソード",
        "ブロンズロングソード"
    ]
    
    static var bukiAttackArray: [Int] = [
        1,
        3,
        2,
        4,
        5
    ]
    
    
    static var bukiPriceArray: [Int] = [
        100,
        100,
        200,
        100,
        100
    ]
    static var bukiKaisetuArray: [String] = [
        "名のとおり錆びている剣。他の剣より攻撃力が低い",
        "一般的な長さの剣",
        "一般的なものより短い剣",
        "一般的なものより長く、輝かしい剣",
        "一般的なものより長い剣"
    ]
    static var bouguArray: [String] = [
        "armor_koshiate_green",
        "armor_koshiate_blue",
        "armor_koshiate_red",
        "armor_koshiate_iron"
    ]
    static var bouguNameArray: [String] = [
        "風の防具",
        "水の防具",
        "炎の防具",
        "鉄の防具"
    ]
    static var bouguSutiArray: [Int] = [
        3,
        3,
        3,
        3
    ]
    
    static var bouguKaisetuArray: [String] = [
        "風属性の攻撃に耐性がある防具",
        "水属性の攻撃に耐性がある防具",
        "炎属性の攻撃に耐性がある防具",
        "一般的な防具"
    ]
    //自分が持っていないアイテムをフィルタリングする関数
    static func showNewBuki<T>(_ items: [T]) -> [T] {
        let myBuki = ItemStorage.myBuki
        
        let filteredBukiArray = zip(myBuki, items)
            .filter{ $0.0 == 0}
            .map { $0.1 }
        return filteredBukiArray
    }
    //自分が持っているアイテムをフィルタリングする関数
    static func showMyBuki<T>(_ items: [T]) -> [T]{
        let myBuki = ItemStorage.myBuki
        
        let filteredBukiArray = zip(myBuki, items)
            .filter{ $0.0 == 1}
            .map { $0.1 }
        return filteredBukiArray
    }
    
    
    static func showNewBougu<T>(_ items: [T]) -> [T] {
        let myBougu = ItemStorage.myBougu
        
        let filteredBouguArray = zip(myBuki, items)
            .filter{ $0.0 == 0}
            .map { $0.1 }
        return filteredBouguArray
    }
    
    
    static func showMyBougu<T>(_ items: [T]) -> [T]{
        let myBougu = ItemStorage.myBougu
        
        let filteredBouguArray = zip(myBuki, items)
            .filter{ $0.0 == 1}
            .map { $0.1 }
        return filteredBouguArray
    }
}
