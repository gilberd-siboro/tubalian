/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306_1
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : database_pa3

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 13/06/2025 16:22:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bantuan
-- ----------------------------
DROP TABLE IF EXISTS `bantuan`;
CREATE TABLE `bantuan`  (
  `id_bantuan` int NOT NULL AUTO_INCREMENT,
  `jenis_bantuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tanggal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_kelompok_tani` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_bantuan`) USING BTREE,
  INDEX `id_kelompok_tani`(`id_kelompok_tani` ASC) USING BTREE,
  CONSTRAINT `bantuan_ibfk_1` FOREIGN KEY (`id_kelompok_tani`) REFERENCES `kelompok_tani` (`id_kelompok_tani`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bantuan
-- ----------------------------
INSERT INTO `bantuan` VALUES (1, 'asd', '02 Apr, 2025', 3, '2025-04-24 14:43:07', '2025-04-24 14:50:28', 1);
INSERT INTO `bantuan` VALUES (2, 'asd', '02 Apr, 2025', 2, '2025-04-30 08:15:44', '2025-04-30 08:15:49', 1);
INSERT INTO `bantuan` VALUES (3, 'jhbnm', '07 May, 2025', 3, '2025-05-09 11:12:46', '2025-05-09 11:12:53', 1);
INSERT INTO `bantuan` VALUES (4, 'Bantuan ini berupa bibit, pupuk, pestisida, traktor, pompa air, dan alat-alat pertanian lainnya untuk meningkatkan Alat-alat pertanian', '06 May, 2025', 4, '2025-05-11 21:13:05', NULL, 0);
INSERT INTO `bantuan` VALUES (5, 'pupuk', '09 Jun, 2025', 2, '2025-06-09 04:17:21', NULL, 0);

-- ----------------------------
-- Table structure for berita
-- ----------------------------
DROP TABLE IF EXISTS `berita`;
CREATE TABLE `berita`  (
  `idBerita` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`idBerita`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of berita
-- ----------------------------
INSERT INTO `berita` VALUES (1, 'Tes', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Soluta nulla repellat eligendi officiis quam consequuntur esse quidem tempora aperiam minima!', '1745288712_11422046_MingguKe12.jpg', 1, '2025-04-22 09:25:12', '2025-05-08 13:47:34', 1);
INSERT INTO `berita` VALUES (2, 'Bu Andien Diduga Menghancurkan Sawah: Kontroversi di Desa', 'Pada tanggal 30 April 2025, sebuah insiden kontroversial terjadi di sebuah desa yang terletak di kawasan pedesaan Indonesia. Seorang warga desa, yang dikenal dengan nama Bu Andien, tengah menjadi sorotan publik setelah diduga menyebabkan kerusakan pada ladang sawah yang dikelola oleh petani lokal.\r\n\r\nPeristiwa ini bermula ketika Bu Andien, yang dikenal sebagai tokoh sosial, datang ke sawah milik salah satu petani untuk melakukan sebuah proyek yang melibatkan penggunaan alat berat. Namun, tidak lama setelah itu, beberapa petani melaporkan bahwa tanaman padi mereka hancur akibat penggunaan alat yang terlalu agresif, yang diduga tidak sesuai dengan prosedur pengelolaan pertanian yang aman.\r\n\r\nKerusakan yang terjadi cukup signifikan, dengan sebagian besar tanaman padi rusak, mengakibatkan kerugian besar bagi petani yang menggantungkan hidupnya pada hasil pertanian tersebut. Kejadian ini memicu perdebatan sengit di kalangan warga desa, dengan beberapa pihak membela Bu Andien, sementara yang lainnya mengkritik tindakan yang dilakukan oleh tokoh tersebut.\r\n\r\nPihak yang Terlibat dan Reaksi Masyarakat\r\n\r\nMenurut beberapa saksi mata, Bu Andien menyampaikan bahwa proyek yang sedang dijalankannya bertujuan untuk meningkatkan produktivitas pertanian dan memperkenalkan teknologi baru yang dianggap bisa mempermudah pekerjaan petani. Namun, banyak petani yang merasa khawatir bahwa penggunaan alat berat yang tidak terkontrol justru dapat merusak ekosistem tanah pertanian mereka.\r\n\r\nDi sisi lain, kelompok pendukung Bu Andien menyatakan bahwa segala bentuk inovasi dalam pertanian harus dipandang sebagai langkah maju dan bahwa kerusakan yang terjadi adalah akibat dari ketidaktahuan atau kesalahan dalam pelaksanaan yang tidak direncanakan dengan matang.\r\n\r\nPengawasan dan Tindak Lanjut dari Pihak Berwenang\r\n\r\nPemerintah setempat belum mengeluarkan pernyataan resmi terkait insiden ini. Namun, Kepala Desa yang bertanggung jawab atas wilayah tersebut telah mengimbau kepada masyarakat untuk tetap tenang dan mempercayakan penyelesaian masalah ini kepada pihak yang berwenang.\r\n\r\nPara ahli pertanian yang diundang untuk menilai kerusakan tersebut juga menyoroti pentingnya pelatihan dan pendidikan kepada petani dan pihak terkait mengenai penggunaan alat pertanian yang ramah lingkungan dan sesuai dengan praktik pertanian yang baik.\r\n\r\nHarapan untuk Solusi yang Menguntungkan Semua Pihak\r\n\r\nPara petani berharap agar insiden ini bisa menjadi pelajaran bagi semua pihak untuk lebih berhati-hati dalam menerapkan teknologi pertanian, serta pentingnya menjaga keberlanjutan dan keberagaman pertanian di daerah tersebut. Sementara itu, Bu Andien diharapkan dapat memberikan klarifikasi lebih lanjut terkait peran serta tanggung jawabnya dalam proyek ini.\r\n\r\nInsiden ini masih terus menjadi topik hangat dalam diskusi masyarakat, dengan banyak pihak yang berharap agar ada solusi yang dapat menguntungkan baik petani maupun pihak yang mempromosikan inovasi pertanian di desa tersebut.', '1746686830_th (4).jpeg', 1, '2025-04-30 08:42:11', '2025-05-08 13:48:14', 0);
INSERT INTO `berita` VALUES (3, 'Ancaman Kucing Liar: Ladang Pertanian di Desa Ynnoj Terancam', 'Pemerintah Kabupaten Tapanuli Utara membuka peluang bagi generasi muda untuk berkontribusi dalam sektor pertanian dengan menggagas program baru yang mengajak para petani milenial bergabung sebagai mitra pemerintah. Program ini bertujuan untuk meningkatkan kualitas dan kuantitas hasil pertanian serta membuka peluang usaha bagi kaum muda di daerah tersebut.\r\n\r\nDalam rangka mendorong perkembangan sektor pertanian yang berkelanjutan, Pemkab Tapanuli Utara mengundang para petani milenial dengan usia maksimal 35 tahun untuk mengikuti program ini. Dengan tema “Petani Milenial Bersatu Membangun Pertanian yang Modern”, Pemkab berencana membentuk sinergi antara pemerintah dan petani, khususnya dalam pengelolaan pertanian dan peternakan yang lebih maju, ramah lingkungan, dan menghasilkan produk berkualitas.\r\n\r\nSyarat Pendaftaran Program Petani Milenial:\r\n\r\n1. Usia maksimal 35 tahun\r\n\r\n2. Petani dengan luas lahan minimal 0,5 Ha\r\n\r\n3. Peternak yang memiliki lahan minimal 0,2 Ha\r\n\r\n4. Pemilik kolam ikan untuk kegiatan budidaya perikanan\r\n\r\n5. Bersedia menjadi mitra Pemerintah Kabupaten Tapanuli Utara\r\n\r\nProgram ini diharapkan dapat membuka jalan bagi para pemuda untuk berperan aktif dalam dunia pertanian dan peternakan, serta menjadi agen perubahan dalam memajukan sektor tersebut di Tapanuli Utara. Selain itu, para petani milenial yang bergabung akan mendapatkan pendampingan dan fasilitas dari pemerintah dalam rangka memodernisasi teknik pertanian dan peternakan, serta memperkenalkan teknologi baru yang dapat meningkatkan produktivitas.\r\n\r\nDukungan dari Pemerintah Kabupaten:\r\n\r\nPemkab Tapanuli Utara memberikan dukungan penuh terhadap program ini, dengan harapan dapat menciptakan lapangan pekerjaan baru di sektor pertanian dan peternakan. Selain itu, keberadaan petani milenial diharapkan dapat membawa inovasi serta pemikiran kreatif yang dapat meningkatkan daya saing produk pertanian dari Tapanuli Utara di pasar nasional maupun internasional.\r\n\r\nDengan mendaftar sebagai mitra petani milenial, peserta program ini berkesempatan untuk ikut serta dalam pengembangan potensi agribisnis, pelatihan keterampilan, dan mendapatkan akses terhadap pasar yang lebih luas. Para petani dan peternak juga akan diberi kesempatan untuk memasarkan produk mereka secara langsung melalui program kerjasama dengan berbagai lembaga dan perusahaan yang bergerak di bidang agribisnis.\r\n\r\nMelalui program ini, Pemkab Tapanuli Utara berharap agar generasi muda dapat melihat sektor pertanian sebagai peluang yang menjanjikan dan mampu menjadi pendorong utama dalam mewujudkan ketahanan pangan dan kemajuan ekonomi daerah. Pemerintah juga berkomitmen untuk terus mendukung segala upaya yang berkaitan dengan peningkatan kualitas sumber daya manusia, terutama dalam sektor yang memiliki peran vital bagi kehidupan masyarakat ini.\r\n\r\nJadi, bagi para petani dan peternak muda yang memenuhi syarat, jangan lewatkan kesempatan berharga ini untuk bergabung dan menjadi bagian dari kemajuan pertanian Tapanuli Utara!', '1746686135_th (3).jpeg', 1, '2025-04-30 08:43:54', '2025-05-08 13:35:35', 0);
INSERT INTO `berita` VALUES (4, 'Harga Tomat Diperkirakan Naik di Pasar Sidoal: Apa Penyebabnya?', 'Pasar Sidoal diperkirakan akan mengalami kenaikan harga tomat dalam beberapa minggu ke depan. Para pedagang dan petani setempat mengindikasikan bahwa beberapa faktor telah berkontribusi terhadap tren ini, yang dapat memengaruhi konsumen dan rantai pasok', '1746685953_th (2).jpeg', 1, '2025-04-30 08:46:41', '2025-05-08 13:32:33', 0);
INSERT INTO `berita` VALUES (5, 'Gagal Panen padi di desa Simare mare', 'Gagal Panen padi di desa Simare mare', '1746685813_th (1).jpeg', 1, '2025-05-03 20:13:07', '2025-05-08 13:30:13', 0);
INSERT INTO `berita` VALUES (6, 'Jagung Murah di Pasar Dolok', 'Penurunan harga jagung dalam beberapa pekan terakhir disambut positif oleh petani lokal. Salah satu petani dari daerah Blitar, Budi Santoso, menyatakan bahwa tren harga yang lebih rendah justru memberikan dampak yang menguntungkan, baik bagi pelaku usaha tani maupun konsumen. Menurutnya, dengan harga yang kini lebih terjangkau, jangkauan pasar semakin luas dan volume penjualan mengalami peningkatan.\r\n\r\n\"Kami senang dengan harga jagung yang lebih murah. Ini membantu kami menjangkau lebih banyak konsumen dan meningkatkan penjualan kami,\" ujar Budi saat ditemui di lahan pertaniannya, Minggu (11/5). Ia menjelaskan bahwa meskipun harga satuan jagung menurun, keuntungan tetap dapat diraih dari peningkatan volume transaksi. Petani juga merasa lebih termotivasi untuk terus menanam dan merawat lahan mereka karena adanya permintaan pasar yang stabil.\r\n\r\nHarga jagung di sejumlah pasar tradisional dan sentra pertanian di Jawa Timur diketahui mengalami penurunan dalam kisaran 5–10 persen dibandingkan bulan sebelumnya. Penurunan ini dinilai sebagai hasil dari meningkatnya pasokan dan efisiensi distribusi dari produsen ke konsumen. Selain itu, cuaca yang mendukung musim panen juga menjadi salah satu faktor yang mempercepat pasokan ke pasar.\r\n\r\nDi sisi lain, para pelaku industri pakan ternak dan makanan olahan yang menggunakan jagung sebagai bahan baku utama juga merasakan dampak positif. Dengan harga yang lebih rendah, biaya produksi dapat ditekan, sehingga harga jual produk ke konsumen pun lebih kompetitif. Hal ini berpotensi mendorong pertumbuhan sektor hilir yang selama ini sangat bergantung pada komoditas jagung.\r\n\r\nPemerintah daerah dan dinas pertanian setempat turut mengamati kondisi ini dengan optimisme. Mereka menyebut bahwa kestabilan harga jagung dalam jangka menengah sangat penting, baik bagi kesejahteraan petani maupun keberlanjutan industri terkait. Upaya untuk menjaga pasokan, memperbaiki infrastruktur distribusi, serta meningkatkan produktivitas lahan akan terus dilakukan untuk memastikan harga tetap stabil dan adil di semua lini.\r\n\r\nKe depan, petani seperti Budi Santoso berharap agar tren positif ini bisa terus berlangsung. Ia menegaskan bahwa harga yang stabil jauh lebih penting daripada harga tinggi yang hanya bersifat sementara. “Petani butuh kepastian, bukan spekulasi. Dengan harga yang stabil dan permintaan yang jelas, kami bisa merencanakan produksi dengan lebih baik,” tuturnya.\r\n\r\nDengan semua pihak yang merasa diuntungkan—mulai dari petani, pelaku usaha, hingga konsumen—tren penurunan harga jagung kali ini tampaknya membuka peluang terciptanya sistem pangan yang lebih seimbang dan berkelanjutan. Jika dikelola dengan baik, momentum ini bisa menjadi titik tolak bagi perbaikan ekosistem pertanian nasional secara Penurunan harga jagung dalam beberapa pekan terakhir disambut positif oleh petani lokal. Salah satu petani dari daerah Blitar, Budi Santoso, menyatakan bahwa tren harga yang lebih rendah justru memberikan dampak yang menguntungkan, baik bagi pelaku usaha tani maupun konsumen. Menurutnya, dengan harga yang kini lebih terjangkau, jangkauan pasar semakin luas dan volume penjualan mengalami peningkatan.\r\n\r\n\"Kami senang dengan harga jagung yang lebih murah. Ini membantu kami menjangkau lebih banyak konsumen dan meningkatkan penjualan kami,\" ujar Budi saat ditemui di lahan pertaniannya, Minggu (11/5). Ia menjelaskan bahwa meskipun harga satuan jagung menurun, keuntungan tetap dapat diraih dari peningkatan volume transaksi. Petani juga merasa lebih termotivasi untuk terus menanam dan merawat lahan mereka karena adanya permintaan pasar yang stabil.\r\n\r\nHarga jagung di sejumlah pasar tradisional dan sentra pertanian di Jawa Timur diketahui mengalami penurunan dalam kisaran 5–10 persen dibandingkan bulan sebelumnya. Penurunan ini dinilai sebagai hasil dari meningkatnya pasokan dan efisiensi distribusi dari produsen ke konsumen. Selain itu, cuaca yang mendukung musim panen juga menjadi salah satu faktor yang mempercepat pasokan ke pasar.\r\n\r\nDi sisi lain, para pelaku industri pakan ternak dan makanan olahan yang menggunakan jagung sebagai bahan baku utama juga merasakan dampak positif. Dengan harga yang lebih rendah, biaya produksi dapat ditekan, sehingga harga jual produk ke konsumen pun lebih kompetitif. Hal ini berpotensi mendorong pertumbuhan sektor hilir yang selama ini sangat bergantung pada komoditas jagung.\r\n\r\nPemerintah daerah dan dinas pertanian setempat turut mengamati kondisi ini dengan optimisme. Mereka menyebut bahwa kestabilan harga jagung dalam jangka menengah sangat penting, baik bagi kesejahteraan petani maupun keberlanjutan industri terkait. Upaya untuk menjaga pasokan, memperbaiki infrastruktur distribusi, serta meningkatkan produktivitas lahan akan terus dilakukan untuk memastikan harga tetap stabil dan adil di semua lini.\r\n\r\nKe depan, petani seperti Budi Santoso berharap agar tren positif ini bisa terus berlangsung. Ia menegaskan bahwa harga yang stabil jauh lebih penting daripada harga tinggi yang hanya bersifat sementara. “Petani butuh kepastian, bukan spekulasi. Dengan harga yang stabil dan permintaan yang jelas, kami bisa merencanakan produksi dengan lebih baik,” tuturnya.\r\n\r\nDengan semua pihak yang merasa diuntungkan—mulai dari petani, pelaku usaha, hingga konsumen—tren penurunan harga jagung kali ini tampaknya membuka peluang terciptanya sistem pangan yang lebih seimbang dan berkelanjutan. Jika dikelola dengan baik, momentum ini bisa menjadi titik tolak bagi perbaikan ekosistem pertanian nasional secara menyeluruh.', '1746685703_th.jpeg', 1, '2025-05-03 20:35:10', '2025-05-11 16:27:19', 0);
INSERT INTO `berita` VALUES (7, 'tes', 'tes', '1746686995_th (3).jpeg', 1, '2025-05-08 13:49:55', '2025-05-08 13:50:23', 1);
INSERT INTO `berita` VALUES (8, 'Serangan Hama, Ancaman Panen di Tambunan!', 'Sawah-sawah petani di Desa Tambunan saat ini tengah menghadapi serangan hama padi yang mengancam hasil panen tahun ini. Serangan yang datang secara tiba-tiba ini menyebabkan kekhawatiran di kalangan petani karena berdampak langsung pada produktivitas dan ketahanan pangan lokal. Pemerintah desa bersama penyuluh pertanian sedang berupaya melakukan tindakan pencegahan dan pengendalian agar penyebaran hama tidak semakin meluas. Kolaborasi antara petani dan pihak terkait menjadi kunci untuk menyelamatkan padi dari ancaman gagal panen', '1747359326_th (5).jpeg', 1, '2025-05-16 01:35:26', '2025-06-04 04:29:55', 1);
INSERT INTO `berita` VALUES (9, 'Pemkab Tapanuli Utara Mengajak Petani Milenial untuk Bergabung dan Membangun Pertanian Modern di Daerah', 'Pemerintah Kabupaten Tapanuli Utara membuka peluang bagi generasi muda untuk berkontribusi dalam sektor pertanian dengan menggagas program baru yang mengajak para petani milenial bergabung sebagai mitra pemerintah. Program ini bertujuan untuk meningkatkan kualitas dan kuantitas hasil pertanian serta membuka peluang usaha bagi kaum muda di daerah tersebut.\r\n\r\nDalam rangka mendorong perkembangan sektor pertanian yang berkelanjutan, Pemkab Tapanuli Utara mengundang para petani milenial dengan usia maksimal 35 tahun untuk mengikuti program ini. Dengan tema “Petani Milenial Bersatu Membangun Pertanian yang Modern”, Pemkab berencana membentuk sinergi antara pemerintah dan petani, khususnya dalam pengelolaan pertanian dan peternakan yang lebih maju, ramah lingkungan, dan menghasilkan produk berkualitas.\r\n\r\nSyarat Pendaftaran Program Petani Milenial:\r\n\r\n1. Usia maksimal 35 tahun\r\n\r\n2. Petani dengan luas lahan minimal 0,5 Ha\r\n\r\n3. Peternak yang memiliki lahan minimal 0,2 Ha\r\n\r\n4. Pemilik kolam ikan untuk kegiatan budidaya perikanan\r\n\r\n5. Bersedia menjadi mitra Pemerintah Kabupaten Tapanuli Utara\r\n\r\nProgram ini diharapkan dapat membuka jalan bagi para pemuda untuk berperan aktif dalam dunia pertanian dan peternakan, serta menjadi agen perubahan dalam memajukan sektor tersebut di Tapanuli Utara. Selain itu, para petani milenial yang bergabung akan mendapatkan pendampingan dan fasilitas dari pemerintah dalam rangka memodernisasi teknik pertanian dan peternakan, serta memperkenalkan teknologi baru yang dapat meningkatkan produktivitas.\r\n\r\nDukungan dari Pemerintah Kabupaten:\r\n\r\nPemkab Tapanuli Utara memberikan dukungan penuh terhadap program ini, dengan harapan dapat menciptakan lapangan pekerjaan baru di sektor pertanian dan peternakan. Selain itu, keberadaan petani milenial diharapkan dapat membawa inovasi serta pemikiran kreatif yang dapat meningkatkan daya saing produk pertanian dari Tapanuli Utara di pasar nasional maupun internasional.\r\n\r\nDengan mendaftar sebagai mitra petani milenial, peserta program ini berkesempatan untuk ikut serta dalam pengembangan potensi agribisnis, pelatihan keterampilan, dan mendapatkan akses terhadap pasar yang lebih luas. Para petani dan peternak juga akan diberi kesempatan untuk memasarkan produk mereka secara langsung melalui program kerjasama dengan berbagai lembaga dan perusahaan yang bergerak di bidang agribisnis.\r\n\r\nMelalui program ini, Pemkab Tapanuli Utara berharap agar generasi muda dapat melihat sektor pertanian sebagai peluang yang menjanjikan dan mampu menjadi pendorong utama dalam mewujudkan ketahanan pangan dan kemajuan ekonomi daerah. Pemerintah juga berkomitmen untuk terus mendukung segala upaya yang berkaitan dengan peningkatan kualitas sumber daya manusia, terutama dalam sektor yang memiliki peran vital bagi kehidupan masyarakat ini.\r\n\r\nJadi, bagi para petani dan peternak muda yang memenuhi syarat, jangan lewatkan kesempatan berharga ini untuk bergabung dan menjadi bagian dari kemajuan pertanian Tapanuli Utara!', '1749442533_petani_milenial.jpg', 1, '2025-06-09 04:15:33', NULL, 0);

-- ----------------------------
-- Table structure for bidang
-- ----------------------------
DROP TABLE IF EXISTS `bidang`;
CREATE TABLE `bidang`  (
  `id_bidang` int NOT NULL AUTO_INCREMENT,
  `idDepartemen` int NULL DEFAULT NULL,
  `parent_bidang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nama_bidang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_bidang`) USING BTREE,
  INDEX `fk_idDepartemen`(`idDepartemen` ASC) USING BTREE,
  CONSTRAINT `fk_idDepartemen` FOREIGN KEY (`idDepartemen`) REFERENCES `departemen` (`idDepartemen`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bidang
-- ----------------------------
INSERT INTO `bidang` VALUES (1, 1, NULL, 'Dinas', 'Mengelola dinas pertanian Tapanuli Utara', NULL, '2025-05-09 11:02:52', 0);
INSERT INTO `bidang` VALUES (2, 1, NULL, 'UPT', 'Lembaga yang menjalankan sebagian fungsi teknis operasional dari suatu instansi atau lembaga induk', NULL, NULL, 0);
INSERT INTO `bidang` VALUES (3, 1, NULL, 'Tanaman Pangan', 'Mengelola tanaman pangan', NULL, NULL, 0);
INSERT INTO `bidang` VALUES (4, 1, NULL, 'Hortikultura', 'Mengelola tanaman hortikultura', NULL, NULL, 0);
INSERT INTO `bidang` VALUES (5, 1, NULL, 'Perkebunan', 'Mengelola tanaman perkebunan', NULL, NULL, 0);
INSERT INTO `bidang` VALUES (6, 1, NULL, 'Sarana dan Prasarana', 'Mengelola sarana dan prasarana', NULL, NULL, 0);
INSERT INTO `bidang` VALUES (7, 1, NULL, 'Penyuluhan', 'Mengelola penyuluhan data pertanian', NULL, NULL, 0);
INSERT INTO `bidang` VALUES (8, 2, NULL, 'Non Bidang', 'Tidak termasuk dalam bidang', NULL, NULL, 0);
INSERT INTO `bidang` VALUES (9, 1, NULL, 'Kesekretariatan', 'Bertanggung jawab atas administrasi, kepegawaian, keuangan, dan layanan umum untuk mendukung kelancaran operasional serta pengambilan keputusan pimpinan.', NULL, NULL, 0);

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities`  (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `prov_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`city_id`) USING BTREE,
  INDEX `prov_id`(`prov_id` ASC) USING BTREE,
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`prov_id`) REFERENCES `provinces` (`prov_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES (1, 'Tapanuli Utara', 1);

-- ----------------------------
-- Table structure for data_pertanian
-- ----------------------------
DROP TABLE IF EXISTS `data_pertanian`;
CREATE TABLE `data_pertanian`  (
  `id_data_pertanian` int NOT NULL AUTO_INCREMENT,
  `id_petani` int NULL DEFAULT NULL,
  `id_lahan` int NULL DEFAULT NULL,
  `id_komoditas` int NULL DEFAULT NULL,
  `luas_lahan` decimal(10, 2) NULL DEFAULT NULL,
  `subdis_id` int NULL DEFAULT NULL,
  `tanggal_tanam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tanggal_pencatatan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `alamat_lengkap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_data_pertanian`) USING BTREE,
  INDEX `id_petani`(`id_petani` ASC) USING BTREE,
  INDEX `id_lahan`(`id_lahan` ASC) USING BTREE,
  INDEX `id_komoditas`(`id_komoditas` ASC) USING BTREE,
  INDEX `subdis_id`(`subdis_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `data_pertanian_ibfk_1` FOREIGN KEY (`id_petani`) REFERENCES `petani` (`id_petani`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `data_pertanian_ibfk_2` FOREIGN KEY (`id_lahan`) REFERENCES `lahan` (`id_lahan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `data_pertanian_ibfk_3` FOREIGN KEY (`id_komoditas`) REFERENCES `komoditas` (`id_komoditas`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `data_pertanian_ibfk_4` FOREIGN KEY (`subdis_id`) REFERENCES `subdistricts` (`subdis_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `data_pertanian_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_pertanian
-- ----------------------------
INSERT INTO `data_pertanian` VALUES (2, 1, 1, 7, 1000.00, 1, '06 Mar, 2025', '20 Mar, 2025', 2, 'Tarutung', '2.0197784588225454', '98.97601605494013', NULL, '2025-06-12 11:52:44', 1);
INSERT INTO `data_pertanian` VALUES (3, 7, 1, 7, 12000.00, 15, '03 Apr, 2025', '04 Apr, 2025', 1, 'Silando', NULL, NULL, NULL, '2025-05-08 08:55:32', 0);
INSERT INTO `data_pertanian` VALUES (4, 8, 3, 5, 1000.00, 16, '12 Feb, 2025', '04 Apr, 2025', 1, 'Batu Binumbun', NULL, NULL, NULL, '2025-05-08 09:26:28', 0);
INSERT INTO `data_pertanian` VALUES (5, 9, 2, 6, 1234.00, 17, '02 Apr, 2025', '04 Apr, 2025', 1, 'Simanampang', '0.0260853762749248', '-0.02898091594215613', NULL, '2025-05-10 18:08:42', 0);
INSERT INTO `data_pertanian` VALUES (14, 2, 3, 10, 12312.00, 2, '07 May, 2025', '05 May, 2025', 1, 'Hapoltahan', 'null', 'null', '2025-05-08 09:48:51', '2025-06-12 20:52:42', 0);
INSERT INTO `data_pertanian` VALUES (22, 1, 1, 10, 123.00, 15, '20 May, 2025', '27 May, 2025', 1, 'asd', '2.0308136798895253', '98.96454773662681', '2025-05-11 11:05:40', '2025-06-12 20:53:14', 0);

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `idDepartemen` int NOT NULL AUTO_INCREMENT,
  `namaDepartmen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createAt` datetime NULL DEFAULT NULL,
  `updateAt` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`idDepartemen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES (1, 'Dinas Pertanian Tapanuli Utara', 'Instansi pemerintah daerah yang menangani pertanian', NULL, '2025-05-09 11:02:27', 0);
INSERT INTO `departemen` VALUES (2, 'Non Departemen', 'Tidak tergabung dalam departemen apapun', NULL, '2025-04-01 13:58:05', 0);

-- ----------------------------
-- Table structure for districts
-- ----------------------------
DROP TABLE IF EXISTS `districts`;
CREATE TABLE `districts`  (
  `dis_id` int NOT NULL AUTO_INCREMENT,
  `dis_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city_id` int NULL DEFAULT 1,
  PRIMARY KEY (`dis_id`) USING BTREE,
  UNIQUE INDEX `unique_dis_name`(`dis_name` ASC) USING BTREE,
  INDEX `city_id`(`city_id` ASC) USING BTREE,
  INDEX `dis_id`(`dis_id` ASC) USING BTREE,
  CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of districts
-- ----------------------------
INSERT INTO `districts` VALUES (1, 'Tarutung', 1);
INSERT INTO `districts` VALUES (2, 'Muara', 1);
INSERT INTO `districts` VALUES (3, 'Pahae Julu', 1);
INSERT INTO `districts` VALUES (4, 'Sipoholon', 1);
INSERT INTO `districts` VALUES (5, 'Sipahutar', 1);
INSERT INTO `districts` VALUES (6, 'Siallagan', 1);

-- ----------------------------
-- Table structure for gambar_lahan
-- ----------------------------
DROP TABLE IF EXISTS `gambar_lahan`;
CREATE TABLE `gambar_lahan`  (
  `id_gambar` int NOT NULL AUTO_INCREMENT,
  `url_gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_data_pertanian` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_gambar`) USING BTREE,
  INDEX `id_data_pertanian`(`id_data_pertanian` ASC) USING BTREE,
  CONSTRAINT `gambar_lahan_ibfk_1` FOREIGN KEY (`id_data_pertanian`) REFERENCES `data_pertanian` (`id_data_pertanian`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gambar_lahan
-- ----------------------------
INSERT INTO `gambar_lahan` VALUES (30, '1746669332_fe1.jpg', 3);
INSERT INTO `gambar_lahan` VALUES (31, '1746669332_fed.jpg', 3);
INSERT INTO `gambar_lahan` VALUES (58, '1746936340_fe1.jpg', 22);
INSERT INTO `gambar_lahan` VALUES (59, '1746936340_fed.jpg', 22);
INSERT INTO `gambar_lahan` VALUES (60, '1746936340_harga.jpg', 22);
INSERT INTO `gambar_lahan` VALUES (61, '1746936340_harga_komoditas.jpg', 22);
INSERT INTO `gambar_lahan` VALUES (62, '1746973172_lahannn.jpeg', 2);

-- ----------------------------
-- Table structure for golonganpangkat
-- ----------------------------
DROP TABLE IF EXISTS `golonganpangkat`;
CREATE TABLE `golonganpangkat`  (
  `idGolonganPangkat` int NOT NULL AUTO_INCREMENT,
  `golongan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pangkat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createdAt` datetime NULL DEFAULT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`idGolonganPangkat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of golonganpangkat
-- ----------------------------
INSERT INTO `golonganpangkat` VALUES (1, 'IV/d', 'Pembina Utama Madya', 'Jabatan tertinggi dalam struktural ASN', NULL, '2025-04-01 14:21:35', 0);
INSERT INTO `golonganpangkat` VALUES (2, 'IV/c', 'Pembina Utama Muda', 'Jabatan tinggi dalam struktural ASN', NULL, NULL, 0);
INSERT INTO `golonganpangkat` VALUES (3, 'IV/a', 'Pembina', 'Jabatan dalam struktural ASN', NULL, NULL, 0);
INSERT INTO `golonganpangkat` VALUES (4, 'III/d', 'Penata Tingkat I', 'Jabatan dalam fungsional ASN', NULL, NULL, 0);
INSERT INTO `golonganpangkat` VALUES (5, 'III/c', 'Penata', 'Jabatan dalam fungsional ASN', NULL, NULL, 0);

-- ----------------------------
-- Table structure for harga_komoditas
-- ----------------------------
DROP TABLE IF EXISTS `harga_komoditas`;
CREATE TABLE `harga_komoditas`  (
  `id_harga` int NOT NULL AUTO_INCREMENT,
  `harga` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tanggal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_pasar` int NULL DEFAULT NULL,
  `id_komoditas` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_harga`) USING BTREE,
  INDEX `id_pasar`(`id_pasar` ASC) USING BTREE,
  INDEX `id_komoditas`(`id_komoditas` ASC) USING BTREE,
  CONSTRAINT `harga_komoditas_ibfk_1` FOREIGN KEY (`id_pasar`) REFERENCES `pasar` (`id_pasar`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `harga_komoditas_ibfk_2` FOREIGN KEY (`id_komoditas`) REFERENCES `komoditas` (`id_komoditas`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of harga_komoditas
-- ----------------------------
INSERT INTO `harga_komoditas` VALUES (1, '100700', '03 Feb, 2025', 2, 6, '2025-04-09 10:37:40', '2025-05-11 16:45:36', 1);
INSERT INTO `harga_komoditas` VALUES (3, '100000', '24 Mar, 2025', 1, 6, '2025-04-10 08:21:42', '2025-05-11 16:45:15', 1);
INSERT INTO `harga_komoditas` VALUES (4, '25000', '03 Jan, 2024', 1, 4, '2025-04-10 08:23:19', NULL, 0);
INSERT INTO `harga_komoditas` VALUES (5, '20000', '06 Mar, 2024', 1, 4, '2025-04-10 08:23:46', NULL, 0);
INSERT INTO `harga_komoditas` VALUES (6, '22000', '17 Apr, 2025', 1, 4, '2025-04-10 09:00:24', '2025-04-10 09:00:59', 0);
INSERT INTO `harga_komoditas` VALUES (7, '15000', '11 Jan, 2024', 1, 4, '2025-04-10 09:06:03', NULL, 0);
INSERT INTO `harga_komoditas` VALUES (8, '18000', '07 Mar, 2024', 1, 4, '2025-04-10 09:07:14', NULL, 0);
INSERT INTO `harga_komoditas` VALUES (9, '24000', '24 Apr, 2025', 1, 4, '2025-04-10 09:07:59', '2025-04-10 09:08:24', 0);
INSERT INTO `harga_komoditas` VALUES (10, '17000', '11 Feb, 2025', 1, 3, '2025-04-10 09:09:28', NULL, 0);
INSERT INTO `harga_komoditas` VALUES (11, '13000', '12 Mar, 2025', 1, 3, '2025-04-10 09:10:14', NULL, 0);
INSERT INTO `harga_komoditas` VALUES (12, '10000', '11 Feb, 2025', 2, 3, '2025-04-10 09:15:12', '2025-04-15 10:54:33', 0);
INSERT INTO `harga_komoditas` VALUES (13, '15000', '11 Apr, 2025', 2, 3, '2025-04-10 09:15:38', NULL, 0);
INSERT INTO `harga_komoditas` VALUES (14, '15000', '14 Apr, 2025', 2, 3, '2025-04-10 09:16:01', '2025-04-14 23:51:47', 0);
INSERT INTO `harga_komoditas` VALUES (15, '12000', '28 May, 2025', 2, 3, '2025-04-10 09:16:17', NULL, 0);
INSERT INTO `harga_komoditas` VALUES (16, '465', '123123-02-01', 2, 4, '2025-06-03 14:43:08', NULL, 0);

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan`  (
  `idJabatan` int NOT NULL AUTO_INCREMENT,
  `jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`idJabatan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jabatan
-- ----------------------------
INSERT INTO `jabatan` VALUES (1, 'Kepala', 'Jabatan tertinggi dalam struktur organisasi', NULL, '2025-05-09 11:03:05', 0);
INSERT INTO `jabatan` VALUES (2, 'Staff', 'Mendukung perencanaan, pelaksanaan, administrasi, serta monitoring program dan kebijakan pertanian', NULL, NULL, 0);
INSERT INTO `jabatan` VALUES (3, 'Fungsional', 'Jabatan dalam pemerintahan yang berisi tugas dan fungsi tertentu berdasarkan keahlian dan keterampilan', NULL, NULL, 0);
INSERT INTO `jabatan` VALUES (4, 'KASUBBAG', 'Jabatan struktural yang bertanggung jawab mengkoordinasikan, mengawasi, dan melaksanakan tugas administrasi, kepegawaian, keuangan, serta penyusunan laporan dalam suatu unit kerja untuk mendukung kelancaran operasional instansi.', NULL, NULL, 0);

-- ----------------------------
-- Table structure for jabatan_petani
-- ----------------------------
DROP TABLE IF EXISTS `jabatan_petani`;
CREATE TABLE `jabatan_petani`  (
  `id_jabatan_petani` int NOT NULL AUTO_INCREMENT,
  `idJabatanBidang` int NULL DEFAULT NULL,
  `id_kelompok_tani` int NULL DEFAULT NULL,
  `id_petani` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_jabatan_petani`) USING BTREE,
  INDEX `idJabatanBidang`(`idJabatanBidang` ASC) USING BTREE,
  INDEX `id_kelompok_tani`(`id_kelompok_tani` ASC) USING BTREE,
  INDEX `id_petani`(`id_petani` ASC) USING BTREE,
  CONSTRAINT `jabatan_petani_ibfk_1` FOREIGN KEY (`idJabatanBidang`) REFERENCES `jabatanbidang` (`idJabatanBidang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jabatan_petani_ibfk_2` FOREIGN KEY (`id_kelompok_tani`) REFERENCES `kelompok_tani` (`id_kelompok_tani`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jabatan_petani_ibfk_3` FOREIGN KEY (`id_petani`) REFERENCES `petani` (`id_petani`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jabatan_petani
-- ----------------------------
INSERT INTO `jabatan_petani` VALUES (3, 18, 2, 1, '2025-03-23 19:40:43', '2025-05-09 11:08:31', 0);
INSERT INTO `jabatan_petani` VALUES (7, 18, 3, 2, '2025-03-23 20:14:58', NULL, 0);
INSERT INTO `jabatan_petani` VALUES (8, 18, 4, 3, '2025-03-23 20:20:57', NULL, 0);
INSERT INTO `jabatan_petani` VALUES (9, 18, 5, 4, '2025-03-31 12:37:44', NULL, 0);
INSERT INTO `jabatan_petani` VALUES (10, 18, 6, 6, '2025-04-04 10:50:23', NULL, 0);
INSERT INTO `jabatan_petani` VALUES (11, 18, 7, 7, '2025-04-04 11:06:01', NULL, 0);
INSERT INTO `jabatan_petani` VALUES (12, 18, 8, 8, '2025-04-04 11:17:50', NULL, 0);
INSERT INTO `jabatan_petani` VALUES (13, 18, 9, 9, '2025-04-04 11:36:28', NULL, 0);

-- ----------------------------
-- Table structure for jabatanbidang
-- ----------------------------
DROP TABLE IF EXISTS `jabatanbidang`;
CREATE TABLE `jabatanbidang`  (
  `idJabatanBidang` int NOT NULL AUTO_INCREMENT,
  `idJabatan` int NULL DEFAULT NULL,
  `id_bidang` int NULL DEFAULT NULL,
  `namaJabatanBidang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`idJabatanBidang`) USING BTREE,
  INDEX `idJabatan`(`idJabatan` ASC) USING BTREE,
  INDEX `fk_idBidang`(`id_bidang` ASC) USING BTREE,
  CONSTRAINT `fk_idBidang` FOREIGN KEY (`id_bidang`) REFERENCES `bidang` (`id_bidang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jabatanbidang_ibfk_1` FOREIGN KEY (`idJabatan`) REFERENCES `jabatan` (`idJabatan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jabatanbidang
-- ----------------------------
INSERT INTO `jabatanbidang` VALUES (9, 1, 1, 'Kepala Dinas Pertanian Tapanuli Utara', 'Pimpinan yang mempunyai tugas memimpin mengkoordinasikan, menyelenggarakan, mengevaluasi dan pelaporan kegiatan bidang pertanian.', NULL, '2025-06-11 15:07:31', 0);
INSERT INTO `jabatanbidang` VALUES (10, 1, 2, 'Kepala UPT Alsintan', 'Mengelola, mengoperasikan, dan mengawasi unit layanan alat dan mesin pertanian.', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (11, 1, 2, 'Kepala UPT Laboratorium dan POPT', 'Pengelolaan laboratorium serta pengendalian organisme pengganggu tumbuhan', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (12, 1, 3, 'Kepala Bidang Tanaman Pangan', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang tanaman pangan', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (13, 1, 4, 'Kepala Bidang Hortikultura', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang tanaman hortikultura', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (14, 1, 5, 'Kepala Bidang Perkebunan', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang perkebunan', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (15, 1, 6, 'Kepala Bidang Sarana dan Prasarana', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang sarana dan prasarana', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (16, 1, 7, 'Kepala Bidang Penyuluhan', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang penyuluhan', NULL, '2025-06-11 15:08:07', 0);
INSERT INTO `jabatanbidang` VALUES (18, 1, 8, 'Kepala Kelompok Tani', 'Pemimpin yang bertanggung jawab atas semua kegiatan kelompok tani.', '2025-03-23 19:07:02', '2025-04-01 14:15:37', 0);

-- ----------------------------
-- Table structure for jenis_komoditas
-- ----------------------------
DROP TABLE IF EXISTS `jenis_komoditas`;
CREATE TABLE `jenis_komoditas`  (
  `id_jenis_komoditas` int NOT NULL AUTO_INCREMENT,
  `nama_jenis_komoditas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_jenis_komoditas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_komoditas
-- ----------------------------
INSERT INTO `jenis_komoditas` VALUES (1, 'Tanaman Pangan', NULL, '2025-06-11 14:17:31', 1);
INSERT INTO `jenis_komoditas` VALUES (2, 'Hortikultura', NULL, '2025-06-07 16:33:40', 1);
INSERT INTO `jenis_komoditas` VALUES (5, 'Perkebunan', '2025-04-04 11:10:23', '2025-06-07 16:39:35', 1);
INSERT INTO `jenis_komoditas` VALUES (6, 'Hortikultura', '2025-06-07 16:33:48', '2025-06-07 16:35:38', 1);
INSERT INTO `jenis_komoditas` VALUES (7, 'Hortikultura', '2025-06-07 16:35:42', NULL, 0);
INSERT INTO `jenis_komoditas` VALUES (8, 'Perkebunan', '2025-06-07 16:39:40', '2025-06-07 16:52:18', 1);
INSERT INTO `jenis_komoditas` VALUES (9, 'Perkebunan', '2025-06-07 16:50:58', '2025-06-07 16:52:20', 1);
INSERT INTO `jenis_komoditas` VALUES (10, 'Perkebunan', '2025-06-07 16:52:25', NULL, 0);

-- ----------------------------
-- Table structure for jenis_lahan
-- ----------------------------
DROP TABLE IF EXISTS `jenis_lahan`;
CREATE TABLE `jenis_lahan`  (
  `id_jenis_lahan` int NOT NULL AUTO_INCREMENT,
  `nama_jenis_lahan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_jenis_lahan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jenis_lahan
-- ----------------------------
INSERT INTO `jenis_lahan` VALUES (1, 'Lahan Basah', NULL, '2025-04-01 13:42:00', 0);
INSERT INTO `jenis_lahan` VALUES (2, 'Lahan Kering', '2025-04-04 11:20:43', NULL, 0);
INSERT INTO `jenis_lahan` VALUES (3, 'Lahan Basah', '2025-06-02 09:56:15', '2025-06-02 09:57:33', 1);
INSERT INTO `jenis_lahan` VALUES (4, 'asdasd', '2025-06-02 09:57:42', '2025-06-02 09:59:50', 1);

-- ----------------------------
-- Table structure for kelompok_tani
-- ----------------------------
DROP TABLE IF EXISTS `kelompok_tani`;
CREATE TABLE `kelompok_tani`  (
  `id_kelompok_tani` int NOT NULL AUTO_INCREMENT,
  `nama_kelompok_tani` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alamat_sekretariat` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dis_id` int NOT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_kelompok_tani`) USING BTREE,
  UNIQUE INDEX `nama_kelompok_tani`(`nama_kelompok_tani` ASC) USING BTREE,
  INDEX `dis_id`(`dis_id` ASC) USING BTREE,
  CONSTRAINT `kelompok_tani_ibfk_1` FOREIGN KEY (`dis_id`) REFERENCES `districts` (`dis_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kelompok_tani
-- ----------------------------
INSERT INTO `kelompok_tani` VALUES (2, 'Sejahtera', 'Lumban Jaean', 3, NULL, '2025-05-09 11:11:22', 0);
INSERT INTO `kelompok_tani` VALUES (3, 'Setia', 'Lumban Jaean', 3, NULL, NULL, 0);
INSERT INTO `kelompok_tani` VALUES (4, 'DOSROHA LUMBAN JAEAN', 'Lumban Jaean', 3, NULL, NULL, 0);
INSERT INTO `kelompok_tani` VALUES (5, 'Maju Bersama', 'Lumban Jaean', 3, NULL, '2025-04-01 14:35:47', 0);
INSERT INTO `kelompok_tani` VALUES (6, 'Andesi Aek Siansimun', 'Aeksiansimun', 1, '2025-04-04 10:49:11', NULL, 0);
INSERT INTO `kelompok_tani` VALUES (7, 'Maju Tani', 'Silando', 2, '2025-04-04 11:05:07', '2025-04-04 11:05:16', 0);
INSERT INTO `kelompok_tani` VALUES (8, 'Saut Gabe Naniula', 'Batu Binumbun', 2, '2025-04-04 11:16:28', NULL, 0);
INSERT INTO `kelompok_tani` VALUES (9, 'Bersama Untuk Maju', 'Simanampang', 3, '2025-04-04 11:35:52', NULL, 0);
INSERT INTO `kelompok_tani` VALUES (11, 'Mananom', 'Jkt', 5, '2025-05-13 15:32:31', '2025-05-14 11:02:25', 1);
INSERT INTO `kelompok_tani` VALUES (12, 'asd', 'asd', 2, '2025-05-13 15:39:03', '2025-05-14 11:02:23', 1);

-- ----------------------------
-- Table structure for komoditas
-- ----------------------------
DROP TABLE IF EXISTS `komoditas`;
CREATE TABLE `komoditas`  (
  `id_komoditas` int NOT NULL AUTO_INCREMENT,
  `nama_komoditas` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_jenis_komoditas` int NULL DEFAULT NULL,
  `estimasi_panen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_komoditas`) USING BTREE,
  INDEX `id_jenis_komoditas`(`id_jenis_komoditas` ASC) USING BTREE,
  CONSTRAINT `komoditas_ibfk_1` FOREIGN KEY (`id_jenis_komoditas`) REFERENCES `jenis_komoditas` (`id_jenis_komoditas`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of komoditas
-- ----------------------------
INSERT INTO `komoditas` VALUES (1, 'Padi', 1, '151', 'null', NULL, '2025-04-04 13:30:02', 1);
INSERT INTO `komoditas` VALUES (3, 'Jagung', 1, '70', 'jagung.jpg', '2025-04-04 11:09:06', NULL, 1);
INSERT INTO `komoditas` VALUES (4, 'Kopi', 5, '300', 'kopi.jpeg', '2025-04-04 11:11:54', NULL, 0);
INSERT INTO `komoditas` VALUES (5, 'Bawang Merah', 7, '90', 'bawangmerah.jpg', '2025-04-04 11:13:14', '2025-06-07 16:36:25', 0);
INSERT INTO `komoditas` VALUES (6, 'Kakao', 5, '180', 'kakao.jpeg', '2025-04-04 11:34:38', NULL, 0);
INSERT INTO `komoditas` VALUES (7, 'Padi', 1, '151', '1743748199_padi.jpg', '2025-04-04 13:29:59', '2025-04-04 13:33:05', 1);
INSERT INTO `komoditas` VALUES (8, 'asd', 1, '123', '1746583682_asd.jpg', '2025-05-07 09:08:02', '2025-05-10 17:13:27', 1);
INSERT INTO `komoditas` VALUES (9, 'asdasd', 1, '123', '1748833635_1746586032_harga.jpg', '2025-06-02 10:07:15', NULL, 1);
INSERT INTO `komoditas` VALUES (10, 'Jagung', 10, '120', '1749736341_padi_volwin2.jpeg', '2025-06-12 20:52:21', NULL, 0);

-- ----------------------------
-- Table structure for lahan
-- ----------------------------
DROP TABLE IF EXISTS `lahan`;
CREATE TABLE `lahan`  (
  `id_lahan` int NOT NULL AUTO_INCREMENT,
  `nama_lahan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_jenis_lahan` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_lahan`) USING BTREE,
  INDEX `id_jenis_lahan`(`id_jenis_lahan` ASC) USING BTREE,
  CONSTRAINT `lahan_ibfk_1` FOREIGN KEY (`id_jenis_lahan`) REFERENCES `jenis_lahan` (`id_jenis_lahan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lahan
-- ----------------------------
INSERT INTO `lahan` VALUES (1, 'Sawah', 1, NULL, '2025-04-01 13:53:53', 0);
INSERT INTO `lahan` VALUES (2, 'Perkebunan', 2, '2025-04-04 11:23:34', NULL, 0);
INSERT INTO `lahan` VALUES (3, 'Tegalan', 2, '2025-04-04 11:28:40', NULL, 0);

-- ----------------------------
-- Table structure for pasar
-- ----------------------------
DROP TABLE IF EXISTS `pasar`;
CREATE TABLE `pasar`  (
  `id_pasar` int NOT NULL AUTO_INCREMENT,
  `nama_pasar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subdis_id` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_pasar`) USING BTREE,
  INDEX `subdis_id`(`subdis_id` ASC) USING BTREE,
  CONSTRAINT `pasar_ibfk_1` FOREIGN KEY (`subdis_id`) REFERENCES `subdistricts` (`subdis_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pasar
-- ----------------------------
INSERT INTO `pasar` VALUES (1, 'Pasar Sipoholon', 18, '2025-04-07 19:28:15', '2025-05-09 11:11:47', 0);
INSERT INTO `pasar` VALUES (2, 'Pasar Baru Sipahutar', 19, '2025-04-10 09:14:37', NULL, 0);

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai`  (
  `idPegawai` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `namaPegawai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `idGolonganPangkat` int NULL DEFAULT NULL,
  `idJabatanBidang` int NULL DEFAULT NULL,
  `subdis_id` int NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `noPonsel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `noWA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fileFoto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`idPegawai`) USING BTREE,
  INDEX `idGolonganPangkat`(`idGolonganPangkat` ASC) USING BTREE,
  INDEX `fk_idJabatanBidang`(`idJabatanBidang` ASC) USING BTREE,
  INDEX `subdis_id`(`subdis_id` ASC) USING BTREE,
  CONSTRAINT `fk_idJabatanBidang` FOREIGN KEY (`idJabatanBidang`) REFERENCES `jabatanbidang` (`idJabatanBidang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`idGolonganPangkat`) REFERENCES `golonganpangkat` (`idGolonganPangkat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pegawai_ibfk_2` FOREIGN KEY (`subdis_id`) REFERENCES `subdistricts` (`subdis_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pegawai
-- ----------------------------
INSERT INTO `pegawai` VALUES (1, '123123123', 'Gilberd Siboro', 2, 9, 1, 'IT Del', '081260951690', '0877381928382', '1743481512_gil.jpg', NULL, '2025-05-09 11:07:53', 0);
INSERT INTO `pegawai` VALUES (2, '123981238', 'Erichson Berutu', 4, 16, 1, 'Tarutung', '088238192', '231231423', 'reza.jpg', NULL, NULL, 0);

-- ----------------------------
-- Table structure for petani
-- ----------------------------
DROP TABLE IF EXISTS `petani`;
CREATE TABLE `petani`  (
  `id_petani` int NOT NULL AUTO_INCREMENT,
  `nama_depan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_belakang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alamat_rumah` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_kelompok_tani` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id_petani`) USING BTREE,
  INDEX `id_kelompok_tani`(`id_kelompok_tani` ASC) USING BTREE,
  CONSTRAINT `petani_ibfk_1` FOREIGN KEY (`id_kelompok_tani`) REFERENCES `kelompok_tani` (`id_kelompok_tani`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of petani
-- ----------------------------
INSERT INTO `petani` VALUES (1, 'Erichson', 'Berutu', 'Lumban Jaean', 2, NULL, '2025-05-09 11:11:36', 0);
INSERT INTO `petani` VALUES (2, 'Volwin', 'Sitompul', 'Lumban Jaean', 3, NULL, NULL, 0);
INSERT INTO `petani` VALUES (3, 'Yanti', 'Sitompul', 'Lumban Jaean', 4, NULL, NULL, 0);
INSERT INTO `petani` VALUES (4, 'Erika', 'Magdalena Simanungkalit', 'Lumban Jaean', 5, NULL, NULL, 0);
INSERT INTO `petani` VALUES (5, 'Kevin', 'Simangunsong', 'Siantar', 2, NULL, '2025-04-01 14:30:55', 0);
INSERT INTO `petani` VALUES (6, 'Mangadar', 'Sotarduga Lumban Tobing', 'Aeksiansimun', 6, '2025-04-04 10:50:07', NULL, 0);
INSERT INTO `petani` VALUES (7, 'Dolok', 'Manalu', 'Silando', 7, '2025-04-04 11:05:45', NULL, 0);
INSERT INTO `petani` VALUES (8, 'Bonggas', 'Lumban Tobing', 'Batu Binumbun', 8, '2025-04-04 11:17:37', NULL, 0);
INSERT INTO `petani` VALUES (9, 'Rismauli', 'Tumanggor', 'Simanampang', 9, '2025-04-04 11:36:18', NULL, 0);

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `prov_id` int NOT NULL AUTO_INCREMENT,
  `prov_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `location_id` int NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`prov_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES (1, 'Sumatera Utara', NULL, NULL);

-- ----------------------------
-- Table structure for subdistricts
-- ----------------------------
DROP TABLE IF EXISTS `subdistricts`;
CREATE TABLE `subdistricts`  (
  `subdis_id` int NOT NULL AUTO_INCREMENT,
  `subdis_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dis_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`subdis_id`) USING BTREE,
  UNIQUE INDEX `unique_subdis_name`(`subdis_name` ASC) USING BTREE,
  INDEX `dis_id`(`dis_id` ASC) USING BTREE,
  CONSTRAINT `subdistricts_ibfk_1` FOREIGN KEY (`dis_id`) REFERENCES `districts` (`dis_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subdistricts
-- ----------------------------
INSERT INTO `subdistricts` VALUES (1, 'Hutatoruan VI', 1);
INSERT INTO `subdistricts` VALUES (2, 'Hapoltahan', 1);
INSERT INTO `subdistricts` VALUES (3, 'Lumban Jaean', 3);
INSERT INTO `subdistricts` VALUES (4, 'Simasom Toruan', 3);
INSERT INTO `subdistricts` VALUES (5, 'Pantis', 3);
INSERT INTO `subdistricts` VALUES (6, 'Simasom', 3);
INSERT INTO `subdistricts` VALUES (7, 'Lumban Garaga', 3);
INSERT INTO `subdistricts` VALUES (8, 'Onan Hasang', 3);
INSERT INTO `subdistricts` VALUES (9, 'Lumban Tonga', 3);
INSERT INTO `subdistricts` VALUES (10, 'Pangurdotan', 3);
INSERT INTO `subdistricts` VALUES (11, 'Aek Siansimun', 1);
INSERT INTO `subdistricts` VALUES (12, 'Hutagalung Siualuompu', 1);
INSERT INTO `subdistricts` VALUES (13, 'Hutapea Banuarea', 1);
INSERT INTO `subdistricts` VALUES (14, 'Silali Toruan', 2);
INSERT INTO `subdistricts` VALUES (15, 'Silando', 2);
INSERT INTO `subdistricts` VALUES (16, 'Batu Binumbun', 2);
INSERT INTO `subdistricts` VALUES (17, 'Simanampang', 3);
INSERT INTO `subdistricts` VALUES (18, 'Hutaraja Simanungkalit', 4);
INSERT INTO `subdistricts` VALUES (19, 'Sipahutar I', 5);

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `isDeleted` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 'Admin', 'Tingkat akses dan kontrol tertinggi dalam suatu sistem', NULL, NULL, 0);
INSERT INTO `user_roles` VALUES (2, 'Penyuluh', 'Akses untuk melakukan penyuluhan data pertanian', NULL, NULL, 0);

-- ----------------------------
-- Table structure for user_types
-- ----------------------------
DROP TABLE IF EXISTS `user_types`;
CREATE TABLE `user_types`  (
  `user_type_id` int NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`user_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_types
-- ----------------------------
INSERT INTO `user_types` VALUES (1, 'pegawai', 'Pengguna dalam sistem yang memiliki akses dan peran sesuai dengan statusnya sebagai pegawai', NULL, NULL, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `personal_id` int NULL DEFAULT NULL,
  `user_type_id` int NULL DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_type_id`(`user_type_id` ASC) USING BTREE,
  INDEX `role_id`(`role_id` ASC) USING BTREE,
  INDEX `personal_id`(`personal_id` ASC) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`user_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`personal_id`) REFERENCES `pegawai` (`idPegawai`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'pertanian', 1, 1, NULL, '$2y$12$c8roUKWHlDDuaRxREfJm9.9WxdZiDVc9w9CbhdLZTgS7mEek9Km8a', 'asdasd@gmail.com', 1, NULL, '2025-05-09 10:59:18', 0);
INSERT INTO `users` VALUES (2, 'penyuluh', 1, 1, NULL, '$2y$12$xWUr9RuFuOnEMH7rpdkAcOS1CnsrJkWXOqTfbBUctPyxz6B6.4dqi', 'asd@gmail.com', 2, NULL, '2025-05-14 11:02:59', 0);
INSERT INTO `users` VALUES (4, 'eric', 2, 1, NULL, '$2y$12$IREI7ZXob3wVDBFhYOSCQujRi0CoZt1UmmX1ajvXa0OOxVnR/OBk.', 'eric@gmail.com', 1, '2025-03-18 10:07:06', '2025-03-24 11:11:44', 1);
INSERT INTO `users` VALUES (5, '123', 1, 1, NULL, '$2y$12$nVJZu1gMZpzOw5sz3LQzdObWf3x6qBhItZmAQjUwo9coP6Kv51ZJe', '123@gmail.com', 1, '2025-06-05 07:57:00', NULL, 0);
INSERT INTO `users` VALUES (7, 'Pertanian', 1, 1, NULL, '$2y$12$xXTs1lBbckOfxrXXY1E.UeEI3rz095AapUrDg.Qmx7mCaWIzYsMum', 'asdas@gmail.com', 1, '2025-06-07 17:21:22', NULL, 0);
INSERT INTO `users` VALUES (8, 'pertanian', 1, 1, NULL, '$2y$12$/aD3lXNfpvdi8BFrZVK/SO9MxKkJ3.8ZSBmwNuRXEofkmtvFQzNlm', 'asdasd@gmail.com', 1, '2025-06-07 17:21:38', NULL, 0);

-- ----------------------------
-- Procedure structure for delete_bantuan
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_bantuan`;
delimiter ;;
CREATE PROCEDURE `delete_bantuan`(IN idBantuan JSON)
BEGIN#Routine body goes here...
	UPDATE bantuan 
	SET bantuan.isDeleted = 1,
	bantuan.updated_at = NOW() 
	WHERE
		bantuan.id_bantuan = idBantuan;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_berita
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_berita`;
delimiter ;;
CREATE PROCEDURE `delete_berita`(IN idBerita JSON)
BEGIN#Routine body goes here...
	UPDATE berita 
	SET berita.isDeleted = 1,
	berita.updated_at = NOW() 
	WHERE
		berita.idBerita = idBerita;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_bidang
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_bidang`;
delimiter ;;
CREATE PROCEDURE `delete_bidang`(IN idBidang INT)
BEGIN
	DECLARE
		fk_count INT;

	SELECT
		COUNT(*) INTO fk_count 
	FROM
		jabatanbidang 
	WHERE
		id_bidang = idBidang 
		AND isDeleted = 0;
	IF
		fk_count > 0 THEN
			SIGNAL SQLSTATE '45000';
		ELSE 
		UPDATE bidang 
		SET is_deleted = 1,
		updated_at = NOW() 
		WHERE
			id_bidang = idBidang;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_dataPertanian
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_dataPertanian`;
delimiter ;;
CREATE PROCEDURE `delete_dataPertanian`(IN `idDataPertanian` int)
BEGIN
	#Routine body goes here...
	UPDATE data_pertanian SET data_pertanian.is_deleted = 1, data_pertanian.updated_at = NOW()
	WHERE data_pertanian.id_data_pertanian = idDataPertanian;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_departemen
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_departemen`;
delimiter ;;
CREATE PROCEDURE `delete_departemen`(IN id_departemen INT)
BEGIN
	DECLARE
		fk_count INT;

	SELECT
		COUNT(*) INTO fk_count 
	FROM
		bidang 
	WHERE
		idDepartemen = id_departemen 
		AND is_deleted = 0;
	IF
		fk_count > 0 THEN
			SIGNAL SQLSTATE '45000';
		ELSE 
		UPDATE departemen 
		SET is_deleted = 1,
		updated_at = NOW() 
		WHERE
			idDepartemen = id_departemen;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_gambar
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_gambar`;
delimiter ;;
CREATE PROCEDURE `delete_gambar`(IN idGambar INT)
BEGIN
	DELETE 
	FROM
		gambar_lahan 
	WHERE
		id_gambar = idGambar;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_golonganPangkat
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_golonganPangkat`;
delimiter ;;
CREATE PROCEDURE `delete_golonganPangkat`(IN idGolongan INT)
BEGIN
	DECLARE
		fk_count INT;

	SELECT
		COUNT(*) INTO fk_count 
	FROM
		pegawai 
	WHERE
		idGolonganPangkat = idGolongan 
		AND isDeleted = 0;
	IF
		fk_count > 0 THEN
			SIGNAL SQLSTATE '45000';
		ELSE 
		UPDATE golonganpangkat 
		SET isDeleted = 1,
		updated_at = NOW() 
		WHERE
			idJabidGolonganPangkat = idGolongan;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_harga
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_harga`;
delimiter ;;
CREATE PROCEDURE `delete_harga`(IN idHarga JSON)
BEGIN#Routine body goes here...
	UPDATE harga_komoditas 
	SET harga_komoditas.isDeleted= 1,
	harga_komoditas.updated_at = NOW() 
	WHERE
		harga_komoditas.id_harga = idHarga;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_jabatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_jabatan`;
delimiter ;;
CREATE PROCEDURE `delete_jabatan`(IN id_jabatan INT)
BEGIN
	DECLARE
		fk_count INT;

	SELECT
		COUNT(*) INTO fk_count 
	FROM
		jabatanbidang 
	WHERE
		idJabatan = id_jabatan 
		AND isDeleted = 0;
	IF
		fk_count > 0 THEN
			SIGNAL SQLSTATE '45000';
		ELSE 
		UPDATE jabatan 
		SET isDeleted = 1,
		updated_at = NOW() 
		WHERE
			idJabatan = id_jabatan;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_jabatanBidang
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_jabatanBidang`;
delimiter ;;
CREATE PROCEDURE `delete_jabatanBidang`(IN id_jb INT)
BEGIN
    DECLARE fk_count_jPetani INT;
    DECLARE fk_count_pegawai INT;
		
    SELECT COUNT(*)
    INTO fk_count_jPetani
    FROM jabatan_petani
    WHERE idJabatanBidang = id_jb
    AND isDeleted = 0; 


    SELECT COUNT(*)
    INTO fk_count_pegawai
    FROM pegawai
    WHERE idJabatanBidang = id_jb
    AND isDeleted = 0; 

    IF fk_count_jPetani > 0 OR fk_count_pegawai > 0 THEN

        SIGNAL SQLSTATE '45000' ;
    ELSE

        UPDATE jabatanbidang 
        SET isDeleted = 1, updated_at = NOW() 
        WHERE idJabatanBidang = id_jb;
    END IF;
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_jenisKomoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_jenisKomoditas`;
delimiter ;;
CREATE PROCEDURE `delete_jenisKomoditas`(IN idJenisKomoditas INT)
BEGIN
    DECLARE fk_count INT;

    -- Mengecek apakah ada record di tabel yang memiliki FK yang mengarah ke idJenisKomoditas
    -- Misalkan ada tabel `produk` yang memiliki FK ke `jenis_komoditas`, Anda dapat menambahkan pengecekan
    -- di tabel lainnya sesuai dengan relasi FK yang ada
    
    -- Mengecek FK pada tabel `produk` (sebagai contoh)
    SELECT COUNT(*)
    INTO fk_count
    FROM komoditas
    WHERE id_jenis_komoditas = idJenisKomoditas
    AND is_deleted = 0; -- Hanya menghitung yang belum dihapus

    IF fk_count > 0 THEN
        -- Jika ada referensi FK dengan is_deleted = 0 di tabel produk, berikan error
        SIGNAL SQLSTATE '45000';
    ELSE
        -- Jika tidak ada FK yang masih aktif, lakukan pembaruan pada tabel jenis_komoditas
        UPDATE jenis_komoditas
        SET is_deleted = 1,
            updated_at = NOW()
        WHERE id_jenis_komoditas = idJenisKomoditas;
    END IF;
    
    -- Jika ada tabel lain yang memiliki FK ke jenis_komoditas, tambahkan pengecekan yang serupa
    -- Misalnya untuk tabel lain `penjualan` atau lainnya, tinggal tambahkan blok serupa
    -- seperti yang ada pada bagian pengecekan di atas.
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_jenisLahan
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_jenisLahan`;
delimiter ;;
CREATE PROCEDURE `delete_jenisLahan`(IN idJenisLahan INT)
BEGIN
	DECLARE
		fk_count INT;

	SELECT
		COUNT(*) INTO fk_count 
	FROM
		lahan 
	WHERE
		id_jenis_lahan = idJenisLahan 
		AND is_deleted = 0;-- Hanya menghitung yang belum dihapus
	IF
		fk_count > 0 THEN-- Jika ada referensi FK dengan is_deleted = 0 di tabel produk, berikan error
			SIGNAL SQLSTATE '45000';
		ELSE -- Jika tidak ada FK yang masih aktif, lakukan pembaruan pada tabel jenis_komoditas
		UPDATE jenis_lahan 
		SET is_deleted = 1,
		updated_at = NOW() 
		WHERE
			id_jenis_lahan = idJenisLahan;
		
	END IF;-- Jika ada tabel lain yang memiliki FK ke jenis_komoditas, tambahkan pengecekan yang serupa
-- Misalnya untuk tabel lain `penjualan` atau lainnya, tinggal tambahkan blok serupa
-- seperti yang ada pada bagian pengecekan di atas.
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_kelompokTani
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_kelompokTani`;
delimiter ;;
CREATE PROCEDURE `delete_kelompokTani`(IN id_pokTan INT)
BEGIN
    DECLARE fk_count_bantuan INT;
    DECLARE fk_count_jPetani INT;
    DECLARE fk_count_petani INT;
				
    SELECT COUNT(*)
    INTO fk_count_bantuan
    FROM bantuan
    WHERE id_kelompok_tani = id_pokTan
    AND isDeleted = 0; 


    SELECT COUNT(*)
    INTO fk_count_jPetani
    FROM jabatan_petani
    WHERE id_kelompok_tani = id_pokTan
    AND isDeleted = 0; 
		
		SELECT COUNT(*)
    INTO fk_count_petani
    FROM petani
    WHERE id_kelompok_tani = id_pokTan
    AND is_deleted = 0; 

    IF fk_count_bantuan > 0 OR fk_count_jPetani > 0 OR fk_count_petani > 0 THEN

        SIGNAL SQLSTATE '45000' ;
    ELSE

        UPDATE kelompok_tani 
        SET is_deleted = 1, updated_at = NOW() 
        WHERE id_kelompok_tani = id_pokTan;
    END IF;
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_komoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_komoditas`;
delimiter ;;
CREATE PROCEDURE `delete_komoditas`(IN idKomoditas INT)
BEGIN
    DECLARE fk_count_pertanian INT;
    DECLARE fk_count_harga INT;
		
    SELECT COUNT(*)
    INTO fk_count_pertanian
    FROM data_pertanian
    WHERE id_komoditas = idKomoditas
    AND is_deleted = 0; -- Hanya menghitung yang belum dihapus

    -- Mengecek FK pada tabel `penjualan` yang mengarah ke jenis_komoditas
    SELECT COUNT(*)
    INTO fk_count_harga
    FROM harga_komoditas
    WHERE id_komoditas = idKomoditas
    AND isDeleted = 0; -- Hanya menghitung yang belum dihapus

    IF fk_count_pertanian > 0 AND fk_count_harga > 0 THEN
        -- Jika ada referensi FK yang masih aktif, berikan error
        SIGNAL SQLSTATE '45000' ;
    ELSE
        -- Jika tidak ada FK yang masih aktif, lakukan pembaruan pada tabel jenis_komoditas
        UPDATE komoditas 
        SET is_deleted = 1, updated_at = NOW() 
        WHERE id_komoditas = idKomoditas;
    END IF;
    
    -- Jika ada tabel lain yang memiliki FK ke jenis_komoditas, tambahkan pengecekan yang serupa
    -- Misalnya untuk tabel lain `penjualan` atau lainnya, tinggal tambahkan blok serupa
    -- seperti yang ada pada bagian pengecekan di atas.
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_lahan
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_lahan`;
delimiter ;;
CREATE PROCEDURE `delete_lahan`(IN idLahan INT)
BEGIN
	DECLARE
		fk_count INT;

	SELECT
		COUNT(*) INTO fk_count 
	FROM
		data_pertanian 
	WHERE
		id_lahan = idLahan 
		AND is_deleted = 0;
	IF
		fk_count > 0 THEN
			SIGNAL SQLSTATE '45000';
		ELSE 
		UPDATE lahan 
		SET is_deleted = 1,
		updated_at = NOW() 
		WHERE
			id_lahan = idLahan;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_pasar
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_pasar`;
delimiter ;;
CREATE PROCEDURE `delete_pasar`(IN idPasar INT)
BEGIN
    DECLARE fk_count INT;

    -- Mengecek apakah ada record di tabel yang memiliki FK yang mengarah ke idJenisKomoditas
    -- Misalkan ada tabel `produk` yang memiliki FK ke `jenis_komoditas`, Anda dapat menambahkan pengecekan
    -- di tabel lainnya sesuai dengan relasi FK yang ada
    
    -- Mengecek FK pada tabel `produk` (sebagai contoh)
    SELECT COUNT(*)
    INTO fk_count
    FROM harga_komoditas
    WHERE id_pasar = idPasar
    AND isDeleted = 0; -- Hanya menghitung yang belum dihapus

    IF fk_count > 0 THEN
        -- Jika ada referensi FK dengan is_deleted = 0 di tabel produk, berikan error
        SIGNAL SQLSTATE '45000';
    ELSE
        -- Jika tidak ada FK yang masih aktif, lakukan pembaruan pada tabel jenis_komoditas
        UPDATE pasar 
        SET isDeleted = 1, updated_at = NOW() 
        WHERE id_pasar = idPasar;
    END IF;
    
    -- Jika ada tabel lain yang memiliki FK ke jenis_komoditas, tambahkan pengecekan yang serupa
    -- Misalnya untuk tabel lain `penjualan` atau lainnya, tinggal tambahkan blok serupa
    -- seperti yang ada pada bagian pengecekan di atas.
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_pegawai
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_pegawai`;
delimiter ;;
CREATE PROCEDURE `delete_pegawai`(IN id_pegawai INT)
BEGIN
	DECLARE
		fk_count INT;

	SELECT
		COUNT(*) INTO fk_count 
	FROM
		users 
	WHERE
		personal_id = id_pegawai 
		AND is_deleted = 0;
	IF
		fk_count > 0 THEN
			SIGNAL SQLSTATE '45000';
		ELSE 
		UPDATE pegawai 
		SET isDeleted = 1,
		updated_at = NOW() 
		WHERE
			idPegawai = id_pegawai;
		
	END IF;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_pengguna
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_pengguna`;
delimiter ;;
CREATE PROCEDURE `delete_pengguna`(IN idUser INT)
BEGIN
    DECLARE fk_count_berita INT;
    DECLARE fk_count_dPertanian INT;

				
    SELECT COUNT(*)
    INTO fk_count_berita
    FROM berita
    WHERE user_id = idUser
    AND isDeleted = 0; 


    SELECT COUNT(*)
    INTO fk_count_dPertanian
    FROM data_pertanian
    WHERE user_id = idUser
    AND is_deleted = 0; 


    IF fk_count_berita > 0 OR fk_count_dPertanian > 0 THEN

        SIGNAL SQLSTATE '45000' ;
    ELSE

        UPDATE users 
        SET is_deleted = 1, updated_at = NOW() 
        WHERE user_id = idUser;
    END IF;
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_petani
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_petani`;
delimiter ;;
CREATE PROCEDURE `delete_petani`(IN idPetani INT)
BEGIN
    DECLARE fk_count_dPertanian INT;
    DECLARE fk_count_jPetani INT;

				
    SELECT COUNT(*)
    INTO fk_count_dPertanian
    FROM data_pertanian
    WHERE id_petani = idPetani
    AND is_deleted = 0; 


    SELECT COUNT(*)
    INTO fk_count_jPetani
    FROM jabatan_petani
    WHERE id_petani = idPetani
    AND isDeleted = 0; 


    IF fk_count_dPertanian > 0 OR fk_count_jPetani > 0 THEN

        SIGNAL SQLSTATE '45000' ;
    ELSE

        UPDATE petani 
        SET is_deleted = 1, updated_at = NOW() 
        WHERE id_petani = idPetani;
    END IF;
    
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_harga_komoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_harga_komoditas`;
delimiter ;;
CREATE PROCEDURE `get_harga_komoditas`(IN idKomoditas INT,
    IN idPasar INT)
BEGIN
    SELECT
        STR_TO_DATE(harga_komoditas.tanggal, '%d %b, %Y') AS tanggal,
        MAX(harga_komoditas.harga) AS harga_tertinggi,
        MIN(harga_komoditas.harga) AS harga_terendah
    FROM
        harga_komoditas
        JOIN komoditas ON harga_komoditas.id_komoditas = komoditas.id_komoditas
        JOIN pasar ON harga_komoditas.id_pasar = pasar.id_pasar
    WHERE
        harga_komoditas.isDeleted = 0
        AND komoditas.is_deleted = 0
        AND pasar.isDeleted = 0
        AND (idKomoditas IS NULL OR harga_komoditas.id_komoditas = idKomoditas)
        AND (idPasar IS NULL OR harga_komoditas.id_pasar = idPasar)
    GROUP BY
        STR_TO_DATE(harga_komoditas.tanggal, '%d %b, %Y')
    ORDER BY
        STR_TO_DATE(harga_komoditas.tanggal, '%d %b, %Y') ASC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_bantuan
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_bantuan`;
delimiter ;;
CREATE PROCEDURE `insert_bantuan`(IN dataBantuan JSON)
BEGIN
	#Routine body goes here...
	SET @jenis_bantuan = JSON_UNQUOTE(JSON_EXTRACT(dataBantuan,'$.JenisBantuan'));
	SET @tanggal = JSON_UNQUOTE(JSON_EXTRACT(dataBantuan,'$.Tanggal'));
	SET @kelompok_tani = JSON_UNQUOTE(JSON_EXTRACT(dataBantuan,'$.KelompokTani'));
	
	INSERT INTO bantuan(bantuan.jenis_bantuan, bantuan.tanggal, bantuan.id_kelompok_tani,bantuan.created_at)
	VALUES(@jenis_bantuan, @tanggal, @kelompok_tani, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_berita
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_berita`;
delimiter ;;
CREATE PROCEDURE `insert_berita`(IN dataBerita JSON)
BEGIN
	#Routine body goes here...
	SET @judul = JSON_UNQUOTE(JSON_EXTRACT(dataBerita,'$.Judul'));
	SET @deskripsi = JSON_UNQUOTE(JSON_EXTRACT(dataBerita,'$.Deskripsi'));
	SET @foto = JSON_UNQUOTE(JSON_EXTRACT(dataBerita,'$.Foto'));
	SET @`user` = JSON_UNQUOTE(JSON_EXTRACT(dataBerita,'$.User'));
		
	INSERT INTO berita(berita.judul, berita.deskripsi, berita.foto, berita.user_id, berita.created_at)
	VALUES(@judul, @deskripsi, @foto, @`user`,NOW()); 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_bidang
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_bidang`;
delimiter ;;
CREATE PROCEDURE `insert_bidang`(IN dataBidang JSON)
BEGIN
    -- Mengambil data dari JSON
    SET @nama_departmen = JSON_UNQUOTE(JSON_EXTRACT(dataBidang, '$.NamaDepartmen'));
    SET @nama_bidang = JSON_UNQUOTE(JSON_EXTRACT(dataBidang, '$.NamaBidang'));
    SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataBidang, '$.Keterangan'));

    -- Memasukkan data ke tabel
    INSERT INTO bidang (idDepartemen, nama_bidang, keterangan, created_at)
    VALUES (@nama_departmen, @nama_bidang, @keterangan, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_dataPertanian
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_dataPertanian`;
delimiter ;;
CREATE PROCEDURE `insert_dataPertanian`(IN dataPertanian JSON)
BEGIN
	DECLARE
		new_id INT;
	DECLARE
		STATUS VARCHAR ( 20 ) DEFAULT 'ERROR';
	DECLARE
		idx INT DEFAULT 0;
	DECLARE
		gambarPath VARCHAR ( 255 );-- Ambil data dari JSON
	
	SET @petani = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.Petani' ));
	
	SET @lahan = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.Lahan' ));
	
	SET @komoditas = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.Komoditas' ));
	
	SET @luasLahan = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.LuasLahan' ));
	
	SET @desa = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.Desa' ));
	
	SET @alamat = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.Alamat' ));
	
	SET @tanggalTanam = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.TanggalTanam' ));
	
	SET @tanggalCatat = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.TanggalCatat' ));
	
	SET @pencatat = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.Pencatat' ));
	
		SET @latitude = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.Latitude' ));
		SET @longitude = JSON_UNQUOTE(
	JSON_EXTRACT( dataPertanian, '$.Longitude' ));
	
	SET @gambarLahan = JSON_EXTRACT( dataPertanian, '$.GambarLahan' );-- Insert ke tabel data_pertanian
	INSERT INTO data_pertanian ( id_petani, id_lahan, id_komoditas, luas_lahan, subdis_id, alamat_lengkap, tanggal_tanam, tanggal_pencatatan, user_id, latitude, longitude ,created_at )
	VALUES
		(
			@petani,
			@lahan,
			@komoditas,
			@luasLahan,
			@desa,
			@alamat,
			@tanggalTanam,
			@tanggalCatat,
			@pencatat,
			@latitude,
			@longitude,
			NOW() 
		);-- Ambil id terakhir yang diinsert
	
	SET new_id = LAST_INSERT_ID();-- Loop untuk menyimpan gambar
	WHILE
			idx < JSON_LENGTH( @gambarLahan ) DO
			
			SET gambarPath = JSON_UNQUOTE(
				JSON_EXTRACT(
					@gambarLahan,
				CONCAT( '$[', idx, ']' )));
		INSERT INTO gambar_lahan ( id_data_pertanian, url_gambar )
		VALUES
			( new_id, gambarPath );
		
		SET idx = idx + 1;
		
	END WHILE;-- Menetapkan status keberhasilan
	
	SET STATUS = 'SUCCESS';-- Mengembalikan status ke Laravel
	SELECT STATUS
		;-- Mengembalikan status ke Laravel
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_departmen
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_departmen`;
delimiter ;;
CREATE PROCEDURE `insert_departmen`(IN dataDepartmen JSON)
BEGIN
    -- Mengambil data dari JSON
    SET @nama_departmen = JSON_UNQUOTE(JSON_EXTRACT(dataDepartmen, '$.NamaDepartmen'));
    SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataDepartmen, '$.Keterangan'));

    -- Memasukkan data ke tabel
    INSERT INTO departemen (namaDepartmen, keterangan, createAt)
    VALUES (@nama_departmen, @keterangan, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_desa
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_desa`;
delimiter ;;
CREATE PROCEDURE `insert_desa`(IN dataDesa JSON)
BEGIN
	#Routine body goes here...
	SET @nama_desa = JSON_UNQUOTE(JSON_EXTRACT(dataDesa,'$.NamaDesa'));
	SET @kecamatan = JSON_UNQUOTE(JSON_EXTRACT(dataDesa,'$.Kecamatan'));

	INSERT INTO subdistricts(subdis_name,dis_id)
	VALUES(@nama_desa, @kecamatan);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_gambar
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_gambar`;
delimiter ;;
CREATE PROCEDURE `insert_gambar`(IN dataGambar JSON)
BEGIN
    # Ambil nilai dari parameter JSON
    SET @idData = JSON_UNQUOTE(JSON_EXTRACT(dataGambar, '$.DataPertanian'));
    SET @url = JSON_UNQUOTE(JSON_EXTRACT(dataGambar, '$.UrlGambar'));

    # Masukkan data ke tabel gambar_lahan
    INSERT INTO gambar_lahan(id_data_pertanian, url_gambar)
    VALUES(@idData, @url);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_golonganPangkat
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_golonganPangkat`;
delimiter ;;
CREATE PROCEDURE `insert_golonganPangkat`(IN dataGolonganPangkat JSON)
BEGIN
    -- Mengambil data dari JSON
    SET @golongan = JSON_UNQUOTE(JSON_EXTRACT(dataGolonganPangkat, '$.Golongan'));
    SET @pangkat = JSON_UNQUOTE(JSON_EXTRACT(dataGolonganPangkat, '$.Pangkat'));
    SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataGolonganPangkat, '$.Keterangan'));

    -- Memasukkan data ke tabel
    INSERT INTO golonganpangkat (golongan, pangkat,  keterangan, createdAt)
    VALUES (@golongan, @pangkat, @keterangan, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_harga
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_harga`;
delimiter ;;
CREATE PROCEDURE `insert_harga`(IN dataHarga JSON)
BEGIN
	#Routine body goes here...
	SET @harga = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.Harga'));
	SET @tanggal = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.Tanggal'));
	SET @nama_pasar = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.Pasar'));
	SET @komoditas = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.Komoditas'));


	INSERT INTO harga_komoditas(harga_komoditas.harga, harga_komoditas.tanggal, harga_komoditas.id_pasar, harga_komoditas.id_komoditas ,harga_komoditas.created_at)
	VALUES(@harga, @tanggal,@nama_pasar, @komoditas, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_jabatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_jabatan`;
delimiter ;;
CREATE PROCEDURE `insert_jabatan`(IN dataJabatan JSON)
BEGIN
    -- Mengambil data dari JSON
    SET @jabatan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatan, '$.Jabatan'));
    SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatan, '$.Keterangan'));

    -- Memasukkan data ke tabel
    INSERT INTO jabatan (jabatan, keterangan, created_at)
    VALUES (@jabatan, @keterangan, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_jabatanBidang
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_jabatanBidang`;
delimiter ;;
CREATE PROCEDURE `insert_jabatanBidang`(IN dataJabatanBidang JSON)
BEGIN
    -- Mengambil data dari JSON
    SET @jabatan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang, '$.Jabatan'));
    SET @bidang = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang, '$.Bidang'));
    SET @jabatanBidang = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang, '$.JabatanBidang'));
    SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang, '$.Keterangan'));

    -- Memasukkan data ke tabel
    INSERT INTO jabatanbidang (idJabatan, id_bidang, namaJabatanBidang, keterangan, created_at)
    VALUES (@jabatan, @bidang, @jabatanBidang, @keterangan, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_jabatanPetani
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_jabatanPetani`;
delimiter ;;
CREATE PROCEDURE `insert_jabatanPetani`(IN dataJabatanPetani JSON)
BEGIN
    -- Mengambil data dari JSON
    SET @jabatanBidang = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanPetani, '$.JabatanBidang'));
    SET @kelompokTani = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanPetani, '$.KelompokTani'));
    SET @petani = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanPetani, '$.Petani'));
		
    -- Memasukkan data ke tabel
    INSERT INTO jabatan_petani (idJabatanBidang, id_kelompok_tani,  id_petani, created_at)
    VALUES (@jabatanBidang , @kelompokTani, @petani, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_jenisKomoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_jenisKomoditas`;
delimiter ;;
CREATE PROCEDURE `insert_jenisKomoditas`(IN dataJenisKomoditas JSON)
BEGIN
	#Routine body goes here...
	SET @nama_jenis_komoditas = JSON_UNQUOTE(JSON_EXTRACT(dataJenisKomoditas,'$.JenisKomoditas'));

	INSERT INTO jenis_komoditas(jenis_komoditas.nama_jenis_komoditas, jenis_komoditas.created_at)
	VALUES(@nama_jenis_komoditas, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_jenisLahan
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_jenisLahan`;
delimiter ;;
CREATE PROCEDURE `insert_jenisLahan`(IN dataJenisLahan JSON)
BEGIN
	#Routine body goes here...
	SET @jenis_lahan = JSON_UNQUOTE(JSON_EXTRACT(dataJenisLahan,'$.JenisLahan'));

	INSERT INTO jenis_lahan(`nama_jenis_lahan`, `created_at`)
	VALUES(@jenis_lahan, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_kecamatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_kecamatan`;
delimiter ;;
CREATE PROCEDURE `insert_kecamatan`(IN dataKecamatan JSON)
BEGIN
	#Routine body goes here...
	SET @kecamatan = JSON_UNQUOTE(JSON_EXTRACT(dataKecamatan,'$.Kecamatan'));

	INSERT INTO districts(dis_name)
	VALUES(@kecamatan);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_kelompokTani
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_kelompokTani`;
delimiter ;;
CREATE PROCEDURE `insert_kelompokTani`(IN dataKelompokTani JSON)
BEGIN
	#Routine body goes here...
	SET @nama_kelompok = JSON_UNQUOTE(JSON_EXTRACT(dataKelompokTani,'$.NamaKelompokTani'));
	SET @alamat = JSON_UNQUOTE(JSON_EXTRACT(dataKelompokTani,'$.AlamatSekretariat'));
	SET @kecamatan = JSON_UNQUOTE(JSON_EXTRACT(dataKelompokTani,'$.Kecamatan'));
	
	INSERT INTO kelompok_tani(`nama_kelompok_tani`,`alamat_sekretariat`, `dis_id`,`created_at`)
	VALUES(@nama_kelompok, @alamat, @kecamatan ,NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_komoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_komoditas`;
delimiter ;;
CREATE PROCEDURE `insert_komoditas`(IN dataKomoditas JSON)
BEGIN
	SET @jenis_komoditas = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.JenisKomoditas'));
	SET @nama_komoditas = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.NamaKomoditas'));
	SET @estimasi_panen = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.EstimasiPanen'));
	SET @gambar = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.Gambar'));

	INSERT INTO komoditas(`id_jenis_komoditas`,`nama_komoditas`,`estimasi_panen`, `gambar`, `created_at`)
	VALUES(@jenis_komoditas, @nama_komoditas, @estimasi_panen, @gambar,NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_lahan
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_lahan`;
delimiter ;;
CREATE PROCEDURE `insert_lahan`(IN dataLahan JSON)
BEGIN
	#Routine body goes here...
	SET @jenis_lahan = JSON_UNQUOTE(JSON_EXTRACT(dataLahan,'$.JenisLahan'));
	SET @lahan = JSON_UNQUOTE(JSON_EXTRACT(dataLahan,'$.Lahan'));

	INSERT INTO lahan(lahan.id_jenis_lahan,lahan.nama_lahan, lahan.created_at)
	VALUES(@jenis_lahan, @lahan, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_pasar
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_pasar`;
delimiter ;;
CREATE PROCEDURE `insert_pasar`(IN dataPasar JSON)
BEGIN
	#Routine body goes here...
	SET @nama_pasar = JSON_UNQUOTE(JSON_EXTRACT(dataPasar,'$.Pasar'));
	SET @lokasi = JSON_UNQUOTE(JSON_EXTRACT(dataPasar,'$.Lokasi'));

	INSERT INTO pasar(pasar.nama_pasar, pasar.subdis_id, pasar.created_at)
	VALUES(@nama_pasar, @lokasi, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_pegawai
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_pegawai`;
delimiter ;;
CREATE PROCEDURE `insert_pegawai`(IN dataPegawai JSON)
BEGIN
    -- Mengambil data dari JSON
    SET @nip = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.NIP'));
    SET @nama = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.Nama'));
    SET @golonganPangkat = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.GolonganPangkat'));
    SET @jabatanBidang = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.JabatanBidang'));
    SET @desa = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.Desa'));
    SET @alamat = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.Alamat'));
    SET @ponsel = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.Ponsel'));
    SET @wa = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.WA'));
    SET @foto = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai, '$.Foto'));

		
    -- Memasukkan data ke tabel
    INSERT INTO pegawai (nip, namaPegawai,  idGolonganPangkat, idJabatanBidang, subdis_id, alamat, noPonsel, noWA, fileFoto, created_at)
    VALUES (@nip , @nama, @golonganPangkat, @jabatanBidang, @desa, @alamat, @ponsel, @wa, @foto, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_pengguna
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_pengguna`;
delimiter ;;
CREATE PROCEDURE `insert_pengguna`(IN `dataPengguna` JSON)
BEGIN
    SET @username = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna, '$.Username'));
    SET @email = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna, '$.Email'));
    SET @`password` = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna, '$.Password'));
    SET @role = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna, '$.Role'));
    SET @pegawai = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna, '$.Pegawai'));

    INSERT INTO `users` (`username`, `email`, `password`, `role_id`, `personal_id`, `user_type_id`, `created_at`)
    VALUES (@username, @email, @`password`, @role, @pegawai, 1, NOW()); 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insert_petani
-- ----------------------------
DROP PROCEDURE IF EXISTS `insert_petani`;
delimiter ;;
CREATE PROCEDURE `insert_petani`(IN dataPetani JSON)
BEGIN
	#Routine body goes here...
	SET @nama_depan = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.NamaDepan'));
	SET @nama_belakang = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.NamaBelakang'));
	SET @alamat = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.AlamatRumah'));
	SET @kelompok_tani = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.KelompokTani'));

	INSERT INTO petani(`nama_depan`,`nama_belakang`,`alamat_rumah`,petani.id_kelompok_tani, petani.created_at)
	VALUES(@nama_depan, @nama_belakang, @alamat, @kelompok_tani, NOW());
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_bantuan
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_bantuan`;
delimiter ;;
CREATE PROCEDURE `update_bantuan`(IN dataBantuan JSON)
BEGIN
#Routine body goes here...	
	SET @idBantuan = JSON_UNQUOTE(JSON_EXTRACT( dataBantuan, '$.IdBantuan' ));
	SET @jenis_bantuan = JSON_UNQUOTE(JSON_EXTRACT( dataBantuan, '$.JenisBantuan' ));
	SET @tanggal = JSON_UNQUOTE(JSON_EXTRACT( dataBantuan, '$.Tanggal' ));
	SET @kelompok_tani = JSON_UNQUOTE(JSON_EXTRACT( dataBantuan, '$.KelompokTani' ));
	
	UPDATE bantuan SET bantuan.jenis_bantuan = @jenis_bantuan,bantuan.tanggal = @tanggal,bantuan.id_kelompok_tani = @kelompok_tani, bantuan.updated_at = NOW() 
	WHERE
		bantuan.id_bantuan = @idBantuan;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_berita
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_berita`;
delimiter ;;
CREATE PROCEDURE `update_berita`(IN dataBerita JSON)
BEGIN
	#Routine body goes here...
	SET @idBerita = JSON_UNQUOTE(JSON_EXTRACT(dataBerita,'$.IdBerita'));
	SET @judul = JSON_UNQUOTE(JSON_EXTRACT(dataBerita,'$.Judul'));
	SET @deskripsi = JSON_UNQUOTE(JSON_EXTRACT(dataBerita,'$.Deskripsi'));
	SET @foto = JSON_UNQUOTE(JSON_EXTRACT(dataBerita,'$.Foto'));
 
	UPDATE berita SET berita.judul=@judul, berita.deskripsi=@deskripsi, berita.foto = @foto, berita.updated_at=NOW()
	WHERE berita.idBerita=@idBerita;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_bidang
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_bidang`;
delimiter ;;
CREATE PROCEDURE `update_bidang`(IN dataBidang JSON)
BEGIN
	#Routine body goes here...
	
	SET @idBidang = JSON_UNQUOTE(JSON_EXTRACT(dataBidang,'$.IdBidang'));
	SET @idDepartemen = JSON_UNQUOTE(JSON_EXTRACT(dataBidang,'$.IdDepartemen'));
	SET @bidang = JSON_UNQUOTE(JSON_EXTRACT(dataBidang,'$.NamaBidang'));
	SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataBidang,'$.Keterangan'));
		
	UPDATE bidang SET bidang.nama_bidang=@bidang, bidang.idDepartemen=@idDepartemen, bidang.keterangan = @keterangan, bidang.updated_at=NOW()
	WHERE bidang.id_bidang=@idBidang;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_dataPertanian
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_dataPertanian`;
delimiter ;;
CREATE PROCEDURE `update_dataPertanian`(IN dataPertanian JSON)
BEGIN
	#Routine body goes here...
	SET @idDataPertanian = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.IdDataPertanian'));
	SET @petani = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.Petani'));
	SET @lahan = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.Lahan'));
	SET @komoditas = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.Komoditas'));
	SET @luasLahan = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.LuasLahan'));
	SET @desa = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.Desa'));
	SET @alamat = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.Alamat'));
	SET @latitude = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.Latitude'));
	SET @longitude = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.Longitude'));
	SET @tanggalTanam = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.TanggalTanam'));
	SET @tanggalCatat = JSON_UNQUOTE(JSON_EXTRACT(dataPertanian,'$.TanggalCatat'));

	UPDATE data_pertanian SET data_pertanian.id_petani = @petani, data_pertanian.id_lahan = @lahan, data_pertanian.id_komoditas = @komoditas, data_pertanian.luas_lahan = @luasLahan, data_pertanian.subdis_id = @desa, data_pertanian.tanggal_tanam = @tanggalTanam, data_pertanian.tanggal_pencatatan = @tanggalCatat, data_pertanian.alamat_lengkap = @alamat, data_pertanian.latitude = @latitude, data_pertanian.longitude = @longitude, data_pertanian.updated_at = NOW()
	WHERE data_pertanian.id_data_pertanian = @idDataPertanian;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_departemen
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_departemen`;
delimiter ;;
CREATE PROCEDURE `update_departemen`(IN dataDepartemen JSON)
BEGIN
	#Routine body goes here...
	
	SET @idDepartemen = JSON_UNQUOTE(JSON_EXTRACT(dataDepartemen,'$.IdDepartemen'));
	SET @namaDepartemen = JSON_UNQUOTE(JSON_EXTRACT(dataDepartemen,'$.NamaDepartemen'));
	SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataDepartemen,'$.Keterangan'));
		
	UPDATE departemen SET departemen.namaDepartmen=@namaDepartemen, departemen.keterangan=@keterangan, departemen.updateAt=NOW()
	WHERE departemen.idDepartemen=@idDepartemen;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_desa
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_desa`;
delimiter ;;
CREATE PROCEDURE `update_desa`(IN dataDesa JSON)
BEGIN
	#Routine body goes here...
	SET @idDesa = JSON_UNQUOTE(JSON_EXTRACT(dataDesa,'$.IdDesa'));
	SET @desa = JSON_UNQUOTE(JSON_EXTRACT(dataDesa,'$.NamaDesa'));
	SET @kecamatan = JSON_UNQUOTE(JSON_EXTRACT(dataDesa,'$.Kecamatan'));
	
	UPDATE subdistricts SET subdistricts.subdis_name=@desa, subdistricts.dis_id = @kecamatan
	WHERE subdistricts.subdis_id=@idDesa;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_golonganPangkat
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_golonganPangkat`;
delimiter ;;
CREATE PROCEDURE `update_golonganPangkat`(IN dataGolonganPangkat JSON)
BEGIN
	#Routine body goes here...
	SET @idGolonganPangkat = JSON_UNQUOTE(JSON_EXTRACT(dataGolonganPangkat,'$.IdGolonganPangkat'));
	SET @golongan = JSON_UNQUOTE(JSON_EXTRACT(dataGolonganPangkat,'$.Golongan'));
	SET @pangkat = JSON_UNQUOTE(JSON_EXTRACT(dataGolonganPangkat,'$.Pangkat'));
	SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataGolonganPangkat,'$.Keterangan'));
	
	UPDATE golonganpangkat SET golonganpangkat.golongan=@golongan, golonganpangkat.pangkat=@pangkat, golonganpangkat.keterangan=@keterangan, golonganpangkat.updatedAt=NOW()
	WHERE golonganpangkat.idGolonganPangkat=@idGolonganPangkat;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_harga
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_harga`;
delimiter ;;
CREATE PROCEDURE `update_harga`(IN dataHarga JSON)
BEGIN
	#Routine body goes here...
	SET @idHarga = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.IdHarga'));
	SET @harga = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.Harga'));
	SET @tanggal = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.Tanggal'));
	SET @nama_pasar = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.Pasar'));
	SET @komoditas = JSON_UNQUOTE(JSON_EXTRACT(dataHarga,'$.Komoditas'));
	
		UPDATE harga_komoditas SET harga_komoditas.harga=@harga,  harga_komoditas.tanggal=@tanggal, harga_komoditas.id_pasar=@nama_pasar, harga_komoditas.id_komoditas=@komoditas, harga_komoditas.updated_at=NOW()
	WHERE harga_komoditas.id_harga=@idHarga;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_jabatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_jabatan`;
delimiter ;;
CREATE PROCEDURE `update_jabatan`(IN dataJabatan JSON)
BEGIN
	#Routine body goes here...
	SET @idJabatan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatan,'$.IdJabatan'));
	SET @jabatan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatan,'$.Jabatan'));
	SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatan,'$.Keterangan'));
	
	UPDATE jabatan SET jabatan.jabatan=@jabatan, jabatan.keterangan=@keterangan, jabatan.updated_at=NOW()
	WHERE jabatan.idJabatan=@idJabatan;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_jabatanBidang
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_jabatanBidang`;
delimiter ;;
CREATE PROCEDURE `update_jabatanBidang`(IN dataJabatanBidang JSON)
BEGIN
	#Routine body goes here...
	SET @idJabatanBidang = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang,'$.IdJabatanBidang'));
	SET @jabatan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang,'$.Jabatan'));
	SET @bidang = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang,'$.Bidang'));
	SET @jabatanBidang = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang,'$.JabatanBidang'));
	SET @keterangan = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanBidang,'$.Keterangan'));
	
	UPDATE jabatanbidang SET jabatanbidang.idJabatan=@jabatan, jabatanbidang.id_bidang=@bidang, jabatanbidang.namaJabatanBidang=@jabatanBidang, jabatanbidang.keterangan=@keterangan, jabatanbidang.updated_at=NOW()
	WHERE jabatanbidang.idJabatanBidang=@idJabatanBidang;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_jabatanPetani
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_jabatanPetani`;
delimiter ;;
CREATE PROCEDURE `update_jabatanPetani`(IN dataJabatanPetani JSON)
BEGIN
	#Routine body goes here...
	SET @idJabatanPetani = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanPetani,'$.IdJabatanPetani'));
	SET @jabatanBidang = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanPetani,'$.JabatanBidang'));
	SET @kelompokTani = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanPetani,'$.KelompokTani'));
	SET @petani = JSON_UNQUOTE(JSON_EXTRACT(dataJabatanPetani,'$.Petani'));
		
	UPDATE jabatan_petani SET jabatan_petani.idJabatanBidang=@jabatanBidang, jabatan_petani.id_kelompok_tani=@kelompokTani, jabatan_petani.id_petani=@petani, jabatan_petani.updated_at=NOW()
	WHERE jabatan_petani.id_jabatan_petani=@idJabatanPetani;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_jenisKomoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_jenisKomoditas`;
