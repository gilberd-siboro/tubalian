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

 Date: 08/06/2025 19:47:35
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bantuan
-- ----------------------------
INSERT INTO `bantuan` VALUES (1, 'asd', '02 Apr, 2025', 3, '2025-04-24 14:43:07', '2025-04-24 14:50:28', 1);
INSERT INTO `bantuan` VALUES (2, 'asd', '02 Apr, 2025', 2, '2025-04-30 08:15:44', '2025-04-30 08:15:49', 1);
INSERT INTO `bantuan` VALUES (3, 'jhbnm', '07 May, 2025', 3, '2025-05-09 11:12:46', '2025-05-09 11:12:53', 1);
INSERT INTO `bantuan` VALUES (4, 'Bantuan ini berupa bibit, pupuk, pestisida, traktor, pompa air, dan alat-alat pertanian lainnya untuk meningkatkan produktivitas', '06 May, 2025', 4, '2025-05-11 21:13:05', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of berita
-- ----------------------------
INSERT INTO `berita` VALUES (1, 'Tes', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Soluta nulla repellat eligendi officiis quam consequuntur esse quidem tempora aperiam minima!', '1745288712_11422046_MingguKe12.jpg', 1, '2025-04-22 09:25:12', '2025-05-08 13:47:34', 1);
INSERT INTO `berita` VALUES (2, 'Bu Andien Diduga Menghancurkan Sawah: Kontroversi di Desa', 'Desa setempat dikejutkan oleh insiden yang melibatkan seorang wanita bernama Bu Andien, yang diduga telah menghancurkan sawah milik petani. Kejadian ini memicu perdebatan di kalangan warga desa mengenai kondisi mental dan tindakan yang diambil.', '1746686830_th (4).jpeg', 1, '2025-04-30 08:42:11', '2025-05-08 13:48:14', 0);
INSERT INTO `berita` VALUES (3, 'Ancaman Kucing Liar: Ladang Pertanian di Desa Ynnoj Terancam', 'Desa Ynnoj kini menghadapi masalah serius akibat serangan kucing liar yang merusak ladang pertanian. Para petani melaporkan bahwa kucing-kucing tersebut telah mengganggu tanaman mereka, menyebabkan kerugian yang signifikan.', '1746686135_th (3).jpeg', 1, '2025-04-30 08:43:54', '2025-05-08 13:35:35', 0);
INSERT INTO `berita` VALUES (4, 'Harga Tomat Diperkirakan Naik di Pasar Sidoal: Apa Penyebabnya?', 'Pasar Sidoal diperkirakan akan mengalami kenaikan harga tomat dalam beberapa minggu ke depan. Para pedagang dan petani setempat mengindikasikan bahwa beberapa faktor telah berkontribusi terhadap tren ini, yang dapat memengaruhi konsumen dan rantai pasok', '1746685953_th (2).jpeg', 1, '2025-04-30 08:46:41', '2025-05-08 13:32:33', 0);
INSERT INTO `berita` VALUES (5, 'Gagal Panen padi di desa Simare mare', 'Desa Simare Mare baru-baru ini mengalami gagal panen padi yang mengkhawatirkan, mengakibatkan dampak serius bagi para petani dan ekonomi lokal. Banyak petani yang telah bekerja keras selama musim tanam ini terpaksa menghadapi kenyataan pahit akibat cuaca ekstrem dan serangan hama', '1746685813_th (1).jpeg', 1, '2025-05-03 20:13:07', '2025-05-08 13:30:13', 0);
INSERT INTO `berita` VALUES (6, 'Jagung Murah di Pasar Dolok', 'Penurunan harga jagung dalam beberapa pekan terakhir disambut positif oleh petani lokal. Salah satu petani dari daerah Blitar, Budi Santoso, menyatakan bahwa tren harga yang lebih rendah justru memberikan dampak yang menguntungkan, baik bagi pelaku usaha tani maupun konsumen. Menurutnya, dengan harga yang kini lebih terjangkau, jangkauan pasar semakin luas dan volume penjualan mengalami peningkatan.\r\n\r\n\"Kami senang dengan harga jagung yang lebih murah. Ini membantu kami menjangkau lebih banyak konsumen dan meningkatkan penjualan kami,\" ujar Budi saat ditemui di lahan pertaniannya, Minggu (11/5). Ia menjelaskan bahwa meskipun harga satuan jagung menurun, keuntungan tetap dapat diraih dari peningkatan volume transaksi. Petani juga merasa lebih termotivasi untuk terus menanam dan merawat lahan mereka karena adanya permintaan pasar yang stabil.\r\n\r\nHarga jagung di sejumlah pasar tradisional dan sentra pertanian di Jawa Timur diketahui mengalami penurunan dalam kisaran 5–10 persen dibandingkan bulan sebelumnya. Penurunan ini dinilai sebagai hasil dari meningkatnya pasokan dan efisiensi distribusi dari produsen ke konsumen. Selain itu, cuaca yang mendukung musim panen juga menjadi salah satu faktor yang mempercepat pasokan ke pasar.\r\n\r\nDi sisi lain, para pelaku industri pakan ternak dan makanan olahan yang menggunakan jagung sebagai bahan baku utama juga merasakan dampak positif. Dengan harga yang lebih rendah, biaya produksi dapat ditekan, sehingga harga jual produk ke konsumen pun lebih kompetitif. Hal ini berpotensi mendorong pertumbuhan sektor hilir yang selama ini sangat bergantung pada komoditas jagung.\r\n\r\nPemerintah daerah dan dinas pertanian setempat turut mengamati kondisi ini dengan optimisme. Mereka menyebut bahwa kestabilan harga jagung dalam jangka menengah sangat penting, baik bagi kesejahteraan petani maupun keberlanjutan industri terkait. Upaya untuk menjaga pasokan, memperbaiki infrastruktur distribusi, serta meningkatkan produktivitas lahan akan terus dilakukan untuk memastikan harga tetap stabil dan adil di semua lini.\r\n\r\nKe depan, petani seperti Budi Santoso berharap agar tren positif ini bisa terus berlangsung. Ia menegaskan bahwa harga yang stabil jauh lebih penting daripada harga tinggi yang hanya bersifat sementara. “Petani butuh kepastian, bukan spekulasi. Dengan harga yang stabil dan permintaan yang jelas, kami bisa merencanakan produksi dengan lebih baik,” tuturnya.\r\n\r\nDengan semua pihak yang merasa diuntungkan—mulai dari petani, pelaku usaha, hingga konsumen—tren penurunan harga jagung kali ini tampaknya membuka peluang terciptanya sistem pangan yang lebih seimbang dan berkelanjutan. Jika dikelola dengan baik, momentum ini bisa menjadi titik tolak bagi perbaikan ekosistem pertanian nasional secara menyeluruh.', '1746685703_th.jpeg', 1, '2025-05-03 20:35:10', '2025-05-11 16:27:19', 0);
INSERT INTO `berita` VALUES (7, 'tes', 'tes', '1746686995_th (3).jpeg', 1, '2025-05-08 13:49:55', '2025-05-08 13:50:23', 1);

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
INSERT INTO `data_pertanian` VALUES (1, 1, 1, 1, 1000.00, 1, '11 Mar, 2025', '19 Mar, 2025', 2, 'Lumban Jaean', NULL, NULL, NULL, '2025-03-20 14:23:03', 1);
INSERT INTO `data_pertanian` VALUES (2, 1, 1, 7, 1000.00, 1, '06 Mar, 2025', '20 Mar, 2025', 2, 'Tarutung', '2.0197784588225454', '98.97601605494013', NULL, '2025-05-11 21:19:32', 0);
INSERT INTO `data_pertanian` VALUES (3, 7, 1, 7, 12000.00, 15, '03 Apr, 2025', '04 Apr, 2025', 1, 'Silando', NULL, NULL, NULL, '2025-05-08 08:55:32', 0);
INSERT INTO `data_pertanian` VALUES (4, 8, 3, 5, 1000.00, 16, '12 Feb, 2025', '04 Apr, 2025', 1, 'Batu Binumbun', NULL, NULL, NULL, '2025-05-08 09:26:28', 0);
INSERT INTO `data_pertanian` VALUES (5, 9, 2, 6, 1234.00, 17, '02 Apr, 2025', '04 Apr, 2025', 1, 'Simanampang', '0.0260853762749248', '-0.02898091594215613', NULL, '2025-05-10 18:08:42', 0);
INSERT INTO `data_pertanian` VALUES (14, 2, 3, 3, 12312.00, 2, '07 May, 2025', '05 May, 2025', 1, 'Hapoltahan', 'null', 'null', '2025-05-08 09:48:51', '2025-05-10 12:31:32', 0);
INSERT INTO `data_pertanian` VALUES (22, 1, 1, 3, 123.00, 15, '20 May, 2025', '27 May, 2025', 1, 'asd', '2.0308136798895253', '98.96454773662681', '2025-05-11 11:05:40', NULL, 0);

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
INSERT INTO `jabatanbidang` VALUES (9, 1, 1, 'Kepala Dinas Pertanian Tapanuli Utara', 'Pimpinan yang mempunyai tugas memimpin mengkoordinasikan, menyelenggarakan, mengevaluasi dan pelaporan kegiatan bidang pertanian.', NULL, '2025-03-31 09:12:42', 0);
INSERT INTO `jabatanbidang` VALUES (10, 1, 2, 'Kepala UPT Alsintan', 'Mengelola, mengoperasikan, dan mengawasi unit layanan alat dan mesin pertanian.', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (11, 1, 2, 'Kepala UPT Laboratorium dan POPT', 'Pengelolaan laboratorium serta pengendalian organisme pengganggu tumbuhan', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (12, 1, 3, 'Kepala Bidang Tanaman Pangan', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang tanaman pangan', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (13, 1, 4, 'Kepala Bidang Hortikultura', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang tanaman hortikultura', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (14, 1, 5, 'Kepala Bidang Perkebunan', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang perkebunan', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (15, 1, 6, 'Kepala Bidang Sarana dan Prasarana', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang sarana dan prasarana', NULL, NULL, 0);
INSERT INTO `jabatanbidang` VALUES (16, 1, 7, 'Kepala Bidang Penyuluhan', 'Merencanakan, mengkoordinasikan, mengawasi, dan mengevaluasi program serta kebijakan di bidang penyuluhan', NULL, NULL, 0);
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
INSERT INTO `jenis_komoditas` VALUES (1, 'Tanaman Pangan', NULL, '2025-04-01 13:27:25', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of komoditas
-- ----------------------------
INSERT INTO `komoditas` VALUES (1, 'Padi', 1, '151', 'null', NULL, '2025-04-04 13:30:02', 1);
INSERT INTO `komoditas` VALUES (3, 'Jagung', 1, '70', 'jagung.jpg', '2025-04-04 11:09:06', NULL, 0);
INSERT INTO `komoditas` VALUES (4, 'Kopi', 5, '300', 'kopi.jpeg', '2025-04-04 11:11:54', NULL, 0);
INSERT INTO `komoditas` VALUES (5, 'Bawang Merah', 7, '90', 'bawangmerah.jpg', '2025-04-04 11:13:14', '2025-06-07 16:36:25', 0);
INSERT INTO `komoditas` VALUES (6, 'Kakao', 5, '180', 'kakao.jpeg', '2025-04-04 11:34:38', NULL, 0);
INSERT INTO `komoditas` VALUES (7, 'Padi', 1, '151', '1743748199_padi.jpg', '2025-04-04 13:29:59', '2025-04-04 13:33:05', 0);
INSERT INTO `komoditas` VALUES (8, 'asd', 1, '123', '1746583682_asd.jpg', '2025-05-07 09:08:02', '2025-05-10 17:13:27', 1);
INSERT INTO `komoditas` VALUES (9, 'asdasd', 1, '123', '1748833635_1746586032_harga.jpg', '2025-06-02 10:07:15', NULL, 0);

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
  `personal_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`user_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'pertanian', '1', 1, NULL, '$2y$12$c8roUKWHlDDuaRxREfJm9.9WxdZiDVc9w9CbhdLZTgS7mEek9Km8a', 'asdasd@gmail.com', 1, NULL, '2025-05-09 10:59:18', 0);
INSERT INTO `users` VALUES (2, 'penyuluh', '1', 1, NULL, '$2y$12$xWUr9RuFuOnEMH7rpdkAcOS1CnsrJkWXOqTfbBUctPyxz6B6.4dqi', 'asd@gmail.com', 2, NULL, '2025-05-14 11:02:59', 0);
INSERT INTO `users` VALUES (4, 'eric', '2', 1, NULL, '$2y$12$IREI7ZXob3wVDBFhYOSCQujRi0CoZt1UmmX1ajvXa0OOxVnR/OBk.', 'eric@gmail.com', 1, '2025-03-18 10:07:06', '2025-03-24 11:11:44', 1);
INSERT INTO `users` VALUES (5, '123', '1', 1, NULL, '$2y$12$nVJZu1gMZpzOw5sz3LQzdObWf3x6qBhItZmAQjUwo9coP6Kv51ZJe', '123@gmail.com', 1, '2025-06-05 07:57:00', NULL, 0);
INSERT INTO `users` VALUES (6, '123123', 'null', 1, NULL, '$2y$12$P0NJ2tRiE4nvzWymFUDAYOcq533SiPFF.dhuHFLcjFee91.gP87Ri', '123123@gmail.com', 1, '2025-06-05 07:57:36', NULL, 0);
INSERT INTO `users` VALUES (7, 'Pertanian', '1', 1, NULL, '$2y$12$xXTs1lBbckOfxrXXY1E.UeEI3rz095AapUrDg.Qmx7mCaWIzYsMum', 'asdas@gmail.com', 1, '2025-06-07 17:21:22', NULL, 0);
INSERT INTO `users` VALUES (8, 'pertanian', '1', 1, NULL, '$2y$12$/aD3lXNfpvdi8BFrZVK/SO9MxKkJ3.8ZSBmwNuRXEofkmtvFQzNlm', 'asdasd@gmail.com', 1, '2025-06-07 17:21:38', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
