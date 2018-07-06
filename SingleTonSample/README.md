안녕하세요 린생입니다.

오늘은 SingleTon Pattern의 대하여 알아보겠습니다.

싱글톤이라 쉽게 생각해서 어플리케이션이 실행을 하여 단 한번만 메모리에 할당 된 후

그 메모리의 인스턴스를 할당 받아 사용하는 디자인 패턴입니다.

우리가 싱글톤을 사용하는 이유는 여러가지 있지만 대표적인 이유를 적어보겠습니다.

```
1. 메모리 낭비를 방지 할 수 있음
2. 데이터를 공유 할 수 있다.
```

즉 인스턴스가 절대적으로 한개만 존재하는 것을 보증하고 싶을 경우 사용을 합니다.

우리가 프로그래밍을 하면서 대표적으로 하나의 인스턴스가 존재해야 하는 경우는 무엇이 있을까요?

바로 network 객체 입니다.

네트워크는 하나의 세션으로 유지하다 연결이 이상시 알려주어야 합니다.

그러면 코드를 작성해 보겠습니다. 코드 작성 법은 아주 쉽습니다.

initialization을 private로 설정 해주면 됩니다.

```
class SingleTon {
    private static let sharedInstance = SingleTon()

    private init() { }
}
```

객체를 만들고 Instance는 static 메모리에 할당을 하고 initialzation을 private 설정 합니다.

그러면 정말로 싱클톤인지 확인을 해볼까요??

싱글톤 객체의 프로퍼티를 추가 하겠습니다.

```
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
```

이렇게 만들고 main에서 실행 하겠습니다.

```
func main() {
    let firstInstance = SingleTon.sharedInstance
    let secondInstance = SingleTon.sharedInstance

    firstInstance.setProperty()

    print(secondInstance.getProperty())

}
```

이렇게 실행 하면 결과 값은 어떻게 나올까요??

결과
```
("린생", 28)
```
이렇게 나오는 걸 알수 있습니다. ㅎㅎ

[블로그](http://linsaeng.tistory.com/9)