delimiter ;;
CREATE PROCEDURE `update_jenisKomoditas`(IN dataJenisKomoditas JSON)
BEGIN
	#Routine body goes here...
	SET @idJenisKomoditas = JSON_UNQUOTE(JSON_EXTRACT(dataJenisKomoditas,'$.IdJenisKomoditas'));
	SET @namaJenisKomoditas = JSON_UNQUOTE(JSON_EXTRACT(dataJeniskomoditas,'$.NamaJenisKomoditas'));
	
	UPDATE jenis_komoditas SET jenis_komoditas.nama_jenis_komoditas=@namaJenisKomoditas, jenis_komoditas.updated_at=NOW()
	WHERE jenis_komoditas.id_jenis_komoditas=@idJenisKomoditas;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_jenisLahan
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_jenisLahan`;
delimiter ;;
CREATE PROCEDURE `update_jenisLahan`(IN dataJenisLahan JSON)
BEGIN
	#Routine body goes here...
	
	SET @idJenisLahan = JSON_UNQUOTE(JSON_EXTRACT(dataJenisLahan,'$.IdJenisLahan'));
	SET @namaJenisLahan = JSON_UNQUOTE(JSON_EXTRACT(dataJenisLahan,'$.NamaJenisLahan'));
	
	UPDATE jenis_lahan SET jenis_lahan.nama_jenis_lahan=@namaJenisLahan, jenis_lahan.updated_at=NOW()
	WHERE jenis_lahan.id_jenis_lahan=@idJenisLahan;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_kecamatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_kecamatan`;
