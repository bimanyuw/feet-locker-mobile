Febrian Abimanyu Wijanarko
2406397984

Tugas 7

1) Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    Widget tree adalah struktur hierarkis komponen UI di Flutter. Setiap widget bisa memiliki child (anak) atau children (beberapa anak). Parent mengatur tata letak/konteks untuk child (misal Scaffold berisi AppBar dan body; Column berisi beberapa InfoCard/GridView). Perubahan pada parent memengaruhi bagaimana child diukur, diposisikan, dan dirender.

2) Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    - MaterialApp: Pembungkus aplikasi ber–Material Design, menyiapkan tema, navigasi, dsb.
    - Scaffold: Kerangka halaman (app bar, body, snack bar).
    - AppBar: Bilah atas halaman dengan judul.
    - Text: Menampilkan teks (judul, label, identitas).
    - Icon: Menampilkan ikon pada tombol grid.
    - Card: Panel dengan elevasi untuk info (NPM, Nama, Kelas) dan kartu tombol.
    - Row / Column: Layout linier horizontal/vertikal.
    - GridView.count: Menyusun tombol dalam grid 3 kolom.
    - Padding / SizedBox / Container: Spasi dan pembungkus tata letak.
    - Material + InkWell: Permukaan material + efek sentuh (ripple) & handler onTap.
    - SnackBar + ScaffoldMessenger`: Menampilkan notifikasi singkat saat tombol ditekan.
    - MediaQuery`: Mengambil ukuran layar untuk responsif lebar kartu.

3) Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    MaterialApp menyediakan konfigurasi global: tema (warna/typografi), navigasi (routes), lokalitas, hingga integrasi Material Design. Karena banyak fitur Flutter (Scaffold, AppBar, SnackBar) mengasumsikan konteks Material, menempatkannya sebagai root mempermudah akses ke resource dan perilaku Material di seluruh subtree.

4) Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    - StatelessWidget: UI tidak bergantung pada state internal yang berubah seiring waktu; dibangun dari input (props) saja. Contoh: halaman menu statis dengan tombol–tombol yang hanya memicu Snackbar.
    - StatefulWidget: Memiliki State yang bisa berubah (setState), cocok untuk input form, counter, animasi yang bergantung interaksi.
    Pilih StatelessWidget saat UI cukup statis atau state dikelola eksternal; gunakan StatefulWidget bila UI perlu merespons perubahan state internal.

5) Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    BuildContext adalah pegangan ke posisi sebuah widget di widget tree. Ini dipakai untuk:
    - mengakses tema (Theme.of(context)), media query, ScaffoldMessenger, dsb.
    - melakukan navigasi (Navigator.of(context)).
    Di metode build, context memastikan widget dapat membaca dependensi dari ancestor yang tepat.

6) Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    - Hot reload: Menyuntikkan perubahan kode tanpa mengulang aplikasi dari awal, menjaga state saat ini (cepat saat styling/UI).  
    - Hot restart: Menjalankan ulang aplikasi dari main(), me-reset state (berguna saat perubahan fundamental yang memengaruhi inisialisasi awal).

Tugas 8

1) Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    Navigator.push() menambahkan halaman baru ke atas navigation stack tanpa menghapus halaman sebelumnya. Pengguna masih bisa kembali ke halaman sebelumnya dengan tombol back. Navigator.pushReplacement() menggantikan halaman yang sedang aktif dengan halaman baru dan menghapus halaman sebelumnya dari stack. Pengguna tidak bisa kembali ke halaman sebelumnya dengan tombol back karena halaman itu sudah tidak ada di stack.

    Penerapannya di aplikasi Feet Locker:
    - Navigator.push() digunakan ketika pengguna menekan menu Create Product di grid pada halaman utama. Dari Halaman Utama ke halaman form tambah produk, pengguna masih wajar jika ingin kembali lagi menggunakan tombol back, sehingga halaman sebelumnya tetap disimpan.
    - Navigator.pushReplacementNamed() digunakan di Drawer untuk berpindah antara Halaman Utama ('/') dan Tambah Produk ('/add-product'). Pada konteks navigasi utama aplikasi, pergantian halaman lewat Drawer sebaiknya tidak menumpuk banyak halaman kembar di stack, jadi halaman lama diganti dengan yang baru.

2) Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
    Aplikasi Feet Locker menggunakan struktur widget yang konsisten di setiap halaman utama:
    - Scaffold menjadi kerangka dasar setiap halaman (MyHomePage dan AddProductPage). Di dalamnya diatur struktur utama: appBar, drawer, dan body. Ini memastikan semua halaman punya layout yang rapi dan terstandarisasi.
    - AppBar digunakan untuk menampilkan judul aplikasi “Feet Locker” atau judul halaman yang relevan (“Tambah Produk Baru”). Warna AppBar dikaitkan dengan colorScheme.primary sehingga identitas visual konsisten di seluruh halaman.
    - Drawer (melalui AppDrawer) digunakan sebagai navigasi utama. Isi Drawer menampilkan dua menu:
        1. Halaman Utama
        2. Tambah Produk
    Drawer ini dipasang pada setiap halaman utama sehingga pengguna selalu punya cara yang sama untuk berpindah halaman, tanpa perlu kembali manual menggunakan tombol back.

3) Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    Pada AddProductPage saya memakai Padding untuk memberi jarak seragam di sekeliling form sehingga tiap field terbaca jelas dan tidak saling berdempetan, contohnya seluruh isi form dibungkus Padding(const EdgeInsets.all(16)) di dalam Card. Seluruh Form dibungkus SingleChildScrollView agar layar kecil atau kemunculan keyboard tidak memicu overflow, sehingga pengguna tetap bisa menggulir seluruh field dengan nyaman. Untuk skenario field yang lebih panjang, ListView memberi scrolling bawaan, pengelolaan ruang yang efisien, dan performa lebih stabil dibanding Column statis; pola ini mudah diterapkan dengan mengganti kontainer utama form menjadi ListView(padding: EdgeInsets.all(16), children: [...]) tanpa mengubah validasi maupun logika tombol. Kombinasi ini membuat form responsif, mudah dipindai, dan tetap rapi di berbagai ukuran layar.

4) Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
    Agar konsisten dan terinspirasi Foot Locker, tema aplikasi saya tetapkan monokrom hitam putih berkontras tinggi melalui pengaturan ThemeData di main.dart dengan ColorScheme kustom. Hitam menjadi warna utama untuk AppBar dan tombol aksi, putih digunakan sebagai latar konten dan kartu. AppBar diseragamkan dengan tipografi putih di atas latar hitam, kartu memakai outline tipis agar tampak rapi, dan bidang input memiliki outline abu saat idle serta hitam saat fokus untuk aksentuasi dan aksesibilitas. Seluruh komponen mengikuti skema yang sama sehingga antarmuka terasa satu identitas dan perubahan gaya cukup dilakukan dari konfigurasi tema pusat.