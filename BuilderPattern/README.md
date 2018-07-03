빌더 패턴는 복잡한 객체의 생성을 그 객체의 표현과 분리하여, 생성 절차는 항상 동일하되 결과는 다르게 만드는 패턴입니다.

우리가 객체를 만들다보면 생성 당시의 많은 요소를 한번에 넣어주는 요소 하나를 일력을 받아서 생성을 하는 방식 입니다.

Swift에서는 Builder pattern을 잘 사용하지는 않지만 우리는 코드 베이스를 View 객체를 만들다 보면 속성 값을 지정 해 주어야 합니다.

그 속성을 넣어주는 방식은 주로 다음 과 같을 거 같습니다.

```
let labelView: UILabel = {
   let label = UILabel()
   label.text = "린생"
   label.textColor = .black
   label.font = .systemFont(sizeOf: 20)
   return label    
}()
```

이런게 생성된 labelView는 생성 당시 많은 값을 속성 값을 주어야 됩니다.
빌더 패턴을 사용하면 이러한 속성을 체이닝 형식으로 만들어 줄 수 있습니다.

Builder Pattern은 우선 역할을 나누는 것이 중요합니다.

역할은 크게 3가지로 나눌수 있습니다.

```
Director : 객체 생성 방식에 대한 책임
Builder  : 객체를 생성하는 추상 인터페이스
ConCreateBuilder : Builder의 구현 클래스, 객체 생성 결과에 대한 구체적인 구현 책임
Product : Builder를 이용해서 Director가 만들어 낸 최종 객체
```

Builder는 추상화 하는 작업이 필요합니다. 즉 Protocol을 통해 객체가 무엇을 할 수 있는지 나타내 주는 역할을 합니다.

ConCreateBuilder는 Builder를 채택하여 구현하는 클래스로 객체 생성 결과에 대한 구체적인 구현 책임을 나타내게 됩니다.
위의 let labelView를 보면 text를 저장하고 textColor를 저장하고 font를 저장합니다. 그런 속성을 구체적으로 저장하는 역할 입니다.

Director는 객체를 생성 하는 책임을 가지게 됩니다. 즉 객체가 생성을 할려면 Director를 통해서 생성을 이루어져야 하는 것입니다.

Product는 말 그대로 제품 == 객체를 말합니다.

그럼 구현을 해보겠습니다.

먼저 Builder를 만들어줍니다.

```
protocol Builder {
    var label: UILabel { get }
    func setText(with text: String) -> Builder
    func setTextColor(with textColor: UIColor) -> Builder
    func setFontSize(with textFontSize: CGFloat) -> Builder
}
```

Builder는 protocol로 구현을 하게 됩니다. 중요한 점은 return type을 Builder로 해주는 것입니다.

다음으로 ConCreateBuilder를 만들어 줍니다.

```
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
```

ConCreateBuilder는 Builder를 채택 후 상세한 구현 내용을 구현해주어야합니다.
즉, text를 받아서 text속성을 넣어 주는 형태를 만들어주는것이 중요합니다.

다음으로 Director를 만들어줍니다.

```
class Director {
    func makeLabel(builder: Builder) -> UILabel {
        let build = builder
        build.setText(with: "린생")
        build.setTextColor(with: .black)
        build.setFontSize(with: 40)
        return build.label
    }
}
```

Director는 값을 Builder를 파라미터로 받아서 기본 세팅을 하여 넘겨주는 형태 입니다. 마지막에 build.label을 해주어 모든 세팅을 끝나 후 UILabel 타입을 return해주면 됩니다.

즉 객체를 생성하여 return을 해주는 책임을 가지게 됩니다.

위의 3개의 Builder, ConCreateBuilder, Director를 이제 main에서 어떻게 쓰는 보여 드리겠습니다!! ㅎㅎ

```
class ViewController: UIViewController {
    private let director: Director = Director()

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = director.makeLabel(builder: ConCreateBuilder())
        self.view.addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

    }
}
```

director를 통해서 객체를 생성하고 주요 속성은 ConCreateBuilder 통해 지정을 해주고 Builder에서 그 추상화 작업을 통해 속성을 만들어 주면 됩니다!ㅎㅎ

결과 값
// 블로그 참조


또한 Builder pattern의 장점 중 속성을 체인 형태로 지정을 할 수 있습니다.

```
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
}
```


위의 체인 형태로 속성을 주는 형태로도 만들수 있다는건 좋은 거 같습니다. ㅎㅎ

[블로그](http://linsaeng.tistory.com/7)