delimiter ;;
CREATE PROCEDURE `update_kecamatan`(IN dataKecamatan JSON)
BEGIN
	#Routine body goes here...
	SET @idKecamatan = JSON_UNQUOTE(JSON_EXTRACT(dataKecamatan,'$.IdKecamatan'));
	SET @kecamatan = JSON_UNQUOTE(JSON_EXTRACT(dataKecamatan,'$.Kecamatan'));
	
	UPDATE districts SET districts.dis_name=@kecamatan
	WHERE districts.dis_id=@idKecamatan;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_kelompokTani
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_kelompokTani`;
delimiter ;;
CREATE PROCEDURE `update_kelompokTani`(IN dataKelompokTani JSON)
BEGIN
	#Routine body goes here...
	SET @idKelompokTani = JSON_UNQUOTE(JSON_EXTRACT(dataKelompokTani,'$.IdKelompokTani'));
	SET @kelompokTani = JSON_UNQUOTE(JSON_EXTRACT(dataKelompokTani,'$.KelompokTani'));
	SET @alamat = JSON_UNQUOTE(JSON_EXTRACT(dataKelompokTani,'$.Alamat'));
	SET @kecamatan = JSON_UNQUOTE(JSON_EXTRACT(dataKelompokTani,'$.Kecamatan'));
	
	UPDATE kelompok_tani SET kelompok_tani.nama_kelompok_tani=@kelompokTani, kelompok_tani.alamat_sekretariat=@alamat, kelompok_tani.dis_id=@kecamatan ,kelompok_tani.updated_at=NOW()
	WHERE kelompok_tani.id_kelompok_tani=@idKelompokTani;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_komoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_komoditas`;
