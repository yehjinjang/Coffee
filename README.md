## ☕️ Coffee App (Task1)

### 🔑 **Main Function**
1. **음료 선택**  
   - 다양한 음료 리스트를 제공하며, 이미지, 설명, 가격 표시.  
   - 특정 음료는 핫/아이스, 샷 강도 등을 조절 가능.

2. **주문 확인 및 삭제**  
   - 선택한 음료와 수량을 확인하고 총액 계산
   - 스와이프하여 주문 항목 삭제 가능
   - 준비된 하루치 재고에 따른 Userdefault누적 (Soldout)

3. **결제 기능**  
   - 전화번호 입력을 통한 포인트 적립 기능 제공
   - 간편결제 및 신용카드 방식 지원 (will)
   - 결제 완료 후 주문 번호와 주문 상태를 알림

4. **Data Architecture (Python3) 구현**  
   - 기본적인 Data flow 구현 (miro)
   - 간단 계산로직 구현
   - 데이터 학습 (will) 


## 🛠️ **Stack**
- **SwiftUI**: UI Framework
- **Combine**: Data flow managing
- **Python**: Data architecture Implementation


## 🏗️ **Architecture**
- **MVVM**: Model-View-ViewModel 아키텍처 기반 설계

```
coffeeApp/
├── Models/
│   ├── Drink.swift         # 음료 데이터를 정의한 모델
│   ├── OrderItem.swift     # 주문 아이템 데이터 정의
│
├── ViewModels/
│   ├── CartViewModel.swift # 장바구니 데이터 관리 로직
│
├── Views/
│   ├── ContentView.swift        # 메인 화면
│   ├── DrinkSelectionView.swift # 음료 선택 화면
│   ├── DrinkOptionView.swift    # 음료 옵션 선택 화면(Modal)
│   ├── OrderSummaryView.swift   # 주문 확인 화면
│   ├── PaymentView.swift        # 결제 화면
│   ├── OrderCompleteView.swift  # 결제 완료 화면
│
├── Resources/
│   ├── Assets.xcassets          # 이미지 및 색상 리소스
│   ├── Preview Content          # SwiftUI 미리보기 데이터
```
