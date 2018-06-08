//
//  main.swift
//  ObseverPatternSample
//
//  Created by Jung seoung Yeo on 2018. 6. 8..
//  Copyright © 2018년 Jung seoung Yeo. All rights reserved.
//

import Foundation

func main() {
    let subject = Subject()
    let _ = Linsaeng(subject)
    let _ = Harry(subject)
    
    subject.number = 2
    subject.number = 10
}

main()