delimiter ;;
CREATE PROCEDURE `update_komoditas`(IN dataKomoditas JSON)
BEGIN
	#Routine body goes here...
	SET @idKomoditas = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.IdKomoditas'));
	SET @namaKomoditas = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.NamaKomoditas'));
	SET @jenisKomoditas = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.IdJenisKomoditas'));
	SET @estimasiPanen = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.EstimasiPanen'));
	SET @gambar = JSON_UNQUOTE(JSON_EXTRACT(dataKomoditas,'$.Gambar'));
	
	UPDATE komoditas SET komoditas.nama_komoditas=@namaKomoditas, komoditas.id_jenis_komoditas=@jenisKomoditas, komoditas.estimasi_panen=@estimasiPanen, komoditas.gambar = @gambar,komoditas.updated_at=NOW()
	WHERE komoditas.id_komoditas=@idKomoditas;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_lahan
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_lahan`;
delimiter ;;
CREATE PROCEDURE `update_lahan`(IN dataLahan JSON)
BEGIN
	#Routine body goes here...
	
	SET @idLahan = JSON_UNQUOTE(JSON_EXTRACT(dataLahan,'$.IdLahan'));
	SET @namaLahan = JSON_UNQUOTE(JSON_EXTRACT(dataLahan,'$.NamaLahan'));
	SET @jenisLahan = JSON_UNQUOTE(JSON_EXTRACT(dataLahan,'$.IdJenisLahan'));
		
	UPDATE lahan SET lahan.nama_lahan=@namaLahan, lahan.id_jenis_lahan=@jenisLahan, lahan.updated_at=NOW()
	WHERE lahan.id_lahan=@idLahan;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_pasar
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_pasar`;
delimiter ;;
CREATE PROCEDURE `update_pasar`(IN dataPasar JSON)
BEGIN
	#Routine body goes here...
	SET @idPasar = JSON_UNQUOTE(JSON_EXTRACT(dataPasar,'$.IdPasar'));
	SET @nama_pasar = JSON_UNQUOTE(JSON_EXTRACT(dataPasar,'$.Pasar'));
	SET @lokasi = JSON_UNQUOTE(JSON_EXTRACT(dataPasar,'$.Lokasi'));
	
	UPDATE pasar SET pasar.nama_pasar=@nama_pasar, pasar.subdis_id=@lokasi, pasar.updated_at=NOW()
	WHERE pasar.id_pasar=@idPasar;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_pegawai
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_pegawai`;
delimiter ;;
CREATE PROCEDURE `update_pegawai`(IN dataPegawai JSON)
BEGIN
	#Routine body goes here...
	SET @idPegawai = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.IdPegawai'));
	SET @nip = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.Nip'));
	SET @namaPegawai = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.NamaPegawai'));
	SET @golonganPangkat = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.GolonganPangkat'));
	SET @jabatanBidang = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.JabatanBidang'));
	SET @alamat = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.Alamat'));
	SET @ponsel = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.Ponsel'));	
	SET @wa = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.WA'));	
	SET @desa = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.Desa'));	
	SET @foto = JSON_UNQUOTE(JSON_EXTRACT(dataPegawai,'$.Foto'));
	
	UPDATE pegawai SET pegawai.nip=@nip, pegawai.namaPegawai=@namaPegawai, pegawai.idGolonganPangkat=@golonganPangkat, pegawai.idJabatanBidang=@jabatanBidang, pegawai.alamat=@alamat, pegawai.noPonsel=@ponsel, pegawai.noWA=@wa, pegawai.subdis_id=@desa, pegawai.fileFoto=@foto, pegawai.updated_at=NOW()
	WHERE pegawai.idPegawai=@idPegawai;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_pengguna
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_pengguna`;
delimiter ;;
CREATE PROCEDURE `update_pengguna`(IN `dataPengguna` JSON)
BEGIN
	#Routine body goes here...
	SET @idPengguna = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna,'$.IdPengguna'));
	SET @username = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna,'$.Username'));
	SET @email = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna,'$.Email'));
	SET @`password` = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna,'$.Password'));
	SET @role = JSON_UNQUOTE(JSON_EXTRACT(dataPengguna,'$.Role'));
	
	UPDATE `users` SET `users`.username=@username, `users`.email=@email, `users`.`password`=@`password`, `users`.role_id=@role, `users`.updated_at=NOW()
	WHERE `users`.user_id=@idPengguna;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_petani
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_petani`;
delimiter ;;
CREATE PROCEDURE `update_petani`(IN dataPetani JSON)
BEGIN
	#Routine body goes here...
	SET @idPetani = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.IdPetani'));
	SET @namaDepan = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.NamaDepan'));
	SET @namaBelakang = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.NamaBelakang'));
	SET @alamat = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.Alamat'));
	SET @kelompokTani = JSON_UNQUOTE(JSON_EXTRACT(dataPetani,'$.KelompokTani'));
	
	UPDATE petani SET petani.nama_depan=@namaDepan, petani.nama_belakang=@namaBelakang, petani.alamat_rumah=@alamat, petani.id_kelompok_tani=@kelompokTani, petani.updated_at=NOW()
	WHERE petani.id_petani=@idPetani;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_bantuan
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_bantuan`;
delimiter ;;
CREATE PROCEDURE `viewAll_bantuan`()
BEGIN
	#Routine body goes here...
