//
//  main.swift
//  SingleTonSample
//
//  Created by Jung seoung Yeo on 2018. 7. 5..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import Foundation

func main() {
    let firstInstance = SingleTon.sharedInstance
    let secondInstance = SingleTon.sharedInstance
    
    firstInstance.setProperty()
    
    print(secondInstance.getProperty())
    
}

main()
