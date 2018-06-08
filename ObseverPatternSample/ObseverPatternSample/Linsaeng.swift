//
//  Linsaeng.swift
//  ObseverPatternSample
//
//  Created by Jung seoung Yeo on 2018. 6. 8..
//  Copyright © 2018년 Jung seoung Yeo. All rights reserved.
//

class Linsaeng: Observer {
    private var subject: Subject = Subject()
    
    init (_ subject: Subject) {
        self.subject = subject
        self.subject.attachObsever(self)
    }
    
    func update(_ notifyValue: Int) {
        print("린생이 \(notifyValue) 값으로 입력 된 걸 인지 하였스빈다.")
    }
}
