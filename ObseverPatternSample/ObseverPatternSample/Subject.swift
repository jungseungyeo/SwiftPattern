//
//  Subject.swift
//  ObseverPatternSample
//
//  Created by Jung seoung Yeo on 2018. 6. 8..
//  Copyright © 2018년 Jung seoung Yeo. All rights reserved.
//

class Subject {
    private var observers: [Observer] = [Observer]()
    private var value: Int = Int()
    
    var number: Int {
        set {
            value = newValue
            notify()
        }
        get {
            return value
        }
    }
    
    func attachObsever(_ obsever: Observer) {
        observers.append(obsever)
    }
    
    func notify() {
        for observer in observers {
            observer.update(number)
        }
    }
}
