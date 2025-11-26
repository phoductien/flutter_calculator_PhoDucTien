## 📱 Advanced Mobile Calculator App – Chapter 3

**Tác giả: Phó Đức Tiến
– TDMU
**Mô tả:** Ứng dụng máy tính nâng cao (Advanced Mobile Calculator) được xây dựng bằng Flutter, hỗ trợ nhiều chế độ tính toán: Basic, Scientific, Programmer, với giao diện hiện đại, chuyển theme Dark/Light, lưu lịch sử, cài đặt tuỳ chỉnh và test unit.

---

## 📌 Tổng quan

Advanced Mobile Calculator là một ứng dụng Flutter đa nền tảng được thiết kế như một máy tính khoa học nâng cao phục vụ học tập và thực hành lập trình Flutter.

Ứng dụng không chỉ hỗ trợ các phép tính cơ bản mà còn cung cấp:

* Chế độ **Scientific** với các hàm lượng giác, log, luỹ thừa…
* Chế độ **Programmer** với hệ nhị phân, thập lục phân, toán tử bit…
* Lịch sử tính toán có lưu trữ
* Theme Dark/Light chuyển đổi mượt

Ứng dụng được tổ chức theo kiến trúc rõ ràng: **models – providers – screens – widgets – utils – services**, áp dụng **Provider** cho state management và **SharedPreferences** cho persistence.

---

## ✨ Tính năng chính

### 🔢 Core Calculator

* Basic Mode:

  * C, CE, ±, %, ., +, -, ×, ÷, =
  * Hỗ trợ chuỗi phép tính, ưu tiên ngoặc
* Scientific Mode:

  * sin, cos, tan, ln, log
  * x², xʸ, √, (), π, e
  * Hỗ trợ DEG/RAD
* Programmer Mode:

  * Chuyển đổi DEC, BIN, OCT, HEX
  * Toán tử bit: AND, OR, XOR, NOT
  * Dịch bit: <<, >>

### 🧠 Expression & Logic

* Expression parser hỗ trợ:

  * Thứ tự ưu tiên toán tử (PEMDAS)
  * Ngoặc (), implicit multiplication (2π = 2×π)
  * Hàm số khoa học
  * Phát hiện và xử lý lỗi (Error)

### 🧮 Memory & History

* Memory functions:

  * M+, M-, MR, MC
* History:

  * Lưu lại các phép tính (biểu thức + kết quả + thời gian)
  * Xem lại lịch sử ở History Screen
  * Có giới hạn số lượng (ví dụ 50 bản ghi)
  * Clear All History trong Settings

### 🎨 UI/UX Advanced

* Multi-line display:

  * Dòng biểu thức
  * Dòng kết quả
  * Dòng hiển thị lỗi (nếu có)
* Mode Indicator:

  * Hiển thị chế độ hiện tại: Basic/Scientific/Programmer
  * Hiển thị DEG/RAD
  * Hiển thị trạng thái Memory (M có dữ liệu)
* Theme:

  * Light Theme và Dark Theme
  * Chuyển theme mượt
* Animations:

  * Nút bấm có animation scale
  * Chuyển mode có animation
  * Error có hiệu ứng “shake” hiển thị

### 🎛 Settings

* Chọn theme: Light / Dark / System
* Độ chính xác thập phân: 2–10 chữ số
* Angle mode: Degrees / Radians
* Haptic Feedback: ON/OFF (tuỳ thiết bị)
* Sound Effects: ON/OFF
* History size: 25 / 50 / 100
* Nút “Clear All History” kèm confirm

---

## 🛠 Yêu cầu hệ thống

### Phần mềm

* Flutter SDK 3.22+ (hoặc 3.13+ nếu lab yêu cầu cụ thể)
* Dart SDK (đi kèm Flutter)
* IDE:

  * VS Code + Flutter extension (khuyên dùng)
  * Android Studio / IntelliJ IDEA

### Platform tools

* Android: Android SDK, Android Studio / emulator / device thật
* iOS: Xcode (chỉ macOS)
* Web: Chrome

### Phần cứng

* RAM: tối thiểu 8GB (khuyến nghị 16GB+)
* Ổ cứng: còn trống ~10GB
* CPU: đa nhân
* Mạng: kết nối ổn định để tải packages

---

## 🚀 Cài đặt & Chạy dự án

### Bước 1: Clone repository

```bash
git clone https://github.com/yourname/flutter_advanced_calculator_yourname.git
cd flutter_advanced_calculator_yourname
```

> Thay `yourname` bằng tên GitHub của bạn.

### Bước 2: Cài dependencies

```bash
flutter pub get
```

### Bước 3: Kiểm tra môi trường

```bash
flutter doctor
```

Đảm bảo không có lỗi đỏ nghiêm trọng.

### Bước 4: Chạy ứng dụng

#### Android:

```bash
flutter run -d android
```

#### Web (Chrome):

```bash
flutter run -d chrome
```

#### iOS (macOS):

```bash
flutter run -d ios
```

---

## 📁 Cấu trúc project

