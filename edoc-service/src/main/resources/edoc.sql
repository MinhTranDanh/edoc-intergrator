/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : edoc

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 08/09/2020 14:47:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for counter_
-- ----------------------------
DROP TABLE IF EXISTS `counter_`;
CREATE TABLE `counter_`  (
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `currentId` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of counter_
-- ----------------------------
INSERT INTO `counter_` VALUES ('com.bkav.edoc.service.database.entity.EdocAttachment', 11307);

-- ----------------------------
-- Table structure for edoc_attachment
-- ----------------------------
DROP TABLE IF EXISTS `edoc_attachment`;
CREATE TABLE `edoc_attachment`  (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organ_domain` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `full_path` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type_` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size_` bigint(20) NULL DEFAULT NULL,
  `to_organ_domain` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `document_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`attachment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18061141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_attachment
-- ----------------------------
INSERT INTO `edoc_attachment` VALUES (18061078, '000.00.13.H53', 'B??o c??o c??ng t??c QLNN v??? Th??ng tin v?? truy???n th??ng th??ng 8 v?? ph????ng h?????ng th??ng 9 n??m 2020.doc', '2020-08-14 15:29:38', '000.00.13.H53/2020/8/14/272_1', 'application/msword', 134144, '000.00.13.H53', 272);
INSERT INTO `edoc_attachment` VALUES (18061079, '000.00.13.H53', 'Ph??? l???c b??o c??o th??ng 8.doc', '2020-08-14 15:29:38', '000.00.13.H53/2020/8/14/272_2', 'application/msword', 93184, '000.00.13.H53', 272);
INSERT INTO `edoc_attachment` VALUES (18061080, '000.00.13.H53', 'B??o c??o c??ng t??c QLNN v??? Th??ng tin v?? truy???n th??ng th??ng 8 v?? ph????ng h?????ng th??ng 9 n??m 2020_Signed.pdf', '2020-08-14 15:29:38', '000.00.13.H53/2020/8/14/272_3', 'application/pdf', 448011, '000.00.13.H53', 272);
INSERT INTO `edoc_attachment` VALUES (18061081, '000.00.13.H53', 'phu luc kem theo_1.PDF', '2020-08-14 15:29:38', '000.00.13.H53/2020/8/14/272_4', 'application/pdf', 279030, '000.00.13.H53', 272);
INSERT INTO `edoc_attachment` VALUES (18061082, '000.00.13.H53', '1.1 HDSD xac thuc phan quyen tap trung_IAM.docx', '2020-08-14 17:06:54', '000.00.13.H53/2020/8/14/11253_1', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 2676732, NULL, NULL);
INSERT INTO `edoc_attachment` VALUES (18061083, '000.00.13.H53', '1.1 HDSD xac thuc phan quyen tap trung_IAM.docx', '2020-08-14 17:16:17', '000.00.13.H53/2020/8/14/11255_1', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 2676732, NULL, NULL);
INSERT INTO `edoc_attachment` VALUES (18061084, '000.00.13.H53', '1.1 HDSD xac thuc phan quyen tap trung_IAM.docx', '2020-08-14 17:25:44', '000.00.13.H53/2020/8/14/11256_1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 2676732, NULL, NULL);
INSERT INTO `edoc_attachment` VALUES (18061085, '000.00.13.H53', '1.1 HDSD xac thuc phan quyen tap trung_IAM.docx', '2020-08-14 17:35:54', '000.00.13.H53/2020/8/14/11257_1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 2676732, NULL, NULL);
INSERT INTO `edoc_attachment` VALUES (18061086, '000.00.13.H53', '5.5_TTS_L???p tr??nh_Nguy???n Th??? Ph????ng.docx', '2020-08-14 17:36:04', '000.00.13.H53/2020/8/14/11258_1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 15703, '000.00.21.H53', 273);
INSERT INTO `edoc_attachment` VALUES (18061087, '000.00.13.H53', '15_LGSP 12082019.xlsx', '2020-08-14 17:36:07', '000.00.13.H53/2020/8/14/11259_1.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 218629, '000.00.21.H53', 273);
INSERT INTO `edoc_attachment` VALUES (18061088, '000.00.13.H53', 'c??? Th??nh vi??n tham gia H???i ?????ng c???p t???nh x??t t???ng danh hi???u ???Ngh??? nh??n nh??n d??n???, ???Ngh??? nh??n ??u t?????.docx', '2020-08-14 17:53:21', '000.00.13.H53/2020/8/14/274_1', 'application/msword', 40265, '000.00.13.H53', 274);
INSERT INTO `edoc_attachment` VALUES (18061089, '000.00.13.H53', 'c??? Th??nh vi??n tham gia H???i ?????ng c???p t???nh x??t t???ng danh hi???u ???Ngh??? nh??n nh??n d??n???, ???Ngh??? nh??n ??u t?????_Signed.pdf', '2020-08-14 17:53:21', '000.00.13.H53/2020/8/14/274_2', 'application/pdf', 392185, '000.00.13.H53', 274);
INSERT INTO `edoc_attachment` VALUES (18061090, '000.00.13.H53', 'BC TT 032017.docx', '2020-08-14 18:01:17', '000.00.13.H53/2020/8/14/11260_1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 26493, '000.00.13.H53', 275);
INSERT INTO `edoc_attachment` VALUES (18061091, '000.00.13.H53', 'CV_Hachinet_DungTD.xlsx', '2020-08-14 18:01:17', '000.00.13.H53/2020/8/14/11261_2.xlsx', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 96129, '000.00.13.H53', 275);
INSERT INTO `edoc_attachment` VALUES (18061092, '000.00.13.H53', '13. Tr???c li??n th??ng t??ch h???p.docx', '2020-08-14 18:56:52', '000.00.13.H53/2020/8/14/11262_1', 'application/docx', 705164, '000.00.21.H53', 276);
INSERT INTO `edoc_attachment` VALUES (18061093, '000.00.13.H53', '15_LGSP 12082019.xlsx', '2020-08-14 18:56:52', '000.00.13.H53/2020/8/14/11263_2', 'application/zip', 218629, '000.00.21.H53', 276);
INSERT INTO `edoc_attachment` VALUES (18061094, '000.00.13.H53', 'User_15-06-2020.xlsx', '2020-08-14 19:05:54', '000.00.13.H53/2020/8/14/11264_1', 'application/xlsx', 9216, '000.00.21.H53', 277);
INSERT INTO `edoc_attachment` VALUES (18061095, '000.00.13.H53', 'V??n b???n ????? ngh??? k???t n???i d??? li???u QLVB v?? HCC.doc', '2020-08-14 19:05:54', '000.00.13.H53/2020/8/14/11265_2', 'application/msword', 151552, '000.00.21.H53', 277);
INSERT INTO `edoc_attachment` VALUES (18061096, '000.00.13.H53', 'MetaData_Estimate_Review_xtel_Confirm.xlsx', '2020-08-14 19:13:23', '000.00.13.H53/2020/8/14/11266_1', 'application/xlsx', 165857, '000.00.13.H53', 278);
INSERT INTO `edoc_attachment` VALUES (18061097, '000.00.13.H53', 'Ph???n-m???m-n???n-t???ng-li??n-th??ng-t??ch-h???p.xlsx', '2020-08-14 19:13:23', '000.00.13.H53/2020/8/14/11267_2', 'application/xlsx', 481173, '000.00.13.H53', 278);
INSERT INTO `edoc_attachment` VALUES (18061098, '000.00.13.H53', 'SSO_documentation.docx', '2020-08-14 19:13:23', '000.00.13.H53/2020/8/14/11268_3', 'application/docx', 127676, '000.00.13.H53', 278);
INSERT INTO `edoc_attachment` VALUES (18061099, '000.00.13.H53', 'TKTC-MTA-Chinh-Muc_Luc_G???i_Ch???_Hi???n.docx', '2020-08-14 19:13:23', '000.00.13.H53/2020/8/14/11269_4', 'application/docx', 787131, '000.00.13.H53', 278);
INSERT INTO `edoc_attachment` VALUES (18061100, '000.00.13.H53', '13. Tr???c li??n th??ng t??ch h???p.docx', '2020-08-15 09:06:47', '000.00.13.H53/2020/8/15/11270_1', 'application/docx', 705164, '000.00.13.H53', 279);
INSERT INTO `edoc_attachment` VALUES (18061101, '000.00.13.H53', 'API_web.docx', '2020-08-15 09:06:47', '000.00.13.H53/2020/8/15/11271_2', 'application/docx', 15825, '000.00.13.H53', 279);
INSERT INTO `edoc_attachment` VALUES (18061102, '000.00.13.H53', 'CV_Hachinet_DungTD.xlsx', '2020-08-15 09:06:47', '000.00.13.H53/2020/8/15/11272_3', 'application/xlsx', 96129, '000.00.13.H53', 279);
INSERT INTO `edoc_attachment` VALUES (18061103, '000.00.13.H53', 'V??? vi???c g??p ?? d??? th???o K??? ho???ch truy???n th??ng v??? th???c hi???n th??? t???c h??nh ch??nh tr??n m??i tr?????ng ??i???n t??? tr??n ?????a b??n t???nh T??y Ninh.doc', '2020-08-15 11:27:30', '000.00.13.H53/2020/8/15/280_1', 'application/msword', 34304, '000.00.23.H53', 280);
INSERT INTO `edoc_attachment` VALUES (18061104, '000.00.13.H53', 'Du thao Ke hoach tuyen truyen thuc hien TTHC tren moi truong dien tu_sua.doc', '2020-08-15 11:27:30', '000.00.13.H53/2020/8/15/280_2', 'application/msword', 92672, '000.00.23.H53', 280);
INSERT INTO `edoc_attachment` VALUES (18061105, '000.00.13.H53', 'V??? vi???c g??p ?? d??? th???o K??? ho???ch truy???n th??ng v??? th???c hi???n th??? t???c h??nh ch??nh tr??n m??i tr?????ng ??i???n t??? tr??n ?????a b??n t???nh T??y Ninh_Signed.pdf', '2020-08-15 11:27:30', '000.00.13.H53/2020/8/15/280_3', 'application/pdf', 583754, '000.00.23.H53', 280);
INSERT INTO `edoc_attachment` VALUES (18061106, '000.00.13.H53', 'Ket noi EMR.docx', '2020-08-15 13:17:25', '000.00.13.H53/2020/8/15/11273_1', 'application/docx', 479280, '000.00.21.H53', 281);
INSERT INTO `edoc_attachment` VALUES (18061107, '000.00.13.H53', 'MetaData_Estimate_Review_xtel_Confirm.xlsx', '2020-08-15 13:17:25', '000.00.13.H53/2020/8/15/11274_2', 'application/xlsx', 165857, '000.00.21.H53', 281);
INSERT INTO `edoc_attachment` VALUES (18061108, '000.00.13.H53', 'Ph???n-m???m-n???n-t???ng-li??n-th??ng-t??ch-h???p.xlsx', '2020-08-15 13:17:25', '000.00.13.H53/2020/8/15/11275_3', 'application/xlsx', 481173, '000.00.21.H53', 281);
INSERT INTO `edoc_attachment` VALUES (18061109, '000.00.13.H53', '1.1 HDSD xac thuc phan quyen tap trung_IAM.docx', '2020-08-19 18:12:52', '000.00.13.H53/2020/8/19/11276_1', 'application/docx', 2676732, '000.00.01.H53', 282);
INSERT INTO `edoc_attachment` VALUES (18061110, '000.00.13.H53', '2_TLTVBQG_HuongDanKyThuatKetNoiLienThong_2.2_VPCP.pdf', '2020-08-19 18:12:52', '000.00.13.H53/2020/8/19/11277_2', 'application/pdf', 2305118, '000.00.01.H53', 282);
INSERT INTO `edoc_attachment` VALUES (18061111, '000.00.13.H53', '15_LGSP 12082019.xlsx', '2020-08-19 18:12:52', '000.00.13.H53/2020/8/19/11278_3', 'application/xlsx', 218629, '000.00.01.H53', 282);
INSERT INTO `edoc_attachment` VALUES (18061112, '000.00.13.H53', '9.Gioi-thieu-CQ??T-LGSP.pdf', '2020-08-19 18:29:30', '000.00.13.H53/2020/8/19/11279_1', 'application/pdf', 4703883, '000.01.01.H53', 283);
INSERT INTO `edoc_attachment` VALUES (18061113, '000.00.13.H53', '13. Tr???c li??n th??ng t??ch h???p.docx', '2020-08-19 18:30:16', '000.00.13.H53/2020/8/19/11280_2', 'application/docx', 705164, '000.01.01.H53', 283);
INSERT INTO `edoc_attachment` VALUES (18061114, '000.00.13.H53', '15_LGSP 12082019.xlsx', '2020-08-19 18:30:32', '000.00.13.H53/2020/8/19/11281_3', 'application/xlsx', 218629, '000.01.01.H53', 283);
INSERT INTO `edoc_attachment` VALUES (18061115, '000.00.13.H53', '13. Tr???c li??n th??ng t??ch h???p.docx', '2020-08-20 11:50:45', '000.00.13.H53/2020/8/20/11282_1', 'application/docx', 705164, '000.00.01.H53#000.02.01.H53#000.12.31.H53', 284);
INSERT INTO `edoc_attachment` VALUES (18061116, '000.00.13.H53', '15_LGSP 12082019.xlsx', '2020-08-20 11:50:45', '000.00.13.H53/2020/8/20/11283_2', 'application/xlsx', 218629, '000.00.01.H53#000.02.01.H53#000.12.31.H53', 284);
INSERT INTO `edoc_attachment` VALUES (18061117, '000.00.13.H53', '631_THH_THHT.pdf', '2020-08-20 11:50:45', '000.00.13.H53/2020/8/20/11284_3', 'application/pdf', 1338154, '000.00.01.H53#000.02.01.H53#000.12.31.H53', 284);
INSERT INTO `edoc_attachment` VALUES (18061118, '000.00.13.H53', '1163.PDF', '2020-08-22 21:42:17', '000.00.13.H53\\2020\\8\\22\\11285_1', 'application/zip', 378238, '000.28.31.H53#000.01.32.H53#000.01.33.H53', 285);
INSERT INTO `edoc_attachment` VALUES (18061119, '000.00.13.H53', 'VB 1142_Signed.pdf', '2020-08-22 21:48:00', '000.00.13.H53\\2020\\8\\22\\11286_1', 'application/pdf', 343413, '000.00.01.H53', 286);
INSERT INTO `edoc_attachment` VALUES (18061120, '000.00.13.H53', 'VB 1142.doc', '2020-08-22 21:48:00', '000.00.13.H53\\2020\\8\\22\\11287_2', 'application/msword', 44544, '000.00.01.H53', 286);
INSERT INTO `edoc_attachment` VALUES (18061121, '000.00.13.H53', 'ioc_danhsachnhansu_1597673181.xlsx', '2020-08-24 23:26:37', '000.00.13.H53\\2020\\8\\24\\11288_1', 'application/xlsx', 1789949, '000.10.32.H53', 287);
INSERT INTO `edoc_attachment` VALUES (18061122, '000.00.13.H53', 'CVDi 916 STTTT- CNTT[signed].pdf', '2020-08-24 23:26:39', '000.00.13.H53\\2020\\8\\24\\11289_2', 'application/pdf', 1105550, '000.10.32.H53', 287);
INSERT INTO `edoc_attachment` VALUES (18061123, '000.00.13.H53', 'DanhMucVaMaDinhDanhKetNoiCacHeThongQlvbdhCap4 (1).xlsx', '2020-08-31 00:28:18', '000.00.13.H53\\2020\\8\\31\\11290_1', 'application/xlsx', 1583566, '000.00.01.H53#000.20.31.H53', 288);
INSERT INTO `edoc_attachment` VALUES (18061124, '000.00.13.H53', 'DanhMucVaMaDinhDanhKetNoiCacHeThongQlvbdhCap4.xlsx', '2020-08-31 00:28:20', '000.00.13.H53\\2020\\8\\31\\11291_2', 'application/xlsx', 20394, '000.00.01.H53#000.20.31.H53', 288);
INSERT INTO `edoc_attachment` VALUES (18061125, '000.00.13.H53', 'DanhMucVaMaDinhDanhKetNoiCacHeThongQlvbdhCap4 (1).xlsx', '2020-08-31 00:31:16', '000.00.13.H53\\2020\\8\\31\\11292_1', 'application/xlsx', 1583566, '000.00.01.H53', 289);
INSERT INTO `edoc_attachment` VALUES (18061126, '000.00.13.H53', 'DanhMucVaMaDinhDanhKetNoiCacHeThongQlvbdhCap4.xlsx', '2020-08-31 00:31:16', '000.00.13.H53\\2020\\8\\31\\11293_2', 'application/xlsx', 20394, '000.00.01.H53', 289);
INSERT INTO `edoc_attachment` VALUES (18061127, '000.00.13.H53', 'ioc_danhsachchucvu.xlsx', '2020-09-02 17:21:41', '000.00.13.H53\\2020\\9\\2\\11294_1', 'application/xlsx', 8429, '000.02.01.H53', 290);
INSERT INTO `edoc_attachment` VALUES (18061128, '000.00.13.H53', 'ioc_danhsachnhansu.xlsx', '2020-09-02 17:21:41', '000.00.13.H53\\2020\\9\\2\\11295_2', 'application/xlsx', 596032, '000.02.01.H53', 290);
INSERT INTO `edoc_attachment` VALUES (18061129, '000.00.12.H53', '9.Gioi-thieu-CQ_T-LGSP.pdf', '2020-09-04 14:41:27', '000.00.12.H53/2020/9/4/11296_1', 'application/pdf', 4703883, '000.00.13.H53', 291);
INSERT INTO `edoc_attachment` VALUES (18061130, '000.00.12.H53', '[DMDC] Danh m???c d??ng chung.docx', '2020-09-04 14:41:27', '000.00.12.H53/2020/9/4/11297_2', 'application/docx', 3373683, '000.00.13.H53', 291);
INSERT INTO `edoc_attachment` VALUES (18061131, '000.00.13.H53', 'QungCV.xlsx', '2020-09-04 14:47:41', '000.00.13.H53/2020/9/4/11298_1', 'application/xlsx', 70374, '000.00.12.H53', 292);
INSERT INTO `edoc_attachment` VALUES (18061132, '000.00.13.H53', '[SYT QN] S??? Y T??? QN.xlsx', '2020-09-04 14:47:41', '000.00.13.H53/2020/9/4/11299_2', 'application/xlsx', 127185, '000.00.12.H53', 292);
INSERT INTO `edoc_attachment` VALUES (18061133, '000.00.13.H53', '[SGDQN] S??? GD QN.xlsx', '2020-09-04 14:47:41', '000.00.13.H53/2020/9/4/11300_3', 'application/xlsx', 69852, '000.00.12.H53', 292);
INSERT INTO `edoc_attachment` VALUES (18061134, '000.00.13.H53', '??i???u ch???nh web.docx', '2020-09-04 14:47:41', '000.00.13.H53/2020/9/4/11301_4', 'application/docx', 1860999, '000.00.12.H53', 292);
INSERT INTO `edoc_attachment` VALUES (18061135, '000.00.13.H53', '1.BoTTTT-GioiThieu NGSP.pdf', '2020-09-04 14:52:27', '000.00.13.H53/2020/9/4/11302_1', 'application/pdf', 2371797, '000.00.13.H53', 293);
INSERT INTO `edoc_attachment` VALUES (18061136, '000.00.13.H53', '587_Phuluc.pdf', '2020-09-04 14:52:27', '000.00.13.H53/2020/9/4/11303_2', 'application/pdf', 294318, '000.00.13.H53', 293);
INSERT INTO `edoc_attachment` VALUES (18061137, '000.00.13.H53', 'Authorization_T??i_li???u_ph??t_tri???n_CommonFlows_v1.1_Final.pdf', '2020-09-05 12:40:12', '000.00.13.H53/2020/9/5/11304_1', 'application/pdf', 790503, '000.00.13.H53', 294);
INSERT INTO `edoc_attachment` VALUES (18061138, '000.00.13.H53', 'Authorization_T??i_li???u_ph??t_tri???n_CommonFlows_v1.1_Final.docx', '2020-09-05 12:40:12', '000.00.13.H53/2020/9/5/11305_2', 'application/docx', 644470, '000.00.13.H53', 294);
INSERT INTO `edoc_attachment` VALUES (18061139, '000.00.12.H53', 'Authorization_T??i_li???u_ph??t_tri???n_CommonFlows_v1.1_Final.pdf', '2020-09-05 12:42:00', '000.00.12.H53/2020/9/5/11306_1', 'application/pdf', 790503, '000.00.13.H53', 295);
INSERT INTO `edoc_attachment` VALUES (18061140, '000.00.12.H53', 'Authorization_T??i_li???u_ph??t_tri???n_CommonFlows_v1.1_Final.docx', '2020-09-05 12:42:00', '000.00.12.H53/2020/9/5/11307_2', 'application/docx', 644470, '000.00.13.H53', 295);

-- ----------------------------
-- Table structure for edoc_dailycounter
-- ----------------------------
DROP TABLE IF EXISTS `edoc_dailycounter`;
CREATE TABLE `edoc_dailycounter`  (
  `dailyCounterId` bigint(20) NOT NULL AUTO_INCREMENT,
  `organDomain` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dateTime` datetime(0) NULL DEFAULT NULL,
  `sent` bigint(20) NULL DEFAULT NULL,
  `received` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`dailyCounterId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 712 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_dailycounter
-- ----------------------------
INSERT INTO `edoc_dailycounter` VALUES (7, '000.20.31.H53', '2020-08-31 22:28:02', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (8, '000.00.13.H53', '2020-08-31 22:28:02', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (9, '000.00.01.H53', '2020-08-31 22:28:02', 2, 1);
INSERT INTO `edoc_dailycounter` VALUES (10, '000.20.31.H53', '2020-08-31 22:32:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (11, '000.00.13.H53', '2020-08-31 22:32:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (12, '000.00.01.H53', '2020-08-31 22:32:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (13, '000.20.31.H53', '2020-08-31 22:34:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (14, '000.00.13.H53', '2020-08-31 22:34:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (15, '000.00.01.H53', '2020-08-31 22:34:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (16, '000.20.31.H53', '2020-08-31 22:38:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (17, '000.00.13.H53', '2020-08-31 22:38:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (18, '000.00.01.H53', '2020-08-31 22:38:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (19, '000.20.31.H53', '2020-08-31 22:40:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (20, '000.00.13.H53', '2020-08-31 22:40:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (21, '000.00.01.H53', '2020-08-31 22:40:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (22, '000.20.31.H53', '2020-08-31 22:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (23, '000.00.13.H53', '2020-08-31 22:42:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (24, '000.00.01.H53', '2020-08-31 22:42:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (25, '000.20.31.H53', '2020-08-31 22:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (26, '000.00.13.H53', '2020-08-31 22:44:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (27, '000.00.01.H53', '2020-08-31 22:44:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (28, '000.20.31.H53', '2020-08-31 22:46:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (29, '000.00.13.H53', '2020-08-31 22:46:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (30, '000.00.01.H53', '2020-08-31 22:46:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (31, '000.20.31.H53', '2020-08-31 22:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (32, '000.00.13.H53', '2020-08-31 22:48:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (33, '000.00.01.H53', '2020-08-31 22:48:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (34, '000.20.31.H53', '2020-08-31 22:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (35, '000.00.13.H53', '2020-08-31 22:50:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (36, '000.00.01.H53', '2020-08-31 22:50:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (37, '000.20.31.H53', '2020-08-31 22:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (38, '000.00.13.H53', '2020-08-31 22:52:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (39, '000.00.01.H53', '2020-08-31 22:52:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (40, '000.20.31.H53', '2020-08-31 22:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (41, '000.00.13.H53', '2020-08-31 22:54:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (42, '000.00.01.H53', '2020-08-31 22:54:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (43, '000.20.31.H53', '2020-08-31 22:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (44, '000.00.13.H53', '2020-08-31 22:56:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (45, '000.00.01.H53', '2020-08-31 22:56:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (46, '000.20.31.H53', '2020-08-31 22:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (47, '000.00.13.H53', '2020-08-31 22:58:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (48, '000.00.01.H53', '2020-08-31 22:58:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (49, '000.20.31.H53', '2020-08-31 23:00:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (50, '000.00.13.H53', '2020-08-31 23:00:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (51, '000.00.01.H53', '2020-08-31 23:00:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (52, '000.20.31.H53', '2020-08-31 23:02:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (53, '000.00.13.H53', '2020-08-31 23:02:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (54, '000.00.01.H53', '2020-08-31 23:02:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (55, '000.20.31.H53', '2020-08-31 23:04:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (56, '000.00.13.H53', '2020-08-31 23:04:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (57, '000.00.01.H53', '2020-08-31 23:04:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (58, '000.20.31.H53', '2020-08-31 23:06:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (59, '000.00.13.H53', '2020-08-31 23:06:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (60, '000.00.01.H53', '2020-08-31 23:06:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (61, '000.20.31.H53', '2020-08-31 23:08:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (62, '000.00.13.H53', '2020-08-31 23:08:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (63, '000.00.01.H53', '2020-08-31 23:08:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (64, '000.20.31.H53', '2020-08-31 23:10:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (65, '000.00.13.H53', '2020-08-31 23:10:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (66, '000.00.01.H53', '2020-08-31 23:10:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (67, '000.20.31.H53', '2020-08-31 23:12:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (68, '000.00.13.H53', '2020-08-31 23:12:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (69, '000.00.01.H53', '2020-08-31 23:12:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (70, '000.20.31.H53', '2020-08-31 23:14:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (71, '000.00.13.H53', '2020-08-31 23:14:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (72, '000.00.01.H53', '2020-08-31 23:14:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (73, '000.20.31.H53', '2020-08-31 23:18:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (74, '000.00.13.H53', '2020-08-31 23:18:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (75, '000.00.01.H53', '2020-08-31 23:18:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (76, '000.20.31.H53', '2020-08-31 23:20:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (77, '000.00.13.H53', '2020-08-31 23:20:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (78, '000.00.01.H53', '2020-08-31 23:20:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (79, '000.20.31.H53', '2020-08-31 23:22:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (80, '000.00.13.H53', '2020-08-31 23:22:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (81, '000.00.01.H53', '2020-08-31 23:22:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (82, '000.20.31.H53', '2020-08-31 23:24:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (83, '000.00.13.H53', '2020-08-31 23:24:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (84, '000.00.01.H53', '2020-08-31 23:24:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (85, '000.20.31.H53', '2020-08-31 23:26:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (86, '000.00.13.H53', '2020-08-31 23:26:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (87, '000.00.01.H53', '2020-08-31 23:26:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (88, '000.20.31.H53', '2020-08-31 23:28:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (89, '000.00.13.H53', '2020-08-31 23:28:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (90, '000.00.01.H53', '2020-08-31 23:28:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (91, '000.20.31.H53', '2020-08-31 23:30:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (92, '000.00.13.H53', '2020-08-31 23:30:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (93, '000.00.01.H53', '2020-08-31 23:30:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (94, '000.20.31.H53', '2020-08-31 23:32:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (95, '000.00.13.H53', '2020-08-31 23:32:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (96, '000.00.01.H53', '2020-08-31 23:32:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (97, '000.20.31.H53', '2020-08-31 23:34:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (98, '000.00.13.H53', '2020-08-31 23:34:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (99, '000.00.01.H53', '2020-08-31 23:34:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (100, '000.20.31.H53', '2020-08-31 23:36:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (101, '000.00.13.H53', '2020-08-31 23:36:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (102, '000.00.01.H53', '2020-08-31 23:36:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (103, '000.20.31.H53', '2020-08-31 23:40:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (104, '000.00.13.H53', '2020-08-31 23:40:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (105, '000.00.01.H53', '2020-08-31 23:40:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (106, '000.20.31.H53', '2020-08-31 23:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (107, '000.00.13.H53', '2020-08-31 23:42:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (108, '000.00.01.H53', '2020-08-31 23:42:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (109, '000.20.31.H53', '2020-08-31 23:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (110, '000.00.13.H53', '2020-08-31 23:44:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (111, '000.00.01.H53', '2020-08-31 23:44:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (112, '000.20.31.H53', '2020-08-31 23:46:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (113, '000.00.13.H53', '2020-08-31 23:46:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (114, '000.00.01.H53', '2020-08-31 23:46:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (115, '000.20.31.H53', '2020-08-31 23:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (116, '000.00.13.H53', '2020-08-31 23:48:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (117, '000.00.01.H53', '2020-08-31 23:48:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (118, '000.20.31.H53', '2020-08-31 23:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (119, '000.00.13.H53', '2020-08-31 23:50:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (120, '000.00.01.H53', '2020-08-31 23:50:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (121, '000.20.31.H53', '2020-08-31 23:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (122, '000.00.13.H53', '2020-08-31 23:52:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (123, '000.00.01.H53', '2020-08-31 23:52:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (124, '000.20.31.H53', '2020-08-31 23:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (125, '000.00.13.H53', '2020-08-31 23:54:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (126, '000.00.01.H53', '2020-08-31 23:54:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (127, '000.20.31.H53', '2020-08-31 23:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (128, '000.00.13.H53', '2020-08-31 23:56:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (129, '000.00.01.H53', '2020-08-31 23:56:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (130, '000.20.31.H53', '2020-08-31 23:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (131, '000.00.13.H53', '2020-08-31 23:58:00', 2, 0);
INSERT INTO `edoc_dailycounter` VALUES (132, '000.00.01.H53', '2020-08-31 23:58:00', 0, 2);
INSERT INTO `edoc_dailycounter` VALUES (133, '000.02.01.H53', '2020-09-02 17:22:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (134, '000.00.13.H53', '2020-09-02 17:22:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (135, '000.02.01.H53', '2020-09-02 17:24:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (136, '000.00.13.H53', '2020-09-02 17:24:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (137, '000.02.01.H53', '2020-09-02 17:26:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (138, '000.00.13.H53', '2020-09-02 17:26:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (139, '000.02.01.H53', '2020-09-02 17:28:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (140, '000.00.13.H53', '2020-09-02 17:28:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (141, '000.02.01.H53', '2020-09-02 17:30:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (142, '000.00.13.H53', '2020-09-02 17:30:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (143, '000.02.01.H53', '2020-09-02 17:32:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (144, '000.00.13.H53', '2020-09-02 17:32:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (145, '000.02.01.H53', '2020-09-02 17:34:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (146, '000.00.13.H53', '2020-09-02 17:34:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (147, '000.02.01.H53', '2020-09-02 17:36:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (148, '000.00.13.H53', '2020-09-02 17:36:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (149, '000.02.01.H53', '2020-09-02 17:38:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (150, '000.00.13.H53', '2020-09-02 17:38:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (151, '000.02.01.H53', '2020-09-02 17:40:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (152, '000.00.13.H53', '2020-09-02 17:40:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (153, '000.02.01.H53', '2020-09-02 17:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (154, '000.00.13.H53', '2020-09-02 17:42:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (155, '000.02.01.H53', '2020-09-02 17:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (156, '000.00.13.H53', '2020-09-02 17:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (157, '000.02.01.H53', '2020-09-02 17:46:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (158, '000.00.13.H53', '2020-09-02 17:46:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (159, '000.02.01.H53', '2020-09-02 17:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (160, '000.00.13.H53', '2020-09-02 17:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (161, '000.02.01.H53', '2020-09-02 17:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (162, '000.00.13.H53', '2020-09-02 17:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (163, '000.02.01.H53', '2020-09-02 17:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (164, '000.00.13.H53', '2020-09-02 17:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (165, '000.02.01.H53', '2020-09-02 17:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (166, '000.00.13.H53', '2020-09-02 17:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (167, '000.02.01.H53', '2020-09-02 17:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (168, '000.00.13.H53', '2020-09-02 17:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (169, '000.02.01.H53', '2020-09-02 17:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (170, '000.00.13.H53', '2020-09-02 17:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (171, '000.02.01.H53', '2020-09-02 18:00:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (172, '000.00.13.H53', '2020-09-02 18:00:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (173, '000.02.01.H53', '2020-09-02 18:02:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (174, '000.00.13.H53', '2020-09-02 18:02:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (175, '000.02.01.H53', '2020-09-02 18:04:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (176, '000.00.13.H53', '2020-09-02 18:04:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (177, '000.02.01.H53', '2020-09-02 18:06:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (178, '000.00.13.H53', '2020-09-02 18:06:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (179, '000.02.01.H53', '2020-09-02 18:08:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (180, '000.00.13.H53', '2020-09-02 18:08:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (181, '000.02.01.H53', '2020-09-02 18:10:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (182, '000.00.13.H53', '2020-09-02 18:10:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (183, '000.02.01.H53', '2020-09-02 18:12:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (184, '000.00.13.H53', '2020-09-02 18:12:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (185, '000.02.01.H53', '2020-09-02 18:14:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (186, '000.00.13.H53', '2020-09-02 18:14:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (187, '000.02.01.H53', '2020-09-02 18:16:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (188, '000.00.13.H53', '2020-09-02 18:16:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (189, '000.02.01.H53', '2020-09-02 18:18:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (190, '000.00.13.H53', '2020-09-02 18:18:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (191, '000.02.01.H53', '2020-09-02 18:20:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (192, '000.00.13.H53', '2020-09-02 18:20:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (193, '000.02.01.H53', '2020-09-02 18:22:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (194, '000.00.13.H53', '2020-09-02 18:22:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (195, '000.02.01.H53', '2020-09-02 18:24:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (196, '000.00.13.H53', '2020-09-02 18:24:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (197, '000.02.01.H53', '2020-09-02 18:26:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (198, '000.00.13.H53', '2020-09-02 18:26:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (199, '000.02.01.H53', '2020-09-02 18:28:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (200, '000.00.13.H53', '2020-09-02 18:28:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (201, '000.02.01.H53', '2020-09-02 18:30:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (202, '000.00.13.H53', '2020-09-02 18:30:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (203, '000.02.01.H53', '2020-09-02 18:32:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (204, '000.00.13.H53', '2020-09-02 18:32:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (205, '000.02.01.H53', '2020-09-02 18:34:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (206, '000.00.13.H53', '2020-09-02 18:34:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (207, '000.02.01.H53', '2020-09-02 18:36:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (208, '000.00.13.H53', '2020-09-02 18:36:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (209, '000.02.01.H53', '2020-09-02 18:38:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (210, '000.00.13.H53', '2020-09-02 18:38:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (211, '000.02.01.H53', '2020-09-02 18:40:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (212, '000.00.13.H53', '2020-09-02 18:40:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (213, '000.02.01.H53', '2020-09-02 18:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (214, '000.00.13.H53', '2020-09-02 18:42:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (215, '000.02.01.H53', '2020-09-02 18:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (216, '000.00.13.H53', '2020-09-02 18:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (217, '000.02.01.H53', '2020-09-02 18:46:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (218, '000.00.13.H53', '2020-09-02 18:46:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (219, '000.02.01.H53', '2020-09-02 18:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (220, '000.00.13.H53', '2020-09-02 18:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (221, '000.02.01.H53', '2020-09-02 18:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (222, '000.00.13.H53', '2020-09-02 18:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (223, '000.02.01.H53', '2020-09-02 18:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (224, '000.00.13.H53', '2020-09-02 18:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (225, '000.02.01.H53', '2020-09-02 18:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (226, '000.00.13.H53', '2020-09-02 18:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (227, '000.02.01.H53', '2020-09-02 18:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (228, '000.00.13.H53', '2020-09-02 18:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (229, '000.02.01.H53', '2020-09-02 18:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (230, '000.00.13.H53', '2020-09-02 18:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (231, '000.02.01.H53', '2020-09-02 19:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (232, '000.00.13.H53', '2020-09-02 19:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (233, '000.02.01.H53', '2020-09-02 19:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (234, '000.00.13.H53', '2020-09-02 19:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (235, '000.02.01.H53', '2020-09-02 19:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (236, '000.00.13.H53', '2020-09-02 19:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (237, '000.02.01.H53', '2020-09-02 19:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (238, '000.00.13.H53', '2020-09-02 19:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (239, '000.02.01.H53', '2020-09-02 19:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (240, '000.00.13.H53', '2020-09-02 19:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (241, '000.02.01.H53', '2020-09-02 19:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (242, '000.00.13.H53', '2020-09-02 19:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (243, '000.02.01.H53', '2020-09-02 20:00:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (244, '000.00.13.H53', '2020-09-02 20:00:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (245, '000.02.01.H53', '2020-09-02 20:02:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (246, '000.00.13.H53', '2020-09-02 20:02:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (247, '000.02.01.H53', '2020-09-02 20:04:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (248, '000.00.13.H53', '2020-09-02 20:04:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (249, '000.02.01.H53', '2020-09-02 20:06:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (250, '000.00.13.H53', '2020-09-02 20:06:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (251, '000.02.01.H53', '2020-09-02 20:08:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (252, '000.00.13.H53', '2020-09-02 20:08:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (253, '000.02.01.H53', '2020-09-02 20:10:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (254, '000.00.13.H53', '2020-09-02 20:10:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (255, '000.02.01.H53', '2020-09-02 20:12:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (256, '000.00.13.H53', '2020-09-02 20:12:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (257, '000.02.01.H53', '2020-09-02 20:14:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (258, '000.00.13.H53', '2020-09-02 20:14:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (259, '000.02.01.H53', '2020-09-02 20:16:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (260, '000.00.13.H53', '2020-09-02 20:16:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (261, '000.02.01.H53', '2020-09-02 20:18:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (262, '000.00.13.H53', '2020-09-02 20:18:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (263, '000.02.01.H53', '2020-09-02 20:20:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (264, '000.00.13.H53', '2020-09-02 20:20:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (265, '000.02.01.H53', '2020-09-02 20:22:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (266, '000.00.13.H53', '2020-09-02 20:22:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (267, '000.02.01.H53', '2020-09-02 20:24:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (268, '000.00.13.H53', '2020-09-02 20:24:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (269, '000.02.01.H53', '2020-09-02 20:26:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (270, '000.00.13.H53', '2020-09-02 20:26:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (271, '000.02.01.H53', '2020-09-02 20:28:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (272, '000.00.13.H53', '2020-09-02 20:28:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (273, '000.02.01.H53', '2020-09-02 20:30:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (274, '000.00.13.H53', '2020-09-02 20:30:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (275, '000.02.01.H53', '2020-09-02 20:32:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (276, '000.00.13.H53', '2020-09-02 20:32:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (277, '000.02.01.H53', '2020-09-02 20:34:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (278, '000.00.13.H53', '2020-09-02 20:34:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (279, '000.02.01.H53', '2020-09-02 20:36:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (280, '000.00.13.H53', '2020-09-02 20:36:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (281, '000.02.01.H53', '2020-09-02 20:38:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (282, '000.00.13.H53', '2020-09-02 20:38:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (283, '000.02.01.H53', '2020-09-02 20:40:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (284, '000.00.13.H53', '2020-09-02 20:40:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (285, '000.02.01.H53', '2020-09-02 20:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (286, '000.00.13.H53', '2020-09-02 20:42:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (287, '000.02.01.H53', '2020-09-02 20:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (288, '000.00.13.H53', '2020-09-02 20:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (289, '000.02.01.H53', '2020-09-02 20:46:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (290, '000.00.13.H53', '2020-09-02 20:46:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (291, '000.02.01.H53', '2020-09-02 20:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (292, '000.00.13.H53', '2020-09-02 20:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (293, '000.02.01.H53', '2020-09-02 20:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (294, '000.00.13.H53', '2020-09-02 20:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (295, '000.02.01.H53', '2020-09-02 20:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (296, '000.00.13.H53', '2020-09-02 20:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (297, '000.02.01.H53', '2020-09-02 20:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (298, '000.00.13.H53', '2020-09-02 20:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (299, '000.02.01.H53', '2020-09-02 20:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (300, '000.00.13.H53', '2020-09-02 20:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (301, '000.02.01.H53', '2020-09-02 20:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (302, '000.00.13.H53', '2020-09-02 20:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (303, '000.02.01.H53', '2020-09-02 21:00:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (304, '000.00.13.H53', '2020-09-02 21:00:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (305, '000.02.01.H53', '2020-09-02 21:02:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (306, '000.00.13.H53', '2020-09-02 21:02:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (307, '000.02.01.H53', '2020-09-02 21:04:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (308, '000.00.13.H53', '2020-09-02 21:04:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (309, '000.02.01.H53', '2020-09-02 21:06:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (310, '000.00.13.H53', '2020-09-02 21:06:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (311, '000.02.01.H53', '2020-09-02 21:08:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (312, '000.00.13.H53', '2020-09-02 21:08:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (313, '000.02.01.H53', '2020-09-02 21:10:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (314, '000.00.13.H53', '2020-09-02 21:10:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (315, '000.02.01.H53', '2020-09-02 21:12:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (316, '000.00.13.H53', '2020-09-02 21:12:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (317, '000.02.01.H53', '2020-09-02 21:16:05', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (318, '000.00.13.H53', '2020-09-02 21:16:05', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (319, '000.00.13.H53', '2020-08-02 21:16:05', 100, 100);
INSERT INTO `edoc_dailycounter` VALUES (320, '000.02.01.H53', '2020-08-02 21:16:05', 110, 110);
INSERT INTO `edoc_dailycounter` VALUES (321, '000.02.01.H53', '2020-09-02 21:20:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (322, '000.00.13.H53', '2020-09-02 21:20:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (323, '000.20.31.H53', '2020-08-02 21:16:05', 200, 200);
INSERT INTO `edoc_dailycounter` VALUES (324, '000.21.31.H53', '2020-08-31 21:16:05', 300, 300);
INSERT INTO `edoc_dailycounter` VALUES (325, '000.02.01.H53', '2020-09-02 21:22:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (326, '000.00.13.H53', '2020-09-02 21:22:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (327, '000.02.01.H53', '2020-09-02 21:24:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (328, '000.00.13.H53', '2020-09-02 21:24:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (329, '000.02.01.H53', '2020-09-02 21:26:39', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (330, '000.00.13.H53', '2020-09-02 21:26:39', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (331, '000.12.31.H53', '2020-07-01 21:27:06', 200, 300);
INSERT INTO `edoc_dailycounter` VALUES (332, '000.20.31.H53', '2020-07-03 21:27:06', 113, 112);
INSERT INTO `edoc_dailycounter` VALUES (333, '000.02.01.H53', '2020-09-02 21:30:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (334, '000.00.13.H53', '2020-09-02 21:30:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (335, '000.02.01.H53', '2020-09-02 21:32:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (336, '000.00.13.H53', '2020-09-02 21:32:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (337, '000.02.01.H53', '2020-09-02 21:34:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (338, '000.00.13.H53', '2020-09-02 21:34:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (339, '000.02.01.H53', '2020-09-02 21:36:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (340, '000.00.13.H53', '2020-09-02 21:36:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (341, '000.02.01.H53', '2020-09-02 21:38:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (342, '000.00.13.H53', '2020-09-02 21:38:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (343, '000.02.01.H53', '2020-09-02 21:40:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (344, '000.00.13.H53', '2020-09-02 21:40:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (345, '000.02.01.H53', '2020-09-02 21:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (346, '000.00.13.H53', '2020-09-02 21:42:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (347, '000.02.01.H53', '2020-09-02 21:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (348, '000.00.13.H53', '2020-09-02 21:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (349, '000.02.01.H53', '2020-09-02 21:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (350, '000.00.13.H53', '2020-09-02 21:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (351, '000.02.01.H53', '2020-09-02 21:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (352, '000.00.13.H53', '2020-09-02 21:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (353, '000.02.01.H53', '2020-09-02 21:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (354, '000.00.13.H53', '2020-09-02 21:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (355, '000.02.01.H53', '2020-09-02 21:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (356, '000.00.13.H53', '2020-09-02 21:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (357, '000.02.01.H53', '2020-09-02 21:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (358, '000.00.13.H53', '2020-09-02 21:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (359, '000.02.01.H53', '2020-09-02 21:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (360, '000.00.13.H53', '2020-09-02 21:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (361, '000.02.01.H53', '2020-09-02 22:00:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (362, '000.00.13.H53', '2020-09-02 22:00:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (363, '000.02.01.H53', '2020-09-02 22:02:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (364, '000.00.13.H53', '2020-09-02 22:02:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (365, '000.02.01.H53', '2020-09-02 22:04:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (366, '000.00.13.H53', '2020-09-02 22:04:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (367, '000.02.01.H53', '2020-09-02 22:06:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (368, '000.00.13.H53', '2020-09-02 22:06:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (369, '000.02.01.H53', '2020-09-02 22:08:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (370, '000.00.13.H53', '2020-09-02 22:08:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (371, '000.02.01.H53', '2020-09-02 22:10:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (372, '000.00.13.H53', '2020-09-02 22:10:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (373, '000.02.01.H53', '2020-09-02 22:12:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (374, '000.00.13.H53', '2020-09-02 22:12:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (375, '000.02.01.H53', '2020-09-02 22:14:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (376, '000.00.13.H53', '2020-09-02 22:14:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (377, '000.02.01.H53', '2020-09-02 22:16:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (378, '000.00.13.H53', '2020-09-02 22:16:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (379, '000.02.01.H53', '2020-09-02 22:18:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (380, '000.00.13.H53', '2020-09-02 22:18:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (381, '000.02.01.H53', '2020-09-02 22:20:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (382, '000.00.13.H53', '2020-09-02 22:20:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (383, '000.02.01.H53', '2020-09-02 22:22:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (384, '000.00.13.H53', '2020-09-02 22:22:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (385, '000.02.01.H53', '2020-09-02 22:24:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (386, '000.00.13.H53', '2020-09-02 22:24:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (387, '000.02.01.H53', '2020-09-02 22:26:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (388, '000.00.13.H53', '2020-09-02 22:26:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (389, '000.02.01.H53', '2020-09-02 22:28:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (390, '000.00.13.H53', '2020-09-02 22:28:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (391, '000.02.01.H53', '2020-09-02 22:30:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (392, '000.00.13.H53', '2020-09-02 22:30:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (393, '000.02.01.H53', '2020-09-02 22:32:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (394, '000.00.13.H53', '2020-09-02 22:32:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (395, '000.02.01.H53', '2020-09-02 22:34:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (396, '000.00.13.H53', '2020-09-02 22:34:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (397, '000.02.01.H53', '2020-09-02 22:36:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (398, '000.00.13.H53', '2020-09-02 22:36:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (399, '000.02.01.H53', '2020-09-02 22:38:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (400, '000.00.13.H53', '2020-09-02 22:38:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (401, '000.02.01.H53', '2020-09-02 22:40:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (402, '000.00.13.H53', '2020-09-02 22:40:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (403, '000.02.01.H53', '2020-09-02 22:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (404, '000.00.13.H53', '2020-09-02 22:42:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (405, '000.02.01.H53', '2020-09-02 22:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (406, '000.00.13.H53', '2020-09-02 22:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (407, '000.02.01.H53', '2020-09-02 22:46:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (408, '000.00.13.H53', '2020-09-02 22:46:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (409, '000.02.01.H53', '2020-09-02 22:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (410, '000.00.13.H53', '2020-09-02 22:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (411, '000.02.01.H53', '2020-09-02 22:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (412, '000.00.13.H53', '2020-09-02 22:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (413, '000.02.01.H53', '2020-09-02 22:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (414, '000.00.13.H53', '2020-09-02 22:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (415, '000.02.01.H53', '2020-09-02 22:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (416, '000.00.13.H53', '2020-09-02 22:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (417, '000.02.01.H53', '2020-09-02 22:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (418, '000.00.13.H53', '2020-09-02 22:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (419, '000.02.01.H53', '2020-09-02 22:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (420, '000.00.13.H53', '2020-09-02 22:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (421, '000.02.01.H53', '2020-09-02 23:00:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (422, '000.00.13.H53', '2020-09-02 23:00:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (423, '000.02.01.H53', '2020-09-02 23:02:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (424, '000.00.13.H53', '2020-09-02 23:02:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (425, '000.02.01.H53', '2020-09-02 23:04:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (426, '000.00.13.H53', '2020-09-02 23:04:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (427, '000.02.01.H53', '2020-09-02 23:08:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (428, '000.00.13.H53', '2020-09-02 23:08:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (429, '000.02.01.H53', '2020-09-02 23:10:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (430, '000.00.13.H53', '2020-09-02 23:10:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (431, '000.02.01.H53', '2020-09-02 23:12:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (432, '000.00.13.H53', '2020-09-02 23:12:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (433, '000.02.01.H53', '2020-09-02 23:14:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (434, '000.00.13.H53', '2020-09-02 23:14:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (435, '000.02.01.H53', '2020-09-02 23:16:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (436, '000.00.13.H53', '2020-09-02 23:16:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (437, '000.02.01.H53', '2020-09-02 23:18:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (438, '000.00.13.H53', '2020-09-02 23:18:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (439, '000.02.01.H53', '2020-09-02 23:20:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (440, '000.00.13.H53', '2020-09-02 23:20:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (441, '000.02.01.H53', '2020-09-02 23:22:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (442, '000.00.13.H53', '2020-09-02 23:22:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (443, '000.02.01.H53', '2020-09-02 23:24:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (444, '000.00.13.H53', '2020-09-02 23:24:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (445, '000.02.01.H53', '2020-09-02 23:26:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (446, '000.00.13.H53', '2020-09-02 23:26:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (447, '000.02.01.H53', '2020-09-02 23:28:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (448, '000.00.13.H53', '2020-09-02 23:28:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (449, '000.02.01.H53', '2020-09-02 23:30:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (450, '000.00.13.H53', '2020-09-02 23:30:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (451, '000.02.01.H53', '2020-09-02 23:32:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (452, '000.00.13.H53', '2020-09-02 23:32:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (453, '000.02.01.H53', '2020-09-02 23:34:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (454, '000.00.13.H53', '2020-09-02 23:34:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (455, '000.02.01.H53', '2020-09-02 23:36:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (456, '000.00.13.H53', '2020-09-02 23:36:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (457, '000.02.01.H53', '2020-09-02 23:38:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (458, '000.00.13.H53', '2020-09-02 23:38:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (459, '000.02.01.H53', '2020-09-02 23:40:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (460, '000.00.13.H53', '2020-09-02 23:40:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (461, '000.02.01.H53', '2020-09-02 23:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (462, '000.00.13.H53', '2020-09-02 23:42:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (463, '000.02.01.H53', '2020-09-02 23:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (464, '000.00.13.H53', '2020-09-02 23:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (465, '000.02.01.H53', '2020-09-02 23:46:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (466, '000.00.13.H53', '2020-09-02 23:46:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (467, '000.02.01.H53', '2020-09-02 23:48:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (468, '000.00.13.H53', '2020-09-02 23:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (469, '000.02.01.H53', '2020-09-02 23:50:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (470, '000.00.13.H53', '2020-09-02 23:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (471, '000.02.01.H53', '2020-09-02 23:52:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (472, '000.00.13.H53', '2020-09-02 23:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (473, '000.02.01.H53', '2020-09-02 23:54:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (474, '000.00.13.H53', '2020-09-02 23:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (475, '000.02.01.H53', '2020-09-02 23:56:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (476, '000.00.13.H53', '2020-09-02 23:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (477, '000.02.01.H53', '2020-09-02 23:58:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (478, '000.00.13.H53', '2020-09-02 23:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (479, '000.00.13.H53', '2020-09-04 14:42:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (480, '000.00.12.H53', '2020-09-04 14:42:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (481, '000.00.13.H53', '2020-09-04 14:44:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (482, '000.00.12.H53', '2020-09-04 14:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (483, '000.00.13.H53', '2020-09-04 14:46:00', 0, 1);
INSERT INTO `edoc_dailycounter` VALUES (484, '000.00.12.H53', '2020-09-04 14:46:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (485, '000.00.13.H53', '2020-09-04 14:48:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (486, '000.00.12.H53', '2020-09-04 14:48:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (487, '000.00.13.H53', '2020-09-04 14:50:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (488, '000.00.12.H53', '2020-09-04 14:50:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (489, '000.00.13.H53', '2020-09-04 14:52:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (490, '000.00.12.H53', '2020-09-04 14:52:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (491, '000.00.13.H53', '2020-09-04 14:54:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (492, '000.00.12.H53', '2020-09-04 14:54:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (493, '000.00.13.H53', '2020-09-04 14:56:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (494, '000.00.12.H53', '2020-09-04 14:56:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (495, '000.00.13.H53', '2020-09-04 14:58:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (496, '000.00.12.H53', '2020-09-04 14:58:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (497, '000.00.13.H53', '2020-09-04 15:00:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (498, '000.00.12.H53', '2020-09-04 15:00:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (499, '000.00.13.H53', '2020-09-04 15:02:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (500, '000.00.12.H53', '2020-09-04 15:02:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (501, '000.00.13.H53', '2020-09-04 15:04:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (502, '000.00.12.H53', '2020-09-04 15:04:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (503, '000.00.13.H53', '2020-09-04 15:06:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (504, '000.00.12.H53', '2020-09-04 15:06:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (505, '000.00.13.H53', '2020-09-04 15:08:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (506, '000.00.12.H53', '2020-09-04 15:08:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (507, '000.00.13.H53', '2020-09-04 15:10:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (508, '000.00.12.H53', '2020-09-04 15:10:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (509, '000.00.13.H53', '2020-09-04 15:12:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (510, '000.00.12.H53', '2020-09-04 15:12:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (511, '000.00.13.H53', '2020-09-04 15:14:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (512, '000.00.12.H53', '2020-09-04 15:14:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (513, '000.00.13.H53', '2020-09-04 15:16:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (514, '000.00.12.H53', '2020-09-04 15:16:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (515, '000.00.13.H53', '2020-09-04 15:18:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (516, '000.00.12.H53', '2020-09-04 15:18:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (517, '000.00.13.H53', '2020-09-04 15:20:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (518, '000.00.12.H53', '2020-09-04 15:20:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (519, '000.00.13.H53', '2020-09-04 15:22:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (520, '000.00.12.H53', '2020-09-04 15:22:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (521, '000.00.13.H53', '2020-09-04 15:24:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (522, '000.00.12.H53', '2020-09-04 15:24:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (523, '000.00.13.H53', '2020-09-04 15:26:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (524, '000.00.12.H53', '2020-09-04 15:26:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (525, '000.00.13.H53', '2020-09-04 15:28:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (526, '000.00.12.H53', '2020-09-04 15:28:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (527, '000.00.13.H53', '2020-09-04 15:30:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (528, '000.00.12.H53', '2020-09-04 15:30:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (529, '000.00.13.H53', '2020-09-04 15:32:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (530, '000.00.12.H53', '2020-09-04 15:32:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (531, '000.00.13.H53', '2020-09-04 15:34:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (532, '000.00.12.H53', '2020-09-04 15:34:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (533, '000.00.13.H53', '2020-09-04 15:36:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (534, '000.00.12.H53', '2020-09-04 15:36:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (535, '000.00.13.H53', '2020-09-04 15:38:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (536, '000.00.12.H53', '2020-09-04 15:38:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (537, '000.00.13.H53', '2020-09-04 15:40:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (538, '000.00.12.H53', '2020-09-04 15:40:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (539, '000.00.13.H53', '2020-09-04 15:42:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (540, '000.00.12.H53', '2020-09-04 15:42:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (541, '000.00.13.H53', '2020-09-04 15:44:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (542, '000.00.12.H53', '2020-09-04 15:44:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (543, '000.00.13.H53', '2020-09-04 15:46:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (544, '000.00.12.H53', '2020-09-04 15:46:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (545, '000.00.13.H53', '2020-09-04 15:48:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (546, '000.00.12.H53', '2020-09-04 15:48:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (547, '000.00.13.H53', '2020-09-04 15:50:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (548, '000.00.12.H53', '2020-09-04 15:50:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (549, '000.00.13.H53', '2020-09-04 15:52:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (550, '000.00.12.H53', '2020-09-04 15:52:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (551, '000.00.13.H53', '2020-09-04 15:54:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (552, '000.00.12.H53', '2020-09-04 15:54:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (553, '000.00.13.H53', '2020-09-04 15:56:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (554, '000.00.12.H53', '2020-09-04 15:56:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (555, '000.00.13.H53', '2020-09-04 15:58:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (556, '000.00.12.H53', '2020-09-04 15:58:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (557, '000.00.13.H53', '2020-09-04 16:00:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (558, '000.00.12.H53', '2020-09-04 16:00:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (559, '000.00.13.H53', '2020-09-04 16:02:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (560, '000.00.12.H53', '2020-09-04 16:02:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (561, '000.00.13.H53', '2020-09-04 16:04:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (562, '000.00.12.H53', '2020-09-04 16:04:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (563, '000.00.13.H53', '2020-09-04 16:06:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (564, '000.00.12.H53', '2020-09-04 16:06:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (565, '000.00.13.H53', '2020-09-04 16:08:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (566, '000.00.12.H53', '2020-09-04 16:08:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (567, '000.00.13.H53', '2020-09-04 16:10:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (568, '000.00.12.H53', '2020-09-04 16:10:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (569, '000.00.13.H53', '2020-09-04 16:12:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (570, '000.00.12.H53', '2020-09-04 16:12:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (571, '000.00.13.H53', '2020-09-04 16:14:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (572, '000.00.12.H53', '2020-09-04 16:14:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (573, '000.00.13.H53', '2020-09-04 16:16:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (574, '000.00.12.H53', '2020-09-04 16:16:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (575, '000.00.13.H53', '2020-09-04 16:18:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (576, '000.00.12.H53', '2020-09-04 16:18:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (577, '000.00.13.H53', '2020-09-04 16:20:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (578, '000.00.12.H53', '2020-09-04 16:20:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (579, '000.00.13.H53', '2020-09-04 16:22:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (580, '000.00.12.H53', '2020-09-04 16:22:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (581, '000.00.13.H53', '2020-09-04 16:24:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (582, '000.00.12.H53', '2020-09-04 16:24:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (583, '000.00.13.H53', '2020-09-04 16:26:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (584, '000.00.12.H53', '2020-09-04 16:26:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (585, '000.00.13.H53', '2020-09-04 16:28:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (586, '000.00.12.H53', '2020-09-04 16:28:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (587, '000.00.13.H53', '2020-09-04 16:30:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (588, '000.00.12.H53', '2020-09-04 16:30:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (589, '000.00.13.H53', '2020-09-04 16:32:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (590, '000.00.12.H53', '2020-09-04 16:32:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (591, '000.00.13.H53', '2020-09-04 16:34:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (592, '000.00.12.H53', '2020-09-04 16:34:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (593, '000.00.13.H53', '2020-09-04 16:36:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (594, '000.00.12.H53', '2020-09-04 16:36:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (595, '000.00.13.H53', '2020-09-04 16:38:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (596, '000.00.12.H53', '2020-09-04 16:38:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (597, '000.00.13.H53', '2020-09-04 16:40:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (598, '000.00.12.H53', '2020-09-04 16:40:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (599, '000.00.13.H53', '2020-09-04 16:42:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (600, '000.00.12.H53', '2020-09-04 16:42:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (601, '000.00.13.H53', '2020-09-04 16:44:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (602, '000.00.12.H53', '2020-09-04 16:44:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (603, '000.00.13.H53', '2020-09-04 16:46:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (604, '000.00.12.H53', '2020-09-04 16:46:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (605, '000.00.13.H53', '2020-09-04 16:48:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (606, '000.00.12.H53', '2020-09-04 16:48:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (607, '000.00.13.H53', '2020-09-04 16:50:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (608, '000.00.12.H53', '2020-09-04 16:50:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (609, '000.00.13.H53', '2020-09-04 16:52:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (610, '000.00.12.H53', '2020-09-04 16:52:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (611, '000.00.13.H53', '2020-09-04 16:54:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (612, '000.00.12.H53', '2020-09-04 16:54:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (613, '000.00.13.H53', '2020-09-04 16:56:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (614, '000.00.12.H53', '2020-09-04 16:56:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (615, '000.00.13.H53', '2020-09-04 16:58:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (616, '000.00.12.H53', '2020-09-04 16:58:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (617, '000.00.13.H53', '2020-09-04 17:00:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (618, '000.00.12.H53', '2020-09-04 17:00:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (619, '000.00.13.H53', '2020-09-04 17:02:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (620, '000.00.12.H53', '2020-09-04 17:02:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (621, '000.00.13.H53', '2020-09-04 17:04:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (622, '000.00.12.H53', '2020-09-04 17:04:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (623, '000.00.13.H53', '2020-09-04 17:06:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (624, '000.00.12.H53', '2020-09-04 17:06:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (625, '000.00.13.H53', '2020-09-04 17:08:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (626, '000.00.12.H53', '2020-09-04 17:08:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (627, '000.00.13.H53', '2020-09-04 17:10:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (628, '000.00.12.H53', '2020-09-04 17:10:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (629, '000.00.13.H53', '2020-09-04 17:12:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (630, '000.00.12.H53', '2020-09-04 17:12:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (631, '000.00.13.H53', '2020-09-04 17:14:00', 2, 2);
INSERT INTO `edoc_dailycounter` VALUES (632, '000.00.12.H53', '2020-09-04 17:14:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (633, '000.00.13.H53', '2020-09-05 12:42:00', 1, 1);
INSERT INTO `edoc_dailycounter` VALUES (634, '000.00.13.H53', '2020-09-05 12:44:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (635, '000.00.12.H53', '2020-09-05 12:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (636, '000.00.13.H53', '2020-09-05 12:46:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (637, '000.00.12.H53', '2020-09-05 12:46:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (638, '000.00.13.H53', '2020-09-05 12:48:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (639, '000.00.12.H53', '2020-09-05 12:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (640, '000.00.13.H53', '2020-09-05 12:50:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (641, '000.00.12.H53', '2020-09-05 12:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (642, '000.00.13.H53', '2020-09-05 12:52:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (643, '000.00.12.H53', '2020-09-05 12:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (644, '000.00.13.H53', '2020-09-05 12:54:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (645, '000.00.12.H53', '2020-09-05 12:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (646, '000.00.13.H53', '2020-09-05 12:56:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (647, '000.00.12.H53', '2020-09-05 12:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (648, '000.00.13.H53', '2020-09-05 12:58:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (649, '000.00.12.H53', '2020-09-05 12:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (650, '000.00.13.H53', '2020-09-05 13:00:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (651, '000.00.12.H53', '2020-09-05 13:00:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (652, '000.00.13.H53', '2020-09-05 13:02:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (653, '000.00.12.H53', '2020-09-05 13:02:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (654, '000.00.13.H53', '2020-09-05 13:04:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (655, '000.00.12.H53', '2020-09-05 13:04:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (656, '000.00.13.H53', '2020-09-05 13:06:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (657, '000.00.12.H53', '2020-09-05 13:06:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (658, '000.00.13.H53', '2020-09-05 13:08:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (659, '000.00.12.H53', '2020-09-05 13:08:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (660, '000.00.13.H53', '2020-09-05 13:10:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (661, '000.00.12.H53', '2020-09-05 13:10:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (662, '000.00.13.H53', '2020-09-05 13:12:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (663, '000.00.12.H53', '2020-09-05 13:12:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (664, '000.00.13.H53', '2020-09-05 13:14:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (665, '000.00.12.H53', '2020-09-05 13:14:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (666, '000.00.13.H53', '2020-09-05 13:16:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (667, '000.00.12.H53', '2020-09-05 13:16:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (668, '000.00.13.H53', '2020-09-05 13:18:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (669, '000.00.12.H53', '2020-09-05 13:18:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (670, '000.00.13.H53', '2020-09-05 13:20:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (671, '000.00.12.H53', '2020-09-05 13:20:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (672, '000.00.13.H53', '2020-09-05 13:22:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (673, '000.00.12.H53', '2020-09-05 13:22:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (674, '000.00.13.H53', '2020-09-05 13:24:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (675, '000.00.12.H53', '2020-09-05 13:24:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (676, '000.00.13.H53', '2020-09-05 13:26:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (677, '000.00.12.H53', '2020-09-05 13:26:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (678, '000.00.13.H53', '2020-09-05 13:28:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (679, '000.00.12.H53', '2020-09-05 13:28:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (680, '000.00.13.H53', '2020-09-05 13:30:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (681, '000.00.12.H53', '2020-09-05 13:30:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (682, '000.00.13.H53', '2020-09-05 13:32:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (683, '000.00.12.H53', '2020-09-05 13:32:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (684, '000.00.13.H53', '2020-09-05 13:34:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (685, '000.00.12.H53', '2020-09-05 13:34:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (686, '000.00.13.H53', '2020-09-05 13:36:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (687, '000.00.12.H53', '2020-09-05 13:36:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (688, '000.00.13.H53', '2020-09-05 13:38:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (689, '000.00.12.H53', '2020-09-05 13:38:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (690, '000.00.13.H53', '2020-09-05 13:40:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (691, '000.00.12.H53', '2020-09-05 13:40:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (692, '000.00.13.H53', '2020-09-05 13:42:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (693, '000.00.12.H53', '2020-09-05 13:42:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (694, '000.00.13.H53', '2020-09-05 13:44:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (695, '000.00.12.H53', '2020-09-05 13:44:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (696, '000.00.13.H53', '2020-09-05 13:46:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (697, '000.00.12.H53', '2020-09-05 13:46:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (698, '000.00.13.H53', '2020-09-05 13:48:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (699, '000.00.12.H53', '2020-09-05 13:48:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (700, '000.00.13.H53', '2020-09-05 13:50:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (701, '000.00.12.H53', '2020-09-05 13:50:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (702, '000.00.13.H53', '2020-09-05 13:52:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (703, '000.00.12.H53', '2020-09-05 13:52:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (704, '000.00.13.H53', '2020-09-05 13:54:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (705, '000.00.12.H53', '2020-09-05 13:54:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (706, '000.00.13.H53', '2020-09-05 13:56:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (707, '000.00.12.H53', '2020-09-05 13:56:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (708, '000.00.13.H53', '2020-09-05 13:58:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (709, '000.00.12.H53', '2020-09-05 13:58:00', 1, 0);
INSERT INTO `edoc_dailycounter` VALUES (710, '000.00.13.H53', '2020-09-05 14:00:00', 1, 2);
INSERT INTO `edoc_dailycounter` VALUES (711, '000.00.12.H53', '2020-09-05 14:00:00', 1, 0);

-- ----------------------------
-- Table structure for edoc_document
-- ----------------------------
DROP TABLE IF EXISTS `edoc_document`;
CREATE TABLE `edoc_document`  (
  `document_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `edXML_doc_id` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `subject` varchar(550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_number` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_notation` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promulgation_place` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promulgation_date` datetime(0) NULL DEFAULT NULL,
  `document_type` tinyint(4) NULL DEFAULT NULL,
  `document_type_name` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_type_detail` tinyint(4) NULL DEFAULT NULL,
  `priority_id` bigint(20) NULL DEFAULT NULL,
  `is_draft` tinyint(4) NULL DEFAULT NULL,
  `sent_date` datetime(0) NULL DEFAULT NULL,
  `to_organ_domain` varchar(550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_organ_domain` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `visible` tinyint(4) NULL DEFAULT NULL,
  `send_ext` tinyint(4) NULL DEFAULT NULL,
  `visited` tinyint(4) NULL DEFAULT NULL,
  `document_ext_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`document_id`) USING BTREE,
  INDEX `fromOrganCode`(`code_number`, `code_notation`, `from_organ_domain`) USING BTREE,
  INDEX `fromOrganEdxmlId`(`edXML_doc_id`, `from_organ_domain`) USING BTREE,
  INDEX `fromOrgan`(`from_organ_domain`) USING BTREE,
  INDEX `isDraf`(`is_draft`) USING BTREE,
  INDEX `toOrganDomain`(`to_organ_domain`) USING BTREE,
  INDEX `fromOrganDraft`(`is_draft`, `from_organ_domain`) USING BTREE,
  INDEX `sentDate`(`sent_date`, `modified_date`, `create_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 296 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_document
-- ----------------------------
INSERT INTO `edoc_document` VALUES (272, '18661', '2020-08-14 00:00:00', '2020-08-14 00:00:00', 'V??? vi???c b??o c??o c??ng t??c QLNN ng??nh Th??ng tin v?? Truy???n th??ng th??ng 8 v?? ph????ng h?????ng th??ng 9', '1308', 'BC-STTTT_test', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-14 00:00:00', 1, 'B??o c??o', -1, 0, 0, '2020-08-14 00:00:00', '000.00.13.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (273, '53234', '2020-08-14 00:00:00', '2020-08-14 00:00:00', 'V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '1127', 'SGTVT-QLHT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-12 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-14 00:00:00', '000.00.21.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (274, '18646', '2020-08-14 00:00:00', '2020-08-14 00:00:00', 'V??? vi???c c??? th??nh vi??n tham gia H???i ?????ng c???p t???nh x??t t???ng danh hi???u Ngh??? nh??n nh??n d??n v?? ngh??? nh??n ??u t?? l???n th??? ba n??m 2021', '1298', 'STTTT-VP_test', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-13 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-14 00:00:00', '000.00.13.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (275, '53234', '2020-08-14 00:00:00', '2020-08-14 00:00:00', 'V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '1099', 'SGTVT-QLHT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-06 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-14 00:00:00', '000.00.13.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (276, '53234', '2020-08-14 00:00:00', '2020-08-14 00:00:00', 'V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '1099', 'SGTVT-QLHT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-04 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-14 00:00:00', '000.00.21.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (277, '53234', '2020-08-14 00:00:00', '2020-08-14 00:00:00', 'V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '1099', 'SGTVT-QLHT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-12 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-14 00:00:00', '000.00.21.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (278, '53234', '2020-08-14 00:00:00', '2020-08-14 00:00:00', 'L???y ?? ki???n g??p ?? d??? th???o quy ?????nh qu???n l?? ho???t ?????ng xe trung chuy???n h??nh kh??ch tuy???n c??? ?????nh\n', '1099', 'QD-SGTVT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-12 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-14 00:00:00', '000.00.13.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (279, '53234', '2020-08-15 00:00:00', '2020-08-15 00:00:00', 'T???ng k???t ????nh gi?? 10 n??m th???c hi???n Ch????ng tr??nh ph??t tri???n v???t li???u x??y kh??ng nung tr??n ?????a b??n t???nh', '1126', 'QD-SGTVT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-13 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-15 00:00:00', '000.00.13.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (280, '18632', '2020-08-15 00:00:00', '2020-08-15 00:00:00', 'V??? vi???c g??p ?? d??? th???o K??? ho???ch truy???n th??ng v??? th???c hi???n th??? t???c h??nh ch??nh tr??n m??i tr?????ng ??i???n t??? tr??n ?????a b??n t???nh T??y Ninh ', '1295', 'STTTT-TTBCXB', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-12 00:00:00', 1, 'B??o c??o', -1, 0, 0, '2020-08-15 00:00:00', '000.00.23.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (281, '53234', '2020-08-15 00:00:00', '2020-08-15 00:00:00', 'T???ng k???t ????nh gi?? 10 n??m th???c hi???n Ch????ng tr??nh ph??t tri???n v???t li???u x??y kh??ng nung tr??n ?????a b??n t???nh\n', '1126', 'CV-SGTVT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-15 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-15 00:00:00', '000.00.21.H53', '000.00.13.H53', 1, NULL, 1, NULL);
INSERT INTO `edoc_document` VALUES (282, '53234', '2020-08-19 00:00:00', '2020-08-19 00:00:00', 'T??? tr??nh V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '1111', 'TTr-SGTVT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-19 00:00:00', 3, 'T??? tr??nh', -1, 0, 0, '2020-08-19 00:00:00', '000.00.01.H53', '000.00.13.H53', 1, 1, 1, NULL);
INSERT INTO `edoc_document` VALUES (283, '53234', '2020-08-19 00:00:00', '2020-08-19 00:00:00', 'B??o c??o t??nh h??nh th???c hi???n gi???i ng??n k??? ho???ch v???n th??ng 8/2020 Ql 27', '1127', 'SGTVT-QLHT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-19 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-19 00:00:00', '000.01.01.H53', '000.00.13.H53', 1, 1, 1, NULL);
INSERT INTO `edoc_document` VALUES (284, '53234', '2020-08-20 00:00:00', '2020-08-20 00:00:00', 'Test g???i li??n th??ng', '1099', 'SGTVT-QLHT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-20 00:00:00', 3, 'T??? tr??nh', -1, 0, 0, '2020-08-20 00:00:00', '000.00.01.H53#000.02.01.H53#000.12.31.H53', '000.00.13.H53', 1, 1, 1, NULL);
INSERT INTO `edoc_document` VALUES (285, '53234', '2020-08-22 00:00:00', '2020-08-22 00:00:00', 'Gi???i quy???t c??c t???n t???i trong c??ng t??c b???i th?????ng GPMB d??? ??n Ql 27 ??o???n tr??nh LK', '1163', 'BC_SGTVT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-22 00:00:00', 2, 'B??o c??o', -1, 0, 0, '2020-08-22 00:00:00', '000.28.31.H53#000.01.32.H53#000.01.33.H53', '000.00.13.H53', 1, 1, 1, NULL);
INSERT INTO `edoc_document` VALUES (286, '53234', '2020-08-22 00:00:00', '2020-08-22 00:00:00', 'V??? vi???c ????? xu???t ??i???u ch???nh d??? ??n x??y d???ng h??? th???ng ???????ng giao th??ng Trung t??m th??? tr???n D???Ran, huy???n ????n D????ng.', '1142', 'SGTVT-QLHT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-22 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-22 00:00:00', '000.00.01.H53', '000.00.13.H53', 1, 1, 1, NULL);
INSERT INTO `edoc_document` VALUES (287, '53234', '2020-08-24 00:00:00', '2020-08-24 00:00:00', 'Test g???i v??n b???n r??c ', '1221', 'STNMT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-24 00:00:00', 1, 'C??ng v??n', -1, 0, 1, '2020-08-24 00:00:00', '000.10.32.H53', '000.00.13.H53', 1, 1, 1, NULL);
INSERT INTO `edoc_document` VALUES (288, '53234', '2020-08-31 00:00:00', '2020-08-31 00:00:00', 'Test g???i li??n th??ng ng??y 30/08/2020', '1127', 'UBND', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-31 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-31 00:00:00', '000.00.01.H53#000.20.31.H53', '000.00.13.H53', 1, 0, 1, NULL);
INSERT INTO `edoc_document` VALUES (289, '53234', '2020-08-31 00:31:17', '2020-08-31 00:31:17', 'Test g???i li??n th??ng ti???p', '1223', 'UBND', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-08-31 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-08-31 00:31:17', '000.00.01.H53', '000.00.13.H53', 1, 0, 1, NULL);
INSERT INTO `edoc_document` VALUES (290, '53234', '2020-09-02 17:21:47', '2020-09-02 17:21:47', 'Test g???i li??n th??ng ng??y 01/09/2020', '1332', 'CV-SGTVT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-09-02 00:00:00', 1, 'C??ng v??n', -1, 1, 0, '2020-09-02 17:21:47', '000.02.01.H53', '000.00.13.H53', 1, 0, 1, NULL);
INSERT INTO `edoc_document` VALUES (291, '53234', '2020-09-04 14:41:28', '2020-09-04 14:41:28', 'Test g???i cho s??? th??ng tin truy???n th??ng 04/09/2020', '1322', 'STNMT', 'S??? T??i nguy??n v?? M??i tr?????ng', '2020-09-04 00:00:00', 2, 'B??o c??o', -1, 0, 0, '2020-09-04 14:41:28', '000.00.13.H53', '000.00.12.H53', 1, 0, 1, NULL);
INSERT INTO `edoc_document` VALUES (292, '53234', '2020-09-04 14:47:45', '2020-09-04 14:47:45', 'Test g???i li??n th??ng v??n b???n cho s??? t??i nguy??n m??i tr?????ng', '1443', 'STTT-QD', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-09-05 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-09-04 14:47:45', '000.00.12.H53', '000.00.13.H53', 1, 0, 1, NULL);
INSERT INTO `edoc_document` VALUES (293, '53234', '2020-09-04 14:52:28', '2020-09-04 14:52:28', 'Test g???i li??n th??ng ti???p cho s??? th??ng tin truy???n th??ng', '1543', 'STTT-CV', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-09-04 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-09-04 14:52:28', '000.00.13.H53', '000.00.13.H53', 1, 0, 1, NULL);
INSERT INTO `edoc_document` VALUES (294, '53234', '2020-09-05 12:40:13', '2020-09-05 12:40:13', 'Test g???i v??n b???n ', '13323', 'STTTT', 'S??? Th??ng tin v?? Truy???n th??ng', '2020-09-05 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-09-05 12:40:13', '000.00.13.H53', '000.00.13.H53', 1, 0, 1, NULL);
INSERT INTO `edoc_document` VALUES (295, '53234', '2020-09-05 12:42:16', '2020-09-05 12:42:16', 'Test g???i s??? tttt', '13333', 'STTTT', 'S??? T??i nguy??n v?? M??i tr?????ng', '2020-09-05 00:00:00', 1, 'C??ng v??n', -1, 0, 0, '2020-09-05 12:42:16', '000.00.13.H53', '000.00.12.H53', 1, 0, 1, NULL);

-- ----------------------------
-- Table structure for edoc_document_detail
-- ----------------------------
DROP TABLE IF EXISTS `edoc_document_detail`;
CREATE TABLE `edoc_document_detail`  (
  `document_id` bigint(20) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signer_competence` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signer_position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `signer_fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `due_date` datetime(0) NULL DEFAULT NULL,
  `to_places` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sphere_of_promulgation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typer_notation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promulgation_amount` int(11) NULL DEFAULT NULL,
  `page_amount` int(11) NULL DEFAULT NULL,
  `appendixes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `response_for` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `steering_type` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_document_detail
-- ----------------------------
INSERT INTO `edoc_document_detail` VALUES (272, '', '', '', 'Tr???n Qu???c H??ng', NULL, '', '', '', 0, 0, '', NULL, 0);
INSERT INTO `edoc_document_detail` VALUES (273, 'V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '', 'Gi??m ?????c', 'B??i S??n ??i???n', NULL, '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (274, '', '', '', 'Tr???n Qu???c H??ng', NULL, '', '', '', 0, 0, '', NULL, 0);
INSERT INTO `edoc_document_detail` VALUES (275, 'V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '', 'Gi??m ?????c', 'B??i S??n ??i???n', NULL, '', '', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (276, 'V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '', 'Gi??m ?????c', 'B??i S??n ??i???n', NULL, '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (277, 'V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '', 'Gi??m ?????c', 'B??i S??n ??i???n', NULL, '', '', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (278, 'L???y ?? ki???n g??p ?? d??? th???o quy ?????nh qu???n l?? ho???t ?????ng xe trung chuy???n h??nh kh??ch tuy???n c??? ?????nh', '', 'Gi??m ?????c', 'B??i S??n ??i???n', NULL, '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (279, 'T???ng k???t ????nh gi?? 10 n??m th???c hi???n Ch????ng tr??nh ph??t tri???n v???t li???u x??y kh??ng nung tr??n ?????a b??n t???nh', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-15 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (280, '', '', '', 'Hu???nh Thanh Nam', NULL, '', '', '', 0, 0, '', NULL, 0);
INSERT INTO `edoc_document_detail` VALUES (281, 'T???ng k???t ????nh gi?? 10 n??m th???c hi???n Ch????ng tr??nh ph??t tri???n v???t li???u x??y kh??ng nung tr??n ?????a b??n t???nh', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-15 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (282, 'T??? tr??nh V??? vi???c th???m ?????nh d??? to??n kh???o s??t, l???p b??o c??o nghi??n c???u kh??? thi d??? ??n ?????u t?? x??y d???ng c??ng tr??nh ???????ng giao th??ng x?? B???L?? ??i x?? L???c Qu???ng, huy???n B???o L??m.', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-20 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (283, 'B??o c??o t??nh h??nh th???c hi???n gi???i ng??n k??? ho???ch v???n th??ng 8/2020 Ql 27', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-12 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (284, 'Test g???i li??n th??ng', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-22 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (285, 'Gi???i quy???t c??c t???n t???i trong c??ng t??c b???i th?????ng GPMB d??? ??n Ql 27 ??o???n tr??nh LK', '', 'Chuy??n vi??n', 'Ho??ng Anh Tu???n', NULL, '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (286, 'V??? vi???c ????? xu???t ??i???u ch???nh d??? ??n x??y d???ng h??? th???ng ???????ng giao th??ng Trung t??m th??? tr???n D???Ran, huy???n ????n D????ng.', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-22 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (287, 'Test g???i v??n b???n r??c ', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-24 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (288, 'Test g???i li??n th??ng ng??y 30/08/2020', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-25 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (289, '33333', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-08-31 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (290, 'Test g???i li??n th??ng ng??y 01/09/2020', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-09-03 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (291, 'Test g???i cho s??? th??ng tin truy???n th??ng 04/09/2020', '', 'Gi??m ?????c', 'B??i S??n ??i???n', NULL, '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (292, 'Test g???i li??n th??ng v??n b???n cho s??? t??i nguy??n m??i ', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-09-19 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (293, 'Test g???i li??n th??ng ti???p cho s??? th??ng tin truy???n th??ng', '', 'Gi??m ?????c', 'B??i S??n ??i???n', '2020-09-11 00:00:00', '', 'N???i b???', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (294, '', '', 'Gi??m ?????c', 'Quang', NULL, '', '', '', 3, 3, '', '', 1);
INSERT INTO `edoc_document_detail` VALUES (295, '', '', 'Gi??m ?????c', 'Quang', '2020-09-19 00:00:00', '', '', '', 2, 2, '', '', 1);

-- ----------------------------
-- Table structure for edoc_document_type
-- ----------------------------
DROP TABLE IF EXISTS `edoc_document_type`;
CREATE TABLE `edoc_document_type`  (
  `edoc_document_type` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`edoc_document_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_document_type
-- ----------------------------
INSERT INTO `edoc_document_type` VALUES (1, 'C??ng v??n');
INSERT INTO `edoc_document_type` VALUES (2, 'B??o c??o');
INSERT INTO `edoc_document_type` VALUES (3, 'T??? tr??nh');
INSERT INTO `edoc_document_type` VALUES (4, 'H??? s??');

-- ----------------------------
-- Table structure for edoc_dynamiccontact
-- ----------------------------
DROP TABLE IF EXISTS `edoc_dynamiccontact`;
CREATE TABLE `edoc_dynamiccontact`  (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `InCharge` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Domain` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Email` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Address` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Telephone` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Fax` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Website` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Type` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Version` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4000743 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_dynamiccontact
-- ----------------------------
INSERT INTO `edoc_dynamiccontact` VALUES (2752000, 'UBND T???nh T??y Ninh', 'T??y Ninh', '000.00.00.H53', '000.00.00.H53@bmail.com', 'Tay Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2752723, 'V??n ph??ng UBND t???nh', 'T??y Ninh', '000.00.01.H53', '000.00.01.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2752737, 'Ban Ti???p C??ng d??n', 'T??y Ninh', '000.01.01.H53', '000.01.01.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2752751, 'Trung t??m H??nh ch??nh c??ng c???p t???nh', 'T??y Ninh', '000.02.01.H53', '000.02.01.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753032, 'Thanh tra huy???n??? B???n C???u', 'T??y Ninh', '000.12.31.H53', '000.12.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753046, 'UBND Th??? tr???n B???n C???u huy???n??? B???n C???u', 'T??y Ninh', '000.20.31.H53', '000.20.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753060, 'UBND X?? An Th???nh huy???n??? B???n C???u', 'T??y Ninh', '000.21.31.H53', '000.21.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753074, 'UBND X?? Long Ch??? huy???n??? B???n C???u', 'T??y Ninh', '000.22.31.H53', '000.22.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753088, 'UBND X?? Long Giang huy???n??? B???n C???u', 'T??y Ninh', '000.23.31.H53', '000.23.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753102, 'UBND X?? Long Kh??nh huy???n??? B???n C???u', 'T??y Ninh', '000.24.31.H53', '000.24.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753116, 'UBND X?? Long Ph?????c huy???n??? B???n C???u', 'T??y Ninh', '000.25.31.H53', '000.25.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753130, 'UBND X?? Long Thu???n huy???n??? B???n C???u', 'T??y Ninh', '000.26.31.H53', '000.26.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753144, 'UBND X?? L???i Thu???n huy???n??? B???n C???u', 'T??y Ninh', '000.27.31.H53', '000.27.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753158, 'UBND X?? Ti??n Thu???n huy???n??? B???n C???u', 'T??y Ninh', '000.28.31.H53', '000.28.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753172, 'UBND huy???n Ch??u Th??nh', 'T??y Ninh', '000.00.32.H53', '000.00.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753186, 'V??n ph??ng H??ND-UBND huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.01.32.H53', '000.01.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753200, 'Ph??ng Gi??o d???c v?? ????o t???o huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.02.32.H53', '000.02.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753214, 'Ph??ng Kinh t??? v?? H??? t???ng??? huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.03.32.H53', '000.03.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753228, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.04.32.H53', '000.04.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753242, 'Ph??ng N???i v??? huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.05.32.H53', '000.05.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753256, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.06.32.H53', '000.06.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753270, 'Ph??ng T??i ch??nh - K??? ho???ch huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.07.32.H53', '000.07.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753284, 'Ph??ng T??i nguy??n v?? M??i tr?????ng huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.08.32.H53', '000.08.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753298, 'Ph??ng T?? ph??p??? huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.09.32.H53', '000.09.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753312, 'Ph??ng V??n h??a v?? Th??ng tin??? huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.10.32.H53', '000.10.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753326, 'Ph??ng Y t??? huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.11.32.H53', '000.11.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753340, 'Thanh tra huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.12.32.H53', '000.12.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753354, 'UBND Th??? Tr???n Ch??u Th??nh huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.20.32.H53', '000.20.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753368, 'UBND X?? An B??nh huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.21.32.H53', '000.21.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753382, 'UBND X?? An C?? huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.22.32.H53', '000.22.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753396, 'UBND X?? Bi??n Gi???i huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.23.32.H53', '000.23.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753410, 'UBND X?? ?????ng Kh???i huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.24.32.H53', '000.24.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753424, 'UBND X?? H???o ???????c huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.25.32.H53', '000.25.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753438, 'UBND X?? H??a H???i huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.26.32.H53', '000.26.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753452, 'UBND X?? H??a Th???nh huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.27.32.H53', '000.27.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753466, 'UBND X?? Long V??nh huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.28.32.H53', '000.28.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753480, 'UBND X?? Ninh ??i???n huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.29.32.H53', '000.29.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753494, 'UBND X?? Ph?????c Vinh huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.30.32.H53', '000.30.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753508, 'UBND X?? Thanh ??i???n huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.31.32.H53', '000.31.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753522, 'UBND X?? Th??i B??nh huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.32.32.H53', '000.32.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753536, 'UBND X?? Th??nh Long huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.33.32.H53', '000.33.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753550, 'UBND X?? Tr?? B??nh huy???n??? Ch??u Th??nh', 'T??y Ninh', '000.34.32.H53', '000.34.32.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753564, 'UBND huy???n D????ng Minh Ch??u', 'T??y Ninh', '000.00.33.H53', '000.00.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753578, 'V??n ph??ng H??ND-UBND huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.01.33.H53', '000.01.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753592, 'Ph??ng Gi??o d???c v?? ????o t???o huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.02.33.H53', '000.02.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753606, 'Ph??ng Kinh t??? v?? H??? t???ng??? huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.03.33.H53', '000.03.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753620, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.04.33.H53', '000.04.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753634, 'Ph??ng N???i v??? huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.05.33.H53', '000.05.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753648, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.06.33.H53', '000.06.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753662, 'Ph??ng T??i ch??nh - K??? ho???ch huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.07.33.H53', '000.07.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753676, 'Ph??ng T??i nguy??n v?? M??i tr?????ng huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.08.33.H53', '000.08.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753690, 'Ph??ng T?? ph??p??? huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.09.33.H53', '000.09.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753704, 'Ph??ng V??n h??a v?? Th??ng tin??? huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.10.33.H53', '000.10.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753718, 'Ph??ng Y t??? huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.11.33.H53', '000.11.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753732, 'Thanh tra huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.12.33.H53', '000.12.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753746, 'UBND Th??? Tr???n D????ng Minh Ch??u huy???n D????ng Minh Ch??u', 'T??y Ninh', '000.20.33.H53', '000.20.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753760, 'UBND X?? B??u N??ng huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.21.33.H53', '000.21.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753774, 'UBND X?? B???n C???i huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.22.33.H53', '000.22.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753788, 'UBND X?? C???u Kh???i huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.23.33.H53', '000.23.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753802, 'UBND X?? Ch?? L?? huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.24.33.H53', '000.24.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753816, 'UBND X?? L???c Ninh huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.25.33.H53', '000.25.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753830, 'UBND X?? Phan huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.26.33.H53', '000.26.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753844, 'UBND X?? Ph?????c Minh huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.27.33.H53', '000.27.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753858, 'UBND X?? Ph?????c Ninh huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.28.33.H53', '000.28.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753872, 'UBND X?? Su???i ???? huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.29.33.H53', '000.29.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753886, 'UBND X?? Tru??ng M??t huy???n??? D????ng Minh Ch??u', 'T??y Ninh', '000.30.33.H53', '000.30.33.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753900, 'S??? Giao th??ng V???n t???i', 'T??y Ninh', '000.00.04.H53', '000.00.04.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753914, 'S??? K??? ho???ch v?? ?????u t??', 'T??y Ninh', '000.00.05.H53', '000.00.05.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753928, 'S??? Ngo???i v???', 'T??y Ninh', '000.00.08.H53', '000.00.08.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753942, 'S??? T??i ch??nh', 'T??y Ninh', '000.00.11.H53', '000.00.11.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753956, 'Thanh tra t???nh', 'T??y Ninh', '000.00.18.H53', '000.00.18.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753970, 'Ban An to??n Giao th??ng', 'T??y Ninh', '000.00.19.H53', '000.00.19.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753984, 'Ban Qu???n l?? c??c Khu di t??ch l???ch s??? C??ch M???ng Mi???n Nam', 'T??y Ninh', '000.00.20.H53', '000.00.20.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2753998, 'Ban Qu???n l?? Khu Du l???ch Qu???c Gia N??i B?? ??en', 'T??y Ninh', '000.00.21.H53', '000.00.21.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754012, 'Ban Qu???n l?? Khu Kinh t???', 'T??y Ninh', '000.00.22.H53', '000.00.22.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754026, 'Ban Qu???n l?? V?????n Qu???c Gia L?? G?? Xa M??t', 'T??y Ninh', '000.00.23.H53', '000.00.23.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754040, '????i Ph??t thanh v?? Truy???n h??nh T??y Ninh', 'T??y Ninh', '000.00.40.H53', '000.00.40.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754054, 'T??a so???n b??o', 'T??y Ninh', '000.00.41.H53', '000.00.41.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754068, 'Ban Qu???n l?? D??? ??n ?????u t?? x??y d???ng T??y Ninh', 'T??y Ninh', '000.00.42.H53', '000.00.42.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754082, 'Ban Qu???n l?? D??? ??n ?????u t?? x??y d???ng ng??nh Giao th??ng t???nh T??y Ninh', 'T??y Ninh', '000.00.43.H53', '000.00.43.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754110, 'UBND huy???n B???n C???u', 'T??y Ninh', '000.00.31.H53', '000.00.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754124, 'V??n ph??ng H??ND-UBND huy???n??? B???n C???u', 'T??y Ninh', '000.01.31.H53', '000.01.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754138, 'Ph??ng Gi??o d???c v?? ????o t???o huy???n??? B???n C???u', 'T??y Ninh', '000.02.31.H53', '000.02.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2754152, 'Ph??ng Kinh t??? v?? H??? t???ng??? huy???n??? B???n C???u', 'T??y Ninh', '000.03.31.H53', '000.03.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', '', '');
INSERT INTO `edoc_dynamiccontact` VALUES (2759349, 'Ban Qu???n l?? DA??TXD Khu kinh t??? T??y Ninh', 'T??y Ninh', '000.00.24.H53', '000.00.24.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759363, 'Li??n minh H???p t??c x?? T??y Ninh', 'T??y Ninh', '000.00.25.H53', '000.00.25.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759377, 'C???c thi h??nh ??n t???nh T??y Ninh', 'T??y Ninh', '000.00.26.H53', '000.00.26.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759391, 'C???c thu??? t???nh T??y Ninh', 'T??y Ninh', '000.00.27.H53', '000.00.27.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759405, 'C??ng ty CP Du l???ch', 'T??y Ninh', '000.00.28.H53', '000.00.28.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759419, 'C???c th???ng k?? t???nh T??y Ninh', 'T??y Ninh', '000.00.29.H53', '000.00.29.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759433, 'Li??n ??o??n lao ?????ng t???nh T??y Ninh', 'T??y Ninh', '000.00.39.H53', '000.00.39.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759447, 'Ng??n h??ng nh?? n?????c t???nh T??y Ninh', 'T??y Ninh', '000.00.45.H53', '000.00.45.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759461, 'C???c h???i quan t???nh T??y Ninh', 'T??y Ninh', '000.00.46.H53', '000.00.46.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759475, 'Vi???n ki???m s??t t???nh T??y Ninh', 'T??y Ninh', '000.00.47.H53', '000.00.47.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759489, 'Tr?????ng Ch??nh tr??? t???nh T??y Ninh', 'T??y Ninh', '000.00.48.H53', '000.00.48.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759607, 'Ban Qu???n l?? D??? ??n ?????u t?? X??y d???ng ng??nh N??ng nghi???p v?? Ph??t tri???n n??ng th??n t???nh T??y Ninh', 'T??y Ninh', '000.00.44.H53', '000.00.44.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759608, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i huy???n??? B???n C???u', 'T??y Ninh', '000.04.31.H53', '000.04.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759609, 'Ph??ng N???i v??? huy???n??? B???n C???u', 'T??y Ninh', '000.05.31.H53', '000.05.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759610, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n huy???n??? B???n C???u', 'T??y Ninh', '000.06.31.H53', '000.06.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759611, 'Ph??ng T??i ch??nh - K??? ho???ch huy???n??? B???n C???u', 'T??y Ninh', '000.07.31.H53', '000.07.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759612, 'Ph??ng T??i nguy??n v?? M??i tr?????ng huy???n??? B???n C???u', 'T??y Ninh', '000.08.31.H53', '000.08.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759613, 'Ph??ng T?? ph??p??? huy???n??? B???n C???u', 'T??y Ninh', '000.09.31.H53', '000.09.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759614, 'Ph??ng V??n h??a v?? Th??ng tin??? huy???n??? B???n C???u', 'T??y Ninh', '000.10.31.H53', '000.10.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759615, 'Ph??ng Y t??? huy???n??? B???n C???u', 'T??y Ninh', '000.11.31.H53', '000.11.31.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759616, 'UBND huy???n G?? D???u', 'T??y Ninh', '000.00.34.H53', '000.00.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759617, 'V??n ph??ng H??ND-UBND huy???n??? G?? D???u', 'T??y Ninh', '000.01.34.H53', '000.01.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759618, 'Ph??ng Gi??o d???c v?? ????o t???o huy???n??? G?? D???u', 'T??y Ninh', '000.02.34.H53', '000.02.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759619, 'Ph??ng Kinh t??? v?? H??? t???ng??? huy???n??? G?? D???u', 'T??y Ninh', '000.03.34.H53', '000.03.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759620, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i huy???n??? G?? D???u', 'T??y Ninh', '000.04.34.H53', '000.04.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759621, 'Ph??ng N???i v??? huy???n??? G?? D???u', 'T??y Ninh', '000.05.34.H53', '000.05.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759622, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n huy???n??? G?? D???u', 'T??y Ninh', '000.06.34.H53', '000.06.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759623, 'Ph??ng T??i ch??nh - K??? ho???ch huy???n??? G?? D???u', 'T??y Ninh', '000.07.34.H53', '000.07.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759624, 'Ph??ng T??i nguy??n v?? M??i tr?????ng huy???n??? G?? D???u', 'T??y Ninh', '000.08.34.H53', '000.08.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759625, 'Ph??ng T?? ph??p??? huy???n??? G?? D???u', 'T??y Ninh', '000.09.34.H53', '000.09.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759626, 'Ph??ng V??n h??a v?? Th??ng tin??? huy???n??? G?? D???u', 'T??y Ninh', '000.10.34.H53', '000.10.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759627, 'Ph??ng Y t??? huy???n??? G?? D???u', 'T??y Ninh', '000.11.34.H53', '000.11.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759628, 'UBND Th??? Tr???n G?? D???u huy???n??? G?? D???u', 'T??y Ninh', '000.20.34.H53', '000.20.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759629, 'Thanh tra huy???n??? G?? D???u', 'T??y Ninh', '000.12.34.H53', '000.12.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759630, 'UBND X?? B??u ?????n huy???n??? G?? D???u', 'T??y Ninh', '000.21.34.H53', '000.21.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759631, 'UBND X?? C???m Giang huy???n??? G?? D???u', 'T??y Ninh', '000.22.34.H53', '000.22.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759632, 'UBND X?? Hi???p Th???nh huy???n??? G?? D???u', 'T??y Ninh', '000.23.34.H53', '000.23.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759633, 'UBND X?? Ph?????c ????ng huy???n??? G?? D???u', 'T??y Ninh', '000.24.34.H53', '000.24.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759634, 'UBND X?? Ph?????c Th???nh huy???n??? G?? D???u', 'T??y Ninh', '000.25.34.H53', '000.25.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759635, 'UBND X?? Ph?????c Tr???ch huy???n??? G?? D???u', 'T??y Ninh', '000.26.34.H53', '000.26.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759636, 'UBND X?? Thanh Ph?????c huy???n??? G?? D???u', 'T??y Ninh', '000.27.34.H53', '000.27.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759637, 'UBND X?? Th???nh ?????c huy???n??? G?? D???u', 'T??y Ninh', '000.28.34.H53', '000.28.34.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759638, 'UBND huy???n Ho?? Th??nh', 'T??y Ninh', '000.00.35.H53', '000.00.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759639, 'V??n ph??ng H??ND-UBND huy???n??? H??a Th??nh', 'T??y Ninh', '000.01.35.H53', '000.01.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759640, 'Ph??ng Gi??o d???c v?? ????o t???o huy???n??? H??a Th??nh', 'T??y Ninh', '000.02.35.H53', '000.02.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759641, 'Ph??ng Kinh t??? v?? H??? t???ng??? huy???n??? H??a Th??nh', 'T??y Ninh', '000.03.35.H53', '000.03.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759642, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i huy???n??? H??a Th??nh', 'T??y Ninh', '000.04.35.H53', '000.04.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759643, 'Ph??ng N???i v??? huy???n??? H??a Th??nh', 'T??y Ninh', '000.05.35.H53', '000.05.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759644, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n huy???n??? H??a Th??nh', 'T??y Ninh', '000.06.35.H53', '000.06.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759645, 'Ph??ng T??i ch??nh - K??? ho???ch huy???n??? H??a Th??nh', 'T??y Ninh', '000.07.35.H53', '000.07.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759646, 'Ph??ng T??i nguy??n v?? M??i tr?????ng huy???n??? H??a Th??nh', 'T??y Ninh', '000.08.35.H53', '000.08.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759647, 'Ph??ng T?? ph??p??? huy???n??? H??a Th??nh', 'T??y Ninh', '000.09.35.H53', '000.09.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759648, 'Ph??ng V??n h??a v?? Th??ng tin??? huy???n??? H??a Th??nh', 'T??y Ninh', '000.10.35.H53', '000.10.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759649, 'Ph??ng Y t??? huy???n??? H??a Th??nh', 'T??y Ninh', '000.11.35.H53', '000.11.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759650, 'Thanh tra huy???n??? H??a Th??nh', 'T??y Ninh', '000.12.35.H53', '000.12.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759651, 'UBND Th??? tr???n H??a Th??nh huy???n??? H??a Th??nh', 'T??y Ninh', '000.20.35.H53', '000.20.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759652, 'UBND X?? Hi???p T??n huy???n??? H??a Th??nh', 'T??y Ninh', '000.21.35.H53', '000.21.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759653, 'UBND X?? Long Th??nh B???chuy???n??? H??a Th??nh', 'T??y Ninh', '000.22.35.H53', '000.22.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759654, 'UBND X?? Long Th??nh Nam huy???n??? H??a Th??nh', 'T??y Ninh', '000.23.35.H53', '000.23.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759655, 'UBND X?? Long Th??nh Trung huy???n??? H??a Th??nh', 'T??y Ninh', '000.24.35.H53', '000.24.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759656, 'UBND X?? Tr?????ng H??a huy???n??? H??a Th??nh', 'T??y Ninh', '000.25.35.H53', '000.25.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759657, 'UBND X?? Tr?????ng ????ng huy???n??? H??a Th??nh', 'T??y Ninh', '000.26.35.H53', '000.26.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759658, 'UBND X?? Tr?????ng T??y huy???n??? H??a Th??nh', 'T??y Ninh', '000.27.35.H53', '000.27.35.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759659, 'UBND huy???n T??n Bi??n', 'T??y Ninh', '000.00.36.H53', '000.00.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759660, 'V??n ph??ng H??ND - UBND huy???n??? T??n Bi??n', 'T??y Ninh', '000.01.36.H53', '000.01.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759661, 'Ph??ng Gi??o d???c v?? ????o t???o huy???n??? T??n Bi??n', 'T??y Ninh', '000.02.36.H53', '000.02.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759662, 'Ph??ng Kinh t??? v?? H??? t???ng??? huy???n??? T??n Bi??n', 'T??y Ninh', '000.03.36.H53', '000.03.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759663, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i huy???n??? T??n Bi??n', 'T??y Ninh', '000.04.36.H53', '000.04.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759664, 'Ph??ng N???i v??? huy???n??? T??n Bi??n', 'T??y Ninh', '000.05.36.H53', '000.05.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759665, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n huy???n??? T??n Bi??n', 'T??y Ninh', '000.06.36.H53', '000.06.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759666, 'Ph??ng T??i ch??nh - K??? ho???ch huy???n??? T??n Bi??n', 'T??y Ninh', '000.07.36.H53', '000.07.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759667, 'Ph??ng T??i nguy??n v?? M??i tr?????ng huy???n??? T??n Bi??n', 'T??y Ninh', '000.08.36.H53', '000.08.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759668, 'Ph??ng T?? ph??p??? huy???n??? T??n Bi??n', 'T??y Ninh', '000.09.36.H53', '000.09.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759669, 'Ph??ng V??n h??a v?? Th??ng tin??? huy???n??? T??n Bi??n', 'T??y Ninh', '000.10.36.H53', '000.10.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759670, 'Ph??ng Y t??? huy???n??? T??n Bi??n', 'T??y Ninh', '000.11.36.H53', '000.11.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759671, 'Thanh tra huy???n??? T??n Bi??n', 'T??y Ninh', '000.12.36.H53', '000.12.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759672, 'UBND Th??? tr???n T??n Bi??n huy???n??? T??n Bi??n', 'T??y Ninh', '000.20.36.H53', '000.20.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759673, 'UBND X?? H??a Hi???p huy???n??? T??n Bi??n', 'T??y Ninh', '000.21.36.H53', '000.21.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759674, 'UBND X?? M??? C??ng huy???n??? T??n Bi??n', 'T??y Ninh', '000.22.36.H53', '000.22.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759675, 'UBND X?? T??n B??nh huy???n??? T??n Bi??n', 'T??y Ninh', '000.23.36.H53', '000.23.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759676, 'UBND X?? T??n L???p huy???n??? T??n Bi??n', 'T??y Ninh', '000.24.36.H53', '000.24.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759677, 'UBND X?? T??n Phong huy???n??? T??n Bi??n', 'T??y Ninh', '000.25.36.H53', '000.25.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759678, 'UBND X?? Th???nh B???c huy???n??? T??n Bi??n', 'T??y Ninh', '000.26.36.H53', '000.26.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759679, 'UBND X?? Th???nh B??nh huy???n??? T??n Bi??n', 'T??y Ninh', '000.27.36.H53', '000.27.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759680, 'UBND X?? Th???nh T??y huy???n??? T??n Bi??n', 'T??y Ninh', '000.28.36.H53', '000.28.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759681, 'UBND X?? Tr?? Vong huy???n??? T??n Bi??n', 'T??y Ninh', '000.29.36.H53', '000.29.36.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759682, 'UBND huy???n T??n Ch??u', 'T??y Ninh', '000.00.37.H53', '000.00.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759683, 'V??n ph??ng H??ND-UBND huy???n??? T??n Ch??u', 'T??y Ninh', '000.01.37.H53', '000.01.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759684, 'Ph??ng Gi??o d???c v?? ????o t???o huy???n??? T??n Ch??u', 'T??y Ninh', '000.02.37.H53', '000.02.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759685, 'Ph??ng Kinh t??? v?? H??? t???ng??? huy???n??? T??n Ch??u', 'T??y Ninh', '000.03.37.H53', '000.03.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759686, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i huy???n??? T??n Ch??u', 'T??y Ninh', '000.04.37.H53', '000.04.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759687, 'Ph??ng N???i v??? huy???n??? T??n Ch??u', 'T??y Ninh', '000.05.37.H53', '000.05.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759688, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n huy???n??? T??n Ch??u', 'T??y Ninh', '000.06.37.H53', '000.06.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759689, 'Ph??ng T??i ch??nh - K??? ho???ch huy???n??? T??n Ch??u', 'T??y Ninh', '000.07.37.H53', '000.07.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759690, 'Ph??ng T??i nguy??n v?? M??i tr?????ng huy???n??? T??n Ch??u', 'T??y Ninh', '000.08.37.H53', '000.08.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759691, 'Ph??ng T?? ph??p??? huy???n??? T??n Ch??u', 'T??y Ninh', '000.09.37.H53', '000.09.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759692, 'Ph??ng V??n h??a v?? Th??ng tin??? huy???n??? T??n Ch??u', 'T??y Ninh', '000.10.37.H53', '000.10.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759693, 'Ph??ng Y t??? huy???n??? T??n Ch??u', 'T??y Ninh', '000.1137.H53', '000.1137.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759694, 'Thanh tra huy???n??? T??n Ch??u', 'T??y Ninh', '000.12.37.H53', '000.12.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759695, 'UBND Th??? tr???n T??n Ch??u huy???n??? T??n Ch??u', 'T??y Ninh', '000.20.37.H53', '000.20.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759696, 'UBND X?? Su???i D??y huy???n??? T??n Ch??u', 'T??y Ninh', '000.21.37.H53', '000.21.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759697, 'UBND X?? Su???i Ng?? huy???n??? T??n Ch??u', 'T??y Ninh', '000.22.37.H53', '000.22.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759698, 'UBND X?? T??n ????ng huy???n??? T??n Ch??u', 'T??y Ninh', '000.23.37.H53', '000.23.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759699, 'UBND X?? T??n H?? huy???n??? T??n Ch??u', 'T??y Ninh', '000.24.37.H53', '000.24.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759700, 'UBND X?? T??n Hi???p huy???n??? T??n Ch??u', 'T??y Ninh', '000.25.37.H53', '000.25.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759701, 'UBND X?? T??n H??a huy???n??? T??n Ch??u', 'T??y Ninh', '000.26.37.H53', '000.26.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759702, 'UBND X?? T??n H???i huy???n??? T??n Ch??u', 'T??y Ninh', '000.27.37.H53', '000.27.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759703, 'UBND X?? T??n H??ng huy???n??? T??n Ch??u', 'T??y Ninh', '000.28.37.H53', '000.28.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759704, 'UBND X?? T??n Ph?? huy???n??? T??n Ch??u', 'T??y Ninh', '000.29.37.H53', '000.29.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759705, 'UBND X?? T??n Th??nh huy???n??? T??n Ch??u', 'T??y Ninh', '000.30.37.H53', '000.30.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759706, 'UBND X?? Thanh ????ng huy???n??? T??n Ch??u', 'T??y Ninh', '000.31.37.H53', '000.31.37.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759707, 'UBND huy???n Tr???ng B??ng', 'T??y Ninh', '000.00.38.H53', '000.00.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759708, 'V??n ph??ng H??ND-UBND huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.01.38.H53', '000.01.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759709, 'Ph??ng Gi??o d???c v?? ????o t???o huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.02.38.H53', '000.02.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759710, 'Ph??ng Kinh t??? v?? H??? t???ng??? huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.03.38.H53', '000.03.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759711, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.04.38.H53', '000.04.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759712, 'Ph??ng N???i v??? huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.05.38.H53', '000.05.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759713, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.06.38.H53', '000.06.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759714, 'Ph??ng T??i nguy??n v?? M??i tr?????ng huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.08.38.H53', '000.08.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759715, 'Ph??ng T??i ch??nh - K??? ho???ch huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.07.38.H53', '000.07.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759716, 'Ph??ng T?? ph??p??? huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.09.38.H53', '000.09.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759717, 'Ph??ng V??n h??a v?? Th??ng tin??? huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.10.38.H53', '000.10.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759718, 'Ph??ng Y t??? huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.11.38.H53', '000.11.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759719, 'Thanh tra huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.12.38.H53', '000.12.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759720, 'UBND Th??? tr???n Tr???ng B??ng huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.20.38.H53', '000.20.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759721, 'UBND X?? An H??a huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.21.38.H53', '000.21.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759722, 'UBND X?? An T???nh huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.22.38.H53', '000.22.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759723, 'UBND X?? B??nh Th???nh huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.23.38.H53', '000.23.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759724, 'UBND X?? ????n Thu???n huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.24.38.H53', '000.24.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759725, 'UBND X?? Gia B??nh huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.25.38.H53', '000.25.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759726, 'UBND X?? Gia L???c huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.26.38.H53', '000.26.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759727, 'UBND X?? H??ng Thu???n huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.27.38.H53', '000.27.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759728, 'UBND X?? L???c H??ng huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.28.38.H53', '000.28.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759729, 'UBND X?? Ph?????c Ch??? huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.29.38.H53', '000.29.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759730, 'UBND X?? Ph?????c L??u huy???n??? Tr???ng B??ng', 'T??y Ninh', '000.30.38.H53', '000.30.38.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759731, 'S??? C??ng Th????ng', 'T??y Ninh', '000.00.02.H53', '000.00.02.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759732, 'Chi C???c qu???n l?? th??? tr?????ng - S??? C??ng th????ng', 'T??y Ninh', '000.01.02.H53', '000.01.02.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759733, 'Trung t??m Khuy???n c??ng v?? T?? v???n ph??t tri???n c??ng nghi???p - S??? C??ng th????ng', 'T??y Ninh', '000.02.02.H53', '000.02.02.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759734, 'Trung t??m x??c ti???n th????ng m???i - S??? C??ng th????ng', 'T??y Ninh', '000.03.02.H53', '000.03.02.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759735, 'S??? Gi??o d???c v?? ????o t???o', 'T??y Ninh', '000.00.03.H53', '000.00.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759736, 'Trung t??m Gi??o d???c th?????ng xuy??n t???nh T??y Ninh', 'T??y Ninh', '000.01.03.H53', '000.01.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759737, 'Tr?????ng Cao ?????ng s?? ph???m T??y Ninh', 'T??y Ninh', '000.02.03.H53', '000.02.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759738, 'Tr?????ng Khuy???t t???t t???nh T??y Ninh', 'T??y Ninh', '000.03.03.H53', '000.03.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759739, 'Tr?????ng Ph??? Th??ng D??n t???c N???i tr??', 'T??y Ninh', '000.04.03.H53', '000.04.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759740, 'Tr?????ng THPT Chuy??n Ho??ng L?? Kha', 'T??y Ninh', '000.05.03.H53', '000.05.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759741, 'Tr?????ng THPT Ch??u Th??nh', 'T??y Ninh', '000.06.03.H53', '000.06.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759742, 'Tr?????ng THPT B??nh Th???nh', 'T??y Ninh', '000.07.03.H53', '000.07.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759743, 'Tr?????ng THPT D????ng Minh Ch??u', 'T??y Ninh', '000.08.03.H53', '000.08.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759744, 'Tr?????ng THPT Ho??ng V??n Th???', 'T??y Ninh', '000.09.03.H53', '000.09.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759745, 'Tr?????ng THPT Hu???nh Th??c Kh??ng', 'T??y Ninh', '000.10.03.H53', '000.10.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759746, 'Tr?????ng THPT L?? Du???n', 'T??y Ninh', '000.11.03.H53', '000.11.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759747, 'Tr?????ng THPT L?? H???ng Phong', 'T??y Ninh', '000.12.03.H53', '000.12.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759748, 'Tr?????ng THPT L?? Qu?? ????n', 'T??y Ninh', '000.13.03.H53', '000.13.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759749, 'Tr?????ng THPT L???c H??ng ', 'T??y Ninh', '000.14.03.H53', '000.14.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759750, 'Tr?????ng THPT L????ng Th??? Vinh', 'T??y Ninh', '000.15.03.H53', '000.15.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759751, 'Tr?????ng THPT L?? Th?????ng Ki???t', 'T??y Ninh', '000.16.03.H53', '000.16.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759752, 'Tr?????ng THPT Ng?? Gia T???', 'T??y Ninh', '000.17.03.H53', '000.17.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759753, 'Tr?????ng THPT Nguy???n An Ninh', 'T??y Ninh', '000.18.03.H53', '000.18.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759754, 'Tr?????ng THPT Nguy???n B???nh Khi??m', 'T??y Ninh', '000.19.03.H53', '000.19.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759755, 'Tr?????ng THPT Nguy???n Ch?? Thanh', 'T??y Ninh', '000.20.03.H53', '000.20.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759756, 'Tr?????ng THPT Nguy???n ????nh Chi???u', 'T??y Ninh', '000.21.03.H53', '000.21.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759757, 'Tr?????ng THPT Nguy???n Hu???', 'T??y Ninh', '000.22.03.H53', '000.22.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759758, 'Tr?????ng THPT Nguy???n Th??i B??nh', 'T??y Ninh', '000.23.03.H53', '000.23.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759759, 'Tr?????ng THPT Nguy???n Tr??i', 'T??y Ninh', '000.24.03.H53', '000.24.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759760, 'Tr?????ng THPT Nguy???n Trung Tr???c', 'T??y Ninh', '000.25.03.H53', '000.25.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759761, 'Tr?????ng THPT Nguy???n V??n Tr???i', 'T??y Ninh', '000.26.03.H53', '000.26.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759762, 'Tr?????ng THPT Quang Trung', 'T??y Ninh', '000.27.03.H53', '000.27.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759763, 'Tr?????ng THPT T??n Ch??u', 'T??y Ninh', '000.28.03.H53', '000.28.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759764, 'Tr?????ng THPT T??n ????ng', 'T??y Ninh', '000.29.03.H53', '000.29.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759765, 'Tr?????ng THPT T??n H??ng', 'T??y Ninh', '000.30.03.H53', '000.30.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759766, 'Tr?????ng THPT T??y Ninh', 'T??y Ninh', '000.31.03.H53', '000.31.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759767, 'Tr?????ng THPT Tr???ng B??ng', 'T??y Ninh', '000.32.03.H53', '000.32.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759768, 'Tr?????ng THPT Tr???n ?????i Ngh??a', 'T??y Ninh', '000.33.03.H53', '000.33.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759769, 'Tr?????ng THPT Tr???n Ph??', 'T??y Ninh', '000.34.03.H53', '000.34.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759770, 'Tr?????ng THPT Tr???n Qu???c ?????i', 'T??y Ninh', '000.35.03.H53', '000.35.03.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759771, 'S??? Khoa h???c v?? C??ng ngh???', 'T??y Ninh', '000.00.06.H53', '000.00.06.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759772, 'Chi c???c Ti??u chu???n ??o l?????ng Ch???t l?????ng - S??? KHCN', 'T??y Ninh', '000.01.06.H53', '000.01.06.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759773, 'Trung t??m k??? thu???t Ti??u chu???n ??o l?????ng Ch???t l?????ng - Chi c???c TC??LCL', 'T??y Ninh', '001.01.07.H53', '001.01.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759774, 'Trung t??m Th??ng tin, ???ng d???ng ti???n b??? khoa h???c v?? c??ng ngh??? - S??? KHCN', 'T??y Ninh', '000.02.06.H53', '000.02.06.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759775, 'S??? Lao ?????ng - Th????ng binh v?? X?? h???i', 'T??y Ninh', '000.00.07.H53', '000.00.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759776, 'Chi c???c Ph??ng, ch???ng t??? n???n X?? h???i - S??? L??TBXH', 'T??y Ninh', '000.01.07.H53', '000.01.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759777, 'Trung T??m B???o Tr??? X?? H???i t???nh T??y Ninh - S??? L??TBXH', 'T??y Ninh', '000.02.07.H53', '000.02.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759778, 'Trung t??m D???ch v??? vi???c l??m - S??? L??TBXH', 'T??y Ninh', '000.03.07.H53', '000.03.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759779, 'Trung t??m Gi??o d???c Lao ?????ng X?? h???i - S??? L??TBXH', 'T??y Ninh', '000.04.07.H53', '000.04.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759780, 'Trung t??m nu??i d???y tr??? khi???m th??? T??y Ninh - S??? L??TBXH', 'T??y Ninh', '000.05.07.H53', '000.05.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759781, 'Tr?????ng Cao ?????ng Ngh??? T??y Ninh - S??? L??TBXH', 'T??y Ninh', '000.06.07.H53', '000.06.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759782, 'Tr?????ng Trung c???p Kinh t??? K??? thu???t T??y Ninh - S??? L??TBXH', 'T??y Ninh', '000.07.07.H53', '000.07.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759783, 'Tr?????ng Trung c???p Ngh??? Khu v???c Nam T??y Ninh - S??? L??TBXH', 'T??y Ninh', '000.08.07.H53', '000.08.07.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759784, 'S??? N???i v???', 'T??y Ninh', '000.00.09.H53', '000.00.09.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759785, 'Ban T??n gi??o - S??? N???i v???', 'T??y Ninh', '000.01.09.H53', '000.01.09.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759786, 'Ban Thi ??ua - Khen th?????ng - S??? N???i v???', 'T??y Ninh', '000.02.09.H53', '000.02.09.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759787, 'Chi c???c V??n th?? - L??u tr??? - S??? N???i v???', 'T??y Ninh', '000.03.09.H53', '000.03.09.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759788, 'S??? N??ng nghi???p v?? Ph??t tri???n n??ng th??n', 'T??y Ninh', '000.00.10.H53', '000.00.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759789, 'Ban Qu???n l?? khu r???ng ph??ng h??? D???u Ti???ng - S??? NNPTNT', 'T??y Ninh', '000.01.10.H53', '000.01.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759790, 'Ban Qu???n l?? khu r???ng VHLS??Ch??ng Ri???c??- S??? NNPTNT', 'T??y Ninh', '000.02.10.H53', '000.02.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759791, 'Chi c???c Ch??n nu??i v?? Th?? y - S??? NNPTNT', 'T??y Ninh', '000.03.10.H53', '000.03.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759792, 'Chi c???c Ki???m l??m - S??? NNPTNT', 'T??y Ninh', '000.04.10.H53', '000.04.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759793, 'Chi c???c Ph??t tri???n n??ng th??n - S??? NNPTNT', 'T??y Ninh', '000.05.10.H53', '000.05.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759794, 'Chi c???c Qu???n l?? ch???t l?????ng N??ng l??m s???n v?? Th???y s???n - S??? NNPTNT', 'T??y Ninh', '000.06.10.H53', '000.06.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759795, 'Chi c???c Th???y l???i - S??? NNPTNT', 'T??y Ninh', '000.07.10.H53', '000.07.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759796, 'Chi c???c Tr???ng tr???t v?? B???o v??? th???c v???t - S??? NNPTNT', 'T??y Ninh', '000.08.10.H53', '000.08.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759797, 'Trung t??m Khuy???n n??ng - S??? NNPTNT', 'T??y Ninh', '000.09.10.H53', '000.09.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759798, 'Trung t??m N?????c s???ch v?? V??? sinh m??i tr?????ng n??ng th??n - S??? NNPTNT', 'T??y Ninh', '000.10.10.H53', '000.10.10.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759799, 'S??? T??i nguy??n v?? M??i tr?????ng', 'T??y Ninh', '000.00.12.H53', '000.00.12.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759800, 'Chi c???c B???o v??? m??i tr?????ng - S??? TNMT', 'T??y Ninh', '000.01.12.H53', '000.01.12.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759801, 'Chi c???c Qu???n l?? ?????t ??ai - S??? TNMT', 'T??y Ninh', '000.02.12.H53', '000.02.12.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759802, 'Trung t??m C??ng ngh??? th??ng tin??t??i nguy??n v?? m??i tr?????ng - S??? TNMT', 'T??y Ninh', '000.03.12.H53', '000.03.12.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759803, 'Trung t??m Ph??t tri???n qu??? ?????t - S??? TNMT', 'T??y Ninh', '000.04.12.H53', '000.04.12.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759804, 'Trung t??m Quan tr???c t??i nguy??n v?? m??i tr?????ng - S??? TNMT', 'T??y Ninh', '000.05.12.H53', '000.05.12.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759805, 'V??n ph??ng ????ng k?? ?????t ??ai - S??? TNMT', 'T??y Ninh', '000.06.12.H53', '000.06.12.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759806, 'S??? Th??ng tin v?? Truy???n th??ng', 'T??y Ninh', '000.00.13.H53', '000.00.13.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759808, 'S??? T?? ph??p', 'T??y Ninh', '000.00.14.H53', '000.00.14.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759809, 'Ph??ng C??ng ch???ng s??? 1??? - S??? T?? ph??p', 'T??y Ninh', '000.01.14.H53', '000.01.14.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759810, 'Ph??ng C??ng ch???ng s??? 2 - S??? T?? ph??p', 'T??y Ninh', '000.02.14.H53', '000.02.14.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759811, 'Ph??ng C??ng ch???ng s??? 3 - S??? T?? ph??p', 'T??y Ninh', '000.03.14.H53', '000.03.14.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759812, 'Trung t??m D???ch v??? b??n ?????u gi?? t??i s???n????? - S??? T?? ph??p', 'T??y Ninh', '000.04.14.H53', '000.04.14.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759813, 'Trung??t??m Tr??? gi??p ph??p l?? nh?? n?????c t???nh T??y Ninh - S??? T?? ph??p', 'T??y Ninh', '000.05.14.H53', '000.05.14.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759814, 'S??? V??n h??a, Th??? thao v?? Du l???ch', 'T??y Ninh', '000.00.15.H53', '000.00.15.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759815, 'B???o t??ng t???nh - S??? VHTTDL', 'T??y Ninh', '000.01.15.H53', '000.01.15.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759816, '??o??n Ngh??? thu???t t???nh - S??? VHTTDL', 'T??y Ninh', '000.02.15.H53', '000.02.15.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759817, 'Th?? vi???n t???nh - S??? VHTTDL', 'T??y Ninh', '000.03.15.H53', '000.03.15.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759818, 'Trung t??m Hu???n luy???n v?? Thi ?????u Th??? d???c Th??? thao - S??? VHTTDL', 'T??y Ninh', '000.04.15.H53', '000.04.15.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759819, 'Trung t??m Ph??t h??nh Phim v?? Chi???u b??ng - S??? VHTTDL', 'T??y Ninh', '000.05.15.H53', '000.05.15.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759820, 'Trung t??m V??n h??a t???nh - S??? VHTTDL', 'T??y Ninh', '000.06.15.H53', '000.06.15.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759821, 'Trung t??m Th??ng tin X??c ti???n du l???ch T??y Ninh - S??? VHTTDL', 'T??y Ninh', '000.07.15.H53', '000.07.15.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759822, 'S??? X??y d???ng', 'T??y Ninh', '000.00.16.H53', '000.00.16.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759823, 'Thanh Tra S??? - S??? X??y d???ng', 'T??y Ninh', '000.01.16.H53', '000.01.16.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759824, 'Trung t??m Quy ho???ch v?? Gi??m ?????nh ch???t l?????ng x??y d???ng - S??? X??y d???ng', 'T??y Ninh', '000.02.16.H53', '000.02.16.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759825, 'S??? Y t???', 'T??y Ninh', '000.00.17.H53', '000.00.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759826, 'B???nh vi???n Da khoa t???nh T??y Ninh', 'T??y Ninh', '000.01.17.H53', '000.01.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759827, 'B???nh vi???n??Lao v?? B???nh ph???i t???nh T??y Ninh', 'T??y Ninh', '000.02.17.H53', '000.02.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759828, 'B???nh vi???n??Ph???c h???i ch???c n??ng t???nh T??y Ninh', 'T??y Ninh', '000.03.17.H53', '000.03.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759829, 'B???nh vi???n Y d?????c C??? truy???n t???nh T??y Ninh', 'T??y Ninh', '000.04.17.H53', '000.04.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759830, 'Chi c???c An to??n v??? sinh Th???c ph???m', 'T??y Ninh', '000.05.17.H53', '000.05.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759831, 'Chi c???c D??n s??? - K??? ho???ch ho?? gia ????nh', 'T??y Ninh', '000.06.17.H53', '000.06.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759832, 'Trung t??m Ch??m s??c S???c kh???e Sinh s???n', 'T??y Ninh', '000.07.17.H53', '000.07.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759833, 'Trung t??m Gi??m ?????nh Y khoa t???nh T??y Ninh', 'T??y Ninh', '000.08.17.H53', '000.08.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759834, 'Trung t??m Ki???m d???ch Y t??? Qu???c t???', 'T??y Ninh', '000.09.17.H53', '000.09.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759835, 'Trung t??m Ki???m nghi???m thu???c, m??? ph???m, th???c ph???m ', 'T??y Ninh', '000.10.17.H53', '000.10.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759836, 'Trung t??m Ki???m so??t b???nh t???t t???nh T??y Ninh', 'T??y Ninh', '000.11.17.H53', '000.11.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759837, 'Trung t??m Ph??p y t???nh T??y Ninh', 'T??y Ninh', '000.12.17.H53', '000.12.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759838, 'Trung t??m Y t??? th??nh ph??? T??y Ninh', 'T??y Ninh', '000.13.17.H53', '000.13.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759839, 'Trung t??m Y t??? huy???n??B???n C???u', 'T??y Ninh', '000.14.17.H53', '000.14.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759840, 'Trung t??m Y t??? huy???n??Ch??u Th??nh', 'T??y Ninh', '000.15.17.H53', '000.15.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759841, 'Trung t??m Y t??? huy???n??D????ng Minh Ch??u', 'T??y Ninh', '000.16.17.H53', '000.16.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759842, 'Trung t??m Y t??? huy???n??G?? D???u', 'T??y Ninh', '000.17.17.H53', '000.17.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759843, 'Trung t??m Y t??? huy???n??Ho?? Th??nh', 'T??y Ninh', '000.18.17.H53', '000.18.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759844, 'Trung t??m Y t??? huy???n??T??n Bi??n', 'T??y Ninh', '000.19.17.H53', '000.19.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759845, 'Trung t??m Y t??? huy???n??T??n Ch??u', 'T??y Ninh', '000.20.17.H53', '000.20.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759846, 'Trung t??m Y t??? huy???n??Tr???ng B??ng', 'T??y Ninh', '000.21.17.H53', '000.21.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759847, 'Tr?????ng Trung c???p Y t??? t???nh T??y Ninh', 'T??y Ninh', '000.22.17.H53', '000.22.17.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759848, 'UBND Th??nh ph??? T??y Ninh', 'T??y Ninh', '000.00.30.H53', '000.00.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759849, 'V??n ph??ng H??ND-UBND th??nh ph??? T??y Ninh', 'T??y Ninh', '000.01.30.H53', '000.01.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759850, 'Ph??ng Gi??o d???c v?? ????o t???o th??nh ph??? T??y Ninh', 'T??y Ninh', '000.02.30.H53', '000.02.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759851, 'Ph??ng Kinh t??? v?? H??? t???ng??? th??nh ph??? T??y Ninh', 'T??y Ninh', '000.03.30.H53', '000.03.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759852, 'Ph??ng Lao ?????ng Th????ng binh v?? UBND X?? h???i th??nh ph??? T??y Ninh', 'T??y Ninh', '000.04.30.H53', '000.04.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759853, 'Ph??ng N???i v??? th??nh ph??? T??y Ninh', 'T??y Ninh', '000.05.30.H53', '000.05.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759854, 'Ph??ng N??ng nghi???p v?? Ph??t tri???n n??ng th??n th??nh ph??? T??y Ninh', 'T??y Ninh', '000.06.30.H53', '000.06.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759855, 'Ph??ng T??i ch??nh - K??? ho???ch th??nh ph??? T??y Ninh', 'T??y Ninh', '000.07.30.H53', '000.07.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759856, 'Ph??ng T??i nguy??n v?? M??i tr?????ng th??nh ph??? T??y Ninh', 'T??y Ninh', '000.08.30.H53', '000.08.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759857, 'Ph??ng T?? ph??p??? th??nh ph??? T??y Ninh', 'T??y Ninh', '000.09.30.H53', '000.09.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759858, 'Ph??ng V??n h??a v?? Th??ng tin??? th??nh ph??? T??y Ninh', 'T??y Ninh', '000.10.30.H53', '000.10.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759859, 'Ph??ng Y t??? th??nh ph??? T??y Ninh', 'T??y Ninh', '000.11.30.H53', '000.11.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759860, 'Thanh tra th??nh ph??? T??y Ninh', 'T??y Ninh', '000.12.30.H53', '000.12.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759861, 'UBND Ph?????ng 1 th??nh ph??? T??y Ninh', 'T??y Ninh', '000.20.30.H53', '000.20.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759862, 'UBND Ph?????ng 2 th??nh ph??? T??y Ninh', 'T??y Ninh', '000.21.30.H53', '000.21.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759863, 'UBND Ph?????ng 3 th??nh ph??? T??y Ninh', 'T??y Ninh', '000.22.30.H53', '000.22.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759864, 'UBND Ph?????ng 4 th??nh ph??? T??y Ninh', 'T??y Ninh', '000.23.30.H53', '000.23.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759865, 'UBND X?? B??nh Minh th??nh ph??? T??y Ninh', 'T??y Ninh', '000.24.30.H53', '000.24.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759866, 'UBND Ph?????ng Hi???p Ninh th??nh ph??? T??y Ninh', 'T??y Ninh', '000.25.30.H53', '000.25.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759867, 'UBND Ph?????ng Ninh S??n th??nh ph??? T??y Ninh', 'T??y Ninh', '000.26.30.H53', '000.26.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759868, 'UBND Ph?????ng Ninh Th???nh th??nh ph??? T??y Ninh', 'T??y Ninh', '000.27.30.H53', '000.27.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759869, 'UBND X?? T??n B??nh th??nh ph??? T??y Ninh', 'T??y Ninh', '000.28.30.H53', '000.28.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2759870, 'UBND X?? Th???nh T??n th??nh ph??? T??y Ninh', 'T??y Ninh', '000.29.30.H53', '000.29.30.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2760014, 'Qu??? ?????u t?? ph??t tri???n t???nh T??y Ninh', 'T??y Ninh', '000.00.49.H53', '000.00.49.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2760028, 'Ban qu???n l?? C???a kh???u qu???c t??? M???c B??i', 'T??y Ninh', '000.00.50.H53', '000.00.50.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2760042, 'Ban qu???n l?? C???a kh???u qu???c t??? Xa M??t', 'T??y Ninh', '000.00.51.H53', '000.00.51.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2760065, 'T???nh ???y T??y Ninh', 'T??y Ninh', '000.00.52.H53', '000.00.52.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2760079, 'VP H??N?? t???nh T??y Ninh', 'T??y Ninh', '000.00.53.H53', '000.00.53.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2760093, 'B??? ch??? huy qu??n s??? t???nh T??y Ninh ', 'T??y Ninh', '000.00.54.H53', '000.00.54.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2776441, 'H???i ?????ng nh??n d??n t???nh T??y Ninh', 'T??y Ninh', '000.00.55.H53', '000.00.55.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2776455, 'Qu??? B???o v??? M??i tr?????ng t???nh T??y Ninh', 'T??y Ninh', '000.00.56.H53', '000.00.56.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2776469, 'Qu??? H??? tr??? Ph??t tri???n H???p t??c x?? t???nh T??y Ninh', 'T??y Ninh', '000.00.57.H53', '000.00.57.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2776483, 'Qu??? Ph??t tri???n ?????t t???nh T??y Ninh', 'T??y Ninh', '000.00.58.H53', '000.00.58.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2808810, 'Kho b???c nh?? n?????c t???nh T??y Ninh', 'T??y Ninh', '000.00.59.H53', '000.00.59.H53@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2808858, 'TT C??ng ngh??? th??ng tin??v?? Truy???n th??ng - S??? TTTT', 'TN', '000.01.13.H53', '000.01.13.H53@bmail.vn', 'TN', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853408, 'B??? C??ng an', 'T??y Ninh', '000.00.00.G01', '000.00.00.G01@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853422, 'B??? C??ng Th????ng', 'T??y Ninh', '000.00.00.G02', '000.00.00.G02@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853436, 'B??? Gi??o d???c v?? ????o t???o', 'T??y Ninh', '000.00.00.G03', '000.00.00.G03@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853450, 'B??? Giao th??ng v???n t???i', 'T??y Ninh', '000.00.00.G04', '000.00.00.G04@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853464, 'B??? K??? ho???ch ?????u t??', 'T??y Ninh', '000.00.00.G05', '000.00.00.G05@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853478, 'B??? Khoa h???c v?? C??ng ngh???', 'T??y Ninh', '000.00.00.G06', '000.00.00.G06@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853492, 'B??? Lao ?????ng, Th????ng binh v?? X?? h???i', 'T??y Ninh', '000.00.00.G07', '000.00.00.G07@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853506, 'B??? Ngo???i giao', 'T??y Ninh', '000.00.00.G08', '000.00.00.G08@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853520, 'B??? N???i v???', 'T??y Ninh', '000.00.00.G09', '000.00.00.G09@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853534, 'B??? N??ng nghi???p v?? Ph??t tri???n n??ng th??n', 'T??y Ninh', '000.00.00.G10', '000.00.00.G10@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853548, 'B??? Qu???c ph??ng', 'T??y Ninh', '000.00.00.G11', '000.00.00.G11@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853562, 'B??? T??i ch??nh', 'T??y Ninh', '000.00.00.G12', '000.00.00.G12@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853576, 'B??? T??i nguy??n v?? M??i tr?????ng', 'T??y Ninh', '000.00.00.G13', '000.00.00.G13@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853590, 'B??? Th??ng tin v?? Truy???n th??ng', 'T??y Ninh', '000.00.00.G14', '000.00.00.G14@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853604, 'B??? T?? Ph??p', 'T??y Ninh', '000.00.00.G15', '000.00.00.G15@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853618, 'B??? V??n h??a-Th??? thao-Du l???ch', 'T??y Ninh', '000.00.00.G16', '000.00.00.G16@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853632, 'B??? X??y d???ng', 'T??y Ninh', '000.00.00.G17', '000.00.00.G17@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853646, 'B??? Y T??? ', 'T??y Ninh', '000.00.00.G18', '000.00.00.G18@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853660, 'Ng??n h??ng Nh?? n?????c Vi???t Nam', 'T??y Ninh', '000.00.00.G19', '000.00.00.G19@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853674, 'Thanh tra Ch??nh ph???', 'T??y Ninh', '000.00.00.G20', '000.00.00.G20@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853688, '???y Ban D??n t???c T??', 'T??y Ninh', '000.00.00.G21', '000.00.00.G21@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853702, 'V??n ph??ng Ch??nh ph???', 'T??y Ninh', '000.00.00.G22', '000.00.00.G22@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853716, 'B???o hi???m x?? h???i Vi???t Nam', 'T??y Ninh', '000.00.00.G24', '000.00.00.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853730, '????i ti???ng n??i Vi???t Nam', 'T??y Ninh', '000.00.00.G27', '000.00.00.G27@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853744, '????i truy???n h??nh Vi???t Nam', 'T??y Ninh', '000.00.00.G28', '000.00.00.G28@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2853763, 'C???c Tin h???c h??a - B??? Th??ng tin v?? Truy???n th??ng', 'VN', '000.00.27.G14', '000.00.27.G14@bmail.vn', 'VN', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2937666, 'B???o hi???m x?? h???i t???nh T??y Ninh', 'T??y Ninh', '000.00.80.G24', '000.00.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2937680, 'B???o hi???m x?? h???i th??nh ph??? T??y Ninh, t???nh T??y Ninh', 'T??y Ninh', '000.01.80.G24', '000.01.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2937694, 'B???o hi???m x?? h???i huy???n T??n Bi??n t???nh T??y Ninh', 'T??y Ninh', '000.02.80.G24', '000.02.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2956008, 'B???o hi???m x?? h???i huy???n T??n Ch??u t???nh T??y Ninh ', 'T??y Ninh', '000.03.80.G24', '000.03.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2956022, 'B???o hi???m x?? h???i huy???n D????ng Minh Ch??u t???nh T??y Ninh ', 'T??y Ninh', '000.05.80.G24', '000.05.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2956036, 'B???o hi???m x?? h???i huy???n Ch??u Th??nh t???nh T??y Ninh', 'T??y Ninh', '000.06.80.G24', '000.06.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2956050, 'B???o hi???m x?? h???i huy???n H??a Th??nh t???nh T??y Ninh', 'T??y Ninh', '000.07.80.G24', '000.07.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2956064, 'B???o hi???m x?? h???i huy???n G?? D???u t???nh T??y Ninh', 'T??y Ninh', '000.08.80.G24', '000.08.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2956078, 'B???o hi???m x?? h???i huy???n B???n C???u t???nh T??y Ninh ', 'T??y Ninh', '000.09.80.G24', '000.09.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (2956092, 'B???o hi???m x?? h???i huy???n Tr???ng B??ng t???nh T??y Ninh ', 'T??y Ninh', '000.10.80.G24', '000.10.80.G24@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3189541, 'C???c An to??n th??ng tin - B??? Th??ng tin v?? Truy???n th??ng', 'VN', '000.00.28.G14', '000.00.28.G14@bmail.vn', 'VN', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272269, 'V??n ph??ng B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.01.G14', '000.00.01.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272283, 'Thanh tra B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.02.G14', '000.00.02.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272297, 'V??? B??u ch??nh - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.03.G14', '000.00.03.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272611, 'V??? C??ng ngh??? th??ng tin - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.04.G14', '000.00.04.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272625, 'V??? Khoa h???c v?? C??ng ngh??? - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.05.G14', '000.00.05.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272639, 'V??? K??? ho???ch - T??i ch??nh - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.06.G14', '000.00.06.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272653, 'V??? Qu???n l?? doanh nghi???p - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.07.G14', '000.00.07.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272667, 'V??? H???p t??c qu???c t??? - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.08.G14', '000.00.08.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272681, 'V??? Ph??p ch??? - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.09.G14', '000.00.09.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272695, 'V??? Thi ??ua - Khen th?????ng - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.10.G14', '000.00.10.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272709, 'V??? T??? ch???c c??n b??? - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.11.G14', '000.00.11.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272723, 'C???c B??o ch?? - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.20.G14', '000.00.20.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272737, 'C???c ph??t thanh truy???n h??nh v?? th??ng tin ??i???n t??? - B??? TTTT', 'Vi???t Nam', '000.00.21.G14', '000.00.21.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272751, 'C???c xu???t b???n, In v?? Ph??t h??nh - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.22.G14', '000.00.22.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272765, 'C???c Th??ng tin c?? s??? - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.23.G14', '000.00.23.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272779, 'C???c Th??ng tin ?????i ngo???i - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.24.G14', '000.00.24.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272793, 'C???c Vi???n th??ng - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.25.G14', '000.00.25.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272807, 'C???c T???n s??? v?? tuy???n ??i???n - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.26.G14', '000.00.26.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272821, 'C???c B??u ??i???n Trung ????ng - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.29.G14', '000.00.29.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272835, 'Vi???n Chi???n l?????c Th??ng tin v?? Truy???n th??ng - B??? TTTT', 'Vi???t Nam', '000.00.40.G14', '000.00.40.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272849, 'Trung t??m Th??ng tin - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.41.G14', '000.00.41.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272863, 'B??o B??u ??i???n Vi???t Nam - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.42.G14', '000.00.42.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272877, 'B??o ??i???n t??? VietnamNet - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.43.G14', '000.00.43.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272891, 'T???p ch?? Th??ng tin v?? Truy???n th??ng - B??? Th??ng tin truy???n th??ng', 'Vi???t Nam', '000.00.44.G14', '000.00.44.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272905, 'H???c vi???n C??ng ngh??? b??u ch??nh, vi???n th??ng', 'Vi???t Nam', '000.00.45.G14', '000.00.45.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272919, 'Tr?????ng ????o t???o, B???i d?????ng c??n b??? qu???n l?? Th??ng tin v?? Truy???n th??ng', 'Vi???t Nam', '000.00.46.G14', '000.00.46.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272933, 'Trung t??m Internet Vi???t Nam (VNNIC)', 'Vi???t Nam', '000.00.47.G14', '000.00.47.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272947, 'Vi???n C??ng nghi???p ph???n m???m v?? n???i dung s??? Vi???t Nam', 'Vi???t Nam', '000.00.48.G14', '000.00.48.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272961, 'Nh?? Xu???t b???n Th??ng tin v?? Truy???n th??ng', 'Vi???t Nam', '000.00.49.G14', '000.00.49.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272975, 'Qu??? d???ch v??? Vi???n th??ng c??ng ??ch Vi???t Nam', 'Vi???t Nam', '000.00.50.G14', '000.00.50.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3272989, 'Trung t??m ???ng c???u kh???n c???p m??y t??nh Vi???t Nam', 'Vi???t Nam', '000.00.51.G14', '000.00.51.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3273003, 'Tr?????ng Cao ?????ng CNTT H???u ngh??? Vi???t - H??n', 'Vi???t Nam', '000.00.52.G14', '000.00.52.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3273017, 'Tr?????ng Cao ?????ng C??ng nghi???p In', 'Vi???t Nam', '000.00.53.G14', '000.00.53.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3273031, 'Trung t??m Ch???ng th???c ??i???n t??? qu???c gia', 'Vi???t Nam', '000.00.54.G14', '000.00.54.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3273045, 'Ban Qu???n l?? Ch????ng tr??nh cung c???p d???ch v??? vi???n th??ng c??ng ??ch', 'Vi???t Nam', '000.00.55.G14', '000.00.55.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3273059, 'T???ng c??ng ty B??u ??i???n Vi???t Nam', 'Vi???t Nam', '000.00.80.G14', '000.00.80.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3273073, 'T???ng c??ng ty Vi???n th??ng MibiFone', 'Vi???t Nam', '000.00.81.G14', '000.00.81.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3273087, 'T???ng c??ng ty Truy???n th??ng ??a ph????ng ti???n - VTC', 'Vi???t Nam', '000.00.82.G14', '000.00.82.G14@bmail.vn', 'Vi???t Nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3385114, 'C??ng an t???nh T??y Ninh', 'TN', '000.00.60.H53', '000.00.60.H53@bmail.vn', 'TN', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3385128, 'H???i v??n h???c ngh??? thu???t t???nh T??y Ninh', 'TN', '000.00.61.H53', '000.00.61.H53@bmail.vn', 'TN', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3663231, 'B??? T?? Ph??p - CQCP', 'VN', '000.00.00.G15', '000.00.00.G15@bmail.vn', 'VN', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3688037, 'C???c b??u ??i???n trung ????ng - B??? th??ng tin v?? truy???n th??ng', 'T??y Ninh', '000.00.29.G14', '000.00.29.G14@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3688054, 'C???c Vi???n th??ng - B??? th??ng tin v?? truy???n th??ng', 'T??y Ninh', '000.00.25.G14', '000.00.25.G14@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3688074, 'Trung t??m Gi??m s??t an to??n kh??ng gian m???ng - C???c An to??n th??ng tin', 'Vi???t nam', '000.01.28.G14', '000.01.28.G14@bmail.vn', 'Vi???t nam', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (3688100, 'C???c xu???t b???n, In v?? Ph??t h??nh - B??? Th??ng tin v?? Truy???n th??ng', 'T??y Ninh', '000.00.22.G14', '000.00.22.G14@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (4000714, 'C???c Th??ng tin c?? s???', 'T??y Ninh', '000.00.23.G14', '000.00.23.G14@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (4000728, 'C???c B??o ch??', 'T??y Ninh', '000.00.20.G14', '000.00.20.G14@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);
INSERT INTO `edoc_dynamiccontact` VALUES (4000742, 'C???c T???n s??? v?? tuy???n ??i???n', 'T??y Ninh', '000.00.26.G14', '000.00.26.G14@bmail.vn', 'T??y Ninh', '0975280222', '', '', NULL, NULL);

-- ----------------------------
-- Table structure for edoc_notification
-- ----------------------------
DROP TABLE IF EXISTS `edoc_notification`;
CREATE TABLE `edoc_notification`  (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receiver_id` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_id` bigint(20) NULL DEFAULT NULL,
  `send_number` int(11) NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `modified_date` datetime(0) NULL DEFAULT NULL,
  `due_date` datetime(0) NULL DEFAULT NULL,
  `taken` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`notification_id`) USING BTREE,
  INDEX `organTaken`(`receiver_id`, `taken`) USING BTREE,
  INDEX `documentId`(`document_id`) USING BTREE,
  INDEX `organDocument`(`receiver_id`, `document_id`) USING BTREE,
  INDEX `documentTaken`(`document_id`, `taken`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2718 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_notification
-- ----------------------------
INSERT INTO `edoc_notification` VALUES (2690, '000.00.21.H53', 273, 0, '2020-08-14 17:36:09', '2020-08-14 17:36:09', NULL, 1);
INSERT INTO `edoc_notification` VALUES (2691, '000.00.13.H53', 274, 0, '2020-08-14 17:53:21', '2020-08-14 17:53:21', NULL, 1);
INSERT INTO `edoc_notification` VALUES (2692, '000.00.13.H53', 275, 0, '2020-08-14 18:01:18', '2020-08-14 18:01:18', NULL, 1);
INSERT INTO `edoc_notification` VALUES (2693, '000.00.21.H53', 276, 0, '2020-08-14 18:57:01', '2020-08-14 18:57:01', NULL, 1);
INSERT INTO `edoc_notification` VALUES (2694, '000.00.21.H53', 277, 0, '2020-08-14 19:06:01', '2020-08-14 19:06:01', NULL, 1);
INSERT INTO `edoc_notification` VALUES (2695, '000.00.13.H53', 278, 0, '2020-08-14 19:13:25', '2020-08-14 19:13:25', NULL, 1);
INSERT INTO `edoc_notification` VALUES (2696, '000.00.13.H53', 279, 0, '2020-08-15 09:06:49', '2020-08-15 09:06:49', '2020-08-15 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2697, '000.00.23.H53', 280, 0, '2020-08-15 11:27:30', '2020-08-15 11:27:30', NULL, 0);
INSERT INTO `edoc_notification` VALUES (2698, '000.00.21.H53', 281, 0, '2020-08-15 13:21:58', '2020-08-15 13:21:58', '2020-08-15 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2699, '000.00.01.H53', 282, 0, '2020-08-19 18:18:06', '2020-08-19 18:18:06', '2020-08-20 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2700, '000.01.01.H53', 283, 0, '2020-08-19 18:43:32', '2020-08-19 18:43:32', '2020-08-12 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2701, '000.00.01.H53', 284, 0, '2020-08-20 11:53:15', '2020-08-20 11:53:15', '2020-08-22 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2702, '000.02.01.H53', 284, 0, '2020-08-20 11:53:15', '2020-08-20 11:53:15', '2020-08-22 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2703, '000.12.31.H53', 284, 0, '2020-08-20 11:53:15', '2020-08-20 11:53:15', '2020-08-22 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2704, '000.28.31.H53', 285, 0, '2020-08-22 21:42:19', '2020-08-22 21:42:19', NULL, 0);
INSERT INTO `edoc_notification` VALUES (2705, '000.01.32.H53', 285, 0, '2020-08-22 21:42:19', '2020-08-24 00:22:20', NULL, 1);
INSERT INTO `edoc_notification` VALUES (2706, '000.01.33.H53', 285, 0, '2020-08-22 21:42:19', '2020-08-24 00:17:34', NULL, 1);
INSERT INTO `edoc_notification` VALUES (2707, '000.00.01.H53', 286, 0, '2020-08-22 21:48:06', '2020-08-24 00:07:51', '2020-08-22 00:00:00', 1);
INSERT INTO `edoc_notification` VALUES (2708, '000.10.32.H53', 287, 0, '2020-08-24 23:27:10', '2020-08-24 23:27:10', '2020-08-24 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2709, '000.00.01.H53', 288, 0, '2020-08-31 00:28:47', '2020-08-31 00:28:47', '2020-08-25 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2710, '000.20.31.H53', 288, 0, '2020-08-31 00:28:47', '2020-08-31 00:28:47', '2020-08-25 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2711, '000.00.01.H53', 289, 0, '2020-08-31 00:31:17', '2020-08-31 00:31:17', '2020-08-31 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2712, '000.02.01.H53', 290, 0, '2020-09-02 17:21:47', '2020-09-02 17:21:47', '2020-09-03 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2713, '000.00.13.H53', 291, 0, '2020-09-04 14:41:28', '2020-09-04 14:41:28', NULL, 0);
INSERT INTO `edoc_notification` VALUES (2714, '000.00.12.H53', 292, 0, '2020-09-04 14:47:45', '2020-09-04 14:47:45', '2020-09-19 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2715, '000.00.13.H53', 293, 0, '2020-09-04 14:52:28', '2020-09-04 14:52:28', '2020-09-11 00:00:00', 0);
INSERT INTO `edoc_notification` VALUES (2716, '000.00.13.H53', 294, 0, '2020-09-05 12:40:13', '2020-09-05 12:40:13', NULL, 0);
INSERT INTO `edoc_notification` VALUES (2717, '000.00.13.H53', 295, 0, '2020-09-05 12:42:16', '2020-09-05 12:42:16', '2020-09-19 00:00:00', 0);

-- ----------------------------
-- Table structure for edoc_priority
-- ----------------------------
DROP TABLE IF EXISTS `edoc_priority`;
CREATE TABLE `edoc_priority`  (
  `priority_id` int(20) NOT NULL AUTO_INCREMENT,
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`priority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_priority
-- ----------------------------
INSERT INTO `edoc_priority` VALUES (1, 'Kh???n');
INSERT INTO `edoc_priority` VALUES (2, 'Th?????ng kh???n');
INSERT INTO `edoc_priority` VALUES (3, 'H???a t???c');
INSERT INTO `edoc_priority` VALUES (4, 'H???a t???c h???n gi???');
INSERT INTO `edoc_priority` VALUES (5, 'Th?????ng');

-- ----------------------------
-- Table structure for edoc_trace
-- ----------------------------
DROP TABLE IF EXISTS `edoc_trace`;
CREATE TABLE `edoc_trace`  (
  `trace_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) NULL DEFAULT NULL,
  `time_stamp` datetime(0) NULL DEFAULT NULL,
  `server_time_stamp` datetime(0) NULL DEFAULT NULL,
  `organization_in_charge` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organ_name` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organ_add` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_organ_domain` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_organ_domain` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code_` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_name` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promulgation_date` datetime(0) NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status_code` bigint(20) NULL DEFAULT NULL,
  `enable` tinyint(4) NULL DEFAULT NULL,
  `staff_email` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_mobile` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edxml_document_id` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`trace_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_trace
-- ----------------------------
INSERT INTO `edoc_trace` VALUES (1, 280, '2020-08-20 17:37:45', '2020-08-20 17:37:45', 'test', 'test', NULL, '', NULL, '000.00.13.H53', NULL, NULL, '000.00.13.H53', '1295/STTTT-TTBCXB', 'V??n th??', 'Nguy???n Th??? Kim H?? k???t th??c v??n b???n v??o l??c 12/08/2020 16:21:45: ', '2020-08-12 00:00:00', '', 2, 0, NULL, '', '000.00.13.H53,2020/08/20,1295/STTTT-TTBCXB');
INSERT INTO `edoc_trace` VALUES (2, 272, '2020-08-20 17:37:45', '2020-08-20 17:37:45', 'test', 'test', NULL, '', NULL, '000.00.13.H53', NULL, NULL, '000.00.13.H53', '1308/BC-STTTT_test', 'V??n th??', 'Nguy???n Th??? Kim H?? k???t th??c v??n b???n v??o l??c 14/08/2020 15:34:26: ', '2020-08-14 00:00:00', '', 2, 0, NULL, '', '000.00.13.H53,2020/08/20,1308/BC-STTTT_test');
INSERT INTO `edoc_trace` VALUES (3, 280, '2020-08-20 17:38:45', '2020-08-20 17:37:45', 'test', 'test', NULL, '', NULL, '000.00.13.H53', NULL, NULL, '000.00.13.H53', '1295/STTTT-TTBCXB', 'V??n th??', 'Nguy???n Th??? Kim H?? k???t th??c v??n b???n v??o l??c 12/08/2020 16:21:45: ', '2020-08-12 00:00:00', '', 2, 0, NULL, '', '000.00.13.H53,2020/08/20,1295/STTTT-TTBCXB');
INSERT INTO `edoc_trace` VALUES (4, 280, '2020-08-20 17:39:45', '2020-08-20 17:37:45', 'test', 'test', NULL, '', NULL, '000.00.13.H53', NULL, NULL, '000.00.13.H53', '1295/STTTT-TTBCXB', 'V??n th??', 'Nguy???n Th??? Kim H?? k???t th??c v??n b???n v??o l??c 12/08/2020 16:21:45: ', '2020-08-12 00:00:00', '', 2, 0, NULL, '', '000.00.13.H53,2020/08/20,1295/STTTT-TTBCXB');
INSERT INTO `edoc_trace` VALUES (5, 280, '2020-08-20 17:40:45', '2020-08-20 17:37:45', 'test', 'test', NULL, '', NULL, '000.00.13.H53', NULL, NULL, '000.00.13.H53', '1295/STTTT-TTBCXB', 'V??n th??', 'Nguy???n Th??? Kim H?? k???t th??c v??n b???n v??o l??c 12/08/2020 16:21:45: ', '2020-08-12 00:00:00', '', 2, 0, NULL, '', '000.00.13.H53,2020/08/20,1295/STTTT-TTBCXB');

-- ----------------------------
-- Table structure for edoc_trace_header
-- ----------------------------
DROP TABLE IF EXISTS `edoc_trace_header`;
CREATE TABLE `edoc_trace_header`  (
  `trace_header_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organ_domain` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_stamp` datetime(0) NULL DEFAULT NULL,
  `document_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`trace_header_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_trace_header
-- ----------------------------
INSERT INTO `edoc_trace_header` VALUES (144, '000.00.13.H53', '0020-02-11 00:00:00', 272);
INSERT INTO `edoc_trace_header` VALUES (145, '000.00.13.H53', '2020-08-14 00:00:00', 273);
INSERT INTO `edoc_trace_header` VALUES (146, '000.00.13.H53', '0020-02-12 00:00:00', 274);
INSERT INTO `edoc_trace_header` VALUES (147, '000.00.13.H53', '2020-08-14 00:00:00', 275);
INSERT INTO `edoc_trace_header` VALUES (148, '000.00.13.H53', '2020-08-14 00:00:00', 276);
INSERT INTO `edoc_trace_header` VALUES (149, '000.00.13.H53', '2020-08-14 00:00:00', 277);
INSERT INTO `edoc_trace_header` VALUES (150, '000.00.13.H53', '2020-08-14 00:00:00', 278);
INSERT INTO `edoc_trace_header` VALUES (151, '000.00.13.H53', '2020-08-15 00:00:00', 279);
INSERT INTO `edoc_trace_header` VALUES (152, '000.00.13.H53', NULL, 280);
INSERT INTO `edoc_trace_header` VALUES (153, '000.00.13.H53', '2020-08-15 00:00:00', 281);
INSERT INTO `edoc_trace_header` VALUES (154, '000.00.13.H53', '2020-08-19 00:00:00', 282);
INSERT INTO `edoc_trace_header` VALUES (155, '000.00.13.H53', '2020-08-19 00:00:00', 283);
INSERT INTO `edoc_trace_header` VALUES (156, '000.00.13.H53', '2020-08-20 00:00:00', 284);
INSERT INTO `edoc_trace_header` VALUES (157, '000.00.13.H53', '2020-08-22 00:00:00', 285);
INSERT INTO `edoc_trace_header` VALUES (158, '000.00.13.H53', '2020-08-22 00:00:00', 286);
INSERT INTO `edoc_trace_header` VALUES (159, '000.00.13.H53', '2020-08-24 00:00:00', 287);
INSERT INTO `edoc_trace_header` VALUES (160, '000.00.13.H53', '2020-08-31 00:00:00', 288);
INSERT INTO `edoc_trace_header` VALUES (161, '000.00.13.H53', '2020-08-31 00:00:00', 289);
INSERT INTO `edoc_trace_header` VALUES (162, '000.00.13.H53', '2020-09-02 00:00:00', 290);
INSERT INTO `edoc_trace_header` VALUES (163, '000.00.12.H53', '2020-09-04 00:00:00', 291);
INSERT INTO `edoc_trace_header` VALUES (164, '000.00.13.H53', '2020-09-04 00:00:00', 292);
INSERT INTO `edoc_trace_header` VALUES (165, '000.00.13.H53', '2020-09-04 00:00:00', 293);
INSERT INTO `edoc_trace_header` VALUES (166, '000.00.13.H53', '2020-09-05 00:00:00', 294);
INSERT INTO `edoc_trace_header` VALUES (167, '000.00.12.H53', '2020-09-05 00:00:00', 295);

-- ----------------------------
-- Table structure for edoc_trace_header_list
-- ----------------------------
DROP TABLE IF EXISTS `edoc_trace_header_list`;
CREATE TABLE `edoc_trace_header_list`  (
  `document_id` bigint(20) NOT NULL,
  `business_doc_type` tinyint(4) NULL DEFAULT NULL,
  `business_doc_reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paper` tinyint(4) NULL DEFAULT NULL,
  `department` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `business_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edoc_trace_header_list
-- ----------------------------
INSERT INTO `edoc_trace_header_list` VALUES (272, 0, 'V??n b???n m???i', 1, 'S??? 4T', 'Nguy???n th??? kim h??', '0987654321', 'hantk@s4t.tayninh.gov.vn', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (273, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (274, 0, 'V??n b???n m???i', 1, 'S??? 4T', 'Nguy???n th??? kim h??', '0987654321', 'hantk@s4t.tayninh.gov.vn', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (275, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (276, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (277, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (278, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (279, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (280, 0, 'V??n b???n m???i', 1, 'S??? 4T', 'Nguy???n th??? kim h??', '0987654321', 'hantk@s4t.tayninh.gov.vn', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (281, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (282, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (283, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (284, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (285, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Chu V??n Quang', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (286, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Chu V??n Quang', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (287, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Chu V??n Quang', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (288, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Chu V??n Quang', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (289, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Chu V??n Quang', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (290, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Ho??ng V??n S??n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (291, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Chu V??n Quang', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (292, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'B??i S??n ??i???n', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (293, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Ho??ng Ng???c Kh??nh', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (294, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Test', '', '', NULL);
INSERT INTO `edoc_trace_header_list` VALUES (295, 0, 'V??n b???n ??i???n t??? m???i', 0, '', 'Quang', '', '', NULL);

-- ----------------------------
-- Table structure for user_
-- ----------------------------
DROP TABLE IF EXISTS `user_`;
CREATE TABLE `user_`  (
  `userId` bigint(20) NOT NULL,
  `createDate` datetime(0) NULL DEFAULT NULL,
  `modifiedDate` datetime(0) NULL DEFAULT NULL,
  `password` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emailAddress` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstName` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `middleName` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastName` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jobTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginDate` datetime(0) NULL DEFAULT NULL,
  `loginIP` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastLoginDate` datetime(0) NULL DEFAULT NULL,
  `lastLoginIP` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `IX_9782AD88`(`userId`) USING BTREE,
  UNIQUE INDEX `IX_615E9F7A`(`emailAddress`) USING BTREE,
  UNIQUE INDEX `IX_C5806019`(`username`) USING BTREE,
  INDEX `IX_F6039434`(`status`) USING BTREE,
  INDEX `IX_762F63C6`(`emailAddress`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_
-- ----------------------------
INSERT INTO `user_` VALUES (2760094, '2019-06-25 15:18:54', '2019-06-25 15:18:54', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'vphdnd', 'hdnd@tayninh.gov.vn', 'VP', 'H???i ?????ng', 'nh??n d??n', 'VP H???i ?????ng nh??n d??n', '', NULL, '2019-06-28 10:45:13', '113.190.209.114', '2019-06-28 09:16:51', '113.190.209.114', 0);
INSERT INTO `user_` VALUES (2767108, '2019-06-25 15:21:50', '2019-06-25 15:21:50', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'vpubnd', 'vpubnd@tayninh.gov.vn', 'VP', 'UBND', 't???nh T??y Ninh', 'VP UBND t???nh T??y Ninh', '', NULL, '2019-11-26 11:12:14', '10.184.46.254', '2019-11-15 09:51:21', '10.184.46.254', 0);
INSERT INTO `user_` VALUES (2767122, '2019-06-26 08:28:53', '2019-06-26 08:28:53', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'songoaivu', 'songv@tayninh.gov.vn', 'S???', 'Ngo???i', 'V???', 'S??? Ngo???i V???', '', NULL, '2019-09-05 11:43:33', '123.16.145.132', '2019-06-26 08:29:18', '123.16.145.132', 0);
INSERT INTO `user_` VALUES (2767136, '2019-06-26 13:59:41', '2019-06-26 13:59:41', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'ubndchauthanh', 'chauthanh@tayninh.gov.vn', 'UBND huy???n', 'Ch??u', 'Th??nh', 'UBND huy???n Ch??u Th??nh', '', NULL, '2019-06-26 14:01:22', '14.177.167.235', '2019-06-26 14:01:22', '14.177.167.235', 0);
INSERT INTO `user_` VALUES (2767149, '2019-06-26 14:01:03', '2019-06-26 14:01:03', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'ubndhoathanh', 'hoathanh@tayninh.gov.vn', 'UBND huy???n', 'H??a', 'Th??nh', 'UBND huy???n H??a Th??nh', '', NULL, '2019-06-26 14:02:40', '14.177.144.6', '2019-06-26 14:02:40', '14.177.144.6', 0);
INSERT INTO `user_` VALUES (2776401, '2019-06-27 16:14:44', '2019-06-27 16:14:44', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'stttt', 'stttt@tayninh.gov.vn', 'S???', 'Th??ng tin', 'Truy???n th??ng', 'S??? Th??ng tin Truy???n th??ng', '', NULL, '2019-11-15 15:39:32', '10.184.46.254', '2019-11-08 14:29:21', '10.184.46.254', 0);
INSERT INTO `user_` VALUES (2808812, '2019-07-09 17:13:04', '2019-07-09 17:13:04', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'qptd', 'qptd@tayninh.gov.vn', 'Qu???', 'ph??t tri???n', '?????t', 'Qu??? ph??t tri???n ?????t', '', NULL, '2019-07-09 17:13:34', '14.177.249.15', '2019-07-09 17:13:34', '14.177.249.15', 0);
INSERT INTO `user_` VALUES (2808828, '2019-07-11 13:42:43', '2019-11-26 11:04:19', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'sotnmt', 'tnmt@tayninh.gov.vn', 'S???', 'T??i nguy??n', 'M??i tr?????ng', 'S??? T??i nguy??n M??i tr?????ng', '', NULL, '2019-11-26 11:04:47', '10.184.46.254', '2019-09-05 11:54:51', '10.184.46.254', 0);
INSERT INTO `user_` VALUES (2808864, '2019-07-16 08:57:40', '2019-07-16 08:57:40', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'sgtvt', 'gtvt@tayninh.gov.vn', 'S???', 'Giao th??ng', 'v???n t???i', 'S??? Giao th??ng v???n t???i', '', NULL, '2019-07-16 09:08:58', '14.177.167.188', '2019-07-16 08:58:02', '14.177.167.188', 0);
INSERT INTO `user_` VALUES (2808878, '2019-07-16 09:01:17', '2019-11-26 11:03:41', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'sokhdt', 'skhdt@tayninh.gov.vn', 'S???', 'K??? ho???ch', '?????u t??', 'S??? K??? ho???ch ?????u t??', '', NULL, '2019-11-18 10:40:37', '10.184.46.254', '2019-11-15 14:20:25', '10.184.46.254', 0);
INSERT INTO `user_` VALUES (2853765, '2019-07-26 09:54:39', '2019-07-26 09:54:39', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'stp', 'stp@tayninh.gov.vn', 'S???', 'T??', 'Ph??p', 'S??? T?? Ph??p', '', NULL, '2019-07-26 09:55:05', '14.177.160.202', '2019-07-26 09:55:05', '14.177.160.202', 0);
INSERT INTO `user_` VALUES (2853785, '2019-08-01 10:28:55', '2019-11-26 11:09:46', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'sotc', 'stc@tayninh.gov.vn', 'S???', 'T??i', 'Ch??nh', 'S??? T??i Ch??nh', '', NULL, '2019-11-26 11:09:55', '10.184.46.254', '2019-10-09 17:05:04', '10.184.46.254', 0);
INSERT INTO `user_` VALUES (2853799, '2019-08-01 10:31:56', '2019-11-26 11:02:36', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'sonoivu', 'snv@tayninh.gov.vn', 'S???', 'N???i', 'V???', 'S??? N???i V???', '', NULL, '2019-11-26 11:08:01', '10.184.46.254', '2019-11-26 10:46:53', '10.184.46.254', 0);
INSERT INTO `user_` VALUES (2882013, '2019-08-01 10:34:21', '2019-08-01 10:34:21', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'bantdkt', 'bantdkt@tayninh.gov.vn', 'Ban', 'thi ??ua', 'khen th?????ng', 'Ban thi ??ua khen th?????ng', '', NULL, '2019-08-01 10:34:37', '14.177.160.202', '2019-08-01 10:34:37', '14.177.160.202', 0);
INSERT INTO `user_` VALUES (2882041, '2019-08-02 09:43:30', '2019-08-02 09:43:30', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'svhttdl', 'svhttdl@tayninh.gov.vn', 'S???', 'V??n h??a', 'th??? thao du l???ch', 'S??? V??n h??a th??? thao du l???ch', '', NULL, '2019-09-05 11:50:52', '123.16.145.132', '2019-08-02 11:33:51', '123.16.145.132', 0);
INSERT INTO `user_` VALUES (2882069, '2019-08-16 10:31:27', '2019-08-16 10:31:27', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'thanhtra', 'ttt@tayninh.gov.vn', 'Thanh', 'tra', 't???nh', 'Thanh tra t???nh', '', NULL, '2019-08-16 10:31:50', '14.177.160.202', '2019-08-16 10:31:50', '14.177.160.202', 0);
INSERT INTO `user_` VALUES (2882088, '2019-08-21 14:49:19', '2019-08-21 14:49:19', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'ubndtanchau', 'ubndtanchau@tn.gov.vn', 'UBND', 'T??n', 'Ch??u', 'UBND T??n Ch??u', '', NULL, '2019-08-21 15:14:16', '14.184.16.178', '2019-08-21 14:50:42', '14.184.16.178', 0);
INSERT INTO `user_` VALUES (2937604, '2019-08-23 14:47:36', '2019-08-23 14:47:36', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'thanhpho', 'tp@tayninh.gov.vn', 'Th??nh', 'ph???', 'TN', 'Th??nh ph??? TN', '', NULL, '2019-08-23 14:48:02', '123.16.236.221', '2019-08-23 14:48:02', '123.16.236.221', 0);
INSERT INTO `user_` VALUES (2956100, '2019-09-04 13:37:25', '2019-09-04 13:37:25', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'bhxhtn', 'bhxh@tayninh.gov.vn', 'B???o hi???m x?? h???i', 't???nh', 'T??y Ninh', 'B???o hi???m x?? h???i t???nh T??y Ninh', '', NULL, '2019-10-12 11:11:21', '123.16.236.221', '2019-09-09 15:36:52', '123.16.236.221', 0);
INSERT INTO `user_` VALUES (2973715, '2019-09-05 11:23:51', '2019-09-05 11:23:51', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'bqlnbd', 'bqlnbd@tayninh.gov.vn', 'Ban qu???n l??', 'khu du l???ch', 'N??i b?? ??en', 'Ban qu???n l?? khu du l???ch N??i b?? ??en', '', NULL, '2019-09-05 11:52:48', '123.16.145.132', '2019-09-05 11:24:21', '123.16.145.132', 0);
INSERT INTO `user_` VALUES (2973731, '2019-09-07 09:13:33', '2019-09-07 09:13:33', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'btnmt', 'btnmt@chinhphu.vn', 'B???', 'T??i nguy??n', 'm??i tr?????ng', 'B??? T??i nguy??n m??i tr?????ng', '', NULL, '2019-09-07 10:45:13', '113.190.209.233', '2019-09-07 09:26:07', '113.190.209.233', 0);
INSERT INTO `user_` VALUES (2973744, '2019-09-07 09:15:01', '2019-09-07 09:15:01', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'btttt', 'btttt@chinhphu.vn', 'B???', 'Th??ng tin', 'truy???n th??ng', 'B??? Th??ng tin truy???n th??ng', '', NULL, '2019-11-13 14:59:49', '10.184.46.254', '2019-09-07 09:15:45', '10.184.46.254', 0);
INSERT INTO `user_` VALUES (2973758, '2019-09-07 09:24:15', '2019-09-07 09:24:15', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'bvhttdl', 'bvhttdl@chinhphu.vn', 'B???', 'V??n h??a', 'th??? thao du l???ch', 'B??? V??n h??a th??? thao du l???ch', '', NULL, '2019-09-07 09:24:31', '123.16.236.221', '2019-09-07 09:24:31', '123.16.236.221', 0);
INSERT INTO `user_` VALUES (2973777, '2019-09-11 13:51:06', '2019-09-11 13:51:06', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'snnptnt', 'snnptnt@tayninh.gov.vn', 'S??? N??ng nghi???p', 'ph??t tri???n', 'n??ng th??n', 'S??? N??ng nghi???p ph??t tri???n n??ng th??n', '', NULL, '2019-09-11 14:49:46', '14.162.193.255', '2019-09-11 13:51:25', '14.162.193.255', 0);
INSERT INTO `user_` VALUES (2973792, '2019-09-12 09:20:14', '2019-09-12 09:20:14', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'ubndgodau', 'ubndgd@tayninh.gov.vn', 'UBND huy???n', 'G??', 'D???u', 'UBND huy???n G?? D???u', '', NULL, NULL, '', NULL, '', 0);
INSERT INTO `user_` VALUES (2999105, '2019-09-12 09:47:27', '2019-09-12 09:47:27', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'skhcn', 'khcn@tayninh.gov.vn', 'S??? Khoa', 'h???c', 'c??ng ngh???', 'S??? Khoa h???c c??ng ngh???', '', NULL, '2019-09-12 09:47:39', '123.16.236.221', '2019-09-12 09:47:39', '123.16.236.221', 0);
INSERT INTO `user_` VALUES (2999120, '2019-09-13 15:28:27', '2019-09-13 15:28:27', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'ubndtrb', 'vphdndubnd_trb@tayninh.gov.vn', 'UBND', 'huy???n', 'Tr???ng B??ng', 'UBND huy???n Tr???ng B??ng', '', NULL, '2019-09-13 15:35:49', '10.184.208.254', '2019-09-13 15:28:54', '10.184.208.254', 0);
INSERT INTO `user_` VALUES (2999139, '2019-09-18 15:31:09', '2019-09-18 15:31:09', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'sldtbxh', 'ldtbxh@tayninh.gov.vn', 'S??? Lao ?????ng th????ng binh', 'x??', 'h???i', 'S??? Lao ?????ng th????ng binh x?? h???i', '', NULL, '2019-09-18 15:31:23', '123.16.236.221', '2019-09-18 15:31:23', '123.16.236.221', 0);
INSERT INTO `user_` VALUES (3273093, '2019-11-13 15:07:16', '2019-11-13 15:07:16', 'sNfXNqOfAyECZDLfPvSEJAORGew=', 'sogddt', 'gddt@tn.gov.vn', 'S???', 'Gi??o d???c', '????o t???o', 'S??? Gi??o d???c ????o t???o', '', NULL, '2019-11-13 15:07:47', '10.184.46.254', '2019-11-13 15:07:47', '10.184.46.254', 0);

SET FOREIGN_KEY_CHECKS = 1;
