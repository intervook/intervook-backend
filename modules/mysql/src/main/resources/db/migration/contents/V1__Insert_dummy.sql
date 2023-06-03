insert into quiz(category, type, title, answer, link)
values ('프론트', 'LONG_ANSWER', '브라우저의 렌더링 원리 - 브라우저의 렌더링 원리에 대해 설명해주세요.', '# 브라우저의 렌더링 원리

브라우저가 화면에 나타나는 요소를 렌더링 할 때, 웹킷(Webkit)이나 게코(Gecko) 등과 같은 [렌더링엔진](#gear-렌더링엔진) 을 사용합니다. 렌더링 엔진이 HTML, CSS, Javascript로 렌더링할 때 [CRP](#gear-crp)라는 프로세스를 사용하며 다음 단계들로 이루어집니다.

<br>

1. **HTML를 [파싱](#gear-파싱) 후, [DOM](#gear-dom)트리를 구축합니다.**
2. **CSS를 파싱 후, [CSSOM](#gear-cssom)트리를 구축합니다.**
3. **Javascript를 실행합니다.**
   - 주의! HTML 중간에 스크립트가 있다면 HTML 파싱이 중단됩니다.
4. **DOM과 CSSOM을 조합하여 [렌더트리](#gear-렌더트리)를 구축합니다.**
   - 주의! `display: none` 속성과 같이 화면에서 보이지도 않고 공간을 차지하지 않는 것은 렌더트리로 구축되지 않습니다.
5. **뷰포트 기반으로 렌더트리의 각 노드가 가지는 정확한 위치와 크기를 계산합니다. ([Layout](#gear-layout) 단계)**
6. **계산한 위치/크기를 기반으로 화면에 그립니다. ([Paint](#gear-paint) 단계)**

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 렌더링엔진

- 브라우저 마다 다르지만, 브라우저는 렌더링을 수행하는 렌더링 엔진을 가지고 있습니다. 크롬은 블링크(Blink), 사파리는 웹킷(Webkit) 그리고 파이어폭스는 게코(Gecko)라는 렌더링 엔진을 사용합니다.

### :gear: CRP

- CRP (Critical Rendering Path, 중요 렌더링 경로)는 브라우저가 HTML, CSS, Javascipt를 화면에 픽셀로 변화하는 일련의 단계를 말합니다. CRP는 Document Object Model (DOM), CSS Object Model (CSSOM), 렌더 트리 그리고 레이아웃을 포함합니다.

### :gear: 파싱

- 파싱은 하나의 프로그램을 런타임 환경(예를 들면, 브라우저 내 자바스크립트 엔진)이 실제로 실행할 수 있는 내부 포맷으로 분석하고 변환하는 것을 의미합니다. 즉, 파싱은 문서의 내용을 토큰(token)으로 분석하고, 문법적 의미와 구조를 반영한 파스 트리(parse tree)를 생성하는 과정입니다.

### :gear: DOM

- **DOM(Document Object Model)이란?** 웹 페이지를 이루는 태그들을 자바스크립트가 이용할 수 있게끔 브라우저가 트리구조로 만든 객체 모델을 의미합니다. 영어 뜻풀이 그대로 하자면 문서 객체 모델을 의미합니다. 문서 객체란 html, head, body와 같은 태그들을 javascript가 이용할 수 있는 (메모리에 보관할 수 있는) 객체를 의미합니다. DOM은 HTML과 스크립팅 언어(JavaScript)를 서로 이어주는 역할을 합니다.

### :gear: CSSOM

- **CSSOM(CSS Object Model)이란?** CSS 내용을 파싱하여 자료를 구조화 한 것을 CSSOM이라고 합니다. 즉 DOM처럼 CSS의 내용을 해석하고 노드를 만들어 트리 구조로 만든 것을 CSSOM이라 합니다.

### :gear: 렌더트리

- **렌더트리(Render Tree)란?** 렌더 트리는 CSSOM과 DOM 트리의 결합으로 만들어집니다. 렌더 트리는 웹 페이지에 나타낼 각 요소들의 위치(Layout, 레이아웃)을 계산하는데 사용되고 픽셀을 화면에 렌더링하는 페인트(Paint) 즉 화면에 요소들을 표현하는 프로세스를 위해 존재합니다.

### :gear: Layout

- **Layout(Reflow)이란?** 뷰포트 내에서 노드의 정확한 위치와 크기를 계산합니다. 이것이 바로 \'Layout\' 단계이며 경우에 따라 \'Reflow\' 라고도 합니다.

### :gear: Paint

- **Paint란?** 노드와 해당 노드의 계산된 스타일 및 기하학적 형태에 대해 파악했으므로, 렌더링 트리의 각 노드를 화면의 실제 픽셀로 변환하는 마지막 단계에 이러한 정보를 전달합니다. 이 단계를 흔히 \'페인팅\' 또는 \'래스터화\'라고 합니다.

<br>

## 참고

- [Medium, 브라우저의 렌더링 과정](https://github.com/baeharam/Must-Know-About-Frontend/blob/main/Notes/frontend/browser-rendering.md),
- [Github, 브라우저의 렌더링 원리](https://medium.com/%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%9D%98%ED%92%88%EA%B2%A9/%EB%B8%8C%EB%9D%BC%EC%9A%B0%EC%A0%80%EC%9D%98-%EB%A0%8C%EB%8D%94%EB%A7%81-%EA%B3%BC%EC%A0%95-5c01c4158ce)
- [MDN Web Docs, 중요 렌더링 경로](https://developer.mozilla.org/ko/docs/Web/Performance/Critical_rendering_path)
- [Blog, 파싱이란? 파싱의 뜻은 무엇일까?(번역)](https://oneroomtable.tistory.com/entry/%ED%8C%8C%EC%8B%B1%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%BC%EA%B9%8C-%EB%B2%88%EC%97%AD)
- [Blog, DOM이란? 가상 돔 (Virtual DOM )이 나오게 된 이유](https://dev-cini.tistory.com/10)
- [Blog, CSSOM(CSS Object Model) 이란?](https://itworldyo.tistory.com/151)
- [Blog, 렌더 트리 (Render Tree)](https://sgcomputer.tistory.com/172)
- [Blog, 레이아웃(리플로우) 및 페인트](https://velog.io/@seokkitdo/%EB%A0%88%EC%9D%B4%EC%95%84%EC%9B%83%EB%A6%AC%ED%94%8C%EB%A1%9C%EC%9A%B0-%EB%B0%8F-%ED%8E%98%EC%9D%B8%ED%8A%B8)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/browser-rendering.md'),
       ('프론트', 'LONG_ANSWER', 'Reflow와 Repaint가 실행되는 시점 - Reflow와 Repaint가 실행되는 시점에 대해 말씀해주세요.', '# Reflow와 Repaint가 실행되는 시점

<br>

### [Reflow](#gear-Reflow)

- DOM 엘리먼트 추가, 제거 또는 변경
- CSS 스타일 추가, 제거 또는 변경
- CSS 스타일을 직접 변경하거나, 클래스를 추가함으로써 레이아웃이 변경될 수 있습니다. 엘리먼트의 길이를 변경하면, DOM 트리에 있는 다른 노드에 영향을 줄 수 있습니다.
- CSS3 애니메이션과 트랜지션. 애니메이션의 모든 프레임에서 리플로우가 발생합니다.
- offsetWidth 와 offsetHeight 의 사용. offsetWidth 와 offsetHeight 속성을 읽으면, 초기 리플로우가 트리거되어 수치가 계산됩니다.
- 유저 행동. 유저 인터랙션으로 발생하는 hover 효과, 필드에 텍스트 입력, 창 크기 조정, 글꼴 크기 변경, 스타일시트 또는 글꼴 전환등을 활성화하여 리플로우를 트리거할 수 있습니다.

### [Repaint](#gear-Repaint)

- 가시성이 변경되는 순간 (opacity, background-color, visibility, outline)
- Reflow 가 실행된 순간 뒤에 실행됩니다.

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: Reflow

- 생성된 DOM 노드의 레이아웃 수치(너비, 높이, 위치 등) 변경 시 영향 받은 모든 노드의(자신, 자식, 부모, 조상(결국 모든 노드) ) 수치를 다시 계산하여(Recalculate), 렌더 트리를 재생성하는 과정을 Reflow 라고 합니다.

### :gear: Repaint

- Reflow 과정이 끝난 후 재 생성된 렌더 트리를 다시 그리게 되는데 이 과정을 Repaint 라고 합니다.

<br>

## 참고

- [github, Reflow & Repaint](https://k0102575.github.io/articles/2020-11/reflow-repaint)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/reflow-repaint.md'),
       ('프론트', 'LONG_ANSWER', '주소창에 google.com을 입력하면 일어나는 일 - 주소창에 google.com을 입력하면 일어나는 일에 대해 말씀해주세요.', '# 주소창에 google.com을 입력하면 일어나는 일

1. **사용자가 웹 브라우저를 통해 google.com 을 입력하면 URL 주소 중 도메인 네임 부분을 [DNS](#gear-dns) 서버에서 검색합니다.**
2. **DNS 서버에서 해당 도메인 네임에 해당하는 IP 주소를 찾아 사용자가 입력한 [URL](#gear-url) 정보와 함께 전달합니다.**
3. **브라우저는 [HTTP](#gear-http) [프로토콜](#gear-프로토콜)을 사용하여 요청 메시지를 생성하고 HTTP 요청 메시지는 [TCP](#gear-tcp)/[IP](#gear-ip) 프로토콜을 사용하여 서버로 전송됩니다.**
4. **서버는 [response](#gear-response) 메시지를 생성하여 다시 브라우저에게 데이터를 전송합니다.**
5. **브라우저는 response를 받아 [파싱](#gear-파싱)하여 화면에 [렌더링](#gear-렌더링)합니다.**

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: DNS

- 도메인 이름 시스템(DNS)은 사람이 읽을 수 있는 도메인 이름(예: www.amazon.com )을 머신이 읽을 수 있는 IP 주소(예: 192.0.2.44)로 변환합니다. 모든 통신에는 주소가 필요합니다. 출발지와 도착지의 주소를 알아야 통신을 할 수 있습니다. 우리는 이 주소를 IP라고 부릅니다. IP 주소로 변환하는 과정에 개입하는 것이 DNS 입니다.

### :gear: URL

- URL(Uniform Resource Locator)은 통합 자원 지시자로 인터넷의 리소스를 가리키는 표준 명칭으로 서버의 자원을 요청할 때 사용됩니다. URL을 통해 인터넷 상의 모든 리소스를 요청할 수 있으며, HTTP, FTP 등의 자원 요청도 가능합니다.

### :gear: HTTP

- HTTP(HyperText Transfer Protocol)은 TCP 기반의 클라이언트와 서버 사이에 이루어지는 요청/응답 프로토콜입니다. HTTP는 Text Protocol로 사람이 쉽게 읽고 쓸 수 있습니다. 프로토콜 설계상 클라이언트가 요청을 보내면 반드시 응답을 받아야 합니다. 응답을 받아야 다음 request를 보낼 수 있습니다.

### :gear: 프로토콜

- 프로토콜은 통신하기 위한 약속들을 기술적으로 잘 정의해 둔 것입니다. 데이터를 송수신하는 순서와 내용을 결정합니다. HTTP, TCP/IP, UDP 모두 프로토콜입니다.

### :gear: TCP

- TCP (전송 제어 프로토콜)은 두 개의 호스트를 연결하고 데이터 스트림을 교환하게 해주는 중요한 네트워크 프로토콜입니다. TCP는 데이터 전송을 제어하고 데이터를 어떻게 보낼 지, 어떻게 맞출 지 정합니다. 또한 데이터와 패킷이 보내진 순서대로 전달하는 것을 보장해줍니다.신뢰성과 연결성을 책임지기 위한 프로토콜이 TCP입니다. 호스트와 호스트간의 데이터 전송은 IP(인터넷 계층 프로토콜)에 의지하면서 동시에 신뢰성 있는 전송에 대해서는 TCP가 책임지는 구조입니다.

### :gear: IP

- IP (Internet Protocol)은 비신뢰성, 비연결지향 데이터그램 프로토콜로 패킷을 받아서 주소를 해석하고 경로를 결정하여 다음 호스트로 전송하는 역할을 합니다.

### :gear: response

- HTTP 메시지는 서버와 클라이언트 간에 데이터가 교환되는 방식입니다. 메시지 타입은 두 가지가 있습니다. 요청(request)은 클라이언트가 서버로 전달해서 서버의 액션이 일어나게끔 하는 메시지고, 응답(response)은 요청에 대한 서버의 답변입니다.

### :gear: 파싱

- 파싱은 하나의 프로그램을 런타임 환경(예를 들면, 브라우저 내 자바스크립트 엔진)이 실제로 실행할 수 있는 내부 포맷으로 분석하고 변환하는 것을 의미합니다. 즉, 파싱은 문서의 내용을 토큰(token)으로 분석하고, 문법적 의미와 구조를 반영한 파스 트리(parse tree)를 생성하는 과정입니다.

<br>

## 참고

- [blog, [네트워크]google.com을 입력하면 일어나는 일](https://bohyeon-n.github.io/deploy/network/internet-2.html)
- [AWS, DNS란 무엇입니까?](https://aws.amazon.com/ko/route53/what-is-dns/)
- [blog, URL이란](https://velog.io/@mer1-97/URL%EC%9D%B4%EB%9E%80)
- [mdn web docs, HTTP](https://developer.mozilla.org/ko/docs/Web/HTTP/Overview)
- [mdn web docs, 프로토콜](https://developer.mozilla.org/ko/docs/Glossary/Protocol)
- [mdn web docs, TCP](https://developer.mozilla.org/ko/docs/Glossary/TCP)
- [Blog, 파싱이란? 파싱의 뜻은 무엇일까?(번역)](https://oneroomtable.tistory.com/entry/%ED%8C%8C%EC%8B%B1%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%BC%EA%B9%8C-%EB%B2%88%EC%97%AD)
',
        'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/what-happens-when-type-google.md'),
       ('프론트', 'LONG_ANSWER', '호이스팅(hoisting)이란? - 호이스팅에 대해서 설명해주세요.', '# 호이스팅(hoisting)이란?

호이스팅이란 "끌어올린다" 라는 뜻으로 **변수 및 함수 선언문이 스코프 내의 최상단으로 끌어올려지는 현상** 을 말합니다. 여기서 주의할 점은 **"선언문"** 이라는 것이며 "대입문"은 끌어올려지지 않습니다.

<br>

> ### 모범 답변([medium 링크 참고](https://medium.com/@limsungmook/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EB%8A%94-%EC%99%9C-%ED%94%84%EB%A1%9C%ED%86%A0%ED%83%80%EC%9E%85%EC%9D%84-%EC%84%A0%ED%83%9D%ED%96%88%EC%9D%84%EA%B9%8C-997f985adb42))
>
> 실행 컨텍스트 생성 시 렉시컬 스코프 내의 선언이 끌어올려 지는 게 호이스팅입니다.

<br>

---

<br>

```javascript
console.log(a);
var a = 2;
```

컴파일러는 자바스크립트 엔진이 [인터프리팅](#gear-인터프리팅)을 하기 전에 컴파일을 하는데 이 때, `var a = 2;` 를 2개의 구문으로 봅니다.

- `var a`
- `a = 2`

`var a` 는 변수 선언문으로 컴파일을 할 때 처리하고, `a = 2` 는 실행할 때까지 내버려둡니다. 따라서, 변수 a는 호이스팅 되고 콘솔에는 다음과 같은 결과가 나옵니다.

```javascript
undefined;
```

> var는 선언, 초기화가 동시에 이루어지기 때문에 undefined를 출력하지만 let,const는 선언단계만 호이스팅 되기 때문에 Reference Error를 출력합니다.

<br>

[함수선언문](#gear-함수선언문)의 경우도 호이스팅 됩니다.

```javascript
func();
function func() {
  console.log(\'함수 호이스팅\');
}
```

```
함수 호이스팅
```

> 함수 호이스팅에서 주의할 점: [함수표현식](#gear-함수표현식)은 호이스팅 되지 않습니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 인터프리팅

- 인터프리팅(Interpreting)은 컴파일과 다르게 소스 코드를 한 번에 읽어서 번역하지 않고, 런타임 상태의 소스코드를 한 줄 한 줄 번역하면서 프로그램을 구동하는 방식입니다. 한 줄 한 줄 번역한 코드가 바로 기계어가 되는 것은 아니고 중간 코드(intermediate code)로 번역됩니다. 이 중간 코드는 다른 프로그램에 의하여 기계어로 번역되어 실행됩니다.

### :gear: 함수선언문

- 변수를 선언하는 것(const,let 등)처럼 함수 선언은 function으로 시작합니다. 선언 된 함수는 나중 사용을 위해 저장되며, call 될 때 실행됩니다.

### :gear: 함수표현식

- 자바스크립트 함수는 표현식을 사용하여 정의 될 수 있으며, 함수 표현식은 변수로 저장될 수 있습니다.

```js
var x = function (a, b) {
  return a * b;
};
```

함수 표현식이 변수에 저장되면, 변수는 함수처럼 사용 가능해집니다. 변수에 저장된 함수는 함수명이 필요 없으며, 변수 이름을 통하여 호출됩니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행 질문 답변](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80)
- [Github, 호이스팅](https://github.com/baeharam/Must-Know-About-Frontend/blob/main/Notes/javascript/hoisting.md)
- [blog, 컴파일과 인터프리팅](https://honggom.tistory.com/158)
- [blog, 함수 표현식vs함수 선언식](https://velog.io/@bisu8018/%ED%95%A8%EC%88%98-%ED%91%9C%ED%98%84%EC%8B%9D-VS-%ED%95%A8%EC%88%98-%EC%84%A0%EC%96%B8%EC%8B%9D)
- [medium, 자바스크립트는 왜 프로토타입을 선택했을까](https://medium.com/@limsungmook/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EB%8A%94-%EC%99%9C-%ED%94%84%EB%A1%9C%ED%86%A0%ED%83%80%EC%9E%85%EC%9D%84-%EC%84%A0%ED%83%9D%ED%96%88%EC%9D%84%EA%B9%8C-997f985adb42)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/hoisting.md'),
       ('프론트', 'LONG_ANSWER', '클로저(Closure)란? - 클로저에 대해서 설명해주세요.', '# 클로저(Closure)란?

함수와 함수가 선언된 어휘적 환경의 조합입니다.(MDN 정의) 또한 **함수가 속한 [렉시컬스코프](#gear-렉시컬스코프)를 기억하여 함수가 렉시컬 스코프 밖에서 실행될 때도 그 스코프에 접근할 수 있게 하는 기능** 을 말합니다.

```javascript
function outer() {
  var a = 2;
  function inner() {
    console.log(a);
  }
  return inner;
}
var func = outer();
func(); // 2
```

여기서 GC([GarbageCollector](#gear-garbagecollector))가 `outer()` 의 참조를 없앨 것 같지만 내부함수인 `inner()` 가 해당 스코프의 변수인 a를 참조하고 있기 때문에 없애지 않습니다. 따라서 스코프 외부에서 `inner()` 가 실행되도 해당 스코프를 기억하기 때문에 2를 출력하게 됩니다. 즉, 여기서 클로저는 `inner()` 가 되며 `func` 에 담겨 밖에서도 실행되고 렉시컬 스코프를 기억합니다.

<br>

> 위의 코드와 같은 방식으로 자바스크립트에는 없는 캡슐화라는 개념을 구현할 수 있고 정보 은닉과 캡슐화가 가져다주는 이점들을 얻을 수 있습니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 렉시컬스코프

- 렉시컬 스코프는 함수를 어디서 호출하는지가 아니라 어디에 선언하였는지에 따라 결정됩니다. 자바스크립트는 렉시컬 스코프를 따르므로 함수를 선언한 시점에 상위 스코프가 결정됩니다. 함수를 어디에서 호출하였는지는 스코프 결정에 아무런 의미를 주지 않습니다.

### :gear: GarbageCollector

- 메모리에 할당된 값이 더는 필요하지 않다고 판단될때 메모리를 해제시키는 과정을 가비지 컬렉션이라고 부르며 이 역할을 가비지 컬렉터가 맡고 있습니다. 가비지 컬렉터가 ‘필요없다’라고 판단하는 기준은 더 이상 \'객체에 닿을 수 없을 때\'를 말합니다. 닿는다는 roots(전역 변수)를 기준으로 참조, 또는 참조의 참조의… 참조가 되는 객체들입니다. 이 알고리즘을 mark and sweep이라고 부르는데 가비지 컬렉터는 ‘root에서 닿을 수 있는’ 객체들의 reachable을 true로 표시하고, false인 객체들은 메모리에서 해제시킵니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행 질문 답변](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80)
- [Github, 클로저](https://github.com/baeharam/Must-Know-About-Frontend/blob/main/Notes/javascript/closure.md)
- [poiemaweb, scope](https://poiemaweb.com/js-scope)
- [[JS] Closure와 Garbage Collection](https://dkje.github.io/2020/09/18/Closure/)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/closure.md'),
       ('프론트', 'LONG_ANSWER', 'CSS에서 margin과 padding이란? - CSS에서 margin과 padding에 대해서 설명해주세요.', '# CSS에서 margin과 padding이란?

- margin: 바깥쪽 여백을 의미합니다.

- padding: 안쪽 여백을 의미합니다.

<br>

---

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행 질문 답변](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/margin-padding.md'),
       ('프론트', 'LONG_ANSWER', 'CSS에서 position이란? - CSS에서 position을 어떻게 사용하는지 설명해주세요.', '# CSS에서 position이란?

position 속성은 문서 상에 요소를 배치하는 방법을 지정합니다.

- `static`: 요소를 일반적인 문서 흐름에 따라 배치합니다.

- `relative`: `static` + 자신을 기준으로 `top`, `right`, `bottom`, `left`의 값에 따라 [오프셋](#gear-오프셋)을 적용합니다.

- `absolute`: 요소를 일반적인 문서 흐름에서 제거하고, 가장 가까운 위치 지정 조상 요소에 대해 상대적으로 배치합니다.

- `fixed`: 요소를 일반적인 문서 흐름에서 제거하고, [뷰포트](#gear-뷰포트)의 초기 [컨테이닝블록](#gear-컨테이닝블록)을 기준으로 삼아 배치합니다. => 바뀌지 않는 위치에 지정

- `sticky`: `static` + `fixed` 특징을 동시에 가집니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 오프셋

- 오프셋(offset)이란 `top`, `left`, `right`, `bottom` 값을 의미하고 기준이 되는곳으로부터 얼마만큼 떨어져있는지를 나타내기 위해 필요한 속성입니다.

### :gear: 뷰포트

- 뷰포트(viewport)는 화면에서 실제 내용이 표시되는 영역으로, 데스크톱은 사용자가 설정한 해상도가 뷰포트 영역이 되고, 스마트 기기는 기본으로 설정되어 있는 값이 뷰포트 영역이 됩니다.

### :gear: 컨테이닝블록

- 컨테이닝 블록이란 요소의 위치와 크기를 지정하는 데 사용하는 블록을 의미합니다. 상대적인 값이나, 요소의 위치를 지정하는 기준이 필요할 때 사용한다는 의미힙니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행 질문 답변](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80)
- [blog, CSS Position](https://mingeesuh.tistory.com/3)
- [blog, 뷰포트 (viewport)](https://masssal.tistory.com/34)
- [blog, 컨테이닝 블록](https://velog.io/@1-blue/%EC%BB%A8%ED%85%8C%EC%9D%B4%EB%8B%9D-%EB%B8%94%EB%A1%9D)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/position.md'),
       ('프론트', 'LONG_ANSWER', 'REST API란? - REST API란 무엇인지 설명해주세요.', '# REST API란?

[REST](#gear-rest) 원칙을 적용하여 서비스 [API](#gear-api)를 설계한 것을 말합니다.

### REST란 무엇인가?

- [자원](#gear-자원)을 이름으로 구분하여 해당 자원의 상태를 주고받는 모든 것입니다. HTTP [URI](#gear-uri)를 통해 자원을 명시하고 HTTP 메서드(POST, GET, PUT, DELETE)를 통해 해당 자원에 대한 [CRUD](#gear-crud)를 적용하는 것을 말합니다.
- 즉, 자원 기반의 구조 설계의 중심에 자원이 있고, HTTP 메서드를 통해 이를 처리합니다.

### API란 무엇인가?

- 응용프로그램에서 사용할 수 있도록 운영 체제나 프로그래밍 언어가 제공하는 기능을 제어할 수 있게 만든 인터페이스입니다.
- 쉽게 말해 프로그램끼리 통신할 수 있도록 하는 중재자입니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: REST

- REpresentational State Transfer의 약자로 전반적인 웹 어플리케이션에서 상호작용하는데 사용되는 웹 아키텍쳐 모델입니다. 즉, 자원을 주고받는 웹 상에서의 통신 체계에 있어서 범용적인 스타일을 규정한 아키텍쳐 라고 할 수 있습니다.

### :gear: API

- Application Programming Interface의 약자로 구글 맵 API, 카카오 비전 API 등 기존에 있는 응용 프로그램을 통해서 데이터를 제공받거나 기능을 사용하고자 할 때 사용하는 인터페이스 및 규격 을 말합니다. API는 프로그래밍 언어, 운영체제 등에서도 사용되는 범용적인 용어입니다. 따라서, REST API라는 것은 REST 원칙을 적용하여 서비스 API를 설계한 것을 말하며 대부분의 서비스가 REST API를 제공합니다.

### :gear: 자원

- 자원(Resource)은 문서, 그림, DB, 이미지, 동영상, 해당 소프트웨어 자체 등의 웹에서 사용되는 모든 자료를 의미합니다.

### :gear: URI

- URI는 Uniform Resource Identifier의 약자이며, 리소스(전화,지도,이미지,텍스트)에 접근할 수 있는 유일한(Uniform) 식별자(Identifier)를 의미합니다. URI를 수신하는 기기는 해당 URI에 맞게 데이터를 반환합니다.

### :gear: CRUD

- CRUD는 대부분의 컴퓨터 소프트웨어가 가지는 기본적인 데이터 처리 기능인 Create(생성), Read(읽기), Update(갱신), Delete(삭제)를 묶어서 일컫는 말입니다. 사용자 인터페이스가 갖추어야 할 기능(정보의 참조/검색/갱신)을 가리키는 용어로서도 사용됩니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행 질문 답변](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80)
- [Github, REST API](https://github.com/baeharam/Must-Know-About-Frontend/blob/main/Notes/network/rest-api.md)
- [blog, CRUD란?](https://livedata.tistory.com/3)
- [blog, URI,URL,URN의 차이](https://kotlinworld.com/96)
- [blog, URI, URL이란?](https://grape-blog.tistory.com/10)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/rest-api.md'),
       ('프론트', 'LONG_ANSWER', 'this의 용법 - this의 용법에 대해 아는대로 설명해주세요.', '# this의 용법

this는 호출 패턴에 따라 다른 객체를 참조합니다. 실행 컨텍스트([EC](#gear-ec))가 생성될 때마다 this의 [바인딩](#gear-바인딩)이 일어나며 우선순위 순으로 나열해보면 다음과 같습니다.

<br>

1. [`new`](#gear-new) 를 사용했을 때 해당 객체로 바인딩됩니다.

```javascript
var name = \'global\';
function Func() {
  this.name = \'Func\';
  this.print = function f() {
    console.log(this.name);
  };
}
var a = new Func();
a.print(); // Func
```

2. [`call`](#gear-call), [`apply`](#gear-apply), [`bind`](#gear-bind) 와 같은 명시적 바인딩을 사용했을 때 인자로 전달된 객체에 바인딩됩니다.

```javascript
function func() {
  console.log(this.name);
}
var obj = { name: \'obj name\' };
func.call(obj); // obj name
func.apply(obj); // obj name
func.bind(obj)(); // obj name
```

3. 객체의 메소드로 호출할 경우 해당 객체에 바인딩됩니다.

```javascript
var obj = {
  name: \'obj name\',
  print: function p() {
    console.log(this.name);
  },
};
obj.print(); // obj name
```

4. 그 외의 경우

- strict mode(엄격 모드): `undefined` 로 초기화됩니다.
- 일반: 브라우저라면 `window` 객체에 바인딩됩니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 바인딩

- 바인딩(Binding) 이란 프로그램의 어떤 기본 단위가 가질 수 있는 구성요소의 구체적인 값, 성격을 확정하는 것을 말합니다.

### :gear: EC

- EC는 실행 컨텍스트(Execution Context)의 약자이며 scope, hoisting, this, function, closure 등의 동작원리를 담고 있는 자바스크립트의 핵심원리입니다.

### :gear: new

- new라는 기호는 자바스크립트의 고유의 예약어이며 고유의 연산자(operator) 입니다. 아래는 자바스크립트의 new라는 연산자(operator)에 대한 정의 입니다.

> new 연산자는 사용자 정의 객체 타입 또는 내장 객체 타입의 인스턴스를 생성한다.

### :gear: call

- call을 사용하면 함수를 실행하고 함수의 첫 번째 인자로 전달하는 값에 this를 바인딩합니다.

### :gear: apply

- call과 마찬가지로 apply를 사용하면 함수를 실행하고 함수의 첫 번째 인자로 전달하는 값에 this를 바인딩합니다. call과의 차이점은 인자를 배열의 형태로 전달한다는 것입니다. 이 때, 인자로 배열 자체가 전달되는 것이 아니라, 배열의 요소들이 값으로 전달됩니다.

### :gear: bind

- bind는 함수의 첫 번째 인자에 this를 바인딩한다는 점은 같지만, 함수를 실행하지 않으며 새로운 함수를 반환합니다. 즉 반환된 새로운 함수를 실행해야 원본 함수가 실행됩니다.

<br>

## 참고

- [blog, this의 모든 것](https://samsara1019.tistory.com/75)
- [Github, this의 바인딩](https://github.com/baeharam/Must-Know-About-Frontend/blob/main/Notes/javascript/this.md)
- [poiemaweb, 실행 컨텍스트](https://poiemaweb.com/js-execution-context)
- [blog, 바인딩(Binding)](https://medium.com/pocs/%EB%B0%94%EC%9D%B8%EB%94%A9-binding-4a4a2f641b27)
- [blog, 자바스크립트 new연산자](https://lts0606.tistory.com/448)
- [blog, 자바스크립트 call,apply,bind ](https://oneroomtable.tistory.com/entry/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-call-apply-bind-%EC%84%A4%EB%AA%85)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/this.md'),
       ('프론트', 'LONG_ANSWER', '브라우저 저장소의 차이점 - 브라우저 저장소의 차이점에 대해 설명해주세요. (LocalStorage,SessionStorage,Cookie)', '# 브라우저 저장소의 차이점

### LocatStorage

- 로컬 스토리지는 저장한 데이터를 지우지 않는 이상 영구적으로 보관이 가능합니다.([도메인](#gear-도메인)마다 별도로 로컬 스토리지가 생성됩니다.)
- 최대 크기: 5MB
- 사용 예시: 자동 로그인

### SessionStorage

- 세션 종료 시 클라이언트에 대한 정보가 삭제됩니다.
- 최대 크기: 5MB
- 사용 예시: 입력 폼 정보, 비로그인 장바구니

### [쿠키](#gear-쿠키)(Cookie)

- 웹 사이트에서 쿠키를 설정하면, 모든 웹 요청에는 쿠키 정보가 포함됩니다. => 서버 부담 증가
- 최대 크기: 4KB
- 사용 예시: 팝업 창

### 서버 인증과 브라우저 저장소

- 주요 정보를 요청 헤더에 넣는 방법

  > 보안에 매우 취약합니다.

- Session, Cookie 방식

  > 서버 부하가 증가하고, 세션 하이재킹 공격에 취약합니다.

- [JWT](#gear-jwt) 방식
  > 별도의 브라우저 저장소에 저장하지 않고 JWT를 발급하고 검증하면 되어 확장성이 뛰어납니다.<br>
  > 그러나 Payload 정보가 제한적이고, JWT길이가 길다는 단점 존재합니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 도메인

- ip는 사람이 이해하고 기억하기 어렵기 때문에 이를 위해서 각 ip에 이름을 부여할 수 있게 했는데, 이것을 도메인이라고 합니다.

### :gear: 쿠키

- 쿠키(Cookie)란 인터넷 사용자가 어떠한 웹 사이트를 방문할 경우 그 사이트가 사용하고 있는 서버를 통해 인터넷 사용자의 컴퓨터에 설치되는 작은 기록 정보 파일입니다.

### :gear: JWT

- JWT(Json Web Token)란 Json 포맷을 이용하여 사용자에 대한 속성을 저장하는 Claim 기반의 Web Token입니다. JWT는 토큰 자체를 정보로 사용하는 Self-Contained 방식으로 정보를 안전하게 전달합니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#%EB%B8%8C%EB%9D%BC%EC%9A%B0%EC%A0%80-%EC%A0%80%EC%9E%A5%EC%86%8C%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90)
- [생활코딩, 도메인이란?](https://opentutorials.org/course/228/1450)
- [blog, 쿠키(Cookie)란?](https://stupidsecurity.tistory.com/9)
- [blog, JWT란?](https://mangkyu.tistory.com/56)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/web-storage.md'),
       ('프론트', 'LONG_ANSWER', 'Restful API - Restful API에 대해 아는대로 설명해주세요. (GET, PUT, POST, PATCH, OPTION, DELETE)', '# Restful API

[`REST API`](https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/rest-api.md)를 제공하는 웹사이트를 RESTful 하다고 할 수 있습니다. RESTful API를 통해 이해하기 쉬운 API를 만드는 것이 목적입니다.

> - `GET`: 요청받은 URI의 정보를 검색하여 응답합니다.
> - `POST`: 요청된 자원을 생성합니다.
> - `DELETE`: 요청된 자원을 삭제할 것을 요청합니다.
> - `PUT`: 요청된 자원을 (전체를) 수정합니다.

<br>

> - `PATCH`: 요청된 자원 (일부를) 수정합니다.
> - `HEAD`: GET 방식과 동일, 하지만 응답에 BODY가 존재하지 않으며, 응답코드와 HEAD 만 응답합니다.
> - `CONNECT`: 동적으로 [터널모드](#gear-터널모드)를 교환, [프록시](#gear-프록시) 기능을 요청시 사용합니다.
> - `TRACE`: 원격지 서버에 [루프백](#gear-루프백) 메세지를 호출하기 위해 테스트용으로 사용합니다.
> - `OPTIONS`: 웹서버에서 지원되는 메서드의 종류를 확인할 경우 사용합니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 터널모드

- IPSec에는 두 가지 모드가 있는데, IP의 내용(payload)만을 보호하느냐, 아니면 헤더까지 모두 보호하느냐에 따라서 전자는 `전송 모드(Transport Mode)`, 후자는 `터널 모드(Tunnel Mode)`라고 합니다.

### :gear: 프록시

- 프록시(Proxy) 는 ‘대리\', \'대신\' 이라는 뜻을 가집니다. 주로 보안상의 문제를 방지하기 위해, 직접 통신하지 않고 중계자를 거친다는 개념입니다.

### :gear: 루프백

- 루프백(loopback) 이란 가상의 인터페이스를 만들어서 사용하는 것입니다. 인터페이스 예로는 LAN구간 , WAN구간 마다 다르겠지만 Serial와 Ethernet이 FastEthernet 등등 다양한 인터페이스가 존재합니다. 물리적인 인터페이스의 경우 Serial 일때 Clock rate , WAN 인캡슐레이션 등 부여를 해야하고 이는 즉 외부에 간섭을 받는다는 말이 됩니다. 하지만 loopback은 설정을 하지 않아도 되며, 라우터가 죽지 않는 이상 잘 돌아가게 됩니다. 다른 인터페이스는 죽으면 통신이 안되지만 loopback 은 그렇지 않기 때문에 비교적 안전한 인터페이스라고 말합니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#restful-api)
- [blog, IPSEC 개념과 원리, 특징](https://reakwon.tistory.com/108)
- [blog, 프록시(Proxy)란?](https://iforint.tistory.com/145)
- [blog,루프백이란?](https://min-310.tistory.com/169)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/restful-api.md'),
       ('프론트', 'LONG_ANSWER', 'JavaScript는 어떤 언어일까? - JavaScript는 어떤 언어인가요?', '# JavaScript는 어떤 언어일까?

JavaScript는 `싱글 스레드`이면서 `논 블록킹` 언어입니다.

> ### 싱글 스레드 논 블록킹
>
> - 자바스크립트는 비동기 처리를 통해 싱글 스레드이지만 블록킹 되지 않게 합니다.
>   하나의 요청이 완료될 때까지 기다리지 않고 동시에 다른 작업을 수행함으로써 문제를 해결합니다.

> ### 싱글 스레드
>
> - 스레드가 하나밖에 존재하지 않아 한번에 하나의 작업만 할 수 있습니다.

> ### 스레드
>
> - 어떠한 프로그램 내에서, 특히 프로세스 내에서 실행되는 흐름의 단위를 말합니다.

> ### 비동기 처리
>
> - 특정 로직의 실행이 끝날때까지 기다려주지 않고 나머지 코드를 먼저 실행하는 것입니다.
>   멀티 스레드가 아닌 이유는 동시성 문제(동시에 공유된 자원에 접근하는 경우)를 해결하기 까다롭기 때문입니다.

<br>

---

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#javascript%EB%8A%94-%EB%AC%B4%EC%8A%A8-%EC%96%B8%EC%96%B4%EC%9D%B8%EA%B0%80)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/about-javascript.md'),
       ('프론트', 'LONG_ANSWER', 'JavaScript에서 비동기적으로 코딩하기 - JavaScript에서 비동기적으로 코딩하는 법을 알려주세요.', '# 자바스크립트에서 비동기적으로 코딩하기

> ### Promise
>
> - 비동기 작업이 맞이할 미래의 완료 또는 실패와 그 결과 값입니다.
>   쉽게 말해 비동기 작업의 결과라고 생각하면 됩니다.

### [콜백](#gear-콜백) 함수

> 주의! 콜백 지옥에 빠지게 될 수도 있다는 단점이 존재합니다.

### Promise

- `.then`: `promise`가 처리될 때까지 대기합니다.

### `async`/`await`

- `async`: 해당 함수는 항상 `promise`를 반환합니다.
- `await`: `promise`가 처리될 때까지 대기합니다.

> 비동기 처리가 필요한 이유: https://velog.io/@dev-katrina/%EB%B9%84%EB%8F%99%EA%B8%B0

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 콜백

- 함수가 끝나고 난 뒤에 실행되는 함수입니다. 자바스크립트에서 함수는 객체입니다. 따라서 함수는 함수를 인자로 받고 다른 함수를 통해 반환될 수 있습니다. 인자로 대입되는 함수를 콜백함수라고 부릅니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EC%97%90%EC%84%9C-%EB%B9%84%EB%8F%99%EA%B8%B0%EC%A0%81%EC%9C%BC%EB%A1%9C-%EC%BD%94%EB%94%A9%ED%95%98%EA%B8%B0)
- [blog, 콜백이란 무엇인가?](https://medium.com/@flqjsl/%EC%BD%9C%EB%B0%B1%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80-56c26e1f1bc3)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/async-in-javascript.md'),
       ('프론트', 'LONG_ANSWER', 'Event Loop - Event Loop에 대해 알고 있으신가요?', '# 자바스크립트 동작 원리([이벤트 루프](#gear-이벤트루프)(Event Loop))

<img src="../../Images/important-4/javascript-eventloop.gif" width="600px">

- gif 출처: https://beomy.github.io/tech/javascript/javascript-runtime/

> - 일반적인 작업은 [콜스택](#gear-콜스택)(Call Stack)에서 이루어집니다.
> - 시간이 소요되는 작업들(setTimeout, 이벤트, HTTP 요청 메서드 등)은 [WebAPI](#gear-webapi)에서 대기하다가 [콜백큐](#gear-콜백큐)(Callback Queue)로 보내집니다.
> - Call Stack이 비워져 있을때만 Callback Queue에 저장되어있던 작업들을 Call Stack으로 보냅니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 이벤트루프

- 이벤트 루프(Event Loop)는 call stack이 다 비워지면 callback queue에 존재하는 함수를 하나씩 call stack으로 옮기는 역할을 합니다.

### :gear: 콜스택

- 콜스택(Call Stack)은 실행된 코드의 환경을 저장하는 자료구조로, 함수 호출 시 이곳에 저장됩니다. 어떤 함수를 저장하면 스택에 쌓고 또 다른 함수를 호출하면 그 다음 스택에 쌓이면서 가장 위에 쌓인 함수를 가장 먼저 처리합니다. LIFO(Last In First Out)

### :gear: webAPI

- Web API는 브라우저에서 제공하는 API로 DOM, Ajax, TimeOut 등이 있습니다. CallStack에서 실행된 비동기 함수는 Web API를 호출하고, Web API는 콜백 함수를 Task Queue에 넣습니다.

### :gear: 콜백큐

- 콜백큐(Callback Queue)는 함수를 저장하는 자료구조로, Call Stack과 다르게 가장 먼저 들어온 함수를 가장 먼저 처리합니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-%EB%8F%99%EC%9E%91-%EC%9B%90%EB%A6%AC%EC%9D%B4%EB%B2%A4%ED%8A%B8-%EB%A3%A8%ED%94%84)
- [blog, 이벤트 루프란?](https://intrepidgeeks.com/tutorial/javascript-what-is-an-active-loop)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/event-loop.md'),
       ('프론트', 'LONG_ANSWER', '마이크로태스크 큐, 태스크 큐 - 마이크로태스크 큐와 태스크 큐에 대해서 말씀해주세요.', '# 마이크로태스크 큐, 태스크 큐

<br>

2개의 큐 모두 [콜백함수](#gear-콜백함수)가 들어간다는 점에서 동일하지만 어떤 함수를 실행하느냐에 따라 어디로 들어가는지가 달라집니다. 또한 명칭은 큐 (Queue) 이지만 자료구조의 큐와는 다릅니다. 엄밀히 말하자면 [우선순위 큐](#gear-우선순위큐) (Priority Queue) 라고 할 수 있는데, 이벤트 루프가 2개의 큐에서 태스크를 꺼내는 조건이 “제일 오래된 태스크” 이기 때문입니다. ([`동작방식`](https://html.spec.whatwg.org/multipage/webappapis.html#task-queue))

<br>

- 콜백함수를 태스크 큐에 넣는 함수들

  - setTimeout, setInterval, setImmediate, requestAnimationFrame, I/O, UI 렌더링

- 콜백함수를 마이크로태스크 큐에 넣는 함수들

  - process.nextTick, Promise, Object.observe, MutationObserver

<br>

익숙한 함수인 Web API의 `setTimeout()` 의 콜백함수가 태스크 큐에 들어가고 `Promise` 의 콜백함수가 마이크로태스크 큐에 들어간다는 것을 알 수 있습니다. [이벤트 루프](https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/event-loop.md)는 각 콜백함수를 태스크/마이크로태스크 큐에서 꺼내쓰는 것인데, 그렇다면 어떤게 먼저일까요?

<br>

결론부터 말씀드리자면, `마이크로태스크 큐가 먼저입니다.`

<br>

[이벤트 루프](https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/event-loop.md)는 마이크로태스크 큐의 모든 태스크들을 처리한 다음, 태스크 큐의 태스크들을 처리합니다. 따라서 `Promise`의 콜백함수가 `setTimeout()`의 콜백함수보다 먼저 처리됩니다.

<br>

### 예시

```js
console.log(\'콜 스택!\');
setTimeout(() => console.log(\'태스크 큐!\'), 0);
Promise.resolve().then(() => console.log(\'마이크로태스크 큐!\'));
```

<br>

### 결과

```
콜 스택!
마이크로태스크 큐!
태스크 큐!
```

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 콜백함수

- 함수가 끝나고 난 뒤에 실행되는 함수입니다. 자바스크립트에서 함수는 객체입니다. 따라서 함수는 함수를 인자로 받고 다른 함수를 통해 반환될 수 있습니다. 인자로 대입되는 함수를 콜백함수라고 부릅니다.

### :gear: 우선순위큐

- 우선순위 큐(Priority Queue)는 먼저 들어오는 데이터가 아니라, 우선순위가 높은 데이터가 먼저 나가는 형태의 자료구조입니다. 일반적으로 힙(Heap)을 이용하여 구현합니다.

<br>

## 참고

- [blog, Task와 Microtask의 동작방식](https://baeharam.netlify.app/posts/javascript/JS-Task%EC%99%80-Microtask%EC%9D%98-%EB%8F%99%EC%9E%91%EB%B0%A9%EC%8B%9D)
- [blog, 콜백이란 무엇인가?](https://medium.com/@flqjsl/%EC%BD%9C%EB%B0%B1%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80-56c26e1f1bc3)
- [blog, [자료구조] 우선순위 큐와 힙 (Priority Queue & Heap)](https://suyeon96.tistory.com/31)
',
        'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/microtask-queue-task-queue.md'),
       ('프론트', 'LONG_ANSWER', '이벤트 전파 - 이벤트 버블링에 대해서 말씀해주세요.', '# 이벤트 전파

생성된 이벤트 객체는 이벤트를 발생시킨 DOM 요소인 이벤트 타깃을 중심으로 DOM트리를 통해 전파됩니다.

<br>

> ### [이벤트 버블링](#gear-이벤트버블링)
>
> 이벤트가 하위 요소에서 상위 요소 방향으로 전파

<br>

> ### [이벤트 캡처링](#gear-이벤트캡처링)
>
> 이벤트가 상위 요소에서 하위 요소 방향으로 전파

<br>

+) 이벤트 버블링과 캡처링를 막기 위해서 [e.stopPropagation()](#gear-stoppropagation)을 사용합니다.
해당 웹 API를 통해 이벤트가 전파되는 것을 막을 수 있습니다.

<br>

> ### 타깃 단계
>
> 이벤트가 이벤트 타깃에 도달

<br>

### [이벤트 위임](#gear-이벤트위임): 이벤트 버블링 활용하기

이벤트 위임을 사용하지 않고, 동일한 이벤트를 일일히 수동으로 달아주기에는 코드 낭비가 너무 심합니다.

따라서 부모 요소에 이벤트를 부여해 버블링을 통해 하위 요소를 동작시킬때도 해당 이벤트가 발생하도록 만드는 것이 바람직합니다.

<br>

아래와 같은 상황에서

```html
<div class="itemList">
  <li>
    <input type="checkbox" id="item1" />
    <label for="item1">1</label>
  </li>
  <li>
    <input type="checkbox" id="item2" />
    <label for="item2">2</label>
  </li>
</div>
```

- case1: 각각 이벤트들을 부여해주기
  inputs의 내부 input에 각각 이벤트를 달아주었습니다.

```js
let inputs = document.querySelectorAll(\'input\');
inputs.forEach((input) => {
  input.addEventListener(\'click\', () => {
    alert(\'clicked\');
  });
});
```

- case2: 부모 요소에 이벤트 부여하기
  부모 요소인 itemList를 클릭했을 때, 이벤트 버블링을 통해 checkbox type을 클릭했을 경우, 이벤트가 똑같이 동작하도록 만들었습니다.

```js
let itemList = document.querySelector(\'.itemList\');
itemList.addEventListener(\'click\', (e) => {
  console.log(e);
  if (e.target.type === \'checkbox\') {
    alert(\'click\');
  }
});
```

이처럼 이벤트 버블링을 통한 이벤트 위임은 하위 요소에 각각의 이벤트를 붙이지 않고도 상위 요소에서 하위 요소의 이벤트들을 제어할 수 있습니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 이벤트버블링

- 이벤트 버블링(Event Bubbling)은 특정 화면 요소에서 이벤트가 발생했을 때 해당 이벤트가 더 상위의 화면 요소들로 전달되어 가는 특성을 의미합니다. 아래와 같은 그림처럼요.

<img src="../../Images/important-4/event-bubbling.png" width="600px">

> 하위의 클릭 이벤트가 상위로 전달되어 가는 그림

### :gear: 이벤트캡처링

- 이벤트 캡처링(Event Capturing)은 이벤트 버블링과 반대 방향으로 진행되는 이벤트 전파 방식입니다.

<img src="../../Images/important-4/event-capturing.png" width="600px">

> 클릭 이벤트가 발생한 지점을 찾아내려 가는 그림

<br>

```html
<div class="outside">
  녹색 영역
  <div class="middle">
    하늘색 영역
    <div class="inner">
      핑크색 영역
      <div class="float">회색</div>
    </div>
  </div>
</div>
```

<br>

```js
const outside = document.querySelector(\'.outside\');
const middle = document.querySelector(\'.middle\');
const inner = document.querySelector(\'.inner\');
const float = document.querySelector(\'.float\');

function callback() {
  alert(this.className + \' is Capturing!\');
}

outside.addEventListener(\'click\', callback, true);
middle.addEventListener(\'click\', callback, true);
inner.addEventListener(\'click\', callback, true);
float.addEventListener(\'click\', callback, true);
```

<br>

위 코드는 이벤트 캡처링의 예시입니다. `float`을 클릭하면 `가장 상위 부모요소`인 `outside`의 이벤트부터 발생합니다. 이때 `addEventListener`함수의 `두번째 인자`로 전달된 `true`는 `이벤트를 캡처링해야하는지 여부`를 지정합니다.

<br>

```js
target.addEventListener(type, listener[, useCapture]);
```

<br>

- `type` : 이벤트의 이름을 지정하는 문자열. 대소문자 구별. (click, keypress 등..)
- `listener` : 이벤트가 발생할때 호출할 이벤트 리스너 함수.
- `useCapture` : 캡쳐링을 사용할지 여부를 지정하는 Boolean. default는 false 입니다. (선택사항)

### :gear: 이벤트위임

- 캡처링과 버블링을 활용하면 강력한 이벤트 핸들링 패턴인 이벤트 위임(event delegation) 을 구현할 수 있습니다.
  이벤트 위임은 비슷한 방식으로 여러 요소를 다뤄야 할 때 사용됩니다. 이벤트 위임을 사용하면 요소마다 핸들러를 할당하지 않고, 요소의 공통 조상에 이벤트 핸들러를 단 하나만 할당해도 여러 요소를 한꺼번에 다룰 수 있습니다.
  공통 조상에 할당한 핸들러에서 `event.target`을 이용하면 실제 어디서 이벤트가 발생했는지 알 수 있습니다. 이를 이용해 이벤트를 핸들링합니다.

### :gear: stopPropagation

- “난 이렇게 복잡한 이벤트 전달 방식 알고 싶지 않고, 그냥 원하는 화면 요소의 이벤트만 신경 쓰고 싶어요.”라고 생각하시는 분들이 충분히 있을 수 있습니다. 실제로 마감 기한에 쫓기는 상황에서 이런 동작 방식을 정확히 이해하는 시간보다는 구현에 더 많은 시간을 쏟아야 하기 때문입니다. 그럴 때는 아래처럼 stopPropagation() 웹 API를 사용합니다.

```js
function logEvent(event) {
  event.stopPropagation();
}
```

위 API는 해당 이벤트가 전파되는 것을 막습니다. 따라서, 이벤트 버블링의 경우에는 클릭한 요소의 이벤트만 발생시키고 상위 요소로 이벤트를 전달하는 것을 방해합니다. 그리고 이벤트 캡쳐의 경우에는 클릭한 요소의 최상위 요소의 이벤트만 동작시키고 하위 요소들로 이벤트를 전달하지 않습니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#%EC%9D%B4%EB%B2%A4%ED%8A%B8-%EC%A0%84%ED%8C%8C)
- [blog, 이벤트 버블링,캡처,위임](https://joshua1988.github.io/web-development/javascript/event-propagation-delegation/)
- [blog, 이벤트 버블링(Bubbling) & 캡쳐링(Capturing)](https://thisblogfor.me/web/bubblingcapturing/)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/event-bubbling.md'),
       ('프론트', 'LONG_ANSWER', '타입스크립트란? - 타입 스크리트 사용해 본적이 있나요? 어떤지 말씀해주세요.', '# 타입스크립트란?

타입을 명시하지 않는 자바스크립트와 달리, 타입스크립트를 통해 [정적 타입](#gear-정적타입)을 명시하여 사용할 수 있습니다.

<br>

### 타입스크립트의 장점

타입스크립트는 코드에 목적을 명시하고, 목적에 맞지 않는 타입의 변수나 함수들에서 에러를 발생시켜 버그를 사전에 제거할 수 있습니다.

프로젝트가 크고, 복잡할수록 타입스크립트가 가진 강점이 점점 더 강해집니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 정적타입

- TypeScript의 가장 독특한 특징은 정적 타이핑을 지원한다는 것입니다. 정적 타입 언어는 타입을 명시적으로 선언하며, 타입이 결정된 후에는 타입을 변경할 수 없습니다. 잘못된 타입의 값이 할당 또는 반환되면 컴파일러는 이를 감지해 에러를 발생시킵니다.

- 자바스크립트는 동적 타입(dynamic typed) 언어 혹은 느슨한 타입(loosely typed) 언어입니다. 이것은 변수의 타입 선언 없이 값이 할당되는 과정에서 동적으로 타입을 추론(Type Inference)한다는 의미입니다. 동적 타입 언어는 타입 추론에 의해 변수의 타입이 결정된 후에도 같은 변수에 여러 타입의 값을 교차하여 할당할 수 있습니다. 이를 동적 타이핑(Dynamic Typing)이라 합니다. 동적 타이핑은 사용하기 간편하지만 코드를 예측하기 힘들어 예상치 못한 오류를 만들 가능성이 높습니다. 또한 IDE와 같은 도구가 변수나 매개 변수, 함수의 반환값의 타입을 알 수 없어 코드 어시스트 등의 기능을 지원할 수 없게 합니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#%ED%83%80%EC%9E%85%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%EB%9E%80)
- [poiemaweb, 정적 타이핑](https://poiemaweb.com/typescript-typing)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/type-script.md'),
       ('프론트', 'LONG_ANSWER', '실행문맥(실행 컨텍스트) - 실행 문맥에 대해서 설명해주세요.', '# 실행 문맥(실행 컨텍스트)

```js
var x = 10;
const y = 20;

function edit(a) {
  var x = 1;
  const y = 2;

  return x + y + a;
}
edit(12);
```

<br>

<img src="../../Images/important-4/execution-context.png" width="600px">

<br>

위와 같은 코드에서의 [실행 컨텍스트](#gear-실행컨텍스트)를 확인하면 다음과 같습니다.

> 1. 전역 실행 컨텍스트 생성/소스코드 실행
>
> - var로 선언한 전역 변수는 객체 환경 레코드에 저장됨.
> - const, let으로 선언한 전역 변수는 선언적 환경 레코드에 저장됨.
> - edit 함수 실행 컨텍스트 생성/소스코드 실행
>
> 2. 전역 환경 레코드와 달리 함수 환경 레코드는 분리되지 않고, 한 장소에서 var,const,let 모두를 처리한다.
>
> - 추가로 알아야 하는 것들:

실행 컨텍스트들은 실행 컨텍스트 스택에 하나씩 쌓이고 사라진다.
소스코드 평가 과정에서는 선언문이 실행되고, 스코프에 등록된다.
소스코드 실행 과정에서는 변수에 값이 할당되고 함수가 호출된다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 실행컨텍스트

- 실행 컨텍스트는 실행할 코드에 제공할 환경 정보들을 모아놓은 객체입니다. 실행 컨텍스트는 동일한 환경에 있는 코드들을 실행할 때 필요한 환경 정보들을 모아 객체를 구성하고, 이를 콜 스택에 쌓아올렸다가, 가장 위에 쌓여있는 컨텍스트와 관련 있는 코드들을 실행하는 식으로 전체 코드의 환경과 순서를 보장합니다. 어떤 실행 컨텍스트가 활성화되는 시점에 선언된 변수를 위로 끌어올리고 외부 환경 정보를 구성하고, this 값을 설정하는 등의 동작을 수행합니다. 실행 컨텍스트는 자바스크립트의 동적 언어로서의 성격을 가장 잘 파악할 수 있는 개념입니다. 만약 실행 컨텍스트를 구성하고 싶다면, 함수를 실행해보면 됩니다.

출처: https://overcome-the-limits.tistory.com/321 [Plus Ultra]

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#%EC%8B%A4%ED%96%89-%EB%AC%B8%EB%A7%A5%EC%8B%A4%ED%96%89-%EC%BB%A8%ED%85%8D%EC%8A%A4%ED%8A%B8)
- [poiemaweb, 정적 타이핑](https://poiemaweb.com/typescript-typing)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/execution-context.md'),
       ('프론트', 'LONG_ANSWER', 'SPA, CSR, SSR의 차이 - SPA, CSR, SSR의 차이에 대해 설명해주세요.', '# SPA, CSR, SSR의 차이

## SPA

### [싱글 페이지 렌더링]

- SPA는 최초 한번 페이지 전체를 로딩한 후부터 데이터만 변경해서 사용할 수 있는 웹 애플리케이션입니다.
  => 하나의 페이지에서 실행됩니다.

## CSR

### [클라이언트 사이드 렌더링]

- 최초 로드시 필요한 파일들을 전부 받고, 사용자의 [인터렉션](#gear-인터렉션)에 따라서 클라이언트단에서 받아와 랜더링을 해주는 방식입니다.
  => 기본 틀만 받고, 브라우저에서 동작으로 DOM을 그립니다.

> 단점: 초반에 뼈대만 다운받기 때문에, [SEO](#gear-seo)에 취약, 초기 화면의 렌더링 속도가 느립니다.
> 장점: 렌더링 속도가 빠릅니다.

## SSR

### [서버 사이드 렌더링]

- 요청시마다 새로고침이 일어나며 서버에 새로운 페이지에 대한 요청을 하는 방식
  => 이미 다 만들어진 DOM을 받습니다.
  > 단점: 매 랜더링마다 서버를 거침으로 속도가 느립니다.
  > 장점: 초기 화면의 렌더링 속도가 빠르며, [SEO](#gear-seo)에 최적화되어 있습니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 인터렉션

- 인터렉션은 사용자가 목적을 달성하기 위해서 제품의 UI를 사용하여 상호작용하는 과정을 의미합니다. 핸드폰으로 예를 들면, 전화를 걸기 위해 사용자가 통화 버튼을 누르면 최근 통화 목록이 표시되고, 연락처를 보고 싶으면 연락처 리스트를 클릭하면 저장되어 있는 연락처가 리스트로 쭉 뜹니다. 이때 통화 목록을 상하로 스크롤하고, 통화를 원하는 사람 혹은 항목의 전화하기 버튼을 터치하면 통화가 되고 통화 종료 버튼을 누르면 통화가 종료됩니다. 그러면 해당 항목은 최근 통화목록 맨 위에 새롭게 항목이 추가 됩니다. 이렇게 사용자와 핸드폰이 주고 받는 과정이 모두 다 인터렉션입니다.

### :gear: SEO

- SEO(Search Engine Optimization)는 검색 엔진 최적화 라는 말로, 특정 웹 페이지가 검색 결과 상위에 노출 될 수 있도록 하는 작업입니다. 검색 엔진이 이해하기 쉽도록, 기본적으로 특정 검색어를 웹 페이지에 적절히 배치하고 다른 웹 페이지에서 링크가 많이 걸릴 수 있는 등 검색 결과 상위에 노출될 수 있도록 하는 작업을 말합니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#spa-csr-ssr-%EC%B0%A8%EC%9D%B4)
- [UI, 인터렉션, UX란? 야무지게 구분해보자!](https://everybody-yeah.tistory.com/12)
- [SEO란 무엇인가?](https://velog.io/@hahan/SEO%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/spa-scr-ssr.md'),
       ('프론트', 'LONG_ANSWER', 'null, undefined, undeclared, NaN - null, undefined, undeclared, NaN 에 대해 설명해주세요.', '# null, undefined, undeclared, NaN

## null

- 빈 값
- null이라는 빈 값을 할당했을 때, 생기는 타입입니다.

## undefined

- 정의되지 않음
- `var` 선언문의 경우, 호이스팅 되었을 때, 변수 선언과 초기화가 동시에 일어나기 때문에, 변수가 `undefined` 됩니다.(타입 결정 안됨)

```js
console.log(data); // undefined
const data = \'data\';
```

## undeclared

- 선언되지 않음
- `let`, `const` 선언문의 경우, [호이스팅](#gear-호이스팅) 되었을 때, 변수 선언과 초기화가 따로 이루어지기에, 변수가 `undeclared`되어 에러가 생깁니다.

```js
console.log(data); // error
let data = \'data\';
```

## NaN

- 표현 불가능한 수치형 결과입니다.

```js
typeof 1 / 0; // NaN
```

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 호이스팅

- 호이스팅이란 "끌어올린다" 라는 뜻으로 **변수 및 함수 선언문이 스코프 내의 최상단으로 끌어올려지는 현상** 을 말합니다. 여기서 주의할 점은 **"선언문"** 이라는 것이며 "대입문"은 끌어올려지지 않습니다. ([호이스팅이란? 글 보러가기](https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/hoisting.md))
  <br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#null-undefined-undeclared-nan)
- [github, 호이스팅이란?](https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/hoisting.md)
',
        'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-4/null-undefined-undeclared-nan.md'),
       ('프론트', 'LONG_ANSWER',
        'HTML 렌더링 중에 JavaScript가 실행되면 렌더링이 멈추는 이유 - HTML이 렌더링 중에 JavaScript가 실행되면 멈추는데 그 이유는 무엇일까요?', '# HTML 렌더링 중에 JavaScript가 실행되면 렌더링이 멈추는 이유

렌더링 엔진은 HTML 한 줄씩 순차적으로 [파싱](#gear-파싱)하며 [DOM](#gear-dom)을 생성해 나가다가 JavaScript를 만나면 DOM 생성을 임시 중단합니다.

DOM 생성을 임시 중단하고, 자바스크립트 코드를 파싱하기 위해 자바스크립트 엔진에 제어권을 넘기게 되는데, 파싱이 끝나면 다시 렌더링 엔진에 제어권을 넘겨 중단된 부분부터 HTML 파싱을 재개하며 DOM 트리를 생성합니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 파싱

- 파싱은 하나의 프로그램을 런타임 환경(예를 들면, 브라우저 내 자바스크립트 엔진)이 실제로 실행할 수 있는 내부 포맷으로 분석하고 변환하는 것을 의미합니다. 즉, 파싱은 문서의 내용을 토큰(token)으로 분석하고, 문법적 의미와 구조를 반영한 파스 트리(parse tree)를 생성하는 과정입니다.

### :gear: DOM

- **DOM(Document Object Model)이란?** 웹 페이지를 이루는 태그들을 자바스크립트가 이용할 수 있게끔 브라우저가 트리구조로 만든 객체 모델을 의미합니다. 영어 뜻풀이 그대로 하자면 문서 객체 모델을 의미합니다. 문서 객체란 html, head, body와 같은 태그들을 javascript가 이용할 수 있는 (메모리에 보관할 수 있는) 객체를 의미합니다. DOM은 HTML과 스크립팅 언어(JavaScript)를 서로 이어주는 역할을 합니다.

<br>

## 참고

- [blog, 프론트엔드 면접 문제 은행](https://velog.io/@wkahd01/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EB%A9%B4%EC%A0%91-%EB%AC%B8%EC%A0%9C-%EC%9D%80%ED%96%89-HTML-%EC%A7%88%EB%AC%B8-%EB%8B%B5%EB%B3%80#html-%EB%A0%8C%EB%8D%94%EB%A7%81-%EC%A4%91%EC%97%90-javascript%EA%B0%80-%EC%8B%A4%ED%96%89%EB%90%98%EB%A9%B4-%EB%A0%8C%EB%8D%94%EB%A7%81%EC%9D%B4-%EB%A9%88%EC%B6%94%EB%8A%94-%EC%9D%B4%EC%9C%A0)
- [Blog, 파싱이란? 파싱의 뜻은 무엇일까?(번역)](https://oneroomtable.tistory.com/entry/%ED%8C%8C%EC%8B%B1%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%BC%EA%B9%8C-%EB%B2%88%EC%97%AD)
- [Blog, DOM이란? 가상 돔 (Virtual DOM )이 나오게 된 이유](https://dev-cini.tistory.com/10)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-3/why-stop-rendering.md'),
       ('프론트', 'LONG_ANSWER', 'require와 import의 차이점 - require와 import의 차이점에 대해 설명해주세요.', '# require와 import의 차이점

- `require`는 [CommonJS](#gear-commonjs)를 사용하는 node.js문이지만 `import`는 ES6에서만 사용됩니다.
- `require`는 파일(non-lexical,비어휘적)에 저장된 위치에 남아 있으며 `import`는 항상 맨 위로 이동합니다.
- `require`는 프로그램의 어느 지점에서나 호출 할 수 있지만 `import`는 파일의 시작 부분에서만 실행할 수 있습니다. (하지만 import전용 비동기 문법으로 처리 가능)
- 일반적으로 `import`는 사용자가 필요한 모듈 부분만 선택하고 로드 할 수 있기 때문에 더 선호됩니다. 이 명령문은 `require`보다 성능이 우수하며 메모리를 절약합니다.

<br>

<br>

> 기본적으로 require와 import는 모듈 키워드입니다. 외부 파일이나 라이브러리를 불러올 때 사용합니다.
> `require`는 NodeJS에서 사용되고 있는 CommonJS 키워드이고, `import`는 ES6(ES2015)에서 새롭게 도입된 키워드입니다.
> <br>
>
> ```javascript
> const moment = require(\'moment\');
> ```
>
> CommonJS 방식을 따른 첫번째 코드는 Ruby처럼 require 키워드를 사용하여 여타 다른 변수를 할당하듯이 모듈을 불러오는 반면에,
> <br>
>
> ```js
> import moment from \'moment\';
> ```
>
> ES6 방식을 따른 두번째 코드는 Java나 Python처럼 import 키워드를 사용하여 좀 더 명시적으로 모듈을 불러오고 있습니다.
> <br>
> 최근 ES6(ES2015) 모듈 시스템인 `import` 가 많이 사용되고 있지만, 그러나 아직까지는 `import` 키워드가 100% 대체되어 사용될 수 없습니다.
> <br>
> Babel과 같은 ES6 코드를 변환(transpile)해주는 도구를 사용할 수 없는 경우에는 `require` 키워드를 사용해야 합니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: CommonJS

CommonJS 란? 웹 브라우저 밖의 자바스크립트를 위한 모듈 생태계의 규칙을 설립하기 위한 프로젝트입니다.
<br>
개념은 간단합니다. `\'.js\'` 파일 간의 어떻게 의존성을 가지게 할지 정해주는 것입니다. commonJS라는 개념이 존재하는 이유는 자바스크립트를 범용적으로 모듈화를 높이기 위해서입니다.

<br>

## 참고

- [require ⚔️ import (CommonJs와 ES6) 차이](https://inpa.tistory.com/entry/NODE-%F0%9F%93%9A-require-%E2%9A%94%EF%B8%8F-import-CommonJs%EC%99%80-ES6-%EC%B0%A8%EC%9D%B4-1)
- [Server & Node [CommonJS]](https://velog.io/@sksgur3217/Server-Node-CommonJS)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-3/require-import.md'),
       ('프론트', 'LONG_ANSWER', 'var, let, const의 차이점 - var, let, const의 차이점에 대해 설명해주세요.', '# var, let, const의 차이점

- `var`는 변수 재선언, 재할당 모두 가능합니다. <br>
- `let`는 변수 재선언은 불가능, 재할당은 가능합니다. <br>
- `const`는 변수 재선언, 재할당 모두 불가능합니다. <br>
- `var`는 [`function-scoped`](#gear-function-scoped)이고, `let`, `const`는 [`block-scoped`](#gear-block-scoped)입니다.

<br>

### var의 재선언, 재할당이 가능하기 때문에 생긴 문제점
```js
// 이미 만들어진 변수이름으로 재선언했는데 아무런 문제가 발생하지 않습니다.
var a = \'test\'
var a = \'test2\'

// hoisting으로 인해 ReferenceError에러가 나지 않습니다.
c = \'test\'
var c
```

### es2015에 추가된 let, const는?
```js
// let
let a = \'test\'
let a = \'test2\' // Uncaught SyntaxError: Identifier \'a\' has already been declared
a = \'test3\'     // 가능

// const
const b = \'test\'
const b = \'test2\' // Uncaught SyntaxError: Identifier \'a\' has already been declared
b = \'test3\'    // Uncaught TypeError:Assignment to constant variable.
```

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: function-scoped
- `var`는 `function-scoped`이기 때문에 for문이 끝난다음에 i를 호출하면 값이 출력이 잘 됩니다.
- 그 이유는 `var`가 [`hoisting`](https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-5/hoisting.md)이 되었기 때문입니다.

```js
for(var j = 0; j < 10; j++) {
  console.log(\'j\', j)
}
console.log(\'after loop j is \', j) // after loop j is 10


// 아래의 경우에는 에러가 발생합니다.
function counter () {
  for(var i = 0; i < 10; i++) {
    console.log(\'i\', i)
  }
}
counter()
console.log(\'after loop i is\', i) // ReferenceError: i is not defined
```

- `function scope`는 함수 내부 스코프를 의미하며 함수 내부에서 선언된 변수는 함수 내부에서만 접근이 가능합니다.
```js
function sayHi () {
  const hi = \'Hi there!\'
  console.log(hi)
}

sayHi() // \'Hi there!\'
console.log(hi) // Error, hi is not defined
```
- `function scope`에서 다른 함수를 호출할 수 있지만, 다른 함수 내부에서 선언된 내부 변수에는 접근이 불가합니다.
```js
function first () {
  const firstFunctionVariable = `I\'m part of first`
}

function second () {
  first() // It works
  console.log(firstFunctionVariable) // Error, firstFunctionVariable is not defined
}
```

### :gear: block-scoped

`var`가 `function-scoped`로 `hoisting`이 되었다면

`let`, `const`는 `block-scoped`단위로 `hoisting`이 일어납니다.


### Block Scope
중괄호({}) 내부에서 let, const 변수를 선언하면 그 변수들은 중괄호 내부에서만 접근이 가능합니다. <br>
함수도 중괄호로 선언되므로 block scope도 function scope의 부분집합이라고 할 수 있습니다.
```js
{
  const hi = \'Hi there!\'
  console.log(hi) // \'Hi there!\'
}

console.log(hi) // Error, hi is not defined
```

<br>

<br>

```js
c = \'test\' // ReferenceError: c is not defined
let c
```

위의 코드에서 ReferenceError가 발생한 이유는 [tdz](#gear-tdz)(temporal dead zone)때문입니다. <br>

`let`은 값을 할당하기전에 변수가 선언 되어있어야 하는데 그렇지 않기 때문에 에러가 납니다. <br>

이건 `const`도 마찬가지인데 좀 더 엄격합니다.

```js
// let은 선언하고 나중에 값을 할당이 가능하지만
let dd
dd = \'test\'

// const 선언과 동시에 값을 할당 해야합니다.
const aa // Missing initializer in const declaration
```
이렇게 javascript에 tdz가 필요한 이유는 동적언어이다보니 runtime type check 가 필요해서입니다.

<br>

### :gear: tdz
- TDZ(Temporal Dead Zone) 란, 한글로 직역하자면 일시적인 사각지대란 뜻입니다. <br> 이 일시적인 사각지대는 스코프의 시작 지점부터 초기화 시작 지점까지의 구간을 TDZ(Temporal Dead Zone) 라고합니다.

<br>

## 참고

- [Github, var,let,const 차이점은?](https://gist.github.com/LeoHeo/7c2a2a6dbcf80becaaa1e61e90091e5d)
- [blog, 함수 스코프, 블록 스코프, 렉시컬 스코프](https://velog.io/@iwaskorean/JavaScript-33%EA%B0%80%EC%A7%80-%EA%B0%9C%EB%85%90-6.-Function-Scope-Block-Scope-and-Lexical-Scope%ED%95%A8%EC%88%98-%EC%8A%A4%EC%BD%94%ED%94%84-%EB%B8%94%EB%A1%9D-%EC%8A%A4%EC%BD%94%ED%94%84-%EB%A0%89%EC%8B%9C%EC%BB%AC-%EC%8A%A4%EC%BD%94%ED%94%84)
- [blog, TDZ이란?](https://noogoonaa.tistory.com/78)

', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-3/var-let-const.md'),
       ('프론트', 'LONG_ANSWER', 'sass(scss)의 장점 - SASS(SCSS)를 사용해본 적이 있나요? 기존 CSS와 비교할 때 어떤 면이 더 좋은가요?', '# sass(scss)의 장점(특징)

## 1. 변수 사용가능

선언방법
변수 타입 : `숫자, 문자열, 색상, boolean, null, lists, maps`

```scss
$변수명: 속성값;
```

## 2. 수학 연산자 사용가능

사용가능 연산자 : `+, -, /, *, %, ==, !=`

> ### 주의
>
> `+, -` 연산시에는 단위 통일 <br> `나눔기호` 사용시에는 괄호로 묶어서 사용

## 3. Nesting 기능

중첩해서 선언하기 가능

```css
/* CSS */
.container {
  width: 100%;
}

.container h1 {
  color: red;
}
```

```scss
/* Sass */
.container {
  width: 100%;
  h1 {
    color: red;
  }
}
```

상위요소 참조시에는 & 문자 사용

```css
a {
  color: black;
}
a:hover {
  text-decoration: underline;
  color: gray;
}
a:visited {
  color: purple;
}

.widget {
  font-weight: 400;
}
.widget-area {
  font-weight: 600;
}
.widget-top_posts {
  font-weight: 1000;
}
```

```scss
/* Sass */

a {
  color: black;
  &:hover {
    text-decoration: underline;
    color: gray;
  }
  &:visited {
    color: purple;
  }
}

.widget {
  font-weight: 400;
  &-area {
    font-weight: 600;
  }
  &-top_posts {
    font-weight: 1000;
  }
}
```

## 4. `import`와 `extend`

`@import` 지시어를 사용해서 다른 scss 파일을 import할 수 있다

`@extend` 지시어를 사용하여 특정 선택자의 속성을 상속받을 수 있다

```css
.box,
.success-box {
  border: 1px solid gray;
  padding: 10px;
  display: inline-block;
}

.success-box {
  border: 1px solid green;
}
```

```scss
/* Sass */
.box {
  border: 1px solid gray;
  padding: 10px;
  display: inline-block;
}

.success-box {
  @extend .box;
  border: 1px solid green;
}
```

`Placeholder` 선택자 %를 사용하면 상속은 하면서 해당 선택자는 컴파일 X

```scss
/* SASS */
%box {
  padding: 0.5em;
}

.success-box {
  @extend %box;
  color: green;
}

.error-box {
  @extend %box;
  color: red;
}
```

```css
/* CSS */
.success-box,
.error-box {
  padding: 0.5em;
}

.success-box {
  color: green;
}

.error-box {
  color: red;
}
```

## 6. 믹스인(Mixin)

공통적으로 쓰이는 css 속성들을 묶어서 재사용이 가능하게 하는 기능

`parameter`를 받을 수 있다

선언 `@mixin`

사용 `@include`

```scss
/* SASS */
@mixin headline($color, $size) {
  color: $color;
  font-size: $size;
}

h1 {
  @include headline(green, 12px);
}

// 인자에 default값 적용
@mixin headline($color: #eee, $size: 10px) {
  width: 50px;
}
```

```css
/* CSS */
h1 {
  color: green;
  font-size: 12px;
}
```

```scss
/* SASS */

@mixin media($queryString) {
  @media #{$queryString} {
    @content;
  }
}

.container {
  width: 900px;
  @include media(\'(max-width: 767px)\') {
    width: 100%;
  }
}
```

```css
/* CSS */
.container {
  width: 900px;
}
@media (max-width: 767px) {
  .container {
    width: 100%;
  }
}
```

## 7. 커스텀 함수 사용

함수 정의는 `@function` ,리턴값은 `@return`

```scss
$grid-width: 40px;
$gutter-width: 10px;
@function grid-width($n) {
   @return $n * $grid-width + ($n -1 ) * $gutter-width;
}
#sidebar { width: grid-width(5); } // 믹스인과 달리 @include를 쓰지 않는다.
내장함수도 사용 가능
```

## 8. 흐름제어

분기문 : `@if`절 사용

`@if` 표현식 { ... } `@else`

`if` 표현식 { ... } `@else` { ... }

```scss
@mixin hcolor($n) {
  @if $n % 2 == 0 { color: white; }
  @else { color: blue; }
}
.row-3 { @include hcolor(3); }

@function text-color($brightness) {
  @if $brightness < 128 { @return #333; }
  @return #ccc;
}
code { color: text-color(200);
```

반복문

- `@for` : n~m 까지의 숫자 범위에 대해 각 정수값에 대해 순회
- `@each` : 주어진 리스트나 맵의 각 원소에 대해 순회
- `@while` : 주어진 조건을 만족하는 동안 반복

```scss
@for $i from 1 through 3 {
  // 1, 2, 3,에 대해 반복
  .time-#{$i} {
    width: 2em * $i;
  }
}

// 리스트 내 각 문자열 원소에 대해서...
@each $animal in puma, sea-slug, egret, alamander {
  .#{$animal}-icon {
    background-image: url(\'/image/#{$animal}.png\');
  }
}

// 6, 4, 2번 아이템에 대해서
$i: 6;
@while $i > 0 {
  .item-#{$i} {
    width: 2em * $i;
  }
  $i: $i - 2;
}
```

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear:

<br>

## 참고

- [blog, scss 문법 특징](https://joyoungg.gitbooks.io/scss/content/d2b9-c9d5.html)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-3/sass-scss.md'),
       ('프론트', 'LONG_ANSWER', 'CORS에 대처하는 방법과 우회하는 방법 - CORS에 대처하는 방법과 우회하는 방법에 대해 설명해주세요.', '# [CORS](#gear-cors)에 대처하는 방법과 우회하는 방법

외부 서버로 ajax 요청이 안될 경우 아래와 같은 단계로 처리를 생각해 볼 수 있습니다.

<br>

1. 개발자가 테스트 혹은 개발단계에서 쉽게 요청하기: [웹 브라우저 실행 옵션](#gear-웹브라우저실행옵션)이나 [플러그인](#gear-플러그인)을 통한 [동일 출처 정책](#gear-동일출처정책) 회피

2. CORS구현이 안되어 있는 서버로 ajax요청을 해야하지만 서버 쪽 컨트롤이 불가능할 경우: [jsonp방식](#gear-jsonp방식)으로 요청

3. Ajax요청을 해야 하는 다른 도메인의 서버를 클라이언트와 같이 개발하거나 서버 개발 쪽 수정 요청이 가능한 경우: [서버에서](#gear-서버에서) CORS 요청이 허용되도록 구현

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: CORS

- CORS(Cross-Origin Resource Sharing)란? 웹 브라우저에서 외부 도메인 서버와 통신하기 위한 방식을 표준화한 스펙입니다. 서버와 클라이언트가 정해진 헤더를 통해 서로 요청이나 응답에 반응할지 결정하는 방식으로 교차 출처 자원 공유(cross-origin resource sharing)라는 이름으로 포준화 되었습니다.

### :gear: 웹브라우저실행옵션

- (용어설명이 아닙니다.) 웹브라우저 실행 시 외부 요청을 허용하는 옵션을 사용, same origin policy는 결국 클라이언트인 웹 브라우저가 요청을 해도 되는지 판단해서 결정하는 것으로 이 과정만 무시한다면 어디든 요청하지 못할 이유는 없습니다. 크롬같은 웹 브라우저들은 실행 시 커맨드 라인 옵션을 통해서 외부 도메인 요청가능 여부를 확인하는 동작을 무시하게 할 수 있습니다.

<br>

> ### 크롬의 경우 <br>
>
> `--disable-web-security` 옵션을 추가하여 크롬 실행

<br>

### :gear: 플러그인

- (용어설명이 아닙니다.) 외부 요청을 가능하게 해주는 플러그인 설치, 서버에서 받은 요청의 응답에 특정 header(`Access-Control-Allow-Origin: *`)만 추가하면 웹 브라우저가 요청이 가능한 사이트로 인식하여 요청이 가능합니다. 크롬의 경우 웹스토어에 요청을 가로채서 응답에 위 header를 추가해주는 플러그인이 있습니다. 웹스토어에서 cors로 검색하면 확장 프로그램 검색 결과에서 찾을 수 있습니다.

### :gear: 동일출처정책

- 동일 출처 정책(Same-Origin Policy)란? 어떤 출처에서 불러온 문서나 스크립트가 다른 출처에서 가져온 리소스와 상호작용하는 것을 제한하는 중요한 보안 방식입니다. 동일 출처 정책은 잠재적으로 해로울 수 있는 문서를 분리함으로써 공격받을 수 있는 경로를 줄여줍니다.

### :gear: jsonp방식

- 웹 브라우저에서 css나 js 같은 리소스 파일들은 동일 출처 정책에 영향을 받지 않고 로딩이 가능합니다. 이런 점을 응용해서 외부 서버에서 읽어온 js 파일을 json으로 바꿔주는 일종의 편법적인 방법입니다. 단점은 리소스 파일을 GET 메서드로 읽어오기 때문에 GET 방식의 API만 요청이 가능합니다.

### :gear: 서버에서

- (용어설명이 아닙니다.) 서버에서 CORS 요청 핸들링하기, 서버로 날아온 preflight 요청을 처리하며 웹 브라우저에서 실제 요청을 날릴 수 있도록 해줍니다.

### 모든 외부 도메인에서 모든 요청을 허용할 경우 처리

가장 쉬운 방법으로 모든 요청을 허용하는 방식입니다.

preflight 요청을 받기 위해 OPTIONS 메서드의 요청을 받아서 컨트롤해야 합니다. 모든 요청의 응답에 아래 header를 추가합니다.

```
Access-Control-Allow-Origin: *
Access-Control-Allow-Methods: GET,POST,PUT,DELETE,OPTIONS
Access-Control-Max_Age: 3600
Access-Control-Allow-Headers: Origin,Accept,X-requested-With,Content-Type,Access-Control-Request-Method,Access-
Control-Request-Headers,Authorization
```

<br>

`Access-Control-Allow-Origin`: 요청을 허용하는 출처, `\'*\'` 이면 모든 곳에 공개되어 있음을 의미합니다.
<br>
`Access-Control-Allow_Methods`: 요청을 허용하는 메서드, 기본값은 `GET`,`POST`라고 보면 됩니다. 이 헤더가 없으면 `GET`과 `POST`요청만 가능합니다. 만약 이 헤더가 지정되어 있으면, 클라이언트는 헤더값에 해당하는 메서드일 경우에만 실제 요청을 시도하게 됩니다.
<br>
`Access-Control-Max-Age`: 클라이언트에서 preflight의 요청 결과를 저장할 기간을 지정. 클라이언트에서 preflight 요청의 결과를 저장하고 있을 시간입니다. 해당 시간 동안은 preflight 요청을 다시 하지 않게 됩니다.
<br>
`Access-Control-Allow_Headers` : 요청을 허용하는 헤더

<br>

웹 브라우저의 스크립트 엔진에서 preflight 요청 응답으로 `Access-Control-Allow-Origin` header에 `"*"` 값이 있으면 모든 도메인에서의 요청을 허용하는 것으로 판단합니다. ajax 요청이 실패하면서 발생하는 메시지는 바로 preflight요청을 날린 응답 메시지에 `Access-Control-Allow-Origin` 헤더가 없어서 요청이 허용되지 않는다는 뜻입니다.

<br>

## 참고

- [brunch, javascript ajax 크로스도메인 요청 - CORS](https://brunch.co.kr/@adrenalinee31/1)
- [MDN, 동일 출처 정책](https://developer.mozilla.org/ko/docs/Web/Security/Same-origin_policy)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-3/how-to-handle-cors-error.md'),
       ('프론트', 'LONG_ANSWER', 'React의 라이프 사이클 - React의 라이프 사이클에 대해 설명해주세요.', '# React의 생명 주기(라이프 사이클)

리액트는 컴포넌트 기반의 View를 중심으로 한 라이브러리입니다. 그러다보니 각각의 컴포넌트에는 라이프 사이클 즉, 컴포넌트의 생명 주기가 존재합니다. 컴포넌트의 생명은 보통 페이지에서 렌더링되기 전인 준비 과정에서 시작하여 페이지에서 사라질 때 끝이 납니다.

<br>

<img src="../../Images/important-3/react-lifecycle.png" width="800px">

> 위의 이미지는 리액트의 생명 주기를 나타낸 화면입니다. <br>
> 이미지에서 볼 수 있듯이 컴포넌트는 `생성 => 업데이트 => 제거`의 생명 주기를 갖고 있습니다. <br>
> 그럼 이제 각각의 라이프 사이클이 무엇이고 어떻게 Class와 Hooks를 활용한 함수형 컴포넌트에서 사용하는지 알아보도록 하겠습니다. <br>
> 아래 목록에서 자주 사용되는 메서드는 `코드블럭`으로 표시하겠습니다. 나머지는 상대적으로 덜 사용됩니다.

<br>

<br>

## 마운트(생성)

컴포넌트의 [인스턴스](gear-)가 생성되어, DOM에 삽입될 때 순서대로 호출됩니다.

- `constructor()`
- getDerivedStateFromProps()
- `render()`
- `componentDidMount()`

<br>

## 업데이트

props나 state가 변경되면 렌더(갱신)가 진행되며 순서대로 호출됩니다.

- getDerivedStateFromProps()
- shouldComponentUpdate()
- `render()`
- getSnapshotBeforeUpdate()
- `componentDidUpdate()`

<br>

## 마운트 해제(제거)

아래 메서드는 컴포넌트가 DOM에서 제거될 때 호출됩니다.

- `componentWillUnmount()`

<br>

<br>

위에 명시된 자주 사용되는 생명 주기 메서드에 대해 간략한 소개를 하겠습니다.

<br>

<br>

### `render()`

클래스 컴포넌트에서 반드시 구현되어야 하는 유일한 메서드입니다.

- 이 메서드가 호출되면 this.props와 this.state의 값을 활용하여 값을 반환합니다.
- render() 함수는 컴포넌트의 state를 변경하지 않고, 호출될 때마다 동일한 결과를 반환하며 브라우저와 직접적인 상호작용을 하지 않습니다.

<br>

```js
// Class
class Example extends React.Component {
  render() {
    return <div>컴포넌트</div>;
  }
}

// Hooks
const example = () => {
  return <div>컴포넌트</div>;
};
```

> 함수형 컴포넌트에서는 render를 안쓰고 컴포넌트를 렌더링할 수 있습니다.

<br>

### `constructor(props)`

메서드를 바인딩하거나 state를 초기화하는 작업이 없다면 constructor(생성자)가 없어도 됩니다.

- react 컴포넌트의 생성자는 해당 컴포넌트가 마운트되기 전에 호출됩니다.
- 생성자를 구현하면, this.props가 생성자 내에서 정의되도록 super(props)를 호출해야 합니다.
- state의 값을 변경하고자 한다면 constructor() 외부에서 this.setState()를 통해 수정해야 합니다.

<br>

```js
// Class
class Example extends React.Component {
    constructor(props) {
        super(props);
        this.state = { count: 0 };
}

// Hooks
const Example = () => {
    const [count,setCount] = useState(0);
}
```

> 클래스형에서는 초기 state를 정할 때 constructor를 사용해야 합니다. 하지만 훅에서는 useState hook을 사용하면 초기 상태를 쉽게 설정해줄 수 있습니다.

<br>

### `componentDidMount()`

컴포넌트가 마운트된 직후에 호출됩니다.

- DOM 노드가 있어야 하는 초기화 작업이 이루어지면 좋습니다.
- 외부에서 데이터를 불러와야 한다면 네트워크 요청을 보내기 좋은 위치입니다.

<br>

```js
// Class
class Example extends React.Component {
    componentDidMount() {
        ...
    }
}

// Hooks
const Example = () => {
    useEffect(() => {
        ...
    }, []);
}
```

> 함수형 Hooks 에서는 useEffect의 [] 의존성 배열을 비워야지만 똑같은 메소드를 구현할 수 있습니다.

<br>

### `componentDidUpdate()`

갱신(렌더)가 일어난 직후에 호출되며 최초 렌더링에서는 호출되지 않습니다.

<br>

```js
// Class
class Example extends React.Component {
    componentDidUpdate(prevProps, prevState) {
        ...
    }
}

// Hooks
const Example = () => {
    useEffect(() => {
        ...
    });
}
```

<br>

### `componentWillUnmount()`

컴포넌트가 마운트 해제되어 제거되기 직전에 호출됩니다.

- 타이머 제거, 네트워크 요청 취소, componentDidMount()에서 생성된 작업 등을 정리할 때 사용됩니다.
- 실행 직후 컴포넌트는 렌더링되지 않으므로 setState()를 호출하면 안됩니다.

<br>

```js
// Class
class Example extends React.Component {
    coomponentWillUnmount() {
        ...
    }
}

// Hooks
const Example = () => {
    useEffect(() => {
        return () => {
            ...
        }
    }, []);
}
```

> 함수형 컴포넌트에서는 useEffect CleanUp 함수를 통해 해당 메서드를 구현할 수 있습니다.

<br>

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 인스턴스

인스턴스(instance)란 객체 지향 프로그래밍(OOP)에서 클래스(class)에 소속된 개별적인 객체를 말합니다. 예를 들어, 사용자(user)라는 클래스를 정의하고 홍길동(hong)이라는 객체를 생성할 경우, hong이라는 객체는 user라는 클래스의 인스턴스가 됩니다. 하나의 클래스를 사용하여 유사한 성질을 가진 수많은 인스턴스를 생성할 수 있습니다. 이 때 추상적인 개념인 클래스에서 실제 객체를 생성하는 것을 인스턴스화(instantiation)한다고 말합니다.

<br>

## 참고

- [blog, 리액트 라이프사이클의 이해](https://kyun2da.dev/react/%EB%A6%AC%EC%95%A1%ED%8A%B8-%EB%9D%BC%EC%9D%B4%ED%94%84%EC%82%AC%EC%9D%B4%ED%81%B4%EC%9D%98-%EC%9D%B4%ED%95%B4/)
- [blog, React Lifecycle(생명주기)](https://kim-mj.tistory.com/250)

- [해시넷, 인스턴스](http://wiki.hash.kr/index.php/%EC%9D%B8%EC%8A%A4%ED%84%B4%EC%8A%A4)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-3/react-life-cycle.md'),
       ('프론트', 'LONG_ANSWER', 'ES6에서 Arrow 함수를 언제, 왜 쓸까? - ES6에서 Arrow 함수를 언제 쓰나요? 왜 쓰나요?', '# ES6에서 Arrow 함수를 언제, 왜 쓸까?

<br>

Arrow 함수(arrow function)를 언제, 왜 사용하는지 그 이유들을 알아봅시다.

<br>

## 1. 함수 본연의 기능을 아주 잘 표현하는 문법입니다.

보통 프로그래밍할 때 function 문법은 아래와 같은 이유로 많이 사용합니다.

- 여러가지 기능을 하는 코드를 한 단어로 묶고 싶을 때 (그리고 나중에 재사용할 때)
- [입출력기능](#gear-입출력기능)을 만들 때

<br>

그리고 `arrow function`을 사용하면 함수 본연의 입출력기능을 아주 직관적으로 잘 표현해줍니다.

<br>

```js
let 두배만들기 = (x) => {
  return x * 2;
};

console.log(두배만들기(4));
console.log(두배만들기(8));
```

<br>

`arrow function`을 쓰면 입출력기능이 쉽고 예쁘게 표현되는 것이 `arrow function`를 쓰는 이유 중 하나입니다.

<br>

<br>

## 2. 소괄호 생략이 가능합니다.

파라미터가 하나라면 소괄호를 생략 가능합니다.

<br>

```js
let 두배만들기 = x => {
  return x * 2;
};

console.log(두배만들기(4));
console.log(두배만들기(8));
```

<br>

이렇게도 가능합니다.

<br>

<br>

## 3. 중괄호 생략이 가능합니다.

중괄호 안에 return 한줄 뿐이라면 중괄호와 return도 생략가능합니다.

<br>

```js
let 두배만들기 = (x) => x * 2;

console.log(두배만들기(4));
console.log(두배만들기(8));
```

<br>

생략하니 이제 x가 어떻게 변하는 함수인지 입출력기능이 바로 한눈에 들어오는 걸 볼 수 있습니다.

<br>

<br>

## 4. `arrow function`을 쓰면 내부에서 `this`값을 쓸 때 밖에 있던 `this`값을 그대로 사용합니다.

`arrow function`은 어디서 쓰던 내부의 `this` 값을 변화시키지 않습니다. <br>

또한 바깥에 있던 `this`의 의미를 그대로 내부에서도 사용합니다. 이게 `arrow function`을 쓰는 핵심 이유입니다. <br>

예시를 보겠습니다.

<br>

```js
let 오브젝트1 = {
  함수: function () {
    console.log(this);
  },
};

오브젝트1.함수();
```

<br>

위의 코드는 실행하면 무슨 결과가 나올까요? <br>

> 결과: 함수()를 가지고 있는 오브젝트인 오브젝트1이 콘솔창에 출력됩니다.

<br>

다른 예시를 봅시다.

<br>

```js
let 오브젝트1 = {
  함수: () => {
    console.log(this);
  },
};

오브젝트1.함수();
```

<br>

위의 코드는 출력하면 어떤 결과가 나올까요? <br>

> 결과: `window`라는게 출력됩니다. 여기선 `this`가 `window`입니다. <br>
> 함수의 주인인 오브젝트1이 출력되지 않는 이유는 `this`값은 함수를 만나면 항상 변하는데, <br> > `arrow function` 안에서는 변하지 않고 밖에 있던 `this`를 그대로 씁니다. <br>
> (오브젝트 밖에 있던 `this`는 `window`입니다.)

<br>

왜냐면 `arrow function`은 외부에 있던 `this`를 그대로 내부로 가져와서 사용하는 함수기 때문입니다. <br>

내가 예측하던 `this`값과 달라질 수도 있으니 이는 장점이 아니라 단점이 될 수도 있습니다.

`this`의 뜻이 달라지는 것 처럼 일반 `function`과 용도가 완전 같지 않기 때문에

일반 `function`을 항상 대체할 수 있는 문법이 아닙니다. 그것만 주의합시다.

---

<br>

## :hammer_and_wrench: 용어 공부

### :gear: 입출력기능

<br>

2를 집어넣으면 x + 2를 출력해주는 함수를 어떻게 만들어쓸까요?

<br>

```js
function 더해주세요(x) {
  return x + 2;
}
```

<br>

위와 같은 문법을 이용해서 만들어 사용합니다. 함수의 소괄호안에는 `input` 역할을 하는 `파라미터`가 있고 <br>

함수내에 `return` 이라는 것은 `output` 역할을 하는 키워드입니다. 그럼 이제 더해주세요(2); 이렇게 사용하면? <br>

4가 이 자리에 남게 됩니다. 소괄호에 뭔가 집어넣으면 return을 이용해 뭔가 뱉어내는 것. 이게 바로 함수의 입출력 기능입니다.

<br>

## 참고

- [코딩애플, Arrow function은 function을 대체하는 신문법이 아님](https://codingapple.com/unit/es6-3-arrow-function-why/)
', 'https://github.com/Esoolgnah/Frontend-Interview-Questions/blob/main/Notes/important-3/es6-arrow-function.md');
