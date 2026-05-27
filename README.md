# LibEase - Modern Library Management System 📚

LibEase adalah aplikasi mobile Flutter modern yang saya bangun untuk memberikan pengalaman manajemen perpustakaan yang seamless, estetik, dan berperforma tinggi. Aplikasi ini terintegrasi dengan [Golang-Perpustakaan-Restful-API](https://github.com/afrizal423/Golang-Perpustakaan-Restful-API).

## 🚀 Apa yang Baru?

Baru-baru ini saya melakukan beberapa optimasi penting untuk memastikan aplikasi tetap stabil dan nyaman digunakan:
- **Upgrade Kompatibilitas:** Memperbarui `google_fonts` ke versi terbaru untuk mendukung SDK Flutter & Dart terkini.
- **Scroll yang Lebih Mulus:** Implementasi `CachedNetworkImage` untuk manajemen cache gambar yang lebih baik, mengurangi lag saat scrolling.
- **UX yang Lebih Baik:** Penambahan efek *shimmer loading* saat memuat gambar agar transisi data terasa lebih halus.

## 🏗️ Arsitektur Aplikasi

Saya menerapkan **Clean Architecture** untuk memastikan kode tetap rapi, mudah dikembangkan, dan mudah diuji. Arsitektur ini memisahkan tanggung jawab menjadi tiga lapisan utama:

1.  **Data Layer:** Menangani sumber data baik dari API (Remote) maupun Local Storage. Berisi `Models` (DTO) dan implementasi dari `Repositories`.
2.  **Domain Layer:** Lapisan paling inti yang berisi logika bisnis. Independen dari framework, berisi `Entities`, `Use Cases`, dan kontrak (Interfaces) untuk `Repository`.
3.  **Presentation Layer:** Fokus pada UI dan State Management. Lapisan ini menggunakan **Riverpod** untuk mengelola state secara reaktif.

## 📂 Struktur Folder

Struktur project ini saya susun secara modular agar mudah dipelihara:

```text
lib/
├── core/                  # Utilitas global, tema aplikasi, dan konfigurasi network (Dio)
├── features/              # Modularisasi fitur (setiap fitur memiliki folder sendiri)
│   ├── auth/              # Fitur login dan autentikasi
│   ├── books/             # Fitur daftar buku, detail buku, dan pencarian
│   └── ...                # Fitur lainnya (Category, Borrowing)
├── shared/                # Widget dan komponen reusable untuk konsistensi UI
└── main.dart              # Titik masuk utama (entry point) aplikasi
```

## 🛠️ State Management: Riverpod

Saya memilih **Riverpod** sebagai solusi state management karena:
- **Type-safe:** Meminimalisir kemungkinan error saat runtime.
- **Testable:** Sangat memudahkan dalam melakukan unit testing pada logika bisnis.
- **Scalable:** Cocok untuk aplikasi skala kecil hingga besar dengan boilerplate yang minimal.

## 🔄 Alur API (API Flow)

Setiap permintaan data mengikuti alur yang terstruktur:
1.  **UI Request:** Widget memicu aksi melalui `Provider`.
2.  **Provider/UseCase:** Menghubungkan UI dengan logika bisnis di Domain Layer.
3.  **Repository:** Mengambil data dari Remote Data Source (melalui `Dio`).
4.  **Data Mapping:** Data mentah dari API dikonversi menjadi `Model` (Data Layer) kemudian dipetakan ke `Entity` (Domain Layer).
5.  **State Update:** UI menerima data terbaru dalam bentuk `AsyncValue` untuk menangani state loading, data, dan error secara elegan.

## 🎨 Desain Halaman & UX

-   **Login Page:** Desain bersih dengan fokus pada kemudahan input pengguna.
-   **Home Dashboard:** Layout kartu buku yang modern dengan bayangan halus dan navigasi kategori yang intuitif.
-   **Visual Feedback:** Penggunaan animasi transisi yang ringan dan *shimmer effect* untuk memberikan pengalaman loading yang tidak membosankan.


