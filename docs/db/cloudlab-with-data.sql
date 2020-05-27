/*
 Navicat Premium Data Transfer

 Source Server         : cloudlab
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:33360
 Source Schema         : cloudlab

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 27/05/2020 15:44:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `cid` int(0) UNSIGNED NOT NULL,
  `item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'key',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'value',
  `vtype` tinyint(0) NOT NULL COMMENT '1, string, 2, int, 3, float/double',
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `unique`(`item`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'webroot', 'E:\\gtt\\webapp', 1);
INSERT INTO `config` VALUES (2, 'rdp_pic_path', 'E:\\gtt\\webapp\\images\\rdp', 1);
INSERT INTO `config` VALUES (3, 'rdp_pic_web_root', '/images/rdp', 1);

-- ----------------------------
-- Table structure for experiment
-- ----------------------------
DROP TABLE IF EXISTS `experiment`;
CREATE TABLE `experiment`  (
  `eid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'the experiment id',
  `ename` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'the name of experiment',
  `etime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'the date and time of experiment',
  `sid` int(0) UNSIGNED NOT NULL COMMENT 'the id of specimen',
  `uid` int(0) UNSIGNED NOT NULL COMMENT 'operator',
  `frequncy` double NOT NULL COMMENT 'the frequncy',
  `sampling` double NOT NULL COMMENT 'the sampling',
  `H` double NULL DEFAULT NULL COMMENT 'the H value',
  `cycles` double NULL DEFAULT NULL COMMENT 'the cycles',
  `datatype` int(0) NOT NULL DEFAULT 0 COMMENT 'the type of datafile, 0 for 3 columns, 1 for 9 columns',
  `datapath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'the filepath of raw data file',
  `rawpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'the path of the raw files',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eid`) USING BTREE,
  UNIQUE INDEX `unique_ename`(`ename`) USING BTREE,
  UNIQUE INDEX `unique_datapath`(`datapath`) USING BTREE,
  UNIQUE INDEX `unique_rawpath`(`rawpath`) USING BTREE,
  INDEX `fk_experiment_specimen`(`sid`) USING BTREE,
  INDEX `fk_experiment_user`(`uid`) USING BTREE,
  CONSTRAINT `fk_experiment_specimen` FOREIGN KEY (`sid`) REFERENCES `specimen` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_experiment_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of experiment
-- ----------------------------
INSERT INTO `experiment` VALUES (1, 'GCr15测试1', '2020-05-27 15:40:49', 1, 1, 0.1, 32, 20, 3087, 1, 'E:\\试验数据\\韩福宁\\GCr15\\S1-H20-N3087', 'E:\\试验数据\\韩福宁\\GCr15\\S1-H20-N3087', NULL);
INSERT INTO `experiment` VALUES (2, 'GCr15 测试2', '2020-05-27 15:40:51', 2, 1, 0.1, 32, 15, 7141, 1, 'E:\\试验数据\\韩福宁\\GCr15\\S2-H15-N7141', 'E:\\试验数据\\韩福宁\\GCr15\\S2-H15-N7141', NULL);
INSERT INTO `experiment` VALUES (3, 'GCr15 测试3', '2020-05-27 15:40:52', 3, 1, 0.1, 32, 10, 39534, 1, 'E:\\试验数据\\韩福宁\\GCr15\\S3-H10-N39534', 'E:\\试验数据\\韩福宁\\GCr15\\S3-H10-N39534', NULL);
INSERT INTO `experiment` VALUES (4, 'GCr15 测试4', '2020-05-27 15:40:54', 4, 1, 0.1, 32, 25, 1640, 1, 'E:\\试验数据\\韩福宁\\GCr15\\S4-H25-N1640', 'E:\\试验数据\\韩福宁\\GCr15\\S4-H25-N1640', NULL);
INSERT INTO `experiment` VALUES (5, 'GCr15 测试5', '2020-05-27 15:40:55', 5, 1, 0.1, 32, 30, 1279, 1, 'E:\\试验数据\\韩福宁\\GCr15\\S5-H30-N1279', 'E:\\试验数据\\韩福宁\\GCr15\\S5-H30-N1279', NULL);
INSERT INTO `experiment` VALUES (6, 'GCr15 测试6', '2020-05-27 15:40:57', 6, 1, 0.1, 32, 35, 1250, 1, 'E:\\试验数据\\韩福宁\\GCr15\\S6-H35-N1250', 'E:\\试验数据\\韩福宁\\GCr15\\S6-H35-N1250', NULL);
INSERT INTO `experiment` VALUES (8, 'QT800 测试1', '2019-12-10 10:19:31', 8, 1, 0.1, 16, 36, 743, 2, 'E:\\试验数据\\韩福宁\\QT800\\S2H36N743_20191210\\Data', 'E:\\试验数据\\韩福宁\\QT800\\S2H36N743_20191210', NULL);
INSERT INTO `experiment` VALUES (9, 'QT800 测试2', '2019-12-10 14:09:10', 9, 1, 0.1, 16, 34, 954, 2, 'E:\\试验数据\\韩福宁\\QT800\\S3H34N954_20191210\\Data', 'E:\\试验数据\\韩福宁\\QT800\\S3H34N954_20191210', NULL);
INSERT INTO `experiment` VALUES (10, 'QT800 测试3', '2019-12-12 09:52:39', 10, 1, 0.1, 16, 38, 366, 2, 'E:\\试验数据\\韩福宁\\QT800\\S5H38N366_20191212\\Data', 'E:\\试验数据\\韩福宁\\QT800\\S5H38N366_20191212', NULL);
INSERT INTO `experiment` VALUES (11, 'QT800 测试4', '2019-12-12 11:55:25', 11, 1, 0.1, 16, 32, 1298, 2, 'E:\\试验数据\\韩福宁\\QT800\\S6H32N1298_20191212\\Data', 'E:\\试验数据\\韩福宁\\QT800\\S6H32N1298_20191212', NULL);
INSERT INTO `experiment` VALUES (12, 'QT800 测试5', '2019-12-12 17:50:30', 12, 1, 0.1, 16, 30, 1029, 2, 'E:\\试验数据\\韩福宁\\QT800\\S7H30N1029_20191212\\Data', 'E:\\试验数据\\韩福宁\\QT800\\S7H30N1029_20191212', NULL);
INSERT INTO `experiment` VALUES (13, 'QT800 测试6', '2019-12-12 23:24:52', 13, 1, 0.1, 16, 25, 2951, 2, 'E:\\试验数据\\韩福宁\\QT800\\S8H25N2951_20191212\\Data', 'E:\\试验数据\\韩福宁\\QT800\\S8H25N2951_20191212', NULL);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `mid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'the id of the material',
  `mname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'name of material',
  `en_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'the english name of material',
  `standard` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'the standard name',
  `properties` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'the description of the material',
  PRIMARY KEY (`mid`) USING BTREE,
  UNIQUE INDEX `unique_mname`(`mname`) USING BTREE,
  UNIQUE INDEX `unique_en_name`(`en_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (1, 'GCr15', 'High-carbon chromium bearing steel', 'GB/T 18254-2016', '高碳铬轴承钢');
INSERT INTO `material` VALUES (2, 'QT800', '', '', '');

-- ----------------------------
-- Table structure for rdp_data_1
-- ----------------------------
DROP TABLE IF EXISTS `rdp_data_1`;
CREATE TABLE `rdp_data_1`  (
  `rdpd_id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'the data id',
  `eid` int(0) UNSIGNED NOT NULL COMMENT 'experiment id',
  `max_angle` double NULL DEFAULT NULL COMMENT 'max_angle',
  `min_angle` double NULL DEFAULT NULL COMMENT 'min_angle',
  `max_torque` double NULL DEFAULT NULL COMMENT 'max_torque',
  `min_torque` double NULL DEFAULT NULL COMMENT 'max_torque',
  `max_shearforce` double NULL DEFAULT NULL COMMENT 'max_shearforce',
  `min_shearforce` double NULL DEFAULT NULL COMMENT 'min_shearforce',
  `max_shearstrain` double NULL DEFAULT NULL COMMENT 'max_shearstrain',
  `min_shearstrain` double NULL DEFAULT NULL COMMENT 'min_shearstrain',
  `max_force_improved` double NULL DEFAULT NULL COMMENT 'max_force_improved',
  `min_force_improved` double NULL DEFAULT NULL COMMENT 'min_force_improved',
  `G_right` double NULL DEFAULT NULL COMMENT 'G_right',
  `G_left` double NULL DEFAULT NULL COMMENT 'G_left',
  `G_mean` double NULL DEFAULT NULL COMMENT 'G_mean',
  `Tao_max` double NULL DEFAULT NULL COMMENT 'Tao_max',
  PRIMARY KEY (`rdpd_id`) USING BTREE,
  INDEX `fk_rdpd_exp`(`eid`) USING BTREE,
  CONSTRAINT `fk_rdpd_exp` FOREIGN KEY (`eid`) REFERENCES `experiment` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rdp_data_1
-- ----------------------------

-- ----------------------------
-- Table structure for rdp_result
-- ----------------------------
DROP TABLE IF EXISTS `rdp_result`;
CREATE TABLE `rdp_result`  (
  `expid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'result id',
  `eid` int(0) UNSIGNED NOT NULL COMMENT 'the experiment id',
  `rawlen` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'the length of raw data',
  `period` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'the amount of period',
  `bpoint` int(0) UNSIGNED NULL DEFAULT NULL COMMENT 'break point',
  `first_loop` int(0) NULL DEFAULT 100 COMMENT 'the effect first loop no for G__',
  `G_loop_no` int(0) NULL DEFAULT 100 COMMENT 'The Effect Loop No for G___',
  `theta_8` double NULL DEFAULT NULL COMMENT 'theta_8',
  `torque_8` double NULL DEFAULT NULL COMMENT 'torque_8',
  `TauMax` double NULL DEFAULT NULL COMMENT 'Max Tau in MPa',
  `TauMin` double NULL DEFAULT NULL COMMENT 'Min Tau in MPa',
  `TauMean` double NULL DEFAULT NULL COMMENT 'Mean Tau in Mpa',
  `Strain_TotMax` double NULL DEFAULT NULL COMMENT 'Strain_TotMax',
  `Strain_TotMin` double NULL DEFAULT NULL COMMENT 'Strain_TotMin',
  `Strain_TotMean` double NULL DEFAULT NULL COMMENT 'Strain_TotMean',
  `StrainRate` double NULL DEFAULT NULL COMMENT 'StrainRate',
  `G_left_value` double NULL DEFAULT NULL COMMENT 'G_left_value',
  `G_right_value` double NULL DEFAULT NULL COMMENT 'G_right_value',
  `nHardening` double NULL DEFAULT NULL COMMENT 'nHardening',
  `KMpa` double NULL DEFAULT NULL COMMENT 'KMpa',
  `Strain_Plastic` double NULL DEFAULT NULL COMMENT 'Strain_Plastic',
  `Strain_Elastic` double NULL DEFAULT NULL COMMENT 'Strain_Elastic',
  `Strain_amplitude` double NULL DEFAULT NULL COMMENT 'Strain_amplitude',
  `Tau_MaxMPa` double NULL DEFAULT NULL COMMENT 'Tau_MaxMPa',
  `Tau_amplitudeMPa` double NULL DEFAULT NULL COMMENT 'Tau_amplitudeMPa',
  `strain_total` double NULL DEFAULT NULL COMMENT 'strain_total',
  `g_mean_mean` double NULL DEFAULT NULL COMMENT 'g_mean_mean',
  `tau_max_mean` double NULL DEFAULT NULL COMMENT 'tau_max_mean',
  `dtname` varchar(34) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'rdp_data_1' COMMENT 'The table name to save result data',
  PRIMARY KEY (`expid`) USING BTREE,
  UNIQUE INDEX `unique_eid`(`eid`) USING BTREE,
  CONSTRAINT `fk_rdp_exp` FOREIGN KEY (`eid`) REFERENCES `experiment` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rdp_result
-- ----------------------------
INSERT INTO `rdp_result` VALUES (1, 10, 58478, 365, 365, 1, 100, 0.18114597773523944, 57.42245, 1364.8839082812367, -1364.883908281237, 0.000000000000004372570681600617, 0.027731623751400505, -0.0281316532159576, -0.00010216145725591914, 17.876248629554592, 53.38666441036041, 53.73634622337783, 0.32988719626088725, 10749.622511019941, 0.0020104738734842286, 0.02516142278680169, 0.027073329190779538, 1353.9358165847711, 1302.4179509686767, 0.0558632769673581, 53408.40626207592, 1364.8839082812367, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (2, 8, 115202, 720, 720, 1, 100, 0.17135555329617727, 54.58565, 1296.3176009462395, -1296.3176009462395, -3.16235988099071e-16, 0.02752768202830496, -0.027625071400566248, -0.00014952276968312848, 17.648881097238785, 53.702675803135286, 53.68855500382694, 0.34584913834341297, 11459.430136499595, 0.0017992339992143613, 0.02390409899521223, 0.02582716410485559, 1287.048299168017, 1241.4050193402704, 0.05515275342887121, 53628.96335971633, 1296.3176009462395, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (3, 9, 148805, 930, 930, 1, 100, 0.16127889485978802, 52.99325, 1259.5071257287168, -1259.5071257287168, -0.000000000000002202758965542614, 0.025860019928024384, -0.02500341233114556, 0.00014101715527822383, 16.276298322934384, 54.009966407766925, 55.10309247224753, 0.4216724377608476, 20568.513579703147, 0.0015880928498309588, 0.022603741379137243, 0.024182016751925738, 1249.5018797043824, 1115.1244139381342, 0.05086343225916995, 54402.055656537545, 1259.5071257287168, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (4, 12, 164668, 1029, 1029, 1, 100, 0.14247122684029712, 47.6678, 1139.16742067455, -1139.16742067455, 7.741321634740391e-16, 0.02348680847762509, -0.02466071693251648, -0.00038087545224634695, 15.407208131245302, 53.71038605139655, 54.81332117190044, 0.33182521687464717, 12971.033766751665, 0.0008441376115642822, 0.020526546414480287, 0.02119396943928014, 1123.9357031579034, 1065.2098870080026, 0.04814752541014157, 54536.0954700335, 1139.16742067455, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (5, 11, 206443, 1290, 1290, 1, 100, 0.15323990832510215, 49.8517, 1189.2879648365724, -1189.2879648365724, 0.000000000000001322965528180171, 0.026905384883506387, -0.02489476558520892, -0.00038593870658422565, 16.5760481499889, 53.847262773359596, 53.59953011796946, 0.38980724786044935, 16958.308644116023, 0.0010570527889829304, 0.02192893345978239, 0.02277981923087349, 1175.4288113384055, 1104.174553853412, 0.051800150468715306, 53962.39729794893, 1189.2879648365724, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (8, 13, 470498, 2940, 2940, 1, 100, 0.11791182627085892, 40.1402, 961.1414170339734, -961.1414170339733, 8.316662167454048e-16, 0.01794687163240729, -0.021818884577956707, -0.001559528219255556, 12.725041987316478, 54.59919731174542, 54.45796589188529, 0.23256515130358035, 5481.961579639798, 0.0003625693941683658, 0.01732420454646047, 0.01776164856553939, 946.4461106218216, 918.1424671125608, 0.039765756210363996, 54788.54798627874, 961.1414170339734, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (9, 5, 409446, 1279, 1279, 1, 100, 0.12861460181574583, 15.87528854608536, 787.6085549903491, -787.6085549903491, 0.00000000000000233511697198155, 0.018968611206490207, -0.01967329361777925, -0.00035173918120092693, 24.730819087532453, 109.84025236562404, 112.39092072933217, 0.13955446114662592, 1349.9080617755606, 0.012989966615484936, 0.006302223656876937, 0.019292190272361873, 748.631302257669, 726.5337205316877, 0.038641904824269456, 108809.09838556965, 787.6085549903491, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (10, 4, 499589, 1561, 1561, 1, 100, 0.10656362798988973, 14.13075160980223, 698.0064053132007, -698.0064053132007, 0.000000000000003985415985833895, 0.015660965132611795, -0.01633688540412798, -0.0003277366700503726, 20.478624343513452, 113.55194859943886, 107.24775666703776, 0.13323384947168315, 1186.0542507903854, 0.010351551103400358, 0.005632993095083104, 0.01589825777916489, 666.3641387566761, 662.3971986160633, 0.03199785053673977, 106019.6069234311, 698.0064053132007, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (11, 1, 984116, 3075, 3075, 1, 100, 0.08480034214078944, 13.219526946544631, 662.8032925374305, -662.8032925374305, 0.00000000000000592658287081619, 0.014366668842833285, -0.012971725037557953, -0.0002165210800275718, 17.496572083450392, 114.79268275040047, 122.16311663654331, 0.17597574452001247, 1439.4188514048826, 0.007837846489571235, 0.0048822048315471794, 0.012734432391004845, 623.393498927137, 683.4299636881599, 0.027338393880391238, 112679.79545082588, 662.8032925374305, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (12, 2, 2285961, 7143, 7143, 6, 100, 0.0630369897126619, 12.102234244346604, 594.4136583791387, -594.4136583791387, -0.000000000000003770592227010333, 0.010584467436410923, -0.009750355396144005, -0.0002543659692644282, 13.014286612835155, 122.95030468427701, 116.32704888281405, 0.20310962987849449, 1685.0341420000657, 0.004711246943915251, 0.004744301512984034, 0.009462738991842499, 570.7053044277839, 630.2890471048752, 0.02033482283255493, 118303.99683670446, 594.4136583791387, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (13, 3, 12656426, 39551, 39551, 6, 100, 0.04136951108377722, 11.55459475517274, 537.9048612448341, -537.9048612448341, 8.830132860330955e-17, 0.010512562086978785, -0.00829786733761479, -0.0002405781245884857, 12.038674831739888, 121.80211933278677, 122.00162458675946, 0.20524623446158943, 1957.9221370611565, 0.0019621028688539847, 0.0042433237937125985, 0.0062198077324530105, 544.8802579879791, 615.2466657150088, 0.018810429424593576, 124719.88660161718, 537.9048612448341, 'rdp_data_1');
INSERT INTO `rdp_result` VALUES (14, 6, 400187, 1250, 1250, 6, 100, 0.1504258911434948, 16.02941864728927, 760.3990351786827, -760.3990351786829, -0.000000000000005643381856477337, 0.0261303840099313, -0.02479295449734758, -0.0003970330573372175, 32.590936644658484, 101.48401068499204, 110.02930834927902, 0.1296458425559593, 1223.39370604255, 0.016333821706151132, 0.006230061965373086, 0.022571074206467433, 755.8996185497747, 767.0017846708912, 0.05092333850727888, 103145.38321620348, 760.3990351786827, 'rdp_data_1');

-- ----------------------------
-- Table structure for specimen
-- ----------------------------
DROP TABLE IF EXISTS `specimen`;
CREATE TABLE `specimen`  (
  `sid` int(0) UNSIGNED NOT NULL COMMENT 'the specimen id',
  `sname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'the name of specimen',
  `mid` int(0) UNSIGNED NOT NULL COMMENT 'the material id',
  `radius` double NOT NULL COMMENT 'the radius of specimen',
  `length` double NOT NULL COMMENT 'the length of specimen',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'the description',
  PRIMARY KEY (`sid`) USING BTREE,
  UNIQUE INDEX `unique_sname`(`sname`) USING BTREE,
  INDEX `fk_specimen_material`(`mid`) USING BTREE,
  CONSTRAINT `fk_specimen_material` FOREIGN KEY (`mid`) REFERENCES `material` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of specimen
-- ----------------------------
INSERT INTO `specimen` VALUES (1, 'S1-GCr15', 1, 3, 20, NULL);
INSERT INTO `specimen` VALUES (2, 'S2-GCr15', 1, 3, 20, NULL);
INSERT INTO `specimen` VALUES (3, 'S3-GCr15', 1, 3, 20, NULL);
INSERT INTO `specimen` VALUES (4, 'S4-GCr15', 1, 3, 20, NULL);
INSERT INTO `specimen` VALUES (5, 'S5-GCr15', 1, 3, 20, NULL);
INSERT INTO `specimen` VALUES (6, 'S6-GCr15', 1, 3, 20, NULL);
INSERT INTO `specimen` VALUES (7, 'S7-GCr15', 1, 3, 20, NULL);
INSERT INTO `specimen` VALUES (8, 'S2-QT800', 2, 3, 20, NULL);
INSERT INTO `specimen` VALUES (9, 'S3-QT800', 2, 3, 20, NULL);
INSERT INTO `specimen` VALUES (10, 'S5-QT800', 2, 3, 20, NULL);
INSERT INTO `specimen` VALUES (11, 'S6-QT800', 2, 3, 20, NULL);
INSERT INTO `specimen` VALUES (12, 'S7-QT800', 2, 3, 20, NULL);
INSERT INTO `specimen` VALUES (13, 'S8-QT800', 2, 3, 20, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'user id',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'username',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'password of the user',
  `type` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'user type, 0 administrators, 1 teacher, 2 student 3 normal user',
  `userno` int(0) NULL DEFAULT NULL COMMENT 'the digital number for user by type',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'something about the user',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '韩福宁', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, 1, '');
INSERT INTO `user` VALUES (2, '高天天', '7c4a8d09ca3762af61e59520943dc26494f8941b', 0, 2, '');

-- ----------------------------
-- View structure for v_experiment
-- ----------------------------
DROP VIEW IF EXISTS `v_experiment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_experiment` AS select `e`.`eid` AS `eid`,`e`.`ename` AS `ename`,`e`.`etime` AS `etime`,`e`.`sid` AS `sid`,`e`.`uid` AS `uid`,`e`.`frequncy` AS `frequncy`,`e`.`sampling` AS `sampling`,`e`.`H` AS `H`,`e`.`cycles` AS `cycles`,`e`.`datatype` AS `datatype`,`e`.`datapath` AS `datapath`,`e`.`rawpath` AS `rawpath`,`u`.`username` AS `username`,`s`.`sname` AS `sname`,`s`.`mid` AS `mid`,`s`.`radius` AS `radius`,`s`.`length` AS `length`,`m`.`mname` AS `mname` from (((`experiment` `e` join `user` `u` on((`e`.`uid` = `u`.`uid`))) join `specimen` `s` on((`e`.`sid` = `s`.`sid`))) join `material` `m` on((`m`.`mid` = `s`.`mid`)));

-- ----------------------------
-- View structure for v_rdp_exp
-- ----------------------------
DROP VIEW IF EXISTS `v_rdp_exp`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_rdp_exp` AS select `r`.`expid` AS `expid`,`r`.`eid` AS `eid`,`r`.`rawlen` AS `rawlen`,`r`.`period` AS `period`,`r`.`bpoint` AS `bpoint`,`r`.`theta_8` AS `theta_8`,`r`.`torque_8` AS `torque_8`,`r`.`TauMax` AS `TauMax`,`r`.`TauMin` AS `TauMin`,`r`.`TauMean` AS `TauMean`,`r`.`Strain_TotMax` AS `Strain_TotMax`,`r`.`Strain_TotMin` AS `Strain_TotMin`,`r`.`Strain_TotMean` AS `Strain_TotMean`,`r`.`StrainRate` AS `StrainRate`,`r`.`pic_path` AS `pic_path`,`r`.`dtable_name` AS `dtable_name`,`e`.`ename` AS `ename` from (`rdp_result` `r` join `experiment` `e` on((`r`.`eid` = `e`.`eid`)));

-- ----------------------------
-- View structure for v_rdpd_exp
-- ----------------------------
DROP VIEW IF EXISTS `v_rdpd_exp`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_rdpd_exp` AS select `r`.`rdpd_id` AS `rdpd_id`,`r`.`eid` AS `eid`,`r`.`max_angle` AS `max_angle`,`r`.`min_angle` AS `min_angle`,`r`.`max_torque` AS `max_torque`,`r`.`min_torque` AS `min_torque`,`r`.`max_shearforce` AS `max_shearforce`,`r`.`min_shearforce` AS `min_shearforce`,`r`.`max_shearstrain` AS `max_shearstrain`,`r`.`min_shearstrain` AS `min_shearstrain`,`r`.`max_force_improved` AS `max_force_improved`,`r`.`min_force_improved` AS `min_force_improved`,`r`.`G_right` AS `G_right`,`r`.`G_left` AS `G_left`,`r`.`G_mean_per` AS `G_mean_per`,`r`.`G_mean` AS `G_mean`,`r`.`Tao_max` AS `Tao_max`,`e`.`ename` AS `ename` from (`rdp_data` `r` join `experiment` `e` on((`r`.`eid` = `e`.`eid`)));

-- ----------------------------
-- View structure for v_specimen
-- ----------------------------
DROP VIEW IF EXISTS `v_specimen`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_specimen` AS select `s`.`sid` AS `sid`,`s`.`sname` AS `sname`,`s`.`mid` AS `mid`,`s`.`radius` AS `radius`,`s`.`length` AS `length`,`m`.`mname` AS `mname`,`m`.`en_name` AS `en_name`,`m`.`standard` AS `standard`,`m`.`properties` AS `properties` from (`specimen` `s` join `material` `m` on((`s`.`mid` = `m`.`mid`)));

-- ----------------------------
-- View structure for v_specimen_params
-- ----------------------------
DROP VIEW IF EXISTS `v_specimen_params`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_specimen_params` AS select `r`.`expid` AS `expid`,`r`.`eid` AS `eid`,`r`.`period` AS `N`,`r`.`Tau_amplitudeMPa` AS `Strain`,`r`.`Tau_MaxMPa` AS `Tau`,`r`.`Strain_Plastic` AS `pStrain`,`r`.`Strain_Elastic` AS `eStrain`,`r`.`g_mean_mean` AS `E`,`e`.`ename` AS `ename`,`s`.`sname` AS `sname`,`m`.`mname` AS `mname`,`e`.`sid` AS `sid`,`s`.`mid` AS `mid` from (((`rdp_result` `r` join `experiment` `e` on((`r`.`eid` = `e`.`eid`))) join `specimen` `s` on((`e`.`sid` = `s`.`sid`))) join `material` `m` on((`s`.`mid` = `m`.`mid`)));

-- ----------------------------
-- Procedure structure for get_rdp_pic_save_path
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_rdp_pic_save_path`;
delimiter ;;
CREATE PROCEDURE `get_rdp_pic_save_path`(IN `eid` int)
BEGIN
	DECLARE pic_path VARCHAR(512);
	DECLARE root_path VARCHAR(512);
	
	SELECT CONCAT(`content`, '\\', CONVERT(eid, char), '\\') INTO `pic_path` FROM `config` WHERE `item` = 'rdp_pic_path';
	SELECT CONCAT(`content`, '\\', CONVERT(eid, char)) INTO `root_path` FROM `config` WHERE `item` = 'rdp_pic_path';
	CREATE TEMPORARY TABLE IF NOT EXISTS tt_pic_path (`path` VARCHAR(255));
  DELETE FROM tt_pic_path;
	INSERT INTO tt_pic_path(`path`) SELECT root_path;
  INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'angle_origin.png');
  INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'angle_smooth.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'torque_origin.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'torque_smooth.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'max_force.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'min_force.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'strain.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_all.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'g_mean_log.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'tao_max_log.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_1.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_100.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_n1.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_last.png');
	SELECT * FROM tt_pic_path;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_rdp_pic_web_path
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_rdp_pic_web_path`;
delimiter ;;
CREATE PROCEDURE `get_rdp_pic_web_path`(IN `eid` int)
BEGIN
	DECLARE pic_path VARCHAR(512);
	
	SELECT CONCAT(`content`, '/', CONVERT(eid, char), '/') INTO `pic_path` FROM `config` WHERE `item` = 'rdp_pic_web_root';
	CREATE TEMPORARY TABLE IF NOT EXISTS tt_pic_path (`path` VARCHAR(255));
  DELETE FROM tt_pic_path;
  INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'angle_origin.png');
  INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'angle_smooth.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'torque_origin.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'torque_smooth.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'max_force.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'min_force.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'strain.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_all.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'g_mean_log.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'tao_max_log.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_1.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_100.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_n1.png');
	INSERT INTO tt_pic_path(`path`) SELECT CONCAT(pic_path, 'loop_last.png');

	SELECT * FROM tt_pic_path;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
