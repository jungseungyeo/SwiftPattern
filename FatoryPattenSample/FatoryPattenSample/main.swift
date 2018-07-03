//
//  main.swift
//  FatoryPattenSample
//
//  Created by Jung seoung Yeo on 2018. 5. 30..
//  Copyright © 2018년 Jung seoung Yeo. All rights reserved.
//

import Foundation

func main() {
     let pen = Pen()
     let bag = Bag()
     outputView(pen)          // 공장에서 펜을 만들었습니다.
     outputView(bag)          // 공장에서 가방을 만들었습니다.
}

func outputView(_ product: Factoryable) {
     print("공장에서 \(product.makeProduct())을 만들었습니다.")
     print(product.tmp())
}

main() 