SELECT
	*, 
	kelompok_tani.nama_kelompok_tani
FROM
	bantuan
	INNER JOIN
	kelompok_tani
	ON 
		bantuan.id_kelompok_tani = kelompok_tani.id_kelompok_tani
WHERE
	bantuan.isDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_berita
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_berita`;
delimiter ;;
CREATE PROCEDURE `viewAll_berita`()
BEGIN
	#Routine body goes here...
SELECT
	berita.idBerita,
	berita.judul,
	berita.deskripsi,
	berita.foto,
	berita.created_at,
	berita.user_id,
	pegawai.namaPegawai 
FROM
	berita
	INNER JOIN users ON berita.user_id = users.user_id
	INNER JOIN pegawai ON users.personal_id = pegawai.idPegawai
	WHERE berita.isDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_beritaIndex
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_beritaIndex`;
delimiter ;;
CREATE PROCEDURE `viewAll_beritaIndex`()
BEGIN
	SELECT
		berita.idBerita,
		berita.judul,
		berita.deskripsi,
		berita.foto,
		berita.created_at,
		berita.user_id,
		pegawai.namaPegawai,
		CONCAT(
			DATE_FORMAT(berita.created_at, '%d '),
			CASE MONTH(berita.created_at)
				WHEN 1 THEN 'Januari'
				WHEN 2 THEN 'Februari'
				WHEN 3 THEN 'Maret'
				WHEN 4 THEN 'April'
				WHEN 5 THEN 'Mei'
				WHEN 6 THEN 'Juni'
				WHEN 7 THEN 'Juli'
				WHEN 8 THEN 'Agustus'
				WHEN 9 THEN 'September'
				WHEN 10 THEN 'Oktober'
				WHEN 11 THEN 'November'
				WHEN 12 THEN 'Desember'
			END,
			DATE_FORMAT(berita.created_at, ' %Y | %H:%i:%s WIB')
		) AS formatted_created_at
	FROM
		berita
		INNER JOIN users ON berita.user_id = users.user_id
		INNER JOIN pegawai ON users.personal_id = pegawai.idPegawai
	WHERE
		berita.isDeleted = 0
	ORDER BY
		berita.created_at DESC;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_bidang
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_bidang`;
delimiter ;;
CREATE PROCEDURE `viewAll_bidang`()
BEGIN
    -- Menampilkan bidang yang tidak dihapus
    SELECT
        departemen.namaDepartmen, 
        bidang.id_bidang, 
        bidang.nama_bidang, 
        bidang.keterangan
    FROM
        departemen
    INNER JOIN
        bidang
    ON 
        departemen.idDepartemen = bidang.idDepartemen
    WHERE bidang.is_deleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_dataPertanian
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_dataPertanian`;
delimiter ;;
CREATE PROCEDURE `viewAll_dataPertanian`()
BEGIN
	#Routine body goes here...
