//
//  SingleTon.swift
//  SingleTonSample
//
//  Created by Jung seoung Yeo on 2018. 7. 5..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Foundation

class SingleTon {
    static let sharedInstance = SingleTon()
    
    private lazy var name: String = ""
    private lazy var age: Int = 0
    
    private init() { }
    
    func setProperty() {
        self.name = "린생"
        self.age = 28
    }
    
    func getProperty() -> (String, Int){
        return (self.name, self.age)
    }
}
