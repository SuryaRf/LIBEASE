# LibEase - Modern Library Management System 📚

LibEase adalah aplikasi mobile Flutter modern yang dirancang untuk memberikan pengalaman manajemen perpustakaan yang seamless, estetik, dan berperforma tinggi. Aplikasi ini terintegrasi dengan [Golang-Perpustakaan-Restful-API](https://github.com/afrizal423/Golang-Perpustakaan-Restful-API).

## 🚀 Apa yang Baru?

Baru-baru ini kami melakukan beberapa optimasi penting untuk memastikan aplikasi tetap stabil dan nyaman digunakan:
- **Upgrade Kompatibilitas:** Memperbarui `google_fonts` ke versi terbaru untuk mendukung SDK Flutter & Dart terkini.
- **Scroll yang Lebih Mulus:** Implementasi `CachedNetworkImage` untuk manajemen cache gambar yang lebih baik, mengurangi lag saat scrolling.
- **UX yang Lebih Baik:** Penambahan efek *shimmer loading* saat memuat gambar agar transisi data terasa lebih halus.

## 🏗️ Arsitektur Aplikasi

Kami menerapkan **Clean Architecture** untuk memastikan kode tetap rapi, mudah dikembangkan, dan mudah diuji:

1.  **Data Layer:** Sumber data (API/Local), berisi `Models` (DTO) dan `Repositories Implementation`.
2.  **Domain Layer:** Logika bisnis inti yang independen, berisi `Entities`, `Use Cases`, dan `Repository Interfaces`.
3.  **Presentation Layer:** Fokus pada UI dan State Management menggunakan **Riverpod** yang reaktif.

## 📂 Struktur Project

```text
lib/
├── core/                  # Global utilities, tema, dan config network (Dio)
├── features/              # Modularisasi fitur (Auth, Books, Categories, Borrowing)
├── shared/                # Widget reusable untuk konsistensi UI
└── main.dart              # Titik awal aplikasi
```

## 🛠️ Tech Stack & Library Unggulan

-   **State Management:** [Riverpod](https://riverpod.dev/) (Type-safe, testable, & scalable).
-   **Networking:** [Dio](https://pub.dev/packages/dio) dengan interceptor untuk logging yang rapi.
-   **UI & Animations:** [Flutter Animate](https://pub.dev/packages/flutter_animate) & [Lottie](https://pub.dev/packages/lottie).
-   **Image Handling:** [Cached Network Image](https://pub.dev/packages/cached_network_image) untuk performa scroll maksimal.
-   **Navigation:** [GoRouter](https://pub.dev/packages/go_router) untuk deep linking dan routing yang deklaratif.

## ✨ Fitur Utama

-   **Clean UI/UX:** Menggunakan prinsip Material 3 dengan sentuhan modern.
-   **Shimmer Loading:** State loading yang elegan di seluruh aplikasi.
-   **Responsive Layout:** Tampilan yang pas di berbagai ukuran layar smartphone.
-   **Smart Caching:** Tidak ada lagi download ulang gambar yang sama, hemat kuota dan cepat.

---
*Dikembangkan dengan ❤️ untuk pengalaman membaca yang lebih baik.*
