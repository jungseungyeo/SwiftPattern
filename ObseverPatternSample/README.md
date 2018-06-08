안녕하세요. 린생입니다.

오늘은 Swift Design Pattern 중 Observer Pattern을 소개하겠습니다.

번역을 하자면 Observer -> 관찰자라고 번역 할 수 있습니다.

왜 관찰자 일까요??

Observer Pattern은 해당 프로퍼티가 변경 되는걸 관찰하고 있다가 변경 되는 시점에서 update가 수행 되게 되는 형태를 말합니다.

쉽게 설명을 하자면 제가 지금 한 대상을 보고 있다가 그 대상이 어떻게 하는지를 보고 있다가 그 대상이 변화가 일어나면 제가 행동을 하는 것입니다.

우리가 코드를 만들다 보면 특정 값이 변경이 발생 할 때 다른 연쇄적으로 그 값을 참조 하고 하고 있는 값들이 자동 적으로 변경이 이루어 져야 될 때 사용 하면 유용한 패턴입니다.

그러면 코드로 생성 해 볼까요?

먼저 프로토콜을 생성 해줍니다.

protocol Observer {
    func update(_ notifyValue: Int) 
}

그리고 대상을 객체를 만들어줍니다.

class Subject {
    private var observers: [Observer] = [Observer]()
    private var value: Int = Int()

    // 변경을 되면 notify()를 호출
    var number: Int {
        set {
            value = number
            notify()
        }
        get {
            return value 
        }
    }

    // 옵저버 등록
    func attachObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    // 옵저버 알림
    func notify() {
        for observer in observers {
            observer.update(number)
        }
    }
}

처음 옵저버 패턴을 공부하시는 분들께서는 이 부분이 잘 이해가 되지 않을 거같습니다.

일단 이 Subject class를 설명 하자면 이 클래스는 관찰자들이 보고 있는 대상입니다.
즉 이 값의 value가 변경이 이루어 지면 observer들은 모두 그것을 인지할 수 있는 것입니다.

그래서 var number 에서 set 에 notify() 함수를 호출하게 됩니다.

이제 그러면 옵저버들을 생성 하겠습니다.

class Linsaeng: Observer {
    private var subject: Subject = Subject()
    
    init(_ subject: Subject) {
        self.subject = subject
        self.subject.attachObserver(self)
    }

    func update(_ notifyValue: Int) {
        print(“린생이 \(notifyValue)” 값으로 변경 된 것을 인식 하였습니다.)
    }
}

classclass Harry: Observer {
    private var subject: Subject = Subject()
    
    init(_ subject: Subject) {
        self.subject = subject
        self.subject.attachObserver(self)
    }

    func update(_ notifyValue: Int) {
        print(“해리가 \(notifyValue)” 값으로 변경 된 것을 인식 하였습니다.)
    }
}

옵저버들에게는 생성 될 때 관찰 대상을 넣어주고 초기화를 해주고 update 함수에서 필요한 작업을 하면 됩니다.

이제 main 함수에서 실행을 해볼까요?

func main() {
    let subject = Subject()
    let _ = Linsaeng(subject)
    let _ = Harry(subject)

    subject.number = 2    // 린생이 2 값으로 변경 된 것을 인식 하였습니다.
                          // 해리가 2 값으로 변경 된 것을 인식 하였습니다.

    subject.number = 4    // 린생이 4 값으로 변경 된 것을 인식 하였습니다.
                          // 해리가 4 값으로 변경 된 것을 인식 하였습니다.
}

이렇게 값들이 자기 저장되거나 변경 되는 순간에 Linsaeng, Harry 클래스에서 update 함수가 호출 되는 것을 확인 할 수 있습니다. ㅎㅎ

[블로그]\(http://linsaeng.tistory.com/6?category=753322)