SELECT
        data_pertanian.id_data_pertanian,
        petani.nama_depan, 
        petani.nama_belakang, 
        lahan.nama_lahan, 
        komoditas.nama_komoditas, 
        data_pertanian.luas_lahan, 
        subdistricts.subdis_name, 
        data_pertanian.tanggal_tanam, 
        data_pertanian.tanggal_pencatatan,
				data_pertanian.latitude,
				data_pertanian.longitude, 
        pegawai.namaPegawai, 
        data_pertanian.alamat_lengkap, 
        komoditas.estimasi_panen,  
        DATE_ADD(STR_TO_DATE(data_pertanian.tanggal_tanam, '%d %b, %Y'), INTERVAL komoditas.estimasi_panen DAY) AS estimasi_panen_final
    FROM
        data_pertanian
    INNER JOIN
        petani ON data_pertanian.id_petani = petani.id_petani
    INNER JOIN
        lahan ON data_pertanian.id_lahan = lahan.id_lahan
    INNER JOIN
        komoditas ON data_pertanian.id_komoditas = komoditas.id_komoditas
    INNER JOIN
        subdistricts ON data_pertanian.subdis_id = subdistricts.subdis_id
    INNER JOIN
        users ON data_pertanian.user_id = users.user_id
    INNER JOIN
        pegawai ON users.personal_id = pegawai.idPegawai
    WHERE 
        data_pertanian.is_deleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_departemen
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_departemen`;
delimiter ;;
CREATE PROCEDURE `viewAll_departemen`()
BEGIN
	#Routine body goes here...
SELECT * FROM departemen
		WHERE departemen.isDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_desa
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_desa`;
delimiter ;;
CREATE PROCEDURE `viewAll_desa`()
BEGIN
SELECT
	subdistricts.subdis_id,
	subdistricts.subdis_name, 
	districts.dis_name