```text
lib/
├── main.dart
├── models/
│   ├── calculation_history.dart
│   ├── calculator_mode.dart
│   └── calculator_settings.dart
├── providers/
│   ├── calculator_provider.dart
│   ├── history_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── calculator_screen.dart
│   ├── history_screen.dart
│   └── settings_screen.dart
├── widgets/
│   ├── display_area.dart
│   ├── button_grid.dart
│   ├── calculator_button.dart
│   └── mode_selector.dart
├── utils/
│   ├── calculator_logic.dart
│   ├── expression_parser.dart
│   ├── constants.dart
│   ├── basic_layout.dart
│   ├── scientific_layout.dart
│   └── programmer_layout.dart
└── services/
    └── storage_service.dart
```

**Key components:**

* `models/`: model cho lịch sử, chế độ, cài đặt
* `providers/`: state management với Provider
* `screens/`: 3 màn hình chính (Calculator, History, Settings)
* `widgets/`: các widget tái sử dụng (buttons, display…)
* `utils/`: logic xử lý biểu thức, layout, hằng số
* `services/`: lưu trữ bằng SharedPreferences

---

## 📸 Screenshots

Tạo thư mục:

```text
screenshots/
  ├── basic_mode.png
  ├── scientific_mode.png
  ├── programmer_mode.png
  └── settings_screen.png
```

Chụp lại:

* Giao diện Basic mode
* Giao diện Scientific mode
* Giao diện Programmer mode
* Màn Settings / History

Dùng các ảnh này trong README và khi nộp bài trên e-learning.

---

## 📱 Hướng dẫn sử dụng

### 1. Calculator (màn hình chính)

Chức năng:

* Nhập số và toán tử qua lưới nút
* Dùng `C` để xóa toàn bộ, `CE` để xóa 1 ký tự cuối
* Dùng `±` để đổi dấu số hiện tại
* Dùng `%` để tính phần trăm
* Bấm `=` để tính kết quả
* Vuốt sang phải trên vùng display để xóa 1 ký tự
* Vuốt lên để mở màn hình History

### 2. Scientific Mode

* Chọn `Scientific` ở Mode selector
* Dùng các nút: `sin`, `cos`, `tan`, `ln`, `log`, `x²`, `x^y`, `√`, `π`, `e`
* Chọn DEG/RAD trong Settings để đổi chế độ góc
* Nhập biểu thức có ngoặc, ví dụ: `(5 + 3) × 2`

### 3. Programmer Mode

* Chọn `Programmer` ở Mode selector
* Hỗ trợ:

  * Chuyển giữa `DEC`, `BIN`, `OCT`, `HEX`
  * Toán tử `AND`, `OR`, `XOR`, `NOT`
  * Dịch bit `<<`, `>>`

### 4. History Screen

* Xem danh sách các phép tính trước đó
* Chọn 1 dòng lịch sử để reuse lại biểu thức
* Nút Clear All để xoá toàn bộ history (có confirm)

### 5. Settings Screen

* Chọn theme: Light/Dark/System
* Điều chỉnh số chữ số thập phân
* Chọn DEG/RAD
* Bật/Tắt Haptic, Sound
* Chọn giới hạn lịch sử
* Xoá toàn bộ lịch sử

---

## 🧪 Testing

### Unit tests

Chạy:

```bash
flutter test
```

Kiểm tra:

* Logic cộng/trừ/nhân/chia
* Hàm scientific (sin, cos, log…)
* Expression parser với ngoặc và nhiều toán tử
* Chức năng memory (M+, M-, MR, MC)

### Integration tests (optional)

* Test chuỗi bấm nút trên giao diện
* Test đổi mode
* Test load/save history và settings

---

## 📦 Dependencies chính

* `provider`: state management
* `shared_preferences`: lưu settings, history
* `math_expressions`: xử lý biểu thức toán
* `intl`: format số
* `flutter_test`, `mockito`: testing

---

## 🚀 Deploy & Nộp bài

### GitHub

1. Tạo repo:

`flutter_advanced_calculator_[your_name]`

2. Push source code đầy đủ (không include build/, .dart_tool/, .idea/)

3. Thêm:

* `README.md` (dùng nội dung này)
* Thư mục `screenshots/`
* Thư mục `docs/` nếu có ARCHITECTURE.md, TESTING.md

### Nộp e-learning

* Tạo file ZIP:
  `AdvancedCalculator_[StudentID]_[Name].zip`
* Bỏ vào:

  * thư mục `lib/`
  * `pubspec.yaml`
  * `screenshots/`
  * `test/`
* Upload lên hệ thống + ghi chú các tính năng thêm, khó khăn, coverage test.

---

Nếu bạn muốn, mình có thể giúp **chuyển luôn đoạn này thành `README.md`** hoặc viết dạng **comment trong `main.dart`** như:

```dart
// Advanced Mobile Calculator - Chapter 3
// [dán nội dung mô tả ở trên vào đây dưới dạng comment]
void main() {}
```

Hoặc bạn bảo:

> “viết README.md luôn”

mình sẽ format lại đúng Markdown cho GitHub.
