안녕하세요. 린생입니다. 
오늘은 디자인 패턴 중에 팩토리 패턴을 소개를 할까 합니다.
영어로는 factory patten이라고 하는데 
왜 factory이라고 이름을 지었을까요?
우리가 어떤 제품을 공장에 요청 할 때 공장에서는 어떤 요구가 들어올지 알 수 가 없습니다.
즉 공장에서는 제품을 만들지만 요청에 따라서 A 제품이 나올수도 있고 B 제품이 나올수가 있습니다.
하지만 공장의 생산 라인이 달라지는 것은 아닙니다. 제품이 달라지는 거죠 
즉 위의 설명중

```
제품 : 객체 
공장 : protocol
생산라인 : protocol을 준수하는 메소드
```

이렇게 정의 할 수 있습니다.
protocol을 먼저 선언해 줍니다.

```
protocol Factoryable {
    func makeProduct() -> String
}
```


그리고 Factoryable을 채택하는 객체인 가방, 펜을 만들어 줍니다. 또 enum으로 ProductNumber를 만듭니다.

```
struct Pen: Factoryable {
    func makeProduct() -> String {
        return "펜"
    }
}
```

```
struct Bag: Factoryable {
    func makeProduct() -> String {
        return "가방"
    }
}
```

그리고 제품을 실행 합니다.

```
func outputView(_ product: Factoryable) {
    print(“공장에서 \(product.makeProduct())을 만들었습니다.")
} 
```

```
func main() {
    let pen = Pen()
    let bag = Bag()

    outputView(pen)    // 공장에서 펜을 만들었습니다.
    outputView(bag)    // 공장에서 가방을 만들었습니다.
}
```

중요한 점은 outputView에서 파라미터로 타입으로 프로토콜인 Fatoryable을 받아서 실행 한다는 점입니다.

여기서 Contoller는 main() 
view는 OutputView(_ product: Factoryable) 입니다.

즉 view에서는 이 대상이 무엇인지는 알 수가 없습니다. 
그냥 protocol을 받아서 실행을 하는 것뿐입니다.

즉 실행을 될 때까지 view에서 펜인지 가방인지 알 수 가 없습니다. 

이렇게 Factory패턴은 View가 해당 제품을 모르고 생상될 때 알 수 없게 하는 것이 중요합니다.

[블로그](http://linsaeng.tistory.com/5)