FROM
	subdistricts
	INNER JOIN
	districts
	ON 
		subdistricts.dis_id = districts.dis_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_golonganPangkat
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_golonganPangkat`;
delimiter ;;
CREATE PROCEDURE `viewAll_golonganPangkat`()
BEGIN#Routine body goes here...
	SELECT
		* 
	FROM
		golonganpangkat 
	WHERE
		golonganpangkat.isDeleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_hargaKomoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_hargaKomoditas`;
delimiter ;;
CREATE PROCEDURE `viewAll_hargaKomoditas`()
BEGIN
	#Routine body goes here...
SELECT
	harga_komoditas.id_harga, 
	harga_komoditas.harga, 
	harga_komoditas.tanggal, 
	komoditas.nama_komoditas, 
	pasar.nama_pasar
FROM
	harga_komoditas
	INNER JOIN
	pasar
	ON 
		harga_komoditas.id_pasar = pasar.id_pasar
	INNER JOIN
	komoditas
	ON 
		harga_komoditas.id_komoditas = komoditas.id_komoditas
		WHERE harga_komoditas.isDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_jabatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_jabatan`;
delimiter ;;
CREATE PROCEDURE `viewAll_jabatan`()
BEGIN
	#Routine body goes here...
SELECT * FROM jabatan
		WHERE jabatan.isDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_jabatanBidang
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_jabatanBidang`;
delimiter ;;
CREATE PROCEDURE `viewAll_jabatanBidang`()
BEGIN
	#Routine body goes here...
SELECT
	jabatanbidang.idJabatanBidang,
	jabatan.jabatan, 
	bidang.nama_bidang, 
	jabatanbidang.namaJabatanBidang, 
	jabatanbidang.keterangan
FROM
	jabatanbidang
	INNER JOIN
	bidang
	ON 
		jabatanbidang.id_bidang = bidang.id_bidang
	INNER JOIN
	jabatan
	ON 
		jabatanbidang.idJabatan = jabatan.idJabatan
		WHERE jabatanbidang.isDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_jabatanBidangPokTan
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_jabatanBidangPokTan`;
delimiter ;;
CREATE PROCEDURE `viewAll_jabatanBidangPokTan`()
BEGIN#Routine body goes here...
	SELECT
		jabatanbidang.idJabatanBidang,
		jabatan.jabatan,
		bidang.nama_bidang,
		jabatanbidang.namaJabatanBidang,
		jabatanbidang.keterangan 
	FROM
		jabatanbidang
		INNER JOIN bidang ON jabatanbidang.id_bidang = bidang.id_bidang
		INNER JOIN jabatan ON jabatanbidang.idJabatan = jabatan.idJabatan 
	WHERE
		jabatanbidang.id_bidang = 8 
			AND jabatanbidang.isDeleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_jabatanPetani
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_jabatanPetani`;
delimiter ;;
CREATE PROCEDURE `viewAll_jabatanPetani`()
BEGIN
	#Routine body goes here...
SELECT
	jabatanbidang.namaJabatanBidang,
	kelompok_tani.nama_kelompok_tani,
	petani.nama_depan,
	petani.nama_belakang,
	kelompok_tani.alamat_sekretariat,
	jabatan_petani.id_jabatan_petani 
FROM
	jabatan_petani
	INNER JOIN jabatanbidang ON jabatan_petani.idJabatanBidang = jabatanbidang.idJabatanBidang
	INNER JOIN kelompok_tani ON jabatan_petani.id_kelompok_tani = kelompok_tani.id_kelompok_tani
	INNER JOIN petani ON jabatan_petani.id_petani = petani.id_petani;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_jenisKomoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_jenisKomoditas`;
delimiter ;;
CREATE PROCEDURE `viewAll_jenisKomoditas`()
BEGIN#Routine body goes here...
	SELECT
		* 
	FROM
		jenis_komoditas 
	WHERE
		jenis_komoditas.is_deleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_jenisLahan
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_jenisLahan`;
delimiter ;;
CREATE PROCEDURE `viewAll_jenisLahan`()
BEGIN
	#Routine body goes here...
SELECT * FROM jenis_lahan
		WHERE jenis_lahan.is_deleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_kabupaten
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_kabupaten`;
delimiter ;;
CREATE PROCEDURE `viewAll_kabupaten`()
BEGIN
SELECT * FROM cities;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_kecamatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_kecamatan`;
delimiter ;;
CREATE PROCEDURE `viewAll_kecamatan`()
BEGIN
SELECT * FROM districts;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_kelompokTani
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_kelompokTani`;
delimiter ;;
CREATE PROCEDURE `viewAll_kelompokTani`()
BEGIN#Routine body goes here...
	SELECT
		kelompok_tani.nama_kelompok_tani,
		kelompok_tani.alamat_sekretariat,
		kelompok_tani.id_kelompok_tani,
		petani.nama_depan,
		petani.nama_belakang,
		districts.dis_name 
	FROM
		kelompok_tani
		LEFT JOIN jabatan_petani ON kelompok_tani.id_kelompok_tani = jabatan_petani.id_kelompok_tani
		LEFT JOIN petani ON jabatan_petani.id_petani = petani.id_petani
		INNER JOIN districts ON kelompok_tani.dis_id = districts.dis_id 
	WHERE
		kelompok_tani.is_deleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_kelompokTaniFull
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_kelompokTaniFull`;
delimiter ;;
CREATE PROCEDURE `viewAll_kelompokTaniFull`()
BEGIN#Routine body goes here...
	SELECT
		* 
	FROM
		kelompok_tani 
	WHERE
		kelompok_tani.is_deleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_Komoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_Komoditas`;
delimiter ;;
CREATE PROCEDURE `viewAll_Komoditas`()
BEGIN
	#Routine body goes here...
SELECT
	komoditas.id_komoditas,
	komoditas.nama_komoditas, 
	komoditas.gambar,
	jenis_komoditas.nama_jenis_komoditas, 
	komoditas.estimasi_panen
FROM
	komoditas
	INNER JOIN
	jenis_komoditas
	ON 
		komoditas.id_jenis_komoditas = jenis_komoditas.id_jenis_komoditas
		WHERE komoditas.is_deleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_komoditasKecamatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_komoditasKecamatan`;
delimiter ;;
CREATE PROCEDURE `viewAll_komoditasKecamatan`()
BEGIN
SELECT
    districts.dis_name, 
    subdistricts.subdis_name, 
    komoditas.id_komoditas, 
    komoditas.gambar, 
    komoditas.nama_komoditas, 
    districts.dis_id, 
    GROUP_CONCAT(gambar_lahan.url_gambar) AS url_gambar
FROM
    districts
    INNER JOIN subdistricts ON districts.dis_id = subdistricts.dis_id
    INNER JOIN data_pertanian ON subdistricts.subdis_id = data_pertanian.subdis_id
    INNER JOIN komoditas ON data_pertanian.id_komoditas = komoditas.id_komoditas
    INNER JOIN gambar_lahan ON data_pertanian.id_data_pertanian = gambar_lahan.id_data_pertanian
WHERE
    data_pertanian.is_deleted = 0
GROUP BY
    districts.dis_name, 
    subdistricts.subdis_name, 
    komoditas.id_komoditas, 
    komoditas.gambar, 
    komoditas.nama_komoditas, 
    districts.dis_id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_lahan
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_lahan`;
delimiter ;;
CREATE PROCEDURE `viewAll_lahan`()
BEGIN
	#Routine body goes here...
SELECT
	lahan.id_lahan,
	lahan.nama_lahan, 
	jenis_lahan.nama_jenis_lahan
FROM
	lahan
	INNER JOIN
	jenis_lahan
	ON 
		lahan.id_jenis_lahan = jenis_lahan.id_jenis_lahan
		WHERE lahan.is_deleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_latestHarga
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_latestHarga`;
delimiter ;;
CREATE PROCEDURE `viewAll_latestHarga`()
BEGIN#Routine body goes here...
	SELECT
		harga_komoditas.harga,
		pasar.nama_pasar,
		subdistricts.subdis_name,
		komoditas.nama_komoditas,
		komoditas.gambar,
		pasar.id_pasar,
		harga_komoditas.tanggal,
		harga_komoditas.id_komoditas 
	FROM
		harga_komoditas
		JOIN ( SELECT id_komoditas, MAX( STR_TO_DATE( tanggal, '%d %b, %Y' )) AS max_tanggal FROM harga_komoditas WHERE isDeleted = 0 GROUP BY id_komoditas ) filter_komoditas ON harga_komoditas.id_komoditas = filter_komoditas.id_komoditas 
		AND STR_TO_DATE( harga_komoditas.tanggal, '%d %b, %Y' ) = filter_komoditas.max_tanggal
		JOIN pasar ON harga_komoditas.id_pasar = pasar.id_pasar
		JOIN komoditas ON harga_komoditas.id_komoditas = komoditas.id_komoditas
		JOIN subdistricts ON pasar.subdis_id = subdistricts.subdis_id 
	WHERE
		harga_komoditas.isDeleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_pasar
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_pasar`;
delimiter ;;
CREATE PROCEDURE `viewAll_pasar`()
BEGIN
	#Routine body goes here...
SELECT
	pasar.id_pasar, 
	pasar.nama_pasar, 
	subdistricts.subdis_name
FROM
	pasar
	INNER JOIN
	subdistricts
	ON 
		pasar.subdis_id = subdistricts.subdis_id
		WHERE pasar.isDeleted = 0;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_pegawai
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_pegawai`;
delimiter ;;
CREATE PROCEDURE `viewAll_pegawai`()
BEGIN#Routine body goes here...
SELECT
	pegawai.idPegawai, 
	pegawai.namaPegawai
FROM
	pegawai
	WHERE
		pegawai.isDeleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_pegawaiFull
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_pegawaiFull`;
delimiter ;;
CREATE PROCEDURE `viewAll_pegawaiFull`()
BEGIN#Routine body goes here...
	SELECT
	pegawai.idPegawai,
		pegawai.nip,
		pegawai.namaPegawai,
		golonganpangkat.golongan,
		golonganpangkat.pangkat,
		jabatanbidang.namaJabatanBidang,
		subdistricts.subdis_name,
		pegawai.alamat,
		pegawai.noPonsel,
		pegawai.noWA,
		pegawai.fileFoto 
	FROM
		pegawai
		INNER JOIN golonganpangkat ON pegawai.idGolonganPangkat = golonganpangkat.idGolonganPangkat
		INNER JOIN jabatanbidang ON pegawai.idJabatanBidang = jabatanbidang.idJabatanBidang
		INNER JOIN subdistricts ON pegawai.subdis_id = subdistricts.subdis_id
	WHERE
		pegawai.isDeleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_Pengguna
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_Pengguna`;
delimiter ;;
CREATE PROCEDURE `viewAll_Pengguna`()
BEGIN#Routine body goes here...
SELECT
	users.user_id,
	users.username,
	users.email,
	users.`password`,
	users.role_id,
	pegawai.fileFoto,
	pegawai.idPegawai,
	users.personal_id,
	user_roles.role_name,
	pegawai.namaPegawai,
	users.is_deleted
FROM
	users
	INNER JOIN pegawai ON pegawai.idPegawai = users.personal_id
	INNER JOIN user_roles ON users.role_id = user_roles.role_id
	WHERE users.is_deleted = 0;
	END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_persebaranKomoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_persebaranKomoditas`;
delimiter ;;
CREATE PROCEDURE `viewAll_persebaranKomoditas`()
BEGIN
    SELECT
        districts.dis_name, 
        subdistricts.subdis_name, 
        komoditas.id_komoditas, 
        komoditas.gambar, 
        komoditas.nama_komoditas, 
        GROUP_CONCAT(gambar_lahan.url_gambar) AS url_gambar
    FROM
        districts
        INNER JOIN subdistricts ON districts.dis_id = subdistricts.dis_id
        INNER JOIN data_pertanian ON subdistricts.subdis_id = data_pertanian.subdis_id
        INNER JOIN komoditas ON data_pertanian.id_komoditas = komoditas.id_komoditas
        INNER JOIN gambar_lahan ON data_pertanian.id_data_pertanian = gambar_lahan.id_data_pertanian
    WHERE
        data_pertanian.is_deleted = 0
    GROUP BY
        districts.dis_name, 
        subdistricts.subdis_name, 
        komoditas.id_komoditas, 
        komoditas.gambar, 
        komoditas.nama_komoditas, 
        districts.dis_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_petani
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_petani`;
delimiter ;;
CREATE PROCEDURE `viewAll_petani`()
BEGIN#Routine body goes here...
SELECT
	petani.id_petani,
	petani.nama_depan, 
	petani.nama_belakang, 
	petani.alamat_rumah, 
	kelompok_tani.nama_kelompok_tani
FROM
	petani
	INNER JOIN
	kelompok_tani
	ON 
		petani.id_kelompok_tani = kelompok_tani.id_kelompok_tani
	WHERE
		petani.is_deleted = 0;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_provinsi
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_provinsi`;
delimiter ;;
CREATE PROCEDURE `viewAll_provinsi`()
BEGIN
SELECT * FROM provinces;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for viewAll_role
-- ----------------------------
DROP PROCEDURE IF EXISTS `viewAll_role`;
delimiter ;;
CREATE PROCEDURE `viewAll_role`()
BEGIN
	#Routine body goes here...
SELECT
	user_roles.role_id, 
	user_roles.role_name
FROM
	user_roles;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_bantuanById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_bantuanById`;
delimiter ;;
CREATE PROCEDURE `view_bantuanById`(IN id INT)
BEGIN
	SELECT
		*,
		kelompok_tani.nama_kelompok_tani 
	FROM
		bantuan
		INNER JOIN kelompok_tani ON bantuan.id_kelompok_tani = kelompok_tani.id_kelompok_tani 
	WHERE
		bantuan.id_bantuan = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_beritaById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_beritaById`;
delimiter ;;
CREATE PROCEDURE `view_beritaById`(IN id INT)
BEGIN
	SELECT
		berita.idBerita,
		berita.judul,
		berita.deskripsi,
		berita.foto,
		berita.created_at,
		berita.user_id,
		pegawai.namaPegawai,
		CONCAT(
			DATE_FORMAT(berita.created_at, '%d '),
			CASE MONTH(berita.created_at)
				WHEN 1 THEN 'Januari'
				WHEN 2 THEN 'Februari'
				WHEN 3 THEN 'Maret'
				WHEN 4 THEN 'April'
				WHEN 5 THEN 'Mei'
				WHEN 6 THEN 'Juni'
				WHEN 7 THEN 'Juli'
				WHEN 8 THEN 'Agustus'
				WHEN 9 THEN 'September'
				WHEN 10 THEN 'Oktober'
				WHEN 11 THEN 'November'
				WHEN 12 THEN 'Desember'
			END,
			DATE_FORMAT(berita.created_at, ' %Y | %H:%i:%s WIB')
		) AS formatted_created_at
	FROM
		berita
		INNER JOIN users ON berita.user_id = users.user_id
		INNER JOIN pegawai ON users.personal_id = pegawai.idPegawai
	WHERE
	berita.idBerita=id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_bidangById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_bidangById`;
delimiter ;;
CREATE PROCEDURE `view_bidangById`(IN id INT)
BEGIN
	SELECT
		departemen.namaDepartmen,
		bidang.idDepartemen,
		bidang.id_bidang,
		bidang.nama_bidang,
		bidang.keterangan 
	FROM
		departemen
		INNER JOIN bidang ON departemen.idDepartemen = bidang.idDepartemen 
	WHERE
		bidang.is_deleted = 0 
		AND bidang.id_bidang = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_dataDetailId
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_dataDetailId`;
delimiter ;;
CREATE PROCEDURE `view_dataDetailId`(IN id INT)
BEGIN
	 SELECT
        dp.id_data_pertanian,
        pt.nama_depan,
        pt.nama_belakang,
        lh.nama_lahan,
        km.nama_komoditas,
        dp.luas_lahan,
        sd.subdis_name,
        dp.tanggal_tanam,
        dp.tanggal_pencatatan,
        pg.namaPegawai,
        dp.alamat_lengkap,
				dp.latitude,
				dp.longitude,
        km.estimasi_panen,
        DATE_ADD(STR_TO_DATE(dp.tanggal_tanam, '%d %b, %Y'), INTERVAL km.estimasi_panen DAY) AS estimasi_panen_final,
        GROUP_CONCAT(gl.id_gambar) AS id_gambar,
        COALESCE(GROUP_CONCAT(gl.url_gambar), '') AS gambar_lahan  -- Ensure empty string if no images are found
    FROM
        data_pertanian dp
        INNER JOIN petani pt ON dp.id_petani = pt.id_petani
        INNER JOIN lahan lh ON dp.id_lahan = lh.id_lahan
        INNER JOIN komoditas km ON dp.id_komoditas = km.id_komoditas
        INNER JOIN subdistricts sd ON dp.subdis_id = sd.subdis_id
        INNER JOIN users u ON dp.user_id = u.user_id
        INNER JOIN pegawai pg ON u.personal_id = pg.idPegawai
        LEFT JOIN gambar_lahan gl ON dp.id_data_pertanian = gl.id_data_pertanian  -- Changed to LEFT JOIN
    WHERE
        dp.id_data_pertanian = id
    GROUP BY
        dp.id_data_pertanian;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_dataPertanianById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_dataPertanianById`;
