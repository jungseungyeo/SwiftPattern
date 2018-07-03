//
//  ViewController.swift
//  BuilderPattern
//
//  Created by Jung seoung Yeo on 2018. 7. 2..
//  Copyright © 2018년 LinSaeng. All rights reserved.
//

import UIKit



// Builder
protocol Builder {
    var label: UILabel { get }
    func setText(with text: String) -> Builder
    func setTextColor(with textColor: UIColor) -> Builder
    func setFontSize(with textFontSize: CGFloat) -> Builder
}

// ConCreateBUilder 상세한 속성을 지정하는 역할
class ConCreateBuilder: Builder {
    var label: UILabel = UILabel()
    
    func setText(with text: String) -> Builder {
        label.text = text
        return self
    }
    
    func setTextColor(with textColor: UIColor) -> Builder {
        label.textColor = textColor
        return self
    }
    
    func setFontSize(with textFontSize: CGFloat) -> Builder {
        label.font = .systemFont(ofSize: textFontSize)
        return self
    }
}

// 객체를 만들어주는 역할
class Director {
    func makeLabel(builder: Builder) -> UILabel {
        let build = builder
        build.setText(with: "린생")
        build.setTextColor(with: .black)
        build.setFontSize(with: 40)
        return build.label
    }
}

class ViewController: UIViewController {
    
    private let director: Director = Director()
    
    // 체인형태의 속성 지정
    private let tmp_Label: UILabel = ConCreateBuilder()
        .setText(with: "린생 2")
        .setTextColor(with: .red)
        .setFontSize(with: 30)
        .label
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let label = director.makeLabel(builder: ConCreateBuilder())
        self.view.addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        // 2
        self.view.addSubview(tmp_Label)
        tmp_Label.frame = CGRect(x: 0, y: 200, width: 100, height: 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

