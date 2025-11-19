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

Tugas 9
1) Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

    Saat berkomunikasi dengan Django, data dikirim dan diterima dalam bentuk JSON. Di sisi Flutter, saya membuat model Dart (misalnya Product) untuk merepresentasikan struktur data tersebut. Dengan model, setiap field punya tipe yang jelas (String, int, bool, dll.) dan konstruktor/factory fromJson() bertugas melakukan parsing dari Map<String, dynamic> ke objek yang aman tipe datanya.

    Kalau saya langsung memakai Map<String, dynamic> di seluruh aplikasi tanpa model, beberapa masalah akan muncul:

    - Validasi tipe jadi lemah – semua nilai bertipe dynamic, sehingga typo key ("prce" bukan "price") atau tipe yang tidak sesuai (angka dibaca sebagai String) baru ketahuan saat runtime, bukan saat compile.
    - Null-safety sulit dijaga – karena setiap akses harus dicek null secara manual, rawan lupa dan berujung null exception.
    - Maintainability buruk – ketika struktur JSON berubah (misalnya field baru ditambah atau nama field diubah), saya harus memperbaiki banyak tempat yang mengakses map['field']. Dengan model, saya cukup update satu tempat (fromJson() / class model).
    - Code jadi tidak terstruktur – parsing, konversi, dan logika UI bercampur, sehingga susah dibaca dan diuji.


2) Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

    Pada tugas ini saya menggunakan dua pendekatan untuk komunikasi jaringan:
    - Package http
        1. Digunakan sebagai klien HTTP umum (GET/POST) yang sifatnya stateless.
        2. Cocok untuk memanggil endpoint publik yang tidak membutuhkan sesi login khusus, misalnya membaca data JSON biasa.
        3. Semua header, cookie, dan body harus saya atur manual setiap kali memanggil.

    - CookieRequest dari pbp_django_auth
        1. Dibuat khusus untuk integrasi Flutter ↔ Django yang menggunakan session+cookie.
        2. CookieRequest otomatis menyimpan dan mengirim cookies (termasuk sessionid dan CSRF cookie) di setiap request berikutnya, sehingga autentikasi Django berbasis sesi tetap terjaga.
        3. Ada fungsi-fungsi helper seperti post, get, login, logout yang sudah disesuaikan dengan cara kerja Django.

    Perbedaan utamanya: http adalah klien HTTP generik tanpa state, sedangkan CookieRequest adalah klien HTTP yang stateful dan fokus pada pengelolaan session/cookie agar autentikasi Django berjalan dengan benar. Dalam tugas ini, CookieRequest dipakai untuk semua endpoint yang butuh login (login, register, logout, dan endpoint JSON yang terproteksi).


3) Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

    Saya membungkus aplikasi dengan Provider<CookieRequest> di main.dart, lalu mengambil instance yang sama di setiap screen dengan context.watch<CookieRequest>().

    Alasannya:
    - Menjaga satu sesi login yang konsisten** – ketika user berhasil login, CookieRequest menyimpan cookie sesi dari Django. Kalau setiap screen membuat instance CookieRequest sendiri, cookie dan status login tidak ikut terbawa sehingga request berikutnya dianggap belum login oleh server.
    - Berbagi informasi user dan state autentikasi** – misalnya kita ingin tahu apakah user sudah login atau belum, atau menampilkan data yang terasosiasi dengan user tersebut. Dengan satu instance global, semua screen melihat state yang sama.
    - Menghindari duplikasi konfigurasi** – base URL, header, dan konfigurasi lain cukup diatur satu kali pada instance CookieRequesT yang dibagikan, bukan diulang-ulang di setiap widget.
    - Mendukung navigasi multi-halaman** – user bisa berpindah dari Login → Menu → List Produk → Detail Produk tanpa kehilangan sesi, karena semua request memakai CookieRequest yang sama.

4) Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

    a. Menambahkan 10.0.2.2 pada ALLOWED_HOSTS Django
        - Di emulator Android, alamat localhost (komputer host) diakses sebagai 10.0.2.2.
        - Ketika Flutter memanggil http://10.0.2.2:8000/..., Django harus mengizinkan host tersebut. Jika tidak, Django akan menolak request dengan error terkait DisallowedHost.

    b. Mengaktifkan CORS dan pengaturan cookie (SameSite/credentials)
        - Jika aplikasi Flutter dan Django berjalan pada origin yang berbeda, kita perlu mengizinkan permintaan lintas-origin (CORS).
        - Selain itu, karena autentikasi Django menggunakan sessionid dalam cookie, pengaturan seperti CORS_ALLOW_CREDENTIALS, CSRF_COOKIE_SAMESITE, dan SESSION_COOKIE_SAMESITE harus sesuai agar cookie boleh dikirim dan dibaca kembali.
        - Jika CORS dan pengaturan cookie tidak benar, request bisa gagal dengan error CORS, CSRF, atau cookie tidak pernah terkirim sehingga server selalu menganggap user belum login.

    c. Menambahkan izin internet di Android (`AndroidManifest.xml`)
        <uses-permission android:name="android.permission.INTERNET" />


    Jika salah satu konfigurasi tersebut tidak dilakukan dengan benar, efeknya antara lain:
    - Request dari Flutter ke Django tidak pernah sampai (network error).
    - Django menolak host atau origin sehingga muncul error 400/403/CORS.
    - Cookie sesi tidak terkirim, sehingga autentikasi tidak pernah dianggap sukses walaupun login sudah dikirim.

5) Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

    1. Input di Flutter
    - User mengisi form (misalnya form tambah produk) di Flutter.
    - Field-field diikat ke variabel lokal (misalnya _name, _price, dll.) dan divalidasi dengan ForM + TextFormField.

    2. Pengiriman ke Django
    - Setelah form valid, Flutter mengirim data ke Django melalui CookieRequest.post() atau postJson() ke endpoint tertentu.
    - Data dikirim sebagai body JSON atau form-encoded sesuai kebutuhan view di Django.

    3. Pemrosesan di sisi Django
    - View Django menerima request, membaca data dari request.POST atau request.body (JSON), dan memvalidasi menggunakan Form/ModelForm atau logika manual.
    - Jika valid, Django menyimpan data ke database melalui model (Product.objects.create(...) atau form.save()).

    4. Respon JSON ke Flutter
    - Django mengembalikan JsonResponse yang berisi status (berhasil/gagal) dan, bila perlu, data item yang baru dibuat atau daftar item yang sudah ada.

    5. Parsing dan penampilan di Flutter
    - Flutter menerima JSON, mengonversinya menjadi objek model Dart (Product.fromJson(...)).
    - Data model ini kemudian ditampilkan di UI, misalnya di ListView pada halaman daftar produk atau pada ProductDetailPage.
    - Proses ini biasanya dibungkus dalam FutureBuilder atau setState supaya UI otomatis ter-refresh ketika data sudah diterima.

6) Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

    - Register
        1. User membuka halaman registrasi di Flutter dan mengisi username, password1, dan password2.
        2. Flutter memanggil endpoint Django /ajax/register/ menggunakan CookieRequest.post() dengan body berisi field tersebut.
        3. Django membuat UserCreationForm dari data POST, memvalidasi kesesuaian password, dan memastikan username unik.
        4. Jika valid, Django menyimpan user baru di database dan mengirim respon JSON yang menandakan registrasi berhasil. Flutter menampilkan pesan sukses dan mengarahkan user kembali ke halaman login.

    - Login
        1. Di halaman login, user mengisi username dan password.
        2. Flutter mengirim request POST ke /ajax/login/ melalui CookieRequest.
        3. Django menggunakan AuthenticationForm atau authenticate() untuk memeriksa kredensial.
        4. Jika benar, Django memanggil login(request, user) yang akan membuat sesi dan mengirim cookie sessionid ke client.
        5. CookieRequest menyimpan cookie tersebut sehingga request berikutnya akan dianggap berasal dari user yang sudah login.
        6. Flutter menerima respon JSON ok: true dan menavigasi ke MenuPage, yang baru bisa diakses oleh user yang sudah login.

    - Logout
        1. Ketika user menekan tombol logout (di drawer atau di menu), Flutter memanggil endpoint /ajax/logout/ dengan CookieRequest.post().
        2. Django memanggil logout(request) yang menghapus sesi user di server dan menghapus cookie sesi.
        3. Django mengirim JSON ok: true, dan Flutter kemudian menavigasi user kembali ke halaman login dengan menghapus riwayat halaman sebelumnya.

7) Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

    1. Memastikan deployment Django berjalan
        - Mengecek kembali konfigurasi ALLOWED_HOSTS, CSRF_TRUSTED_ORIGINS, dan pengaturan static files.
        - Menguji akses ke halaman utama dan halaman login/register melalui URL deployment PBP.

    2. Membuat dan menyesuaikan model kustom pada Django
        - Menyusun model Product yang memuat name, price, description, thumbnail, category, is_featured, dan field tambahan (stock, brand, rating) serta relasi ForeignKey ke User.
        - Melakukan makemigrations dan migrate untuk memastikan struktur tabel terbentuk di database.

    3. Membuat endpoint JSON untuk daftar item
        - Membuat view yang mengembalikan semua produk milik user yang sedang login dalam bentuk JSON (menggunakan helper product_to_dict).
        - Menambahkan URL /json/ yang mengarah ke view tersebut.

    4. Membuat halaman login & register di Flutter
        - Menyusun LoginPage dan RegisterPage dengan Form dan TextFormField, plus validasi sederhana.
        - Menghubungkan kedua halaman ini dengan endpoint /ajax/login/ dan /ajax/register/ memakai CookieRequest.

    5. Mengintegrasikan sistem autentikasi Django dengan Flutter
        - Menggunakan Provider untuk membagikan satu instance CookieRequest ke seluruh aplikasi.
        - Setelah login berhasil, saya mengarahkan user ke MenuPage; jika logout berhasil, saya mengarahkan kembali ke LoginPage.

    6. Membuat halaman daftar item dan detail item di Flutter
        - Membuat Product model di Dart yang merepresentasikan JSON dari Django.
        - Membuat ProductListPage yang menggunakan CookieRequest.get() ke /json/, mengonversi respon menjadi List<Product>, dan menampilkan dalam bentuk list/card.
       - Menambahkan ProductDetailPage yang menampilkan seluruh atribut produk ketika salah satu card ditekan.

    7. Filter item berdasarkan user yang login
        - Di sisi Django, view JSON saya batasi dengan Product.objects.filter(user=request.user) sehingga hanya produk milik user tersebut yang muncul di Flutter.

    8. Menambahkan halaman “tambah produk” di Flutter
    - Memakai form yang sudah ada dari tugas sebelumnya, lalu (opsional) menghubungkannya ke endpoint Django untuk menyimpan produk baru milik user yang sedang login.

    9. Pengujian end-to-end dan dokumentasi
    - Menguji flow lengkap: register → login → melihat daftar produk → melihat detail → (opsional) menambah produk → logout, di lokal maupun di deployment.
    - Menjelaskan seluruh mekanisme di README sesuai pertanyaan yang diberikan.
