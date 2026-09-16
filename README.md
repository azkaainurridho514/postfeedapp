# Post Feed App

Aplikasi Flutter sederhana untuk menampilkan feed postingan, menggunakan data dari [dummyjson.com](https://dummyjson.com). Dibangun dengan pola Clean Architecture (domain, data, presentation) dan state management BLoC.

## Cara Instalasi

```
flutter pub get
```

Menjalankan aplikasi, bisa pilih salah satu:

**Emulator**

*Android Studio*
1. Buka Android Studio, jalankan emulator.
2. Pastikan emulator terdeteksi: `flutter devices`
3. Jalankan: `flutter run`

*VS Code*
1. Buka Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`), pilih **Flutter: Launch Emulator**, lalu pilih emulator yang mau dijalankan.
2. Pilih device/emulator tersebut di pojok kanan bawah VS Code (device selector).
3. Tekan `F5` atau jalankan lewat terminal: `flutter run`


**Real Device**
1. Hubungkan HP ke laptop via USB.
2. Android: aktifkan Developer Options & USB Debugging di HP. iOS: pastikan device sudah trusted & terdaftar di Xcode.
3. Pastikan device terdeteksi: `flutter devices`
4. Jalankan: `flutter run`

## Struktur Folder

Setiap fitur dibagi jadi 3 layer:

```
domain/         <- inti bisnis, tidak tahu soal API/JSON
  ├─ entity/         → model data murni yang dipakai di UI
  ├─ repositories/   → abstract class, berisi kontrak method
  └─ usecases/       → satu class untuk satu aksi

data/           <- implementasi nyata, berhubungan dengan API
  ├─ models/         → turunan dari entity, dilengkapi fromJson()
  ├─ datasources/    → memanggil API menggunakan Dio
  └─ repositories/   → implementasi dari domain/repositories

presentation/   <- UI dan state management
  ├─ bloc/{fitur}/   → event, state, dan bloc (BLoC pattern)
  ├─ pages/          → halaman utama fitur
  └─ widget/         → komponen UI pendukung
```

## Tugas Magang

Tugas saat ini adalah menambahkan fitur **comment** pada postingan. Penjelasan lengkap mengenai arsitektur, struktur folder, daftar file yang harus dibuat, endpoint API, langkah pengerjaan, dan checklist tersedia di dokumen terpisah: **Dokumen Tugas Fitur Comment Front End**.

Silakan buka dokumen tersebut sebelum mulai mengerjakan.