delimiter ;;
CREATE PROCEDURE `view_dataPertanianById`(IN id INT)
BEGIN
	SELECT
		dp.id_data_pertanian,
		pt.id_petani,
		pt.nama_depan,
		pt.nama_belakang,
		k.id_komoditas,
		k.nama_komoditas,
		dp.luas_lahan,
		dp.id_lahan,
		dp.subdis_id,
		s.subdis_name,
		dp.tanggal_tanam,
		dp.tanggal_pencatatan,
		dp.alamat_lengkap,
		dp.latitude,
		dp.longitude,
		GROUP_CONCAT( gl.url_gambar ) AS gambar_lahan 
	FROM
		data_pertanian dp
		INNER JOIN petani pt ON dp.id_petani = pt.id_petani
		INNER JOIN lahan l ON dp.id_lahan = l.id_lahan
		INNER JOIN komoditas k ON dp.id_komoditas = k.id_komoditas
		INNER JOIN subdistricts s ON dp.subdis_id = s.subdis_id
		LEFT JOIN gambar_lahan gl ON dp.id_data_pertanian = gl.id_data_pertanian 
	WHERE
		dp.id_data_pertanian = id 
	GROUP BY
		dp.id_data_pertanian;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_departemenById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_departemenById`;
delimiter ;;
CREATE PROCEDURE `view_departemenById`(IN id INT)
BEGIN
	SELECT
		* 
	FROM
		departemen
	WHERE
		departemen.idDepartemen = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_desaById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_desaById`;
delimiter ;;
CREATE PROCEDURE `view_desaById`(IN id INT)
BEGIN
	SELECT
		subdistricts.subdis_id,
		subdistricts.dis_id,
		subdistricts.subdis_name,
		districts.dis_name 
	FROM
		subdistricts
		INNER JOIN districts ON subdistricts.dis_id = districts.dis_id 
	WHERE
		subdistricts.subdis_id = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_detailPersebaran
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_detailPersebaran`;
delimiter ;;
CREATE PROCEDURE `view_detailPersebaran`(IN komoditasId INT, IN disId INT)
BEGIN
    SELECT
        d.dis_name,
        s.subdis_name
    FROM
        data_pertanian dp
        JOIN subdistricts s ON dp.subdis_id = s.subdis_id
        JOIN districts d ON s.dis_id = d.dis_id
    WHERE
        dp.is_deleted = 0
        AND dp.id_komoditas = komoditasId
        AND (d.dis_id = disId OR disId = 0)  -- This ensures that if disId is 0, it fetches all districts
    GROUP BY
        d.dis_name, s.subdis_name;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_gambarByDataId
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_gambarByDataId`;
delimiter ;;
CREATE PROCEDURE `view_gambarByDataId`(IN idData INT)
BEGIN
    SELECT id, url_gambar 
    FROM gambar_lahan 
    WHERE id_data_pertanian = idData;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_golonganPangkatById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_golonganPangkatById`;
delimiter ;;
CREATE PROCEDURE `view_golonganPangkatById`(IN id INT)
BEGIN
	SELECT
		* 
	FROM
		golonganpangkat
	
	WHERE
		golonganpangkat.idGolonganPangkat = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_hargaByPasar
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_hargaByPasar`;
delimiter ;;
CREATE PROCEDURE `view_hargaByPasar`(IN id INT)
BEGIN
	SELECT
		harga_komoditas.harga,
		pasar.nama_pasar,
		subdistricts.subdis_name,
		komoditas.nama_komoditas,
		komoditas.gambar,
		pasar.id_pasar,
		harga_komoditas.tanggal,
		harga_komoditas.id_komoditas 
	FROM
		harga_komoditas
		JOIN ( SELECT id_komoditas, MAX( STR_TO_DATE( tanggal, '%d %b, %Y' )) AS max_tanggal FROM harga_komoditas WHERE isDeleted = 0 GROUP BY id_komoditas ) filter_komoditas ON harga_komoditas.id_komoditas = filter_komoditas.id_komoditas 
		AND STR_TO_DATE( harga_komoditas.tanggal, '%d %b, %Y' ) = filter_komoditas.max_tanggal
		JOIN pasar ON harga_komoditas.id_pasar = pasar.id_pasar
		JOIN komoditas ON harga_komoditas.id_komoditas = komoditas.id_komoditas
		JOIN subdistricts ON pasar.subdis_id = subdistricts.subdis_id 
	WHERE
		harga_komoditas.isDeleted = 0 
		AND pasar.id_pasar = id ;-- ganti dengan nilai id_pasar
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_hargaKomoditasById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_hargaKomoditasById`;
delimiter ;;
CREATE PROCEDURE `view_hargaKomoditasById`(IN id INT)
BEGIN
SELECT
	harga_komoditas.id_harga, 
	harga_komoditas.harga, 
	harga_komoditas.tanggal,
	harga_komoditas.id_komoditas,
	harga_komoditas.id_pasar, 
	komoditas.nama_komoditas, 
	pasar.nama_pasar
FROM
	harga_komoditas
	INNER JOIN
	pasar
	ON 
		harga_komoditas.id_pasar = pasar.id_pasar
	INNER JOIN
	komoditas
	ON 
		harga_komoditas.id_komoditas = komoditas.id_komoditas
		WHERE harga_komoditas.id_harga = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_jabatanBidangById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_jabatanBidangById`;
delimiter ;;
CREATE PROCEDURE `view_jabatanBidangById`(IN id INT)
BEGIN
SELECT
	jabatanbidang.idJabatanBidang,
	jabatan.jabatan, 
	jabatan.idJabatan,
	bidang.nama_bidang,
	bidang.id_bidang,
	jabatanbidang.namaJabatanBidang, 
	jabatanbidang.keterangan
FROM
	jabatanbidang
	INNER JOIN
	bidang
	ON 
		jabatanbidang.id_bidang = bidang.id_bidang
	INNER JOIN
	jabatan
	ON 
		jabatanbidang.idJabatan = jabatan.idJabatan
	WHERE
		jabatanBidang.idJabatanBidang = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_jabatanById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_jabatanById`;
delimiter ;;
CREATE PROCEDURE `view_jabatanById`(IN id INT)
BEGIN
	SELECT
		* 
	FROM
		jabatan
	WHERE
		jabatan.idJabatan = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_jabatanPetaniById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_jabatanPetaniById`;
delimiter ;;
CREATE PROCEDURE `view_jabatanPetaniById`(IN id INT)
BEGIN
SELECT
	jabatanbidang.namaJabatanBidang,
	kelompok_tani.nama_kelompok_tani,
	petani.nama_depan,
	petani.nama_belakang,
	kelompok_tani.alamat_sekretariat,
	jabatan_petani.idJabatanBidang,
	jabatan_petani.id_kelompok_tani,
	jabatan_petani.id_petani,
	jabatan_petani.id_jabatan_petani
FROM
	jabatan_petani
	INNER JOIN jabatanbidang ON jabatan_petani.idJabatanBidang = jabatanbidang.idJabatanBidang
	INNER JOIN kelompok_tani ON jabatan_petani.id_kelompok_tani = kelompok_tani.id_kelompok_tani
	INNER JOIN petani ON jabatan_petani.id_petani = petani.id_petani
	WHERE
		jabatan_petani.id_jabatan_petani = id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_jenisKomoditasById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_jenisKomoditasById`;
delimiter ;;
CREATE PROCEDURE `view_jenisKomoditasById`(IN `id` INT)
BEGIN
	SELECT
		* 
	FROM
		jenis_komoditas 
	WHERE
		jenis_komoditas.id_jenis_komoditas = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_jenisLahanById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_jenisLahanById`;
delimiter ;;
CREATE PROCEDURE `view_jenisLahanById`(IN id INT)
BEGIN
	SELECT
		* 
	FROM
		jenis_lahan 
	WHERE
		jenis_lahan.id_jenis_lahan = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_kecamatanById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_kecamatanById`;
delimiter ;;
CREATE PROCEDURE `view_kecamatanById`(IN id INT)
BEGIN
	SELECT
		* 
	FROM
		districts 
	WHERE
		districts.dis_id = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_kelompokTaniById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_kelompokTaniById`;
delimiter ;;
CREATE PROCEDURE `view_kelompokTaniById`(IN id INT)
BEGIN
	SELECT
		* 
	FROM
		kelompok_tani	
	WHERE
		kelompok_tani.id_kelompok_tani = id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_komoditasById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_komoditasById`;
delimiter ;;
CREATE PROCEDURE `view_komoditasById`(IN id INT)
BEGIN
	SELECT
		komoditas.id_komoditas,
		komoditas.nama_komoditas,
		komoditas.id_jenis_komoditas,
		komoditas.gambar,
		jenis_komoditas.nama_jenis_komoditas,
		komoditas.estimasi_panen 
	FROM
		komoditas
		INNER JOIN jenis_komoditas ON komoditas.id_jenis_komoditas = jenis_komoditas.id_jenis_komoditas 
	WHERE
		komoditas.id_komoditas = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_komoditasByKecamatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_komoditasByKecamatan`;
delimiter ;;
CREATE PROCEDURE `view_komoditasByKecamatan`(IN id INT)
BEGIN
SELECT
    districts.dis_name,
    subdistricts.subdis_name,
    komoditas.id_komoditas,
    komoditas.gambar,
    komoditas.nama_komoditas,
    GROUP_CONCAT(gambar_lahan.url_gambar) AS url_gambar
FROM
    districts
    INNER JOIN subdistricts ON districts.dis_id = subdistricts.dis_id
    INNER JOIN data_pertanian ON subdistricts.subdis_id = data_pertanian.subdis_id
    INNER JOIN komoditas ON data_pertanian.id_komoditas = komoditas.id_komoditas
    INNER JOIN gambar_lahan ON data_pertanian.id_data_pertanian = gambar_lahan.id_data_pertanian
WHERE
    data_pertanian.is_deleted = 0
		AND districts.dis_id = id
GROUP BY
    districts.dis_name,
    subdistricts.subdis_name,
    komoditas.id_komoditas,
    komoditas.gambar,
    komoditas.nama_komoditas,
    districts.dis_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_lahanById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_lahanById`;
delimiter ;;
CREATE PROCEDURE `view_lahanById`(IN id INT)
BEGIN
	SELECT
		lahan.id_lahan,
		lahan.nama_lahan,
		lahan.id_jenis_lahan,
		jenis_lahan.nama_jenis_lahan 
	FROM
		lahan
		INNER JOIN jenis_lahan ON lahan.id_jenis_lahan = jenis_lahan.id_jenis_lahan
	
	WHERE
		lahan.id_lahan = id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_pasarById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_pasarById`;
delimiter ;;
CREATE PROCEDURE `view_pasarById`(IN id INT)
BEGIN
SELECT
	pasar.id_pasar,
	pasar.subdis_id, 
	pasar.nama_pasar, 
	subdistricts.subdis_name
FROM
	pasar
	INNER JOIN
	subdistricts
	ON 
		pasar.subdis_id = subdistricts.subdis_id
	WHERE
		pasar.id_pasar = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_pegawaiById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_pegawaiById`;
delimiter ;;
CREATE PROCEDURE `view_pegawaiById`(IN id INT)
BEGIN
	SELECT
		pegawai.nip,
		pegawai.namaPegawai,
		golonganpangkat.golongan,
		golonganpangkat.pangkat,
		jabatanbidang.namaJabatanBidang,
		subdistricts.subdis_name,
		pegawai.alamat,
		pegawai.noPonsel,
		pegawai.noWA,
		pegawai.fileFoto,
		pegawai.idGolonganPangkat,
		pegawai.idJabatanBidang,
		pegawai.subdis_id,
		pegawai.idPegawai
	FROM
		pegawai
		INNER JOIN golonganpangkat ON pegawai.idGolonganPangkat = golonganpangkat.idGolonganPangkat
		INNER JOIN jabatanbidang ON pegawai.idJabatanBidang = jabatanbidang.idJabatanBidang
		INNER JOIN subdistricts ON pegawai.subdis_id = subdistricts.subdis_id 
	WHERE
		pegawai.idPegawai = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_penggunaById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_penggunaById`;
delimiter ;;
CREATE PROCEDURE `view_penggunaById`(IN `id` int)
BEGIN
SELECT
	users.user_id,
	users.username,
	users.email,
	users.`password`,
	users.role_id,
	user_roles.role_name 
FROM
	users
	INNER JOIN user_roles ON users.role_id = user_roles.role_id 
WHERE
	users.user_id = id;
	END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_persebaranKomoditas
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_persebaranKomoditas`;
delimiter ;;
CREATE PROCEDURE `view_persebaranKomoditas`(IN komoditasId INT,
    IN kecamatanId INT)
BEGIN
    SELECT
        k.id_komoditas,
        k.nama_komoditas,
        k.gambar,
        COUNT(DISTINCT d.dis_id) AS jumlah_kecamatan,
        COUNT(DISTINCT s.subdis_id) AS jumlah_desa,
        GROUP_CONCAT(DISTINCT gl.url_gambar) AS url_gambar
    FROM
        data_pertanian dp
        JOIN komoditas k ON dp.id_komoditas = k.id_komoditas
        JOIN subdistricts s ON dp.subdis_id = s.subdis_id
        JOIN districts d ON s.dis_id = d.dis_id
        LEFT JOIN gambar_lahan gl ON dp.id_data_pertanian = gl.id_data_pertanian
    WHERE
        dp.is_deleted = 0
        AND (komoditasId IS NULL OR dp.id_komoditas = komoditasId)
        AND (kecamatanId IS NULL OR d.dis_id = kecamatanId)
    GROUP BY
        k.id_komoditas, k.nama_komoditas, k.gambar;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_persebaran_by_kecamatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_persebaran_by_kecamatan`;
delimiter ;;
CREATE PROCEDURE `view_persebaran_by_kecamatan`(IN kecamatan_id INT)
BEGIN
    SELECT
        districts.dis_name, 
        subdistricts.subdis_name, 
        komoditas.id_komoditas, 
        komoditas.gambar, 
        komoditas.nama_komoditas, 
        GROUP_CONCAT(gambar_lahan.url_gambar) AS url_gambar
    FROM
        districts
        INNER JOIN subdistricts ON districts.dis_id = subdistricts.dis_id
        INNER JOIN data_pertanian ON subdistricts.subdis_id = data_pertanian.subdis_id
        INNER JOIN komoditas ON data_pertanian.id_komoditas = komoditas.id_komoditas
        INNER JOIN gambar_lahan ON data_pertanian.id_data_pertanian = gambar_lahan.id_data_pertanian
    WHERE
        data_pertanian.is_deleted = 0
        AND districts.dis_id = kecamatan_id
    GROUP BY
        districts.dis_name, 
        subdistricts.subdis_name, 
        komoditas.id_komoditas, 
        komoditas.gambar, 
        komoditas.nama_komoditas, 
        districts.dis_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_persebaran_by_komoditas_dan_kecamatan
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_persebaran_by_komoditas_dan_kecamatan`;
delimiter ;;
CREATE PROCEDURE `view_persebaran_by_komoditas_dan_kecamatan`(IN komoditas_id INT, IN kecamatan_id INT)
BEGIN
    SELECT
        districts.dis_name, 
        subdistricts.subdis_name, 
        komoditas.id_komoditas, 
        komoditas.gambar, 
        komoditas.nama_komoditas, 
        GROUP_CONCAT(gambar_lahan.url_gambar) AS url_gambar
    FROM
        districts
        INNER JOIN subdistricts ON districts.dis_id = subdistricts.dis_id
        INNER JOIN data_pertanian ON subdistricts.subdis_id = data_pertanian.subdis_id
        INNER JOIN komoditas ON data_pertanian.id_komoditas = komoditas.id_komoditas
        INNER JOIN gambar_lahan ON data_pertanian.id_data_pertanian = gambar_lahan.id_data_pertanian
    WHERE
        data_pertanian.is_deleted = 0
        AND komoditas.id_komoditas = komoditas_id
        AND districts.dis_id = kecamatan_id
    GROUP BY
        districts.dis_name, 
        subdistricts.subdis_name, 
        komoditas.id_komoditas, 
        komoditas.gambar, 
        komoditas.nama_komoditas, 
        districts.dis_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_petaniById
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_petaniById`;
delimiter ;;
CREATE PROCEDURE `view_petaniById`(IN id INT)
BEGIN
	SELECT
		petani.id_petani,
		petani.nama_depan,
		petani.nama_belakang,
		petani.alamat_rumah,
		petani.id_kelompok_tani,
		kelompok_tani.nama_kelompok_tani 
	FROM
		petani
		INNER JOIN kelompok_tani ON petani.id_kelompok_tani = kelompok_tani.id_kelompok_tani 
	WHERE
		petani.id_petani = id;
	
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for view_trenHarga
-- ----------------------------
DROP PROCEDURE IF EXISTS `view_trenHarga`;
delimiter ;;
CREATE PROCEDURE `view_trenHarga`(IN idKomoditas INT, IN idPasar INT)
BEGIN
    SELECT 
        hk.tanggal,
				hk.harga,
        k.nama_komoditas,
        p.nama_pasar,
        s.subdis_name
    FROM harga_komoditas hk
    JOIN komoditas k ON hk.id_komoditas = k.id_komoditas
    JOIN pasar p ON hk.id_pasar = p.id_pasar
    JOIN subdistricts s ON p.subdis_id = s.subdis_id
    WHERE 
        hk.isDeleted = 0
        AND k.is_deleted = 0
        AND p.isDeleted = 0
        AND (idKomoditas IS NULL OR hk.id_komoditas = idKomoditas)
        AND (idPasar IS NULL OR hk.id_pasar = idPasar)
    ORDER BY 
        STR_TO_DATE(hk.tanggal, '%d %b, %Y') ASC;
	
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
