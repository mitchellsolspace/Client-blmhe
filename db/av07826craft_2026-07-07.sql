# ************************************************************
# Sequel Ace SQL dump
# Version 20095
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 5.7.42-0ubuntu0.18.04.1)
# Database: av07826craft
# Generation Time: 2026-07-07 23:31:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexdata`;

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  KEY `assets_uploaderId_fk` (`uploaderId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(16,1,8,1,'test.png','image',1124,780,2206219,NULL,NULL,NULL,'2021-01-13 15:51:54','2021-01-13 15:51:54','2021-01-13 15:51:54','ccb83f04-634f-4b16-9a26-46270e1e1444'),
	(19,1,8,1,'sample.pdf','pdf',NULL,NULL,3028,NULL,NULL,NULL,'2021-01-19 16:19:55','2021-01-19 16:19:55','2021-01-19 16:19:55','46fd1edb-eae9-4740-95bf-1e95e9534fd4'),
	(24,1,1,1,'sample.pdf','pdf',NULL,NULL,3028,NULL,NULL,NULL,'2021-01-19 16:38:05','2021-01-19 16:38:05','2021-01-19 16:38:05','b0bccec1-8699-4de4-ac19-a4c028ea5d9f'),
	(25,1,8,1,'HPSE-Allen.pdf','pdf',NULL,NULL,86451,NULL,NULL,NULL,'2021-04-13 21:28:31','2021-04-13 21:28:31','2021-04-13 21:28:31','5251838d-20a0-4aaa-bfa1-16257f5415d4'),
	(28,1,1,1,'HPSE-McNeil.pdf','pdf',NULL,NULL,157907,NULL,NULL,NULL,'2021-04-13 21:38:16','2021-04-13 21:38:16','2021-04-13 21:38:16','69bc801f-a98c-4d34-bed1-def8808e9ee9'),
	(36,1,1,1,'HPSE-Stephens.pdf','pdf',NULL,NULL,156188,NULL,NULL,NULL,'2021-04-13 21:49:13','2021-04-13 21:49:13','2021-04-13 21:49:13','78ae332c-7848-4c94-ac86-07fd91081b9d'),
	(40,1,1,1,'HPSE-Allen.pdf','pdf',NULL,NULL,86451,NULL,NULL,NULL,'2021-04-13 21:50:31','2021-04-13 21:50:31','2021-04-13 21:50:31','28a73000-018f-48d2-859b-22bf073950c9'),
	(46,1,1,1,'Screen-Shot-2021-04-21-at-10.42.07-AM.png','image',499,657,184244,NULL,NULL,NULL,'2021-04-21 14:42:25','2021-04-21 14:42:25','2021-04-21 14:42:25','ebac9e70-228a-4c13-96db-64ffecb29378'),
	(47,1,1,1,'Screen-Shot-2021-04-21-at-10.45.35-AM.png','image',691,514,43014,NULL,NULL,NULL,'2021-04-21 14:45:47','2021-04-21 14:45:47','2021-04-21 14:45:47','4e3ea59e-fe18-4e88-955a-9e8f29e2d139'),
	(61,1,1,1,'Screen-Shot-2021-04-21-at-10.57.54-AM.png','image',808,443,414575,NULL,NULL,NULL,'2021-04-21 14:58:13','2021-04-21 14:58:14','2021-04-21 14:58:14','28cfe22c-34e0-489c-832a-80c518af4872'),
	(64,1,1,1,'Screen-Shot-2021-04-21-at-11.19.19-AM.png','image',505,655,437194,NULL,NULL,NULL,'2021-04-21 15:19:33','2021-04-21 15:19:33','2021-04-21 15:19:33','f2652fff-8fc5-4762-b342-ed6ce925b100'),
	(71,1,1,1,'Screen-Shot-2021-04-21-at-11.23.29-AM.png','image',460,646,170423,NULL,NULL,NULL,'2021-04-21 15:23:45','2021-04-21 15:23:45','2021-04-21 15:23:45','c4f36dc2-821b-4d19-8601-dfb6392b4066'),
	(73,1,1,1,'Screen-Shot-2021-04-21-at-11.22.49-AM.png','image',502,654,782541,NULL,NULL,NULL,'2021-04-21 15:24:04','2021-04-21 15:24:04','2021-04-21 15:24:04','dd7d23bd-6343-48f1-8eae-4580d145b1f5'),
	(74,1,1,1,'Screen-Shot-2021-04-21-at-11.23.07-AM.png','image',503,652,342752,NULL,NULL,NULL,'2021-04-21 15:24:18','2021-04-21 15:24:19','2021-04-21 15:24:19','f53bcf9a-0dd2-4409-a910-6cec4bae78f1'),
	(77,1,1,1,'Screen-Shot-2021-04-21-at-11.25.48-AM.png','image',460,657,146458,NULL,NULL,NULL,'2021-04-21 15:26:00','2021-04-21 15:26:00','2021-04-21 15:26:00','cb5b5cbc-89af-4486-a30d-5e832e03deb8'),
	(80,1,1,1,'Screen-Shot-2021-04-21-at-11.27.21-AM.png','image',527,655,686257,NULL,NULL,NULL,'2021-04-21 15:27:36','2021-04-21 15:27:36','2021-04-21 15:27:36','4757fc57-fb88-4029-90b3-69eb82cbe27b'),
	(83,1,1,1,'Screen-Shot-2021-04-21-at-11.28.22-AM.png','image',879,657,850436,NULL,NULL,NULL,'2021-04-21 15:28:36','2021-04-21 15:28:36','2021-04-21 15:28:36','4f55547d-3720-48b5-967b-805ad86600be'),
	(86,1,1,1,'Screen-Shot-2021-04-21-at-11.30.10-AM.png','image',508,655,407065,NULL,NULL,NULL,'2021-04-21 15:30:23','2021-04-21 15:30:23','2021-04-21 15:30:23','57a8fb53-fbed-421e-ba54-9101c4c5173d'),
	(89,1,1,1,'Screen-Shot-2021-04-21-at-11.30.55-AM.png','image',510,655,315672,NULL,NULL,NULL,'2021-04-21 15:31:10','2021-04-21 15:31:10','2021-04-21 15:31:10','6e2d2a7a-1c6f-4987-9753-a69e6de1c778'),
	(91,1,1,1,'Screen-Shot-2021-04-21-at-11.33.24-AM.png','image',657,397,591866,NULL,NULL,NULL,'2021-04-21 15:33:44','2021-04-21 15:33:44','2021-04-21 15:33:44','e0a4f4db-a9aa-4b22-9d16-9307dde7124d'),
	(92,1,1,1,'Screen-Shot-2021-04-21-at-11.35.54-AM.png','image',900,556,825347,NULL,NULL,NULL,'2021-04-21 15:36:09','2021-04-21 15:36:09','2021-04-21 15:36:09','c077e9e4-a18f-47e3-b9f6-ab6d1621f585'),
	(93,1,1,1,'Screen-Shot-2021-04-21-at-1.37.38-PM.png','image',654,389,451092,NULL,NULL,NULL,'2021-04-21 17:38:22','2021-04-21 17:38:22','2021-04-21 17:38:22','3a1b18b6-d391-48ae-9531-839b3ae7e6b9'),
	(94,1,1,1,'Screen-Shot-2021-04-21-at-1.38.48-PM.png','image',649,392,398352,NULL,NULL,NULL,'2021-04-21 17:39:02','2021-04-21 17:39:02','2021-04-21 17:39:02','8145e23b-55f9-4615-8ee8-17333f3f637a'),
	(95,1,1,1,'Screen-Shot-2021-04-21-at-1.37.38-PM_2021-04-21-173955.png','image',654,389,451092,NULL,NULL,NULL,'2021-04-21 17:39:56','2021-04-21 17:39:56','2021-04-21 17:39:56','de92f720-a252-4dba-912b-d78fbdc43ec8'),
	(96,1,1,1,'Screen-Shot-2021-04-21-at-1.37.38-PM_2021-04-21-174256.png','image',654,389,451092,NULL,NULL,NULL,'2021-04-21 17:42:56','2021-04-21 17:42:56','2021-04-21 17:42:56','3cbf68e0-a2c9-433b-b32e-c40213b1afe7'),
	(98,1,1,1,'Screen-Shot-2021-04-21-at-2.36.07-PM.png','image',537,402,522400,NULL,NULL,NULL,'2021-04-21 18:36:23','2021-04-21 18:36:23','2021-04-21 18:36:23','68fc00c3-c94f-49fb-9471-f86c7d703ebf'),
	(109,1,1,1,'HPSE-Ogwo-pt2.docx.pdf','pdf',NULL,NULL,154690,NULL,NULL,NULL,'2021-07-21 16:19:00','2021-07-21 16:19:00','2021-07-21 16:19:00','2ba33bd5-f44c-4a37-958f-56f3c721c258'),
	(112,1,1,1,'HPSE-Ogwo-Pt-1.docx.pdf','pdf',NULL,NULL,173327,NULL,NULL,NULL,'2021-07-21 16:19:17','2021-07-21 16:19:17','2021-07-21 16:19:17','d5819fca-3d5e-4407-8c19-9aff50122eb7'),
	(116,1,1,1,'HPSE-Willis.docx.pdf','pdf',NULL,NULL,174494,NULL,NULL,NULL,'2021-07-21 16:43:23','2021-07-21 16:43:23','2021-07-21 16:43:23','850d28ee-4065-45b3-acc0-a644c783c61d'),
	(121,1,1,1,'HPSE-Campbell.docx.pdf','pdf',NULL,NULL,127746,NULL,NULL,NULL,'2021-07-21 17:07:22','2021-07-21 17:07:22','2021-07-21 17:07:22','bcab6d61-1ac0-4d22-8df4-7fd97a3d10fd'),
	(124,1,1,1,'HPSE-Ogwo-Pt2_AO-1.pdf','pdf',NULL,NULL,155383,NULL,NULL,NULL,'2021-08-03 14:06:27','2021-08-03 14:06:27','2021-08-03 14:06:27','4a0826e5-803a-4d93-b67b-0b66cd67c0ad'),
	(126,1,1,1,'HPSE-Ogwo-Pt-1_AO.pdf','pdf',NULL,NULL,170487,NULL,NULL,NULL,'2021-08-03 14:06:47','2021-08-03 14:06:47','2021-08-03 14:06:47','59c4f0ef-7cc2-46b5-8b78-544567a7f82b');

/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransformindex`;

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransforms`;

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransforms_name_idx` (`name`),
  KEY `assettransforms_handle_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups`;

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups_sites`;

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table changedattributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedattributes`;

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedattributes_siteId_fk` (`siteId`),
  KEY `changedattributes_userId_fk` (`userId`),
  CONSTRAINT `changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(15,1,'title','2021-04-21 14:42:37',0,1),
	(17,1,'title','2021-04-21 14:43:51',0,1),
	(59,1,'title','2021-04-21 17:41:18',0,1),
	(62,1,'title','2021-04-21 17:43:31',0,1);

/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table changedfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `changedfields`;

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  KEY `changedfields_siteId_fk` (`siteId`),
  KEY `changedfields_fieldId_fk` (`fieldId`),
  KEY `changedfields_userId_fk` (`userId`),
  CONSTRAINT `changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`)
VALUES
	(15,1,6,'2021-04-21 14:42:37',0,1),
	(15,1,7,'2021-01-13 16:16:52',0,1),
	(15,1,8,'2021-04-21 14:42:37',0,1),
	(17,1,6,'2021-04-21 14:43:51',0,1),
	(17,1,8,'2021-04-21 14:45:50',0,1),
	(37,1,3,'2021-04-20 14:38:26',0,1),
	(37,1,4,'2021-04-22 22:48:31',0,1),
	(41,1,4,'2021-07-21 15:11:55',0,1),
	(49,1,8,'2021-04-21 15:34:25',0,1),
	(51,1,8,'2021-04-21 15:36:15',0,1),
	(53,1,6,'2021-04-21 18:36:24',0,1),
	(53,1,8,'2021-04-21 18:36:24',0,1),
	(55,1,8,'2021-04-21 17:38:24',0,1),
	(57,1,8,'2021-04-21 17:39:03',0,1),
	(59,1,6,'2021-04-21 17:41:18',0,1),
	(59,1,8,'2021-04-21 17:40:02',0,1),
	(62,1,6,'2021-04-21 17:43:31',0,1),
	(62,1,8,'2021-04-21 17:43:31',0,1),
	(65,1,7,'2021-04-21 15:24:27',0,1),
	(67,1,6,'2021-04-22 22:50:17',0,1),
	(67,1,8,'2021-04-21 15:24:08',0,1),
	(69,1,8,'2021-04-21 15:24:20',0,1),
	(103,1,4,'2021-07-21 15:49:02',0,1),
	(103,1,5,'2021-08-03 14:06:54',0,1),
	(110,1,5,'2021-08-03 14:06:30',0,1);

/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_projectIntroduction` text,
  `field_interviewsIntroduction` text,
  `field_videoEmbed` text,
  `field_description` text,
  `field_timelineDescription` text,
  `field_timelineType` varchar(255) DEFAULT NULL,
  `field_bibliography` text,
  `field_credits` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_projectIntroduction`, `field_interviewsIntroduction`, `field_videoEmbed`, `field_description`, `field_timelineDescription`, `field_timelineType`, `field_bibliography`, `field_credits`)
VALUES
	(1,1,1,NULL,'2020-08-18 13:00:37','2021-01-18 13:27:06','3c384576-f049-48f6-b136-2436f695e60d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,7,1,NULL,'2021-01-13 15:26:50','2022-05-06 16:47:40','7e44bd0d-e6e7-43a3-b1fc-57cc383a0a1b','<h4>This oral history project documents the formation and impact of the student-led movement of <em>Black Lives Matter in Higher Education (BLMHE)</em>. Housed within Teachers College Higher and Postsecondary Education Program (HPSE), this group consists of HPSE students and faculty that have come together to analyze the effects of systemic societal forces on members of the HPSE community and their broader effects on higher education. </h4>','<p>Taking a decolonial approach toward documenting this group, <a href=\"https://www.cynthiatobar.net/\">Cynthia Tobar</a> collaborated with and worked alongside student activists in BLMHE. These interviews seek to demonstrate issues of microaggressions, diversity &amp; inclusion, sense of belonging and the role of Teachers College faculty in the Higher and Postsecondary program in combating racism in higher education.</p>',NULL,NULL,NULL,NULL,'<p>Altbach, P.G. “Patterns of higher education development,” p.15-36 in Altbach, P. G., Gumport, P. J., &amp; Berdahl, R. O. (Eds.). (2011). <em>American higher education in the twenty-first century: Social, political, and economic challenges.</em> JHU Press.</p>\n<p>Bonilla-Silva, E. (1997). Rethinking racism: Toward a structural interpretation. <em>American sociological review</em>, 465-480.</p>\n<p>Bowman, N. A., Park, J. J., &amp; Denson, N. (2015). Student Involvement in Ethnic Student Organizations: Examining Civic Outcomes 6 Years After Graduation. <em>Research in Higher Education: Journal of the Association for Institutional Research</em>, 56, 2, 127-145. </p>\n<p>Castillo-Montoya, M., &amp; Torres-Guzmán, M. (2012). Thriving in Our Identity and in the Academy: Latina Epistemology as a Core Resource. <em>Harvard Educational Review, 82, </em>4, 540-558.</p>\n<p>Cook-Sather, A. (2016). Creating Brave Spaces within and through Student-Faculty Pedagogical Partnerships, <em>Teaching and Learning Together in Higher Education</em>: Iss. 18, <a href=\"http://repository.brynmawr.edu/tlthe/vol1/iss18/1\">http://repository.brynmawr.edu/tlthe/vol1/iss18/1</a> </p>\n<p>Gibson, J. (March 07, 1996). “Can\'t we settle this?” Student conflicts in higher education and options for resolution. <em>New Directions for Higher Education</em>, 1995, 92, 27-34. </p>\n<p>Hope, E. C., Keels, M., &amp; Durkee, M. I. (2016). Participation in Black Lives Matter and deferred action for childhood arrivals: Modern activism among Black and Latino college students. <em>Journal of Diversity in Higher Education</em>, 9(3), 203. </p>\n<p>Janesick, V. J. (2007). Oral History as a Social Justice Project: Issues for the Qualitative Researcher. <em>The Qualitative Report,</em> 12(1), 111-121. </p>\n<p>Kimball, E. W., Moore, A., Vaccaro, A., Troiano, P. F., &amp; Newman, B. M. (2016). College students with disabilities redefine activism: Self-advocacy, storytelling, and collective action. <em>Journal of Diversity in Higher Education</em>, 9, 3, 245-260. </p>\n<p>Kohstall, F. (2015). From Reform to Resistance: Universities and Student Mobilisation in Egypt and Morocco before and after the Arab Uprisings. <em>British Journal of Middle Eastern Studies, 42, </em>1, 59-73.</p>\n<p>McAdam, D. (1986). Recruitment to high-risk activism: The case of freedom summer. <em>American Journal of Sociology</em>, 92, 64–90.</p>\n<p>Palmer, P. (2009). <em>The courage to teach.</em>\nHoboken, NJ: John Wiley &amp; Sons.</p>\n<p>Parsons, M and Ward, E. (2001), “The Roaring Silence: Feminist Revisions in the Education</p>\n<p>Policy Literature,” <em>Policy Studies Review</em> 18 (2), 46-64.</p>\n<p>Pascarella, E. T., &amp; Terenzini, P. T. (1991). <em>How college affects students: Findings and insights from twenty years of research.</em>\nSan Francisco, CA: Jossey-Bass.</p>','<p><em><br /></em></p>\n<p><em>The Black Lives Matter in Higher Education oral history project is made possible thanks to funding from The City University of New York PSC-CUNY Research Award Program and <em>a Teachers College Vice Presidential Grant for Diversity and Community Initiative grant. </em></em></p>'),
	(15,15,1,'BLMHE Kick-Off Event','2021-01-13 15:49:43','2021-04-21 15:18:32','cd7eabd6-8ab2-419b-86bb-f4ce2643978e',NULL,NULL,NULL,NULL,'<p>BLMHE hosted it\'s first kick-off event and was held in the Grace Dodge building at Teachers College. The event, which was attended by both HPSE faculty and students, was designed to help spark interactive discussions on how the Black Lives Matter movement intersects with higher education, and to develop BLMHE\'s mission and practice.</p>','local',NULL,NULL),
	(16,16,1,'Test','2021-01-13 15:51:53','2021-01-13 15:51:53','931b6b39-a102-47d2-be5e-36d403210d69',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(17,17,1,'BLM movement begins','2021-01-13 15:53:20','2021-04-21 15:36:45','33dba342-e067-4ae7-aad0-027af6077f8d',NULL,NULL,NULL,NULL,'<p>The Black Lives Matter movement began in 2013, following the death of Trayvon Martin, an African-American teenager who was shot while walking to a family friend\'s house, and the subsequent acquittal of George Zimmerman, the man who shot him.<br /><br />The campaign was co-founded by three Black women: Alicia Garza, Patrisse Cullors, and Opal Tometi, as a response to the police killings of Black people. The phrase \"black lives matter\" was first used in a Facebook post by Garza after Zimmerman was found not guilty, and was the inspiration for the campaign. Cullors recognised the power of Garza\'s words and created the hashtag #BlackLivesMatter, and the campaign was born.</p>','national',NULL,NULL),
	(19,19,1,'Sample','2021-01-19 16:19:55','2021-01-19 16:19:55','6514c38c-c0ab-4083-9368-1ca0e9013aa9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(24,24,1,'Sample','2021-01-19 16:38:05','2021-01-19 16:38:05','5a0cc491-ad0a-446b-b19e-8b16caa3c823',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(25,25,1,'HPSE Allen','2021-04-13 21:28:31','2021-04-13 21:28:31','17d5c9a8-5d80-4fc0-8369-22c01235c284',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(28,28,1,'HPSE Mc Neil','2021-04-13 21:38:16','2021-04-13 21:38:16','83b76d5c-aeea-456b-b4da-5a45e3ff0af0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(29,29,1,'Interview with Charlen McNeill','2021-04-13 21:41:15','2021-07-21 14:18:19','9971491c-9e4c-4f2c-8636-54e3161f6e47',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fXllxWo_1a0\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Charlen McNeil, a co-founder and former Ed.M. student at TC, from Hoboken, New Jersey, describes how her family background and growing up in the Hoboken Projects influenced her early forays into activism. In this interview, Charlen describes how her family’s involvement in the Black Panther Party and the NAACP played a critical part in her burgeoning activism. Charlen reflects on how the realization of how TC values diversity and inclusion has influenced her experience as a student and her future aspirations for a future as a higher education professional.',NULL,NULL,NULL,NULL),
	(30,30,1,'Interview with Charlen McNeill','2021-04-13 21:41:15','2021-04-13 21:41:15','c9237a44-85ec-4191-919b-3cf231c446d9',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fXllxWo_1a0\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Charlen McNeil, a co-founder and former Ed.M. student at TC, from Hoboken, New Jersey, describes how her family background and growing up in the Hoboken Projects influenced her early forays into activism. In this interview, Charlen describes how her family’s involvement in the Black Panther Party and the NAACP played a critical part in her burgeoning activism. Charlen reflects on how the realization of how TC values diversity and inclusion has influenced her experience as a student and her future aspirations for a future as a higher education professional.',NULL,NULL,NULL,NULL),
	(36,36,1,'HPSE Stephens','2021-04-13 21:49:13','2021-04-13 21:49:13','5ab7cda1-c6ba-4444-bcb6-89b3b847668c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(37,37,1,'Interview with Kat Stephens','2021-04-13 21:49:44','2021-04-22 22:48:31','1cd5652e-685c-4b81-b394-942fff1d7568',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SlGVrAT3A3k\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Kat Stephens, a co-founder and former Ed.M student in the HPSE program, was born in Guyana, South America, who as a child emigrated to New York City. In this interview, Kat expresses how she perceives performing blackness in an American context amongst other groups at TC has helped her more confidently center her own identity, and how she has arrived at a point in her life where she is no longer performing and is proud of her AfroCarribean roots. Kat describes how from the beginning of these brainstorming sessions, the students were interested in a distinctly different vision of activism that would go beyond direct action tactics such as protests or rallies.',NULL,NULL,NULL,NULL),
	(38,38,1,'Interview with Kat Stephens','2021-04-13 21:49:44','2021-04-13 21:49:44','0598dbab-de7d-42e9-8196-e565d68c72cf',NULL,NULL,'Charlen McNeil, a former Ed.M. student at TC, from Hoboken, New Jersey, describes how her family background and growing up in the Hoboken Projects influenced her early forays into activism. Charlen describes how her family’s involvement in the Black Panther Party and the NAACP played a critical part in her burgeoning activism. Charlen reflects on how the realization of how TC values diversity and inclusion has influenced her experience as a student and her future aspirations for a future as a higher education professional.','Kat Stephens, a co-founder and former Ed.M student in the HPSE program, was born in Guyana, South America, who as a child emigrated to New York City as a child. In this interview, Kat expresses how she perceives performing blackness in an American context amongst other groups at TC has helped her more confidently center her own identity, and how she has arrived at a point in her life where she is no longer performing and is proud of her AfroCarribean roots. Kat describes how from the beginning of these brainstorming sessions, the students were interested in a distinctly different visions of activism that would go beyond direct action tactics such as protests or rallies.',NULL,NULL,NULL,NULL),
	(40,40,1,'HPSE Allen','2021-04-13 21:50:31','2021-04-13 21:50:31','c680052c-fe7a-46df-83b9-96bb134d3d8a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(41,41,1,'Interview with Brian Allen','2021-04-13 21:51:11','2021-07-21 15:11:55','e8352e90-cf23-40f9-ae9e-0317ffd1ea3e',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/_EY1_F4Tpw8\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Brian Allen, a co-founder of BLMHE, is currently a doctoral student in the HPSE program who began at TC as a Masters student. In this interview, he shares his thoughts on what his vision of activism was like before becoming involved with BLMHE and how it has changed over time.',NULL,NULL,NULL,NULL),
	(42,42,1,'Interview with Brian Allen','2021-04-13 21:51:11','2021-04-13 21:51:11','d0ead7e0-9ed0-4ce1-b5f4-d21370f82407',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/_EY1_F4Tpw8\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Brian Allen is a co-founder of BLMHE, a doctoral student in the HPSE program who began at TC as a Masters student. In this interview, shares his thoughts on what his vision of activism was like before becoming involved with BLMHE and how it has changed over time.',NULL,NULL,NULL,NULL),
	(45,45,1,'Interview with Kat Stephens','2021-04-20 14:38:26','2021-04-20 14:38:26','76b3928c-0231-46d7-a367-9656a54ec70b',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SlGVrAT3A3k\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Kat Stephens, a co-founder and former Ed.M student in the HPSE program, was born in Guyana, South America, who as a child emigrated to New York City as a child. In this interview, Kat expresses how she perceives performing blackness in an American context amongst other groups at TC has helped her more confidently center her own identity, and how she has arrived at a point in her life where she is no longer performing and is proud of her AfroCarribean roots. Kat describes how from the beginning of these brainstorming sessions, the students were interested in a distinctly different visions of activism that would go beyond direct action tactics such as protests or rallies.',NULL,NULL,NULL,NULL),
	(46,46,1,'Screen Shot 2021 04 21 at 10 42 07 AM','2021-04-21 14:42:25','2021-04-21 14:42:25','42ed0454-f121-44f0-bc63-c426999449db',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(47,47,1,'Screen Shot 2021 04 21 at 10 45 35 AM','2021-04-21 14:45:47','2021-04-21 14:45:47','ab01f790-e94d-438b-af16-86666843422a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(49,49,1,'Deaths of Walter Scott, Freddie Gray, and Meagan Hockaday; Black Trans Lives Matter','2021-04-21 14:49:46','2021-04-21 15:34:25','5f63439b-ce8c-4811-bb1f-64f76a659fb3',NULL,NULL,NULL,NULL,'<p>The following year saw another spate of Black people killed by police officers in the USA, including Walter Scott, Freddie Gray, and Meagan Hockaday. Black Lives Matter protested against these and many more. They also organised protests to highlight the injustices faced by Black women and Black transgender women. By the end of 2015, 21 transgender people had been killed that year in the USA, a record number at the time, and 13 of the victims were Black.</p>','national',NULL,NULL),
	(51,51,1,'Deaths of Danner and Sterling; Kaepernick protest','2021-04-21 14:51:31','2021-04-21 15:36:15','6fb8113e-8c1e-4099-966b-384334d6fd1c',NULL,NULL,NULL,NULL,'<p>2016 saw Black Lives Matter organize many more protests against police brutality towards Black people. Those whose deaths occurred due to police actions included Deborah Danner and Alton Sterling. Early July saw over 100 protests take place across America following Sterling\'s death on July 5th, and Philandro Castile\'s shooting the next day. This year also saw major American sports stars lend their voices to the cause of Black Lives Matter. In July 2016, basketball players including LeBron James and Carmelo Anthony opened an awards ceremony by speaking about recent deaths of Black people, saying: \"Enough is enough.\" Then, from August, many sports stars began taking part in protests during national anthems at sports games, beginning with Colin Kaepernick, who knelt during the anthem ahead of an NFL game.</p>','national',NULL,NULL),
	(53,53,1,'First BLM art exhibit; Castile court ruling and protest; Unite the Right rally','2021-04-21 14:52:36','2021-04-21 18:36:24','af63e453-ac3c-4a14-9f6e-6b299e8ab52f',NULL,NULL,NULL,NULL,'<p>In 2017, Black Lives Matter put on their first art exhibition timed to coincide with Black History Month in the US state of Virginia. It featured the work of over 30 Black artists and creators. Black Lives Matter protest not only the killings of Black people, but also some acquittals and \'not guilty\' verdicts in those cases which make it to trial. In June, they held a protest after the officer accused of killing Philandro Castile the year before was found not guilty. In August, Black Lives Matter campaigners were among counter-protestors at a white supremacist \'Unite The Right\' rally in Charlottesville, Virginia.</p>','national',NULL,NULL),
	(55,55,1,'ABC News interview; #BlackLivesMatter ; Deaths of Mack and Ross Jr.','2021-04-21 14:53:05','2021-04-21 17:38:24','17d711ae-3e79-4393-b1dd-952d56997c85',NULL,NULL,NULL,NULL,'<p>In an interview with ABC News marking five years of Black Lives Matter, Cullors explained the impact the organisation had had on other causes. She said: “[BLM] has popularised civil disobedience and the need to put our bodies on the line... With things like the Women’s March, and Me Too, and March for our Lives, all of these movements, their foundations are in Black Lives Matter.”</p>\n<p>By May 1st, 2018, a study found that the hashtag #BlackLivesMatter had been used nearly 30 million times on Twitter since the first instance in 2013.</p>\n<p>As they marked five years of action, Black Lives Matter continued to highlight the deaths of Black people who had lost their lives at the hands of US police that year, including Grechario Mack and Kenneth Ross Jr.</p>','national',NULL,NULL),
	(57,57,1,'21 Savage arrest; Death of Isaiah Lewis','2021-04-21 14:53:58','2021-04-21 17:39:03','aab39b85-84a8-46e4-a02a-2ad9b9ed9754',NULL,NULL,NULL,NULL,'<p>In February 2019, the rapper 21 Savage was arrested and detained by the United States\' immigration agency, ICE. As a result, Cullors convened a group of 60 high profile stars from the music and entertainment worlds to advocate for his release.</p>\n<p>Then, in May, Oklahoma teenager Isaiah Lewis was shot by police and killed. Days later, Black Lives Matter held a 100-strong rally in protest.</p>','national',NULL,NULL),
	(59,59,1,'Death of George Floyd; Global protests; Biden elected','2021-04-21 14:54:55','2021-04-21 18:37:50','2222082c-d99b-42ec-96d4-6b946486f914',NULL,NULL,NULL,NULL,'<p>Major protests were sparked at the end of May following the death of George Floyd in Minneapolis. A video showing a police officer kneeling on Floyd\'s neck went viral following his death. Police officer, Derek Chauvin, has since been charged with second-degree murder - raised from an initial charge of third-degree murder and second-degree manslaughter. Three other officers who were there have all been charged with aiding and abetting second-degree murder and aiding and abetting second-degree manslaughter. Their cases are also yet to go to trial. Black Lives Matter went on to organize protests around the world. In London, two Black activists Aima, 18, and Tash, 21, organized a rally in Trafalgar Square, which was attended by thousands on Sunday, May 31st. Many more have followed since. At one London protest, Star Wars actor John Boyega joined 15,000 others in Hyde Park, and told crowds: \"Today is about innocent people who were halfway through their process, we don’t know what George Floyd could have achieved, we don’t know what Sandra Bland could have achieved, but today we’re going to make sure that won’t be an alien thought to our young ones.\"</p>\n<p>In November, Joe Biden won the US Presidential election, and vote counts revealed that areas with high numbers of Black voters helped him win many of the states that went to Trump in the 2016 election.</p>','national',NULL,NULL),
	(61,61,1,'Screen Shot 2021 04 21 at 10 57 54 AM','2021-04-21 14:58:13','2021-04-21 14:58:13','9f2853f3-d85c-4928-a705-3057c8de927d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(62,62,1,'BLM nominated for Nobel Peace Prize; Chauvin Guilty of Murder in Floyd\'s Death','2021-04-21 14:59:30','2021-04-21 17:43:46','be32b0f0-ce9d-4f3e-9552-96bd4fe332fd',NULL,NULL,NULL,NULL,'\n<p>In January, the Black Lives Matter movement was nominated for the Nobel Peace Prize by Norwegian MP Petter Eide. His written nomination noted that, “awarding the peace prize to Black Lives Matter, as the strongest global force against racial injustice, will send a powerful message that peace is founded on equality, solidarity and human rights, and that all countries must respect those basic principles.”</p>\n<p>On 20 April, former police officer Derek Chauvin was found guilty on all three counts relating to his killing of George Floyd – second- and third-degree murder, and manslaughter. The jury reached the verdict unanimously after 10-and-a-half hours of deliberations. Crowds who were gathered at the spot where Floyd was killed, outside the courtroom and across the US erupted into cheers as the verdict was read out.</p>\n<p>Floyd’s family spoke of their relief and highlighted the work still to be done. “I am going to put up a fight every day,” said George’s brother, Philonise Floyd. “Because I am not just fighting for George anymore.”</p>\n<p>Darnella Frazier, the passer-by who recorded the widely shared video of Floyd’s murder when she was 17 years old, said in a Facebook post: “George Floyd we did it!! Justice has been served.”</p>\n<p>US President Joe Biden addressed the nation following the verdict, saying it\'s “a moment of significant change”, but added: “It\'s not enough. We can’t stop here. We’re going to deliver real change and reform.”</p>\n','national',NULL,NULL),
	(64,64,1,'Screen Shot 2021 04 21 at 11 19 19 AM','2021-04-21 15:19:32','2021-04-21 15:19:32','446fb189-8f04-4fe4-99bb-7fce345e4590',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(65,65,1,'Mental Health and Wellness in the BLM Movement','2021-04-21 15:20:10','2021-04-21 15:24:27','8f0a7bf2-9002-4268-a797-97317e64adbf',NULL,NULL,NULL,NULL,'<p>This seminar focused on how student activism and institutionalized racism impacts marginalized students. It was held at Grace Dodge Hall. The graduate student panel consisted of Randolph Scott-McLaughlin, Stephanie Lancet, Nathara Bailey and Mariel Buque. The keynote speaker was Dr. Derald W. Sue, Professor of Psychology and Education.</p>','local',NULL,NULL),
	(67,67,1,'Reckoning with the Past: Columbia University, Slavery and Black Lives Matter','2021-04-21 15:21:03','2021-04-22 22:50:17','dc8567d5-cd5f-472e-9130-d2e5749684af',NULL,NULL,NULL,NULL,'<p>This seminar, which was co-sponsored by HPSE, the Vice President\'s Office for Diversity and Community Affairs at TC and the Black Student Network, was held at the Cowin Auditorium in the Horace Mann building at TC. The key speaker was Dr. Karl Jacoby, Professor from the Department of History and Center for the Study of Ethnicity and Race at Columbia University. Dr. Jacoby and his undergraduate students presented on the Columbia University and Slavery seminar as well as the students\' current research projects. The discussion concluded with a conversation on the obligation of universities to reconcile their histories in order to be responsive to constituents today and how understanding their role in slavery can help affirm that Black Lives Matter.</p>','local',NULL,NULL),
	(69,69,1,'Examining the Movement: Student Activism and BLM in Theory and Practice','2021-04-21 15:21:47','2021-04-21 15:24:20','ac4e1cb6-4690-4c31-84f7-dab0b72b1119',NULL,NULL,NULL,NULL,'<p>This seminar, held at the Milbank Chapel, features guest speakers Dr. Charles H.F. Davis III and Deray McKesson. The speakers reiterated the critical nature of social activist movements such as BLM in the current shifting political climate. They reflected on the essential nature that both a theoretical and real-world perspective on social movements are in order to engage and better support marginalized members within higher education. The implications of allyship and the resulting responsibilities within the movement were also discussed.</p>','local',NULL,NULL),
	(71,71,1,'Screen Shot 2021 04 21 at 11 23 29 AM','2021-04-21 15:23:45','2021-04-21 15:23:45','c8d8700a-f93b-4128-ad8d-9ba25693549c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(72,72,1,'Fall 2017 Kick-off Informational','2021-04-21 15:23:52','2021-04-21 15:25:02','0043a063-2b69-4655-9afa-aad0eb069d41',NULL,NULL,NULL,NULL,'<p>The Fall kick-off of the Black Lives Matter in Higher Education Series was held in the Zankel building at Teachers College.</p>','local',NULL,NULL),
	(73,73,1,'Screen Shot 2021 04 21 at 11 22 49 AM','2021-04-21 15:24:04','2021-04-21 15:24:04','7cf4fb61-a961-421c-a781-f5a63750a248',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(74,74,1,'Screen Shot 2021 04 21 at 11 23 07 AM','2021-04-21 15:24:18','2021-04-21 15:24:18','7965661b-b023-4146-b94a-c4dba32795b9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(77,77,1,'Screen Shot 2021 04 21 at 11 25 48 AM','2021-04-21 15:26:00','2021-04-21 15:26:00','8d11015a-551b-4ed0-9098-166b28528a15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(78,78,1,'All Black Lives Matter','2021-04-21 15:26:04','2021-04-21 15:26:04','49befd19-5baf-436a-baa9-e8b3ee2439d8',NULL,NULL,NULL,NULL,'<p>This seminar, held at Horace Mann, centered on what is Black and who does BLM speak to? The featured speaker was Dr. Chrystal George Mwangi, Assistant Professor, Educational Policy, Research and Administration at UMass Amherst. The presentation explored the use of Blackness as an overarching categorization tool that often lacks an understanding of the diversity and nuance existing within the African Diaspora.</p>','local',NULL,NULL),
	(80,80,1,'Screen Shot 2021 04 21 at 11 27 21 AM','2021-04-21 15:27:36','2021-04-21 15:27:36','3d94e7af-138e-44d3-8adf-cc18e33d34bc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(81,81,1,'Whose Speech is Free Speech?','2021-04-21 15:27:42','2021-04-21 15:27:42','d5ff7133-dbd9-48db-abe5-40ef9abc1a70',NULL,NULL,NULL,NULL,'<p>This roundtable discussion, held at Grace Dodge, focused on the highly contentious issue of free speech conversations in higher education. The discussion explored the conflation of free and hate speech and the resulting impact and implications for specific demographics of students, faculty and staff.</p>','local',NULL,NULL),
	(83,83,1,'Screen Shot 2021 04 21 at 11 28 22 AM','2021-04-21 15:28:36','2021-04-21 15:28:36','c546ec04-748f-4ebf-b32e-c2a0e5742a54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(84,84,1,'Women of Wakanda: Parallels of Strength and Innovation to Women in the Academy','2021-04-21 15:29:09','2021-04-21 15:29:09','3b319844-db70-48b5-8924-23ca4b3697dc',NULL,NULL,NULL,NULL,'<p>This discussion was held at Grace Dodge.</p>','local',NULL,NULL),
	(86,86,1,'Screen Shot 2021 04 21 at 11 30 10 AM','2021-04-21 15:30:23','2021-04-21 15:30:23','5fd2b7ee-1b92-4da1-b16f-bcc032eb5347',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(87,87,1,'Days of Resistance: BLMHE oral history exhibit opening','2021-04-21 15:30:28','2021-04-21 15:30:28','7c6d8f1d-eaf1-4d03-ac80-dadcc887f0c9',NULL,NULL,NULL,NULL,'<p>This oral history exhibit opening and reception was held at Zankel Hall. It consisted of a site-specific multi-media oral history exhibition, across the 2nd floor hallway of Zankel, that reflected on how activist student movements continue to inform and influence not just culture and politics, but also education. The exhibit featured video oral history interviews with BLMHE student co-founders Kat Stephens, Charlen McNeill and Brian Allen.</p>','local',NULL,NULL),
	(89,89,1,'Screen Shot 2021 04 21 at 11 30 55 AM','2021-04-21 15:31:09','2021-04-21 15:31:09','e6cb50ea-6054-481f-8549-ad274a1583c2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(90,90,1,'Imposter Syndrome Open Dialogue','2021-04-21 15:32:06','2021-04-21 15:32:06','2cb4607d-7643-4357-8230-588cd8d08048',NULL,NULL,NULL,NULL,'<p>BLMHE held an open dialogue to unpack imposter syndrome. Through faculty presentation, student perspectives, and reflection opportunities, the group was able to create a supportive environment for those struggling to find their place or voice in academia. This discussion was held at Horace Mann.</p>','local',NULL,NULL),
	(91,91,1,'Screen Shot 2021 04 21 at 11 33 24 AM','2021-04-21 15:33:43','2021-04-21 15:33:43','7ea00516-bac0-43d5-8264-3bbcbb78a409',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(92,92,1,'Screen Shot 2021 04 21 at 11 35 54 AM','2021-04-21 15:36:08','2021-04-21 15:36:08','974aaad0-7f57-460b-b9b8-4f7860e635ed',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(93,93,1,'Screen Shot 2021 04 21 at 1 37 38 PM','2021-04-21 17:38:21','2021-04-21 17:38:21','d23deca7-ccff-41b0-9918-49e0f8ab6866',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(94,94,1,'Screen Shot 2021 04 21 at 1 38 48 PM','2021-04-21 17:39:02','2021-04-21 17:39:02','65e35fd0-8e2e-43ef-9b87-4a431d217c4a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(95,95,1,'Screen Shot 2021 04 21 at 1 37 38 PM','2021-04-21 17:39:55','2021-04-21 17:39:55','54e9ea8e-0330-4e72-9d1c-1ab5a05a41e0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(96,96,1,'Screen Shot 2021 04 21 at 1 37 38 PM','2021-04-21 17:42:56','2021-04-21 17:42:56','c158140b-fff5-4cd6-b685-5f5aabc085d5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(97,97,1,'Interview with Kat Stephens','2021-04-21 18:17:31','2021-04-21 18:17:31','d03d884b-0cba-4ad5-b89b-3ad0e2395710',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SlGVrAT3A3k\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Kat Stephens, a co-founder and former Ed.M student in the HPSE program, was born in Guyana, South America, who as a child emigrated to New York City as a child. In this interview, Kat expresses how she perceives performing blackness in an American context amongst other groups at TC has helped her more confidently center her own identity, and how she has arrived at a point in her life where she is no longer performing and is proud of her AfroCarribean roots. Kat describes how from the beginning of these brainstorming sessions, the students were interested in a distinctly different vision of activism that would go beyond direct action tactics such as protests or rallies.',NULL,NULL,NULL,NULL),
	(98,98,1,'Screen Shot 2021 04 21 at 2 36 07 PM','2021-04-21 18:36:23','2021-04-21 18:36:23','cf58e78c-cc29-4b6a-8faf-692848455a18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(99,99,1,'Interview with Kat Stephens','2021-04-22 22:48:31','2021-04-22 22:48:31','19418310-a09c-451a-ad09-7a0edd176808',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SlGVrAT3A3k\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Kat Stephens, a co-founder and former Ed.M student in the HPSE program, was born in Guyana, South America, who as a child emigrated to New York City. In this interview, Kat expresses how she perceives performing blackness in an American context amongst other groups at TC has helped her more confidently center her own identity, and how she has arrived at a point in her life where she is no longer performing and is proud of her AfroCarribean roots. Kat describes how from the beginning of these brainstorming sessions, the students were interested in a distinctly different vision of activism that would go beyond direct action tactics such as protests or rallies.',NULL,NULL,NULL,NULL),
	(100,100,1,'Interview with Brian Allen','2021-04-22 22:49:24','2021-04-22 22:49:24','82df9459-4718-4a6a-b13c-6ea515a65264',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/_EY1_F4Tpw8\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Brian Allen, a co-founder of BLMHE, is currently a doctoral student in the HPSE program who began at TC as a Masters student. In this interview, shares his thoughts on what his vision of activism was like before becoming involved with BLMHE and how it has changed over time.',NULL,NULL,NULL,NULL),
	(101,101,1,'Interview with Charlen McNeill','2021-07-21 14:18:19','2021-07-21 14:18:19','f096f377-8eb5-49de-8632-0dd9d91a10a0',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fXllxWo_1a0\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Charlen McNeil, a co-founder and former Ed.M. student at TC, from Hoboken, New Jersey, describes how her family background and growing up in the Hoboken Projects influenced her early forays into activism. In this interview, Charlen describes how her family’s involvement in the Black Panther Party and the NAACP played a critical part in her burgeoning activism. Charlen reflects on how the realization of how TC values diversity and inclusion has influenced her experience as a student and her future aspirations for a future as a higher education professional.',NULL,NULL,NULL,NULL),
	(103,103,1,'Interview with Ashley Ogwo, Part 1','2021-07-21 14:21:22','2021-08-03 14:06:54','36d1debd-5fe2-40b3-bdb2-c6d78a5b453c',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1mpFaJ9bAwVVCfC3m5Lpv_PLOCyU7yRKo/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Ashlely Ogwo, is a former EdM student in the HPSE program, and currently a doctoral student in the University of Maryland. In this interview, she describes her time growing up in Detroit as an Igbo American, her early educational experiences and her undergraduate journey before pursuing higher education as a field of study at Teachers College.',NULL,NULL,NULL,NULL),
	(104,104,1,'Interview with Ashley Ogwo, Part 1','2021-07-21 14:21:22','2021-07-21 14:21:22','a87f5652-8f2c-4b7f-b7bd-35209c9d7d01',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1mpFaJ9bAwVVCfC3m5Lpv_PLOCyU7yRKo/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Ashlely Ogwo, former HPSE student.',NULL,NULL,NULL,NULL),
	(105,105,1,'Interview with Brian Allen','2021-07-21 15:11:55','2021-07-21 15:11:55','abf99436-6494-4e02-a0de-f6c6197a28a1',NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/_EY1_F4Tpw8\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>','Brian Allen, a co-founder of BLMHE, is currently a doctoral student in the HPSE program who began at TC as a Masters student. In this interview, he shares his thoughts on what his vision of activism was like before becoming involved with BLMHE and how it has changed over time.',NULL,NULL,NULL,NULL),
	(106,106,1,'Interview with Ashley Ogwo, Part 1','2021-07-21 15:49:02','2021-07-21 15:49:02','81c3d084-74c3-41a2-aabe-19c47333f889',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1mpFaJ9bAwVVCfC3m5Lpv_PLOCyU7yRKo/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Ashlely Ogwo, is a former EdM student in the HPSE program, and currently a doctoral student in the University of Maryland. In this interview, she describes her time growing up in Detroit as an Igbo American, her early educational experiences and her undergraduate journey before pursuing higher education as a field of study at Teachers College.',NULL,NULL,NULL,NULL),
	(107,107,1,'Interview with Ashley Ogwo, Part 1','2021-07-21 15:50:40','2021-07-21 15:50:40','fd6d3e9b-ba43-42d5-99ac-a7770e25a5f2',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1mpFaJ9bAwVVCfC3m5Lpv_PLOCyU7yRKo/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Ashlely Ogwo, is a former EdM student in the HPSE program, and currently a doctoral student in the University of Maryland. In this interview, she describes her time growing up in Detroit as an Igbo American, her early educational experiences and her undergraduate journey before pursuing higher education as a field of study at Teachers College.',NULL,NULL,NULL,NULL),
	(109,109,1,'HPSE Ogwo pt2 docx','2021-07-21 16:19:00','2021-07-21 16:19:00','f2d168fb-e512-4271-8eae-13d334f0e096',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(110,110,1,'Interview with Ashley Ogwo, Part 2','2021-07-21 16:19:09','2021-08-03 14:06:30','905a775b-7287-439b-9da8-8ac9d1a73f8a',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1bqY46RktDZyM3ZlE9GyHMDldcD1FMdpq/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','In part 2 of this interview, Ashley Ogwo shares her internal journey as a graduate student while at Teachers College, as well as her involvement in BLMHE. She describes how her involvement with BLMHE helped her realize that activism can take many different forms within higher education.',NULL,NULL,NULL,NULL),
	(111,111,1,'Interview with Ashley Ogwo, Part 2','2021-07-21 16:19:09','2021-07-21 16:19:09','8a7f5857-65aa-4f06-8b6e-93ed2c477efb',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1bqY46RktDZyM3ZlE9GyHMDldcD1FMdpq/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','In part 2 of this interview, Ashley Ogwo shares her internal journey as a graduate student while at Teachers College, as well as her involvement in BLMHE. She describes how her involvement with BLMHE helped her realize that activism can take many different forms within higher education.',NULL,NULL,NULL,NULL),
	(112,112,1,'HPSE Ogwo Pt 1 docx','2021-07-21 16:19:17','2021-07-21 16:19:17','86b98317-c0ce-487a-8e5e-6dfa010ff1e0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(113,113,1,'Interview with Ashley Ogwo, Part 1','2021-07-21 16:19:19','2021-07-21 16:19:19','382cd381-68f2-4711-be62-7986d0859d19',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1mpFaJ9bAwVVCfC3m5Lpv_PLOCyU7yRKo/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Ashlely Ogwo, is a former EdM student in the HPSE program, and currently a doctoral student in the University of Maryland. In this interview, she describes her time growing up in Detroit as an Igbo American, her early educational experiences and her undergraduate journey before pursuing higher education as a field of study at Teachers College.',NULL,NULL,NULL,NULL),
	(114,114,1,'Interview with Ashley Ogwo, Part 2','2021-07-21 16:26:19','2021-07-21 16:26:19','7ab578fc-4aa1-46ba-afed-737a517f1d03',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1bqY46RktDZyM3ZlE9GyHMDldcD1FMdpq/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','In part 2 of this interview, Ashley Ogwo shares her internal journey as a graduate student while at Teachers College, as well as her involvement in BLMHE. She describes how her involvement with BLMHE helped her realize that activism can take many different forms within higher education.',NULL,NULL,NULL,NULL),
	(116,116,1,'HPSE Willis docx','2021-07-21 16:43:23','2021-07-21 16:43:23','a2cbd527-773c-489f-9b89-9ed94a85724b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(117,117,1,'Interview with Jenay Willis','2021-07-21 16:43:26','2021-07-21 16:45:03','ee9eb310-4baf-4eea-a88b-0420584a8630',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1Vap8R7lfwrHGn-nILoFyW1WA2Nqd2X8K/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Jenay Willis, is a former EdM student in the HPSE program, and currently a doctoral student in the University of Pittsburgh. In this interview, she shares her thoughts growing up in rural Georgia and the strong role her family’s support played in her education. She also describes how higher education in particular led to her growing sense of empowerment by the time she arrived at Teachers College and became involved with BLMHE.',NULL,NULL,NULL,NULL),
	(118,118,1,'Interview with Jenay Willis','2021-07-21 16:43:26','2021-07-21 16:43:26','abc2b4e6-7eb6-4b51-b991-d446de02e4fe',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1Vap8R7lfwrHGn-nILoFyW1WA2Nqd2X8K/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Jenay Willis, is a former EdM student in the HPSE program, and currently a doctoral student in the University of Pittsburgh. In this interview, she shares her thoughts growing up in rural Georgia and the strong role her family’s support played in her education. She also describes how higher education in particular led to her growing sense of empowerment by the time she arrived at Teachers College and became involved with BLMHE.',NULL,NULL,NULL,NULL),
	(119,119,1,'Interview with Jenay Willis','2021-07-21 16:45:03','2021-07-21 16:45:03','e45894b6-a277-43f8-b2e5-b066c197cfdd',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1Vap8R7lfwrHGn-nILoFyW1WA2Nqd2X8K/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Jenay Willis, is a former EdM student in the HPSE program, and currently a doctoral student in the University of Pittsburgh. In this interview, she shares her thoughts growing up in rural Georgia and the strong role her family’s support played in her education. She also describes how higher education in particular led to her growing sense of empowerment by the time she arrived at Teachers College and became involved with BLMHE.',NULL,NULL,NULL,NULL),
	(121,121,1,'HPSE Campbell docx','2021-07-21 17:07:22','2021-07-21 17:07:22','ba523870-dd8b-4e12-a03a-27f6a4c9922a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(122,122,1,'Interview with Dr. Corbin Campbell','2021-07-21 17:07:43','2021-07-21 17:07:43','8498bac1-c205-4275-9256-0f412c2026b4',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1kcvcqfBIRmMKEt1uSIJjSlRYUhqIsx8h/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Dr. Corbin Campbell, was an Associate Professor in the HPSE Program at TC, and currently a Associate Dean of Academic Affairs and Associate Professor in the School of Education at American University. In this interview, she expresses how her goal as a higher education educator is to have all students feel a sense of belonging in the classroom. She describes how  her desire to create antirascist spaces for students, especially students who have typically been voiceless in higher education, led to her support for and allyship involvement with BLMHE, and how it impacted her thinking on centering issues of equity in higher education as an educator and higher education administrator.',NULL,NULL,NULL,NULL),
	(123,123,1,'Interview with Dr. Corbin Campbell','2021-07-21 17:07:43','2021-07-21 17:07:43','758970f9-7639-47f2-9187-f318223245a2',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1kcvcqfBIRmMKEt1uSIJjSlRYUhqIsx8h/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Dr. Corbin Campbell, was an Associate Professor in the HPSE Program at TC, and currently a Associate Dean of Academic Affairs and Associate Professor in the School of Education at American University. In this interview, she expresses how her goal as a higher education educator is to have all students feel a sense of belonging in the classroom. She describes how  her desire to create antirascist spaces for students, especially students who have typically been voiceless in higher education, led to her support for and allyship involvement with BLMHE, and how it impacted her thinking on centering issues of equity in higher education as an educator and higher education administrator.',NULL,NULL,NULL,NULL),
	(124,124,1,'HPSE Ogwo Pt2 AO 1','2021-08-03 14:06:27','2021-08-03 14:06:27','a68308d9-0f39-4f62-b6a7-3462c04a43ab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(125,125,1,'Interview with Ashley Ogwo, Part 2','2021-08-03 14:06:30','2021-08-03 14:06:30','aaf3b680-6d77-4d3c-aaff-de98c639b2f3',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1bqY46RktDZyM3ZlE9GyHMDldcD1FMdpq/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','In part 2 of this interview, Ashley Ogwo shares her internal journey as a graduate student while at Teachers College, as well as her involvement in BLMHE. She describes how her involvement with BLMHE helped her realize that activism can take many different forms within higher education.',NULL,NULL,NULL,NULL),
	(126,126,1,'HPSE Ogwo Pt 1 AO','2021-08-03 14:06:47','2021-08-03 14:06:47','40ec5346-8acc-49d3-a149-f466737b51c0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(127,127,1,'Interview with Ashley Ogwo, Part 1','2021-08-03 14:06:54','2021-08-03 14:06:54','6641e0e5-eb6b-4eef-9f76-5e62450136f3',NULL,NULL,'<iframe src=\"https://drive.google.com/file/d/1mpFaJ9bAwVVCfC3m5Lpv_PLOCyU7yRKo/preview\" width=\"640\" height=\"480\" allow=\"autoplay\"></iframe>','Ashlely Ogwo, is a former EdM student in the HPSE program, and currently a doctoral student in the University of Maryland. In this interview, she describes her time growing up in Detroit as an Igbo American, her early educational experiences and her undergraduate journey before pursuing higher education as a field of study at Teachers College.',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craftidtokens`;

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deprecationerrors`;

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,'ElementQuery::order()','/srv/users/serverpilot/apps/blm-stagin/public/pgs/build/templates/_templates/_home.twig:78','2021-01-24 06:59:24','/srv/users/serverpilot/apps/blm-stagin/public/pgs/build/templates/_templates/_home.twig',78,'The `order` element query param has been deprecated. Use `orderBy` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1846,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::order()\\\", \\\"The `order` element query param has been deprecated. Use `orderB...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1499,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"order\",\"args\":\"\\\"dateCreated asc\\\"\"},{\"objectClass\":null,\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":106,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"order\\\", ...\"},{\"objectClass\":null,\"file\":\"/srv/users/serverpilot/apps/blm-stagin/storage/runtime/compiled_templates/f7/f7978e31574b7917b196ac647aeccd2cd871089ca45408863b55bade5d51cf7a.php\",\"line\":189,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\elements\\\\db\\\\EntryQuery, \\\"order\\\", ...\"},{\"objectClass\":\"__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af\",\"method\":\"block_main\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, \\\"SORT_ASC\\\" => 4, ...], [\\\"head\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_35cc023b22b90c2c9906b05dcd00386671a300219ece77b8444b98028d7c84c9\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/storage/runtime/compiled_templates/44/44b2cedb00abe1e7af1a95d286327ff4d22968e5710c8dc6ac1911e9d4b2b5f4.php\",\"line\":317,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, \\\"SORT_ASC\\\" => 4, ...], [\\\"head\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_35cc023b22b90c2c9906b05dcd00386671a300219ece77b8444b98028d7c84c9\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_35cc023b22b90c2c9906b05dcd00386671a300219ece77b8444b98028d7c84c9\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, \\\"SORT_ASC\\\" => 4, ...], [\\\"head\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_35cc023b22b90c2c9906b05dcd00386671a300219ece77b8444b98028d7c84c9\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, \\\"SORT_ASC\\\" => 4, ...], [\\\"head\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_35cc023b22b90c2c9906b05dcd00386671a300219ece77b8444b98028d7c84c9\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/storage/runtime/compiled_templates/f7/f7978e31574b7917b196ac647aeccd2cd871089ca45408863b55bade5d51cf7a.php\",\"line\":44,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, \\\"SORT_ASC\\\" => 4, ...], [\\\"head\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af\",\"method\":\"doDisplay\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, \\\"SORT_ASC\\\" => 4, ...], [\\\"head\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"variables\\\" => [], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, \\\"SORT_ASC\\\" => 4, ...], [\\\"head\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"__TwigTemplate_57c73d4e88e62c7341404504c6b465dd3215860276da27be699c44f2aa8277af\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/web/View.php\",\"line\":389,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"_templates/_home\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/web/View.php\",\"line\":450,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"_templates/_home\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/web/Controller.php\",\"line\":241,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"_templates/_home\\\", [\\\"variables\\\" => []], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"_templates/_home\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"_templates/_home\\\", [\\\"variables\\\" => []]\"},{\"objectClass\":null,\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"_templates/_home\\\", []]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/yiisoft/yii2/base/Controller.php\",\"line\":180,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"variables\\\" => [], \\\"template\\\" => \\\"_templates/_home\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"_templates/_home\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"_templates/_home\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"_templates/_home\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"variables\\\" => [], \\\"template\\\" => \\\"_templates/_home\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/users/serverpilot/apps/blm-stagin/public/index.php\",\"line\":24,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-01-24 06:59:24','2021-01-24 06:59:24','d04d12ff-83ce-4e6b-ae58-3717591bfcbc');

/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table drafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `drafts`;

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elementindexsettings`;

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2020-08-18 13:00:37','2021-01-18 13:27:06',NULL,'14311205-cfbf-494b-9428-bc43ef4295a2'),
	(7,NULL,NULL,2,'craft\\elements\\GlobalSet',1,0,'2021-01-13 15:26:50','2022-05-06 16:47:40',NULL,'7b370c96-0fd0-4ffd-be32-b1466c1853be'),
	(15,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-01-13 15:49:43','2021-04-21 15:18:32',NULL,'be4f52b8-b7a3-42d2-93c5-6af0b5414f20'),
	(16,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-01-13 15:51:53','2021-01-13 15:51:53',NULL,'b1ab4207-f8a1-4587-a7e2-e3411e5c0b34'),
	(17,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-01-13 15:53:20','2021-04-21 15:36:45',NULL,'40be3b9c-f313-4a62-a3ff-aa7bd8aeb46b'),
	(19,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-01-19 16:19:55','2021-01-19 16:19:55',NULL,'5c82a250-ba7e-4f75-bd4a-6aa15465825f'),
	(24,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-01-19 16:38:05','2021-01-19 16:38:05',NULL,'92308ced-3748-4161-a6f1-4503d14ea7b4'),
	(25,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-13 21:28:31','2021-04-13 21:28:31',NULL,'b68a44ac-c59a-4c8e-8413-0a823e66ea72'),
	(28,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-13 21:38:16','2021-04-13 21:38:16',NULL,'d22af6d5-9787-4b3c-90e2-502261a38a15'),
	(29,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-04-13 21:41:15','2021-07-21 14:18:19',NULL,'fa729917-3a19-445e-a3cb-545f5046f642'),
	(30,NULL,7,3,'craft\\elements\\Entry',1,0,'2021-04-13 21:41:15','2021-04-13 21:41:15',NULL,'28ca1a60-3433-4686-879d-6bd0ed6376af'),
	(36,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-13 21:49:13','2021-04-13 21:49:13',NULL,'6b2d49f2-fae5-46c1-ba0a-17691094d987'),
	(37,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-04-13 21:49:44','2021-04-22 22:48:31',NULL,'c29208ed-7bbf-4592-a4c1-273fffcb4b4d'),
	(38,NULL,11,3,'craft\\elements\\Entry',1,0,'2021-04-13 21:49:44','2021-04-13 21:49:44',NULL,'7e636e8c-ddbf-4c34-9c96-7573268a1d74'),
	(40,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-13 21:50:31','2021-04-13 21:50:31',NULL,'ad5c0c39-8899-425b-8ad7-81d0e26e5e86'),
	(41,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-04-13 21:51:11','2021-07-21 15:11:55',NULL,'8cf9433f-0126-4985-a8d0-8deae3372ef9'),
	(42,NULL,12,3,'craft\\elements\\Entry',1,0,'2021-04-13 21:51:11','2021-04-13 21:51:11',NULL,'828dd030-75a2-41cd-8e63-b69f91016fee'),
	(45,NULL,15,3,'craft\\elements\\Entry',1,0,'2021-04-20 14:38:26','2021-04-20 14:38:26',NULL,'05a36a6c-2733-4e7b-9602-e90403721cd5'),
	(46,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 14:42:25','2021-04-21 14:42:25',NULL,'4af83c7f-49c4-4157-bea0-2116515e776b'),
	(47,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 14:45:47','2021-04-21 14:45:47',NULL,'5ac750f5-2d68-4bbd-8254-3468e3572784'),
	(49,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 14:49:46','2021-04-21 15:34:25',NULL,'0cc9f4f1-7889-4c89-9fa4-4ed413bff6fa'),
	(51,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 14:51:31','2021-04-21 15:36:15',NULL,'32436d8f-db02-49c0-a597-3c14809f70fc'),
	(53,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 14:52:36','2021-04-21 18:36:24',NULL,'b50b4cf4-b8f2-466e-8467-f38f4fa5374b'),
	(55,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 14:53:05','2021-04-21 17:38:24',NULL,'9407331d-b9e8-44d2-80ec-c48afc32e6bc'),
	(57,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 14:53:58','2021-04-21 17:39:03',NULL,'fd8f1986-fc92-4095-bf6a-ce62adfd2e90'),
	(59,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 14:54:55','2021-04-21 18:37:50',NULL,'6c85d267-5d09-45e0-a11d-da585e8942f0'),
	(61,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 14:58:13','2021-04-21 14:58:13',NULL,'8f33d755-4aba-4386-aab7-621204dbfcec'),
	(62,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 14:59:30','2021-04-21 17:43:46',NULL,'0a96b5e5-045c-4421-ba27-eb11e2ac42bd'),
	(64,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:19:32','2021-04-21 15:19:32',NULL,'fe17af35-b23c-4893-afc1-aad3ce90fff4'),
	(65,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:20:10','2021-04-21 15:24:27',NULL,'8ce0731b-9fc0-4772-a114-aaea073850b5'),
	(67,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:21:03','2021-04-22 22:50:17',NULL,'aa1bfdc8-a455-44b9-a230-255db6174dc7'),
	(69,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:21:47','2021-04-21 15:24:20',NULL,'739d41f9-359a-4bbe-ad7b-fc467bdc762d'),
	(71,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:23:45','2021-04-21 15:23:45',NULL,'f9210f18-5425-4e9c-8e11-282c95ecc99c'),
	(72,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:23:52','2021-04-21 15:25:02',NULL,'329b1afb-f11f-4a25-982d-9356881b8734'),
	(73,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:24:04','2021-04-21 15:24:04',NULL,'1cb53011-7435-4c86-8ac7-7db28cb85e42'),
	(74,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:24:18','2021-04-21 15:24:18',NULL,'034ddfe1-8704-45c1-9074-008882549ac1'),
	(77,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:26:00','2021-04-21 15:26:00',NULL,'62593921-ee91-4921-89bf-f87d6140225b'),
	(78,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:26:04','2021-04-21 15:26:04',NULL,'2ae1ba54-122a-463e-88cb-0ab85deca9a4'),
	(80,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:27:36','2021-04-21 15:27:36',NULL,'85b74645-aa84-497a-879d-fa09ec9d76bc'),
	(81,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:27:42','2021-04-21 15:27:42',NULL,'e1fcbeea-93a1-4706-9318-85540a8760cf'),
	(83,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:28:36','2021-04-21 15:28:36',NULL,'adb79157-9ad0-4956-9d64-d1540f48e5f3'),
	(84,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:29:09','2021-04-21 15:29:09',NULL,'47e6818c-6a9a-4153-816c-215bcc9bf5e2'),
	(86,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:30:23','2021-04-21 15:30:23',NULL,'e7bfbeb6-800f-4bd1-b3f7-0ec249b8d173'),
	(87,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:30:28','2021-04-21 15:30:28',NULL,'5739876f-a4e5-4e50-9f27-1a3a26775a26'),
	(89,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:31:09','2021-04-21 15:31:09',NULL,'8b96cd86-a7b6-437f-aebe-edc4ed528a70'),
	(90,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2021-04-21 15:32:06','2021-04-21 15:32:06',NULL,'b0ff773a-0a9b-40dc-aa32-bc7ff4c3aff8'),
	(91,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:33:43','2021-04-21 15:33:43',NULL,'53fe8ae0-b5d4-433b-ae93-b774cd4908d8'),
	(92,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 15:36:08','2021-04-21 15:36:08',NULL,'317cb462-4046-4948-9b17-d7255cc78fa5'),
	(93,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 17:38:21','2021-04-21 17:38:21',NULL,'89e0c9ff-5424-4957-90ac-768cd00f764b'),
	(94,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 17:39:02','2021-04-21 17:39:02',NULL,'705dea9b-6941-4802-9c17-dadf82c59825'),
	(95,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 17:39:55','2021-04-21 17:39:55',NULL,'213e5d50-5ed9-4b75-a6db-3460da7a121d'),
	(96,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 17:42:56','2021-04-21 17:42:56',NULL,'823d1a99-6602-4c49-b199-472a6855ec93'),
	(97,NULL,16,3,'craft\\elements\\Entry',1,0,'2021-04-21 18:17:31','2021-04-21 18:17:31',NULL,'e2073079-c1a9-4e1a-a80d-78459c1145fb'),
	(98,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-04-21 18:36:23','2021-04-21 18:36:23',NULL,'fed70c27-4f90-47ef-8646-3bb7cfa0a667'),
	(99,NULL,17,3,'craft\\elements\\Entry',1,0,'2021-04-22 22:48:31','2021-04-22 22:48:31',NULL,'ec583bf4-d79a-4653-a925-f6851c2303f7'),
	(100,NULL,18,3,'craft\\elements\\Entry',1,0,'2021-04-22 22:49:24','2021-04-22 22:49:24',NULL,'ab07e78a-3132-42e7-80b5-cc364ef6eb56'),
	(101,NULL,19,3,'craft\\elements\\Entry',1,0,'2021-07-21 14:18:19','2021-07-21 14:18:19',NULL,'15e6cb67-fb86-482a-973a-8452a02f7177'),
	(103,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-07-21 14:21:22','2021-08-03 14:06:54',NULL,'58cf5995-1de3-4d62-8b1f-87b88d04365f'),
	(104,NULL,20,3,'craft\\elements\\Entry',1,0,'2021-07-21 14:21:22','2021-07-21 14:21:22',NULL,'18af4dd7-385c-4246-a68e-d0a2d582a2f3'),
	(105,NULL,21,3,'craft\\elements\\Entry',1,0,'2021-07-21 15:11:55','2021-07-21 15:11:55',NULL,'77a5d238-5a02-4c69-9059-00d537303cf0'),
	(106,NULL,22,3,'craft\\elements\\Entry',1,0,'2021-07-21 15:49:02','2021-07-21 15:49:02',NULL,'d8a6fb67-2a56-4d3d-8637-a75bb2543e79'),
	(107,NULL,23,3,'craft\\elements\\Entry',1,0,'2021-07-21 15:50:40','2021-07-21 15:50:40',NULL,'71a13491-a6ca-45e5-b319-c5577473c13c'),
	(109,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-07-21 16:19:00','2021-07-21 16:19:00',NULL,'243671da-7790-4f08-89a3-8986297b1cc0'),
	(110,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-07-21 16:19:09','2021-08-03 14:06:30',NULL,'4a233539-0017-4fb1-ac72-9389418f7474'),
	(111,NULL,24,3,'craft\\elements\\Entry',1,0,'2021-07-21 16:19:09','2021-07-21 16:19:09',NULL,'47ea59ec-40b9-4dd7-bfbc-fee0da377464'),
	(112,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-07-21 16:19:17','2021-07-21 16:19:17',NULL,'6e13d438-f043-474f-ab1e-f8c1484b6628'),
	(113,NULL,25,3,'craft\\elements\\Entry',1,0,'2021-07-21 16:19:19','2021-07-21 16:19:19',NULL,'0270be7c-4a58-4fc5-9f02-5edbc5ac61de'),
	(114,NULL,26,3,'craft\\elements\\Entry',1,0,'2021-07-21 16:26:19','2021-07-21 16:26:19',NULL,'2e04c72f-bcbd-46dd-9bb9-1f3fb4f7e923'),
	(116,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-07-21 16:43:23','2021-07-21 16:43:23',NULL,'caa64cf1-293b-4d93-b5e8-cc4afb278069'),
	(117,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-07-21 16:43:26','2021-07-21 16:45:03',NULL,'4689bb73-051d-40d7-a80b-58fc112d9430'),
	(118,NULL,27,3,'craft\\elements\\Entry',1,0,'2021-07-21 16:43:26','2021-07-21 16:43:26',NULL,'c3d9f196-19a4-41c0-9c8d-5674d810f709'),
	(119,NULL,28,3,'craft\\elements\\Entry',1,0,'2021-07-21 16:45:03','2021-07-21 16:45:03',NULL,'d66be542-1b78-428a-8cc1-5c7b941ea590'),
	(121,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-07-21 17:07:22','2021-07-21 17:07:22',NULL,'2fd857f4-c447-4cd9-b78a-cd18de6782db'),
	(122,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-07-21 17:07:43','2021-07-21 17:07:43',NULL,'7d4548fe-4e85-4e37-9e9c-acb49628e314'),
	(123,NULL,29,3,'craft\\elements\\Entry',1,0,'2021-07-21 17:07:43','2021-07-21 17:07:43',NULL,'13c6ad25-9560-4df7-911a-d14c3c36579b'),
	(124,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-08-03 14:06:27','2021-08-03 14:06:27',NULL,'0151b227-1078-4e95-850e-9a5bb9b1b238'),
	(125,NULL,30,3,'craft\\elements\\Entry',1,0,'2021-08-03 14:06:30','2021-08-03 14:06:30',NULL,'2331541f-7a34-46f6-906f-1d5a2ef67376'),
	(126,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2021-08-03 14:06:47','2021-08-03 14:06:47',NULL,'3c474081-381b-42a5-b458-8665a890256d'),
	(127,NULL,31,3,'craft\\elements\\Entry',1,0,'2021-08-03 14:06:54','2021-08-03 14:06:54',NULL,'d8342622-6ab6-4794-b980-5687473a0d98');

/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_sites`;

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2020-08-18 13:00:37','2020-08-18 13:00:37','fba9c4b5-1492-46ab-a052-75c0d9170b77'),
	(7,7,1,NULL,NULL,1,'2021-01-13 15:26:50','2021-01-13 15:26:50','b91a2150-ccb8-464d-b217-fcd3702768df'),
	(15,15,1,'test-timeline-entry',NULL,1,'2021-01-13 15:49:43','2021-01-13 15:49:43','6c44c512-aa71-4e3b-a651-0f31f2c47f35'),
	(16,16,1,NULL,NULL,1,'2021-01-13 15:51:53','2021-01-13 15:51:53','aaf56988-8476-4d5c-a9dc-357fc238a226'),
	(17,17,1,'test-timeline-entry',NULL,1,'2021-01-13 15:53:20','2021-01-13 15:53:20','7481e282-2902-43f7-9a88-ffbbcee0a4c9'),
	(19,19,1,NULL,NULL,1,'2021-01-19 16:19:55','2021-01-19 16:19:55','98bc051d-91f0-40f4-bf3b-d74633406e53'),
	(24,24,1,NULL,NULL,1,'2021-01-19 16:38:05','2021-01-19 16:38:05','1c3d1704-32cf-4273-886f-ca39be45528d'),
	(25,25,1,NULL,NULL,1,'2021-04-13 21:28:31','2021-04-13 21:28:31','3c74005d-20c3-41f5-8bdd-70266a402a89'),
	(28,28,1,NULL,NULL,1,'2021-04-13 21:38:16','2021-04-13 21:38:16','451858e6-a257-4cec-81e5-5c6d471037b7'),
	(29,29,1,'interview-with-charlen-mcneill',NULL,1,'2021-04-13 21:41:15','2021-04-13 21:41:16','40b6260f-8022-4122-9d64-73bbdb6d8b38'),
	(30,30,1,'interview-with-charlen-mcneill',NULL,1,'2021-04-13 21:41:15','2021-04-13 21:41:15','25ae7266-b187-4e90-ba0a-6f483ca8c388'),
	(36,36,1,NULL,NULL,1,'2021-04-13 21:49:13','2021-04-13 21:49:13','c557e8db-eed4-4b8c-a3a9-e74bb9f0a593'),
	(37,37,1,'interview-with-kat-stephens',NULL,1,'2021-04-13 21:49:44','2021-04-13 21:49:46','4f19f3e3-36d2-45dd-95f3-83ce2b7aac13'),
	(38,38,1,'interview-with-kat-stephens',NULL,1,'2021-04-13 21:49:44','2021-04-13 21:49:44','8c6fa06a-8381-4d34-a1c3-a6a8b8339312'),
	(40,40,1,NULL,NULL,1,'2021-04-13 21:50:31','2021-04-13 21:50:31','3b28ec91-6c99-4a90-8f5e-013e87dfe223'),
	(41,41,1,'interview-with-brian-allen',NULL,1,'2021-04-13 21:51:11','2021-04-13 21:51:12','c87bfea8-2ee3-46c5-ba1d-147f8c08050c'),
	(42,42,1,'interview-with-brian-allen',NULL,1,'2021-04-13 21:51:11','2021-04-13 21:51:11','261eeddb-0cad-45e8-a371-56cbd8bc4a43'),
	(45,45,1,'interview-with-kat-stephens',NULL,1,'2021-04-20 14:38:26','2021-04-20 14:38:26','5ae7a780-5fda-4b48-86b1-ffeca73684ce'),
	(46,46,1,NULL,NULL,1,'2021-04-21 14:42:25','2021-04-21 14:42:25','92d9dc2a-6dc3-4649-a88d-754444ed06b5'),
	(47,47,1,NULL,NULL,1,'2021-04-21 14:45:47','2021-04-21 14:45:47','4555cff0-1483-4f67-befe-c4950fa9e57e'),
	(49,49,1,'deaths-of-walter-scott-freddie-gray-and-meagan-hockaday-black-trans-lives-matter',NULL,1,'2021-04-21 14:49:46','2021-04-21 14:49:46','a931aac8-66cf-4ab2-b06d-cf20c4c8e140'),
	(51,51,1,'deaths-of-danner-and-sterling-kaepernick-protest',NULL,1,'2021-04-21 14:51:31','2021-04-21 14:51:31','6646ba7a-684d-499b-b6d4-5c619ec594b4'),
	(53,53,1,'first-blm-art-exhibit-castile-court-ruling-and-protest-unite-the-right-rally',NULL,1,'2021-04-21 14:52:36','2021-04-21 14:52:36','985cf2da-5d2d-4ca7-9ed1-749c59ff2c3e'),
	(55,55,1,'abc-news-interview-blacklivesmatter-deaths-of-mack-and-ross-jr',NULL,1,'2021-04-21 14:53:05','2021-04-21 14:53:05','48b29eef-e8cf-4e50-986c-072075f4876f'),
	(57,57,1,'21-savage-arrest-death-of-isaiah-lewis',NULL,1,'2021-04-21 14:53:58','2021-04-21 14:53:58','0059e941-277e-447b-91f9-257f39fcc49b'),
	(59,59,1,'death-of-george-floyd-global-protests',NULL,1,'2021-04-21 14:54:55','2021-04-21 14:54:55','ddb7c5ac-56cd-48bf-8f04-1628b376a4b0'),
	(61,61,1,NULL,NULL,1,'2021-04-21 14:58:13','2021-04-21 14:58:13','d6fb37b6-7c0c-4b4b-be32-13659603f883'),
	(62,62,1,'chauvin-guilty-of-murder-in-floyds-death',NULL,1,'2021-04-21 14:59:30','2021-04-21 14:59:30','8219bf0e-fbd0-41d4-b887-324c6303d3f8'),
	(64,64,1,NULL,NULL,1,'2021-04-21 15:19:32','2021-04-21 15:19:32','5bf69859-7081-42a8-b343-e74ebd9467bb'),
	(65,65,1,'mental-health-and-wellness-in-the-blm-movement',NULL,1,'2021-04-21 15:20:10','2021-04-21 15:20:10','0ce43330-bfdc-4542-a154-86d167f9aab9'),
	(67,67,1,'reckoning-with-the-past-columbia-university-slavery-and-black-lives-matter',NULL,1,'2021-04-21 15:21:03','2021-04-21 15:21:03','4048a08e-d3e5-4857-a236-45137324bac5'),
	(69,69,1,'examining-the-movement-student-activism-and-blm-in-theory-and-practice',NULL,1,'2021-04-21 15:21:47','2021-04-21 15:21:47','60d0f91f-09cf-4eee-ae0b-5e5a7ffd8bff'),
	(71,71,1,NULL,NULL,1,'2021-04-21 15:23:45','2021-04-21 15:23:45','74d30ab0-2b9f-48f0-8b30-8923583fcf12'),
	(72,72,1,'fall-2017-kick-off-informational',NULL,1,'2021-04-21 15:23:52','2021-04-21 15:23:52','d87aac18-6fd4-46eb-a2dc-1ba66788eb93'),
	(73,73,1,NULL,NULL,1,'2021-04-21 15:24:04','2021-04-21 15:24:04','660cc5db-65ec-450a-a52f-ca534539a757'),
	(74,74,1,NULL,NULL,1,'2021-04-21 15:24:18','2021-04-21 15:24:18','a39b7695-a2e3-43dd-b24f-fab4fca8bca8'),
	(77,77,1,NULL,NULL,1,'2021-04-21 15:26:00','2021-04-21 15:26:00','a118b6aa-efb6-44ac-bc08-5d4c30f3d8f4'),
	(78,78,1,'all-black-lives-matter',NULL,1,'2021-04-21 15:26:04','2021-04-21 15:26:04','44288a0c-7148-4d67-9902-37c1400281e1'),
	(80,80,1,NULL,NULL,1,'2021-04-21 15:27:36','2021-04-21 15:27:36','1ed1f447-dd26-4f00-be4f-4b708f033568'),
	(81,81,1,'whose-speech-is-free-speech',NULL,1,'2021-04-21 15:27:42','2021-04-21 15:27:42','778c4adf-555c-4725-bb77-d5533fae6997'),
	(83,83,1,NULL,NULL,1,'2021-04-21 15:28:36','2021-04-21 15:28:36','3cbff2a2-1aa3-4d7d-9461-14c85323dd73'),
	(84,84,1,'women-of-wakanda-parallels-of-strength-and-innovation-to-women-in-the-academy',NULL,1,'2021-04-21 15:29:09','2021-04-21 15:29:09','3eade94e-592e-4f8d-a207-497934c7676b'),
	(86,86,1,NULL,NULL,1,'2021-04-21 15:30:23','2021-04-21 15:30:23','a2dd4252-799a-49ce-af17-0ec635a33dae'),
	(87,87,1,'days-of-resistance-blmhe-oral-history-exhibit-opening',NULL,1,'2021-04-21 15:30:28','2021-04-21 15:30:28','df63526c-6ca6-487f-8cdd-10116900f598'),
	(89,89,1,NULL,NULL,1,'2021-04-21 15:31:09','2021-04-21 15:31:09','782ce166-bf95-4b5d-b860-58ed4c44d62b'),
	(90,90,1,'imposter-syndrome-open-dialogue',NULL,1,'2021-04-21 15:32:06','2021-04-21 15:32:06','34cf1c6e-7eba-48de-bb63-3c2e898aa7d0'),
	(91,91,1,NULL,NULL,1,'2021-04-21 15:33:43','2021-04-21 15:33:43','ff2f71b8-0240-4117-9be5-f1f961cc4eb1'),
	(92,92,1,NULL,NULL,1,'2021-04-21 15:36:08','2021-04-21 15:36:08','b066f5a7-6568-4753-8750-dd9d22aa8822'),
	(93,93,1,NULL,NULL,1,'2021-04-21 17:38:21','2021-04-21 17:38:21','8a1604f8-ee22-439a-908c-ef41e72d99cf'),
	(94,94,1,NULL,NULL,1,'2021-04-21 17:39:02','2021-04-21 17:39:02','6dc7778b-2974-4e54-b031-8451efd8efd9'),
	(95,95,1,NULL,NULL,1,'2021-04-21 17:39:55','2021-04-21 17:39:55','7ec727aa-f7c0-4be7-b2fa-cbc52f9fddf3'),
	(96,96,1,NULL,NULL,1,'2021-04-21 17:42:56','2021-04-21 17:42:56','41d9e32d-897c-4085-b294-1b6ed1ef5e9d'),
	(97,97,1,'interview-with-kat-stephens',NULL,1,'2021-04-21 18:17:31','2021-04-21 18:17:31','40f612a0-f128-47b9-a691-609d636ef5f8'),
	(98,98,1,NULL,NULL,1,'2021-04-21 18:36:23','2021-04-21 18:36:23','04feb5bb-cc22-4316-9e51-36e2a09cc139'),
	(99,99,1,'interview-with-kat-stephens',NULL,1,'2021-04-22 22:48:31','2021-04-22 22:48:31','14b1b08c-2bfc-44ee-92da-358d9cdf553f'),
	(100,100,1,'interview-with-brian-allen',NULL,1,'2021-04-22 22:49:24','2021-04-22 22:49:24','99fde9e1-3a3e-4a23-8ba4-dca2879794c5'),
	(101,101,1,'interview-with-charlen-mcneill',NULL,1,'2021-07-21 14:18:19','2021-07-21 14:18:19','1f40bb84-e2ac-4826-bc80-5cecb8a7efc0'),
	(103,103,1,'interview-with-ashley-ogwo-part-1',NULL,1,'2021-07-21 14:21:22','2021-07-21 14:21:23','e3b21ef1-4ee9-4658-b271-268afc4f1ab2'),
	(104,104,1,'interview-with-ashley-ogwo-part-1',NULL,1,'2021-07-21 14:21:22','2021-07-21 14:21:22','7372ea38-755a-4cbc-8500-14218ea39cc1'),
	(105,105,1,'interview-with-brian-allen',NULL,1,'2021-07-21 15:11:55','2021-07-21 15:11:55','0de262fd-7770-4cbe-9523-7d8cf27420d7'),
	(106,106,1,'interview-with-ashley-ogwo-part-1',NULL,1,'2021-07-21 15:49:02','2021-07-21 15:49:02','40bac5e2-f4c4-4a6b-9e2e-cf203602f0b4'),
	(107,107,1,'interview-with-ashley-ogwo-part-1',NULL,1,'2021-07-21 15:50:40','2021-07-21 15:50:40','d36c03de-9c2f-422a-acf4-b9ebccba7cb6'),
	(109,109,1,NULL,NULL,1,'2021-07-21 16:19:00','2021-07-21 16:19:00','860e5d2e-9cdf-489a-958d-2f3f37cbd0a0'),
	(110,110,1,'interview-with-ashley-ogwo-part-2',NULL,1,'2021-07-21 16:19:09','2021-07-21 16:19:09','23118f1c-2cf7-4f31-acf7-775457d66873'),
	(111,111,1,'interview-with-ashley-ogwo-part-2',NULL,1,'2021-07-21 16:19:09','2021-07-21 16:19:09','9b44cf58-4938-481d-839b-a9b5d5eb2e24'),
	(112,112,1,NULL,NULL,1,'2021-07-21 16:19:17','2021-07-21 16:19:17','b7fa06b7-d12c-48dd-86d6-d5a673d3eb3a'),
	(113,113,1,'interview-with-ashley-ogwo-part-1',NULL,1,'2021-07-21 16:19:19','2021-07-21 16:19:19','5b3bff4e-0e20-4ef1-9d77-b46310f8cb9e'),
	(114,114,1,'interview-with-ashley-ogwo-part-2',NULL,1,'2021-07-21 16:26:19','2021-07-21 16:26:19','a2cf40f9-211d-451c-acec-02c826d9ea1c'),
	(116,116,1,NULL,NULL,1,'2021-07-21 16:43:23','2021-07-21 16:43:23','734f8201-8048-4349-b29f-43b6eaf83f6d'),
	(117,117,1,'interview-with-jenay-willis',NULL,1,'2021-07-21 16:43:26','2021-07-21 16:43:27','71d0d89f-d74c-4fa8-a38c-486a77554b36'),
	(118,118,1,'interview-with-jenay-willis',NULL,1,'2021-07-21 16:43:26','2021-07-21 16:43:26','ce16220f-e705-4a18-89a2-efc8d7e8dc41'),
	(119,119,1,'interview-with-jenay-willis',NULL,1,'2021-07-21 16:45:03','2021-07-21 16:45:03','b3b7a023-c6af-4a33-951e-f4c85f284165'),
	(121,121,1,NULL,NULL,1,'2021-07-21 17:07:22','2021-07-21 17:07:22','c8e92082-8b92-46bf-ba3f-45d5db5aef4e'),
	(122,122,1,'interview-with-dr-corbin-campbell',NULL,1,'2021-07-21 17:07:43','2021-07-21 17:07:43','63d0daa8-bdee-488f-9acb-80cdb8c8948e'),
	(123,123,1,'interview-with-dr-corbin-campbell',NULL,1,'2021-07-21 17:07:43','2021-07-21 17:07:43','28029635-433c-4775-b0b5-dd06ad9cdf27'),
	(124,124,1,NULL,NULL,1,'2021-08-03 14:06:27','2021-08-03 14:06:27','d6fa0455-6f8d-4eff-91f1-bf31d7e39500'),
	(125,125,1,'interview-with-ashley-ogwo-part-2',NULL,1,'2021-08-03 14:06:30','2021-08-03 14:06:30','2edc9532-697a-40d4-9160-39d48f506a2f'),
	(126,126,1,NULL,NULL,1,'2021-08-03 14:06:47','2021-08-03 14:06:47','0af4c9b6-0229-4b1a-a8e0-68eafd72bfbc'),
	(127,127,1,'interview-with-ashley-ogwo-part-1',NULL,1,'2021-08-03 14:06:54','2021-08-03 14:06:54','a7b41298-d9ff-4c46-bed2-9599c35c467e');

/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(15,2,NULL,2,1,'2016-11-16 15:49:00',NULL,NULL,'2021-01-13 15:49:43','2021-04-21 14:47:20','d1897549-4915-4e9b-a9dc-2db89357fe17'),
	(17,2,NULL,2,1,'2013-01-13 15:49:00',NULL,NULL,'2021-01-13 15:53:20','2021-01-13 15:53:20','8d68f900-be1d-4eef-a230-6111158ed9ff'),
	(29,1,NULL,1,1,'2021-04-13 21:29:00',NULL,NULL,'2021-04-13 21:41:15','2021-04-13 21:41:15','be3472e2-3eef-40ef-8577-ec63de048095'),
	(30,1,NULL,1,1,'2021-04-13 21:29:00',NULL,NULL,'2021-04-13 21:41:15','2021-04-13 21:41:15','0ec82508-b888-47f0-97be-351a2fda84f8'),
	(37,1,NULL,1,1,'2021-04-13 21:43:00',NULL,NULL,'2021-04-13 21:49:44','2021-04-13 21:49:44','9982e51e-a1dc-4bca-b9ac-9247905629c1'),
	(38,1,NULL,1,1,'2021-04-13 21:43:00',NULL,NULL,'2021-04-13 21:49:44','2021-04-13 21:49:44','b2d046b9-43df-451c-bf90-4497d899e4d8'),
	(41,1,NULL,1,1,'2021-04-13 21:50:00',NULL,NULL,'2021-04-13 21:51:11','2021-04-13 21:51:11','3201ca21-f093-4b1e-94b3-082469fd53e2'),
	(42,1,NULL,1,1,'2021-04-13 21:50:00',NULL,NULL,'2021-04-13 21:51:11','2021-04-13 21:51:11','5f4febea-53cb-4149-a3d2-2d8f23883b6c'),
	(45,1,NULL,1,1,'2021-04-13 21:43:00',NULL,NULL,'2021-04-20 14:38:26','2021-04-20 14:38:26','c5a89df7-b13e-4e97-bd1f-b30ec3316fb5'),
	(49,2,NULL,2,1,'2015-04-21 14:48:00',NULL,NULL,'2021-04-21 14:49:46','2021-04-21 14:49:46','8cb0d535-3466-4940-ad00-38faa7e67a7f'),
	(51,2,NULL,2,1,'2016-04-21 14:49:00',NULL,NULL,'2021-04-21 14:51:31','2021-04-21 14:51:31','ca6707f7-983b-486d-b55d-6326796a075d'),
	(53,2,NULL,2,1,'2017-04-21 14:51:00',NULL,NULL,'2021-04-21 14:52:36','2021-04-21 14:52:36','e4876761-d67d-4d2d-a6d7-f27cd8443fad'),
	(55,2,NULL,2,1,'2018-05-01 14:52:00',NULL,NULL,'2021-04-21 14:53:05','2021-04-21 17:38:24','53855278-7363-44ea-a5a7-d2487dd5e2be'),
	(57,2,NULL,2,1,'2019-04-21 14:53:00',NULL,NULL,'2021-04-21 14:53:58','2021-04-21 14:53:58','0940f7a5-f196-4ec0-b80f-04e9d089c136'),
	(59,2,NULL,2,1,'2020-04-21 14:53:00',NULL,NULL,'2021-04-21 14:54:55','2021-04-21 14:54:55','935f3c6b-4c56-4a49-9d7d-7d5b27a6ac48'),
	(62,2,NULL,2,1,'2021-04-20 14:54:00',NULL,NULL,'2021-04-21 14:59:30','2021-04-21 14:59:30','05fc10b1-de81-4957-bd23-69ef2fca2140'),
	(65,2,NULL,2,1,'2016-12-07 16:18:00',NULL,NULL,'2021-04-21 15:20:10','2021-04-21 15:20:10','23477f42-7be2-4582-8537-4783f2e0db53'),
	(67,2,NULL,2,1,'2017-04-13 15:20:00',NULL,NULL,'2021-04-21 15:21:03','2021-04-21 15:21:03','f869e7d3-57f1-4d11-9767-a3a79aa9f2c5'),
	(69,2,NULL,2,1,'2017-04-19 15:21:00',NULL,NULL,'2021-04-21 15:21:47','2021-04-21 15:21:47','bc7841cf-88cd-4342-839f-427f250d8369'),
	(72,2,NULL,2,1,'2017-09-14 15:21:00',NULL,NULL,'2021-04-21 15:23:52','2021-04-21 15:23:52','56a8abd7-ea02-4d75-9c21-7e7190a9a78d'),
	(78,2,NULL,2,1,'2017-10-19 15:25:00',NULL,NULL,'2021-04-21 15:26:04','2021-04-21 15:26:04','9abda8d4-c497-4745-9f5e-aac11eb1b36b'),
	(81,2,NULL,2,1,'2018-03-28 15:26:00',NULL,NULL,'2021-04-21 15:27:42','2021-04-21 15:27:42','fb002b1f-60c0-4c59-bfbd-148156e21e6e'),
	(84,2,NULL,2,1,'2018-04-11 15:27:00',NULL,NULL,'2021-04-21 15:29:09','2021-04-21 15:29:09','6ab8ba50-6c68-4b33-8c74-142898ecfc7d'),
	(87,2,NULL,2,1,'2018-04-11 15:29:00',NULL,NULL,'2021-04-21 15:30:28','2021-04-21 15:30:28','d8637216-6f40-44aa-ae47-5c1cf748eaea'),
	(90,2,NULL,2,1,'2019-04-12 15:30:00',NULL,NULL,'2021-04-21 15:32:06','2021-04-21 15:32:06','46ddba33-c614-4b56-814e-561f8afc00da'),
	(97,1,NULL,1,1,'2021-04-13 21:43:00',NULL,NULL,'2021-04-21 18:17:31','2021-04-21 18:17:31','e30c6893-f2ab-4257-80e0-1be3665e5d5b'),
	(99,1,NULL,1,1,'2021-04-13 21:43:00',NULL,NULL,'2021-04-22 22:48:31','2021-04-22 22:48:31','474ab9fd-f940-4c3c-a2c4-97ddf07e4f46'),
	(100,1,NULL,1,1,'2021-04-13 21:50:00',NULL,NULL,'2021-04-22 22:49:24','2021-04-22 22:49:24','67683a85-15ec-404e-b421-66c0206c9f2c'),
	(101,1,NULL,1,1,'2021-04-13 21:29:00',NULL,NULL,'2021-07-21 14:18:19','2021-07-21 14:18:19','d40f6324-098e-4270-ac7f-aa961586a1b9'),
	(103,1,NULL,1,1,'2021-07-21 14:18:00',NULL,NULL,'2021-07-21 14:21:22','2021-07-21 14:21:22','3710af56-7209-4876-8c13-27ea3858d64e'),
	(104,1,NULL,1,1,'2021-07-21 14:18:00',NULL,NULL,'2021-07-21 14:21:22','2021-07-21 14:21:22','c3a5ae2b-534b-4c33-b6ac-3014017ebabc'),
	(105,1,NULL,1,1,'2021-04-13 21:50:00',NULL,NULL,'2021-07-21 15:11:55','2021-07-21 15:11:55','efb59807-0118-4fb3-846e-1a25bf24d84e'),
	(106,1,NULL,1,1,'2021-07-21 14:18:00',NULL,NULL,'2021-07-21 15:49:02','2021-07-21 15:49:02','f19941c8-ac70-4fe7-9e5b-e528d6c95800'),
	(107,1,NULL,1,1,'2021-07-21 14:18:00',NULL,NULL,'2021-07-21 15:50:40','2021-07-21 15:50:40','9aa007f8-a2e7-488a-bbe5-5ac2af37a074'),
	(110,1,NULL,1,1,'2021-07-21 15:50:00',NULL,NULL,'2021-07-21 16:19:09','2021-07-21 16:19:09','d9016570-6be2-4926-9df6-b0a2f2b30397'),
	(111,1,NULL,1,1,'2021-07-21 15:50:00',NULL,NULL,'2021-07-21 16:19:09','2021-07-21 16:19:09','a3bdf04b-74ba-42ee-81ae-84e991ed3a2a'),
	(113,1,NULL,1,1,'2021-07-21 14:18:00',NULL,NULL,'2021-07-21 16:19:19','2021-07-21 16:19:19','872215f0-70ce-4135-b438-5bbf5d7eb104'),
	(114,1,NULL,1,1,'2021-07-21 15:50:00',NULL,NULL,'2021-07-21 16:26:19','2021-07-21 16:26:19','99efcf81-b338-4a8e-894c-d471150b3a1e'),
	(117,1,NULL,1,1,'2021-07-21 16:26:00',NULL,NULL,'2021-07-21 16:43:26','2021-07-21 16:43:26','f65d0a28-941e-4029-a697-cea27251b997'),
	(118,1,NULL,1,1,'2021-07-21 16:26:00',NULL,NULL,'2021-07-21 16:43:26','2021-07-21 16:43:26','4710c2e1-c57d-449a-97bd-8b9c65720b35'),
	(119,1,NULL,1,1,'2021-07-21 16:26:00',NULL,NULL,'2021-07-21 16:45:03','2021-07-21 16:45:03','916e70bd-88c8-4fa9-9a5c-fd49e79a2fe0'),
	(122,1,NULL,1,1,'2021-07-21 16:45:00',NULL,NULL,'2021-07-21 17:07:43','2021-07-21 17:07:43','5f8fbcd2-af41-44fe-bf1c-f44025a6f305'),
	(123,1,NULL,1,1,'2021-07-21 16:45:00',NULL,NULL,'2021-07-21 17:07:43','2021-07-21 17:07:43','85109339-70a5-44e3-88ce-98823800c3de'),
	(125,1,NULL,1,1,'2021-07-21 15:50:00',NULL,NULL,'2021-08-03 14:06:30','2021-08-03 14:06:30','ab8cc018-4351-465f-b7d6-15886fdcb08e'),
	(127,1,NULL,1,1,'2021-07-21 14:18:00',NULL,NULL,'2021-08-03 14:06:54','2021-08-03 14:06:54','a8a2d3ea-f943-4c18-92e0-4771b97e840a');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrytypes`;

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,3,'Interview','interview',1,'site',NULL,NULL,1,'2021-01-13 15:33:50','2021-01-13 15:33:50',NULL,'8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94'),
	(2,2,4,'Timeline Entry','timelineEntry',1,'site',NULL,NULL,1,'2021-01-13 15:48:53','2021-01-13 15:48:53',NULL,'f3f75b1e-8bde-4010-8289-007cd6d78b74');

/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldgroups`;

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldgroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Common','2020-08-18 13:00:37','2020-08-18 13:00:37','f33009e6-e6ee-48c3-9dc3-861195670ed1');

/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayoutfields`;

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,3,10,4,0,1,'2021-01-13 15:36:31','2021-01-13 15:36:31','50eaf35b-eae6-4c7a-85c6-3ac5cbd45efa'),
	(5,3,10,3,0,2,'2021-01-13 15:36:31','2021-01-13 15:36:31','153517a0-8c18-4a90-b20a-fea6a7a237e0'),
	(6,3,10,5,0,3,'2021-01-13 15:36:31','2021-01-13 15:36:31','1be50990-afd9-4cef-a911-1c4c5f45a6e6'),
	(12,4,14,8,0,1,'2021-01-13 15:51:05','2021-01-13 15:51:05','dee33e69-92d0-46c4-b53d-d51d801a4a50'),
	(13,4,14,7,0,2,'2021-01-13 15:51:05','2021-01-13 15:51:05','b966e4f5-949e-4231-9c60-138664eac488'),
	(14,4,14,6,0,3,'2021-01-13 15:51:05','2021-01-13 15:51:05','45fa70fe-2ca1-42de-a7df-fbb375833b14'),
	(22,2,17,1,0,0,'2021-04-20 17:06:22','2021-04-20 17:06:22','dc3b3ee1-16cc-4bc9-87b3-e0191833d28a'),
	(23,2,17,2,0,1,'2021-04-20 17:06:22','2021-04-20 17:06:22','6e7c2b60-b184-42fd-bac1-62c66741e1a3'),
	(24,2,17,9,0,2,'2021-04-20 17:06:22','2021-04-20 17:06:22','080e0b11-bb92-48af-b61b-b5c41910a380'),
	(25,2,17,10,0,3,'2021-04-20 17:06:22','2021-04-20 17:06:22','febb0a4c-5629-467e-aa57-4495861e70ed');

/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouts`;

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Asset','2020-08-18 15:17:52','2020-08-18 15:17:52',NULL,'0a13f35f-3709-46e8-8b6e-02a43e3e6c54'),
	(2,'craft\\elements\\GlobalSet','2021-01-13 15:29:05','2021-01-13 15:29:05',NULL,'259d8f15-4323-4613-a9db-a3bdf191d8e8'),
	(3,'craft\\elements\\Entry','2021-01-13 15:33:50','2021-01-13 15:33:50',NULL,'4688c411-3746-4c66-994b-f926e1cc60aa'),
	(4,'craft\\elements\\Entry','2021-01-13 15:48:53','2021-01-13 15:48:53',NULL,'1b9f63de-75d3-4f35-a71f-141febe10688');

/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouttabs`;

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `elements` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(6,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\TitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autofocus\":false,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100}]',1,'2020-08-18 17:41:56','2020-08-18 17:41:56','393e1416-1f82-46e5-8ded-d991375dcbf1'),
	(10,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"64f783bd-b58d-4f2a-9fae-dfe244e0dec0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7084bbf0-9dbf-4035-a276-0f85d0a72615\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5e7c6023-c4fc-4da3-83f6-a7af11294f06\"}]',1,'2021-01-13 15:36:31','2021-01-13 15:36:31','cd97d012-551b-41a8-ae6a-31da54fcc50c'),
	(14,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"148023a6-1f40-4234-9ded-c793fff78f53\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"cdf4dfdf-d663-4279-9d57-044b12bc5dc2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d467e78-3165-4634-b031-fc8df5ab0245\"}]',1,'2021-01-13 15:51:05','2021-01-13 15:51:05','b80a1dd8-050e-4c7c-9da8-4195e4285b44'),
	(17,2,'General','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ca9239ef-7150-4714-8ed8-661dc27b85b2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"36802a24-ca63-44ea-85ed-e4e0e99f72cc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"8c74863d-2f83-4f23-a757-64de973ee40c\"}]',1,'2021-04-20 17:06:22','2021-04-20 17:06:22','07e24458-7add-4a46-8dfa-740f01e8ebe2');

/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fields`;

CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fields_handle_context_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Project Introduction','projectIntroduction','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2021-01-13 15:28:36','2021-01-13 15:30:45','ca9239ef-7150-4714-8ed8-661dc27b85b2'),
	(2,1,'Interviews Introduction','interviewsIntroduction','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2021-01-13 15:31:19','2021-01-26 21:33:57','36802a24-ca63-44ea-85ed-e4e0e99f72cc'),
	(3,1,'Video Embed','videoEmbed','global','Copy and paste in embed code',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"1\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"1\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2021-01-13 15:35:18','2021-01-13 15:35:18','7084bbf0-9dbf-4035-a276-0f85d0a72615'),
	(4,1,'Description','description','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"\",\"uiMode\":\"normal\"}','2021-01-13 15:35:39','2021-01-13 15:40:38','64f783bd-b58d-4f2a-9fae-dfe244e0dec0'),
	(5,1,'Transcript','transcript','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:7afbbfc1-ad51-49ae-aa35-8833b06027e0\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:7afbbfc1-ad51-49ae-aa35-8833b06027e0\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-01-13 15:35:58','2021-01-19 16:18:24','5e7c6023-c4fc-4da3-83f6-a7af11294f06'),
	(6,1,'Timeline Description','timelineDescription','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2021-01-13 15:47:57','2021-01-13 15:47:57','1d467e78-3165-4634-b031-fc8df5ab0245'),
	(7,1,'Timeline Type','timelineType','global','',0,'none',NULL,'craft\\fields\\Dropdown','{\"optgroups\":true,\"options\":[{\"label\":\"National\",\"value\":\"national\",\"default\":\"1\"},{\"label\":\"Local\",\"value\":\"local\",\"default\":\"\"}]}','2021-01-13 15:48:32','2021-01-13 15:48:32','cdf4dfdf-d663-4279-9d57-044b12bc5dc2'),
	(8,1,'Image','image','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:7afbbfc1-ad51-49ae-aa35-8833b06027e0\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"Add an image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:7afbbfc1-ad51-49ae-aa35-8833b06027e0\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-01-13 15:50:37','2021-01-13 15:50:37','148023a6-1f40-4234-9ded-c793fff78f53'),
	(9,1,'Bibliography','bibliography','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2021-01-26 21:32:30','2021-01-26 21:34:04','1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526'),
	(10,1,'Credits','credits','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2021-04-20 17:02:51','2021-04-20 17:02:51','8c74863d-2f83-4f23-a757-64de973ee40c');

/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalsets`;

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;

INSERT INTO `globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,'General','general',2,'2021-01-13 15:26:50','2021-01-13 15:29:05','7b370c96-0fd0-4ffd-be32-b1466c1853be');

/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table gqlschemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqlschemas`;

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gqltokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqltokens`;

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqltokens_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqltokens_name_unq_idx` (`name`),
  KEY `gqltokens_schemaId_fk` (`schemaId`),
  CONSTRAINT `gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'3.5.17.1','3.5.13',0,'rybqskhcrbyi','ytosgidzxdtj','2020-08-18 13:00:37','2021-04-20 17:09:15','bf85ada9-27f8-41d6-86ca-3d7afd8a7b30');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocks`;

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocktypes`;

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocktypes_name_fieldId_idx` (`name`,`fieldId`),
  KEY `matrixblocktypes_handle_fieldId_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `migrations_track_name_unq_idx` (`track`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft','Install','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','d9e03338-9e09-4850-8509-37e6ef631e57'),
	(2,'craft','m150403_183908_migrations_table_changes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','1f532632-dfdd-414e-b2d8-0e70c8027242'),
	(3,'craft','m150403_184247_plugins_table_changes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','9953bd8b-d8ce-4987-a9e3-7f386cc32f07'),
	(4,'craft','m150403_184533_field_version','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','2f6e5025-fbf4-45de-90f6-3586897c802e'),
	(5,'craft','m150403_184729_type_columns','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','f819d6ba-2af3-4eb7-8f4f-410e78216bf9'),
	(6,'craft','m150403_185142_volumes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4423eab2-675f-41bf-9221-7603f1f4d28f'),
	(7,'craft','m150428_231346_userpreferences','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','90798106-5689-4dd2-bd6a-4dd557f07e99'),
	(8,'craft','m150519_150900_fieldversion_conversion','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','5d6ef628-5352-4c9c-b3d6-390cc7badf5f'),
	(9,'craft','m150617_213829_update_email_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','0fd0157e-eecb-4d86-bd2a-00d285e80655'),
	(10,'craft','m150721_124739_templatecachequeries','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','310e65d4-2230-44cd-a2f3-fd89c5d3408f'),
	(11,'craft','m150724_140822_adjust_quality_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','31baddc4-ba1f-4eeb-b377-db70af371e7f'),
	(12,'craft','m150815_133521_last_login_attempt_ip','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','1a048b10-397f-4fc0-acbc-b20342e1eccc'),
	(13,'craft','m151002_095935_volume_cache_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','9afff86b-b8b1-4b6d-b2a9-c0832216112d'),
	(14,'craft','m151005_142750_volume_s3_storage_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','212f5971-a0cc-40ba-a316-9a1def458b18'),
	(15,'craft','m151016_133600_delete_asset_thumbnails','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','705a2057-f5bc-4deb-90af-f81a516824f2'),
	(16,'craft','m151209_000000_move_logo','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','d57aabc7-f657-45d8-8b2f-1f8e14a61268'),
	(17,'craft','m151211_000000_rename_fileId_to_assetId','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','1113e7a6-b1c8-40d1-988a-f2abed549767'),
	(18,'craft','m151215_000000_rename_asset_permissions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','43415916-e6b6-476a-b287-818cbfe50ea5'),
	(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','7cd5979f-8a1f-44a5-b92a-ff679306258a'),
	(20,'craft','m160708_185142_volume_hasUrls_setting','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','f6985960-4481-4c58-bda8-a00cceba445e'),
	(21,'craft','m160714_000000_increase_max_asset_filesize','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','95f5b75f-e3c2-4e0b-bb08-328eb050f353'),
	(22,'craft','m160727_194637_column_cleanup','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','fdb2bd48-64f0-4e9b-acdd-f691a9419efd'),
	(23,'craft','m160804_110002_userphotos_to_assets','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b0e23fc1-696d-4f29-b838-ce802fe64624'),
	(24,'craft','m160807_144858_sites','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','52614618-cfa9-44aa-bc82-403ab98a8e4f'),
	(25,'craft','m160829_000000_pending_user_content_cleanup','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','add7a0c2-bd24-4797-a394-1e011d3c8729'),
	(26,'craft','m160830_000000_asset_index_uri_increase','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','73d60d3e-5387-4ff3-ab72-31650cc81b9d'),
	(27,'craft','m160912_230520_require_entry_type_id','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','654a67dd-2c73-43b2-82ca-7c7283ddcdd3'),
	(28,'craft','m160913_134730_require_matrix_block_type_id','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b25239d2-8103-433d-86f2-6f2fce127055'),
	(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','9114ec62-a852-4372-8f10-5de04281bf2e'),
	(30,'craft','m160920_231045_usergroup_handle_title_unique','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','126f9cef-4dc4-4975-a495-f0e50f1748b7'),
	(31,'craft','m160925_113941_route_uri_parts','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b457ebc0-5c22-45b1-b10e-4b767baa8d8b'),
	(32,'craft','m161006_205918_schemaVersion_not_null','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b12ce99c-41e2-435f-9ce6-2b225254a781'),
	(33,'craft','m161007_130653_update_email_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','e499e584-3550-469a-bf9b-ec44438ba354'),
	(34,'craft','m161013_175052_newParentId','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','7449e33e-4194-4340-af98-74a9ce92b7a7'),
	(35,'craft','m161021_102916_fix_recent_entries_widgets','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','e89e81ce-0ee0-45cc-b0cc-0755eae53cbe'),
	(36,'craft','m161021_182140_rename_get_help_widget','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','69f26832-059d-47f8-88aa-de9ba814ae84'),
	(37,'craft','m161025_000000_fix_char_columns','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b6dc817e-5bab-458b-9cc9-161f698bfdec'),
	(38,'craft','m161029_124145_email_message_languages','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','7821f6a7-ad1e-48de-abfa-a4cb818bc861'),
	(39,'craft','m161108_000000_new_version_format','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','f8c69967-05ef-46a3-9b43-e704f4f76288'),
	(40,'craft','m161109_000000_index_shuffle','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4d22a662-f4c5-4e4a-abdb-cf8bdd854728'),
	(41,'craft','m161122_185500_no_craft_app','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','55a73ed7-1216-4576-b168-3d82962f85b5'),
	(42,'craft','m161125_150752_clear_urlmanager_cache','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','da6a7349-3c37-4006-9ec2-ef48e8b33d37'),
	(43,'craft','m161220_000000_volumes_hasurl_notnull','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','5a6305f7-0ede-4440-8d8c-18a76c70743c'),
	(44,'craft','m170114_161144_udates_permission','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','1b421238-13fb-4b71-96a7-dab6c07baac6'),
	(45,'craft','m170120_000000_schema_cleanup','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','5b0ccaa8-6f85-4939-b68d-9f1ead8f7198'),
	(46,'craft','m170126_000000_assets_focal_point','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','a6ea6cbe-538b-4632-9b3a-56802875e579'),
	(47,'craft','m170206_142126_system_name','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','5c182a58-02fe-4b5a-9fe4-9075417a009e'),
	(48,'craft','m170217_044740_category_branch_limits','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','2f4ffd5a-34a1-4fb1-8fe4-da18e4da51ec'),
	(49,'craft','m170217_120224_asset_indexing_columns','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','e6d7f281-dd2d-4148-933c-6b7012d0d518'),
	(50,'craft','m170223_224012_plain_text_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','35282f66-8f5d-4534-b2e7-b54d8ecd989a'),
	(51,'craft','m170227_120814_focal_point_percentage','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b2c618a5-4f57-4827-9e48-1998d1878486'),
	(52,'craft','m170228_171113_system_messages','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','2de17308-31ff-4123-855b-0b5c2c534dda'),
	(53,'craft','m170303_140500_asset_field_source_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4ecea270-3ec1-4f3f-a600-532d81770d8d'),
	(54,'craft','m170306_150500_asset_temporary_uploads','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c260bfa8-0666-4514-8364-93cafd8f46ed'),
	(55,'craft','m170523_190652_element_field_layout_ids','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','1d6a88a3-3187-49f6-a271-36e66a83ff25'),
	(56,'craft','m170612_000000_route_index_shuffle','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','425f5c49-586e-4eb7-87bf-286848ce5741'),
	(57,'craft','m170621_195237_format_plugin_handles','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','733de7ce-1c7c-472b-8d72-88d8041968e3'),
	(58,'craft','m170630_161027_deprecation_line_nullable','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','1e2db793-8265-4a2b-b6fe-4fd3cc560d9f'),
	(59,'craft','m170630_161028_deprecation_changes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','2b368d42-10b2-4d48-a991-4cd9c463bab4'),
	(60,'craft','m170703_181539_plugins_table_tweaks','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','64ff1eda-d940-4e2d-b812-383028539516'),
	(61,'craft','m170704_134916_sites_tables','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','53040375-efa4-4164-bd21-82769a04ec22'),
	(62,'craft','m170706_183216_rename_sequences','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','64b44586-a0c4-4410-bcbf-e7c140d4897d'),
	(63,'craft','m170707_094758_delete_compiled_traits','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','d89b3801-09f4-461f-84c6-8f0eef8884ec'),
	(64,'craft','m170731_190138_drop_asset_packagist','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','0ed4c445-a336-40ce-b1b2-731274af26aa'),
	(65,'craft','m170810_201318_create_queue_table','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','20bfd0f8-c916-400b-be8d-31d397ef3565'),
	(66,'craft','m170903_192801_longblob_for_queue_jobs','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','63fc67ba-8b21-4785-b303-6d6b8a9ce644'),
	(67,'craft','m170914_204621_asset_cache_shuffle','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','a7d20bbd-ab8d-4436-aa34-38cbbfc94a67'),
	(68,'craft','m171011_214115_site_groups','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','36ff47bf-d00f-4f6d-8fb2-f6982b679db4'),
	(69,'craft','m171012_151440_primary_site','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','27d99901-7ce1-4e37-8872-474e634d93fc'),
	(70,'craft','m171013_142500_transform_interlace','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','1107f2d8-7b51-4112-a93b-16bf0d09524b'),
	(71,'craft','m171016_092553_drop_position_select','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','60678591-b07e-45e5-8d21-299d031916fa'),
	(72,'craft','m171016_221244_less_strict_translation_method','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','3aad0ddb-c6fa-44f6-8013-a17782496656'),
	(73,'craft','m171107_000000_assign_group_permissions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c55e9d39-83c8-4109-bb5c-ab84a97baf3f'),
	(74,'craft','m171117_000001_templatecache_index_tune','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','75a64c75-2dd1-4dd6-9f99-0f493edff754'),
	(75,'craft','m171126_105927_disabled_plugins','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','61063891-094b-4660-851a-f55d3435c2b3'),
	(76,'craft','m171130_214407_craftidtokens_table','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','bf00561b-a388-4363-afa4-93da14900c60'),
	(77,'craft','m171202_004225_update_email_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','98351d2b-c6d6-4ffd-81ba-63045fce41c5'),
	(78,'craft','m171204_000001_templatecache_index_tune_deux','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b3eb92ee-1104-4465-95f6-21e8374cc5d2'),
	(79,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','ca8b23c8-e108-4ee4-97f8-f04ac507ec39'),
	(80,'craft','m171218_143135_longtext_query_column','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4b07453b-c209-4f11-8dc3-925243e7c24c'),
	(81,'craft','m171231_055546_environment_variables_to_aliases','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','457c9e19-d662-4475-9432-fe23d778ae50'),
	(82,'craft','m180113_153740_drop_users_archived_column','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','a38f80ec-9111-4152-b873-98ede7e5bc08'),
	(83,'craft','m180122_213433_propagate_entries_setting','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','cad4bbaa-b7a8-4593-9819-c8100402f9b5'),
	(84,'craft','m180124_230459_fix_propagate_entries_values','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','dc2c9eb1-8a34-491a-be80-6cdc76a24de7'),
	(85,'craft','m180128_235202_set_tag_slugs','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','ff5709ed-8f4b-44d8-a703-8355fa8d7610'),
	(86,'craft','m180202_185551_fix_focal_points','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c0931bea-500f-4e20-b8a3-318e0993e2de'),
	(87,'craft','m180217_172123_tiny_ints','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','bbdf4d66-531a-4bbb-a969-0ee024a87017'),
	(88,'craft','m180321_233505_small_ints','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','bebd469e-bbde-478b-b793-13693c5feb6e'),
	(89,'craft','m180328_115523_new_license_key_statuses','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','56e1b0db-39f1-4ce3-aa8e-c4eb2b63c411'),
	(90,'craft','m180404_182320_edition_changes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','e29e123c-49f7-4aa6-82a7-3acc4570100b'),
	(91,'craft','m180411_102218_fix_db_routes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','841ba53d-5387-4a4f-b9de-3e6b8365d22f'),
	(92,'craft','m180416_205628_resourcepaths_table','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','93755a5e-ac24-4e0f-a7be-470e6f0c1ca2'),
	(93,'craft','m180418_205713_widget_cleanup','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','09be5d78-0133-4507-a59f-a6be9ab970c5'),
	(94,'craft','m180425_203349_searchable_fields','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','01548de0-3b09-4f23-a4bb-6a7f36d37778'),
	(95,'craft','m180516_153000_uids_in_field_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4dfb1037-1d18-4b05-85dd-2b8853e713f1'),
	(96,'craft','m180517_173000_user_photo_volume_to_uid','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','8846c2a0-8ede-45bf-9775-a095f839f562'),
	(97,'craft','m180518_173000_permissions_to_uid','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','431d71f1-b13b-4964-a7f0-5f52ac5e6404'),
	(98,'craft','m180520_173000_matrix_context_to_uids','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','bf29d0ad-7930-42e2-816c-bdba23140d1d'),
	(99,'craft','m180521_172900_project_config_table','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','71f1b9ed-7941-4cda-9697-9ad02ca5824c'),
	(100,'craft','m180521_173000_initial_yml_and_snapshot','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','7edc4290-b0d0-4c1e-afbd-ed452bdd6cb7'),
	(101,'craft','m180731_162030_soft_delete_sites','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b5c62688-7fbf-4519-9206-c89a64cc74f4'),
	(102,'craft','m180810_214427_soft_delete_field_layouts','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','3736f4c7-af95-4dab-9428-0c450dfd19a6'),
	(103,'craft','m180810_214439_soft_delete_elements','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','8f7abe6e-c869-4772-9516-9cc34ad4349e'),
	(104,'craft','m180824_193422_case_sensitivity_fixes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','40f01842-7328-49ae-a8ba-a1925e760775'),
	(105,'craft','m180901_151639_fix_matrixcontent_tables','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','76e88525-89e0-4f02-b98e-f7cf0bb1f3a9'),
	(106,'craft','m180904_112109_permission_changes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','d2ad28b5-bfc5-400b-9ef9-2946023bd477'),
	(107,'craft','m180910_142030_soft_delete_sitegroups','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','83a5a6ce-14dd-4557-adbb-b9274b14fd38'),
	(108,'craft','m181011_160000_soft_delete_asset_support','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','feb7f19d-008c-428a-9d37-0670228b606c'),
	(109,'craft','m181016_183648_set_default_user_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','90a317f7-1c75-45d7-b458-e00ae0428e2a'),
	(110,'craft','m181017_225222_system_config_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','cd8a81fe-6101-49d2-9e27-912387d8534d'),
	(111,'craft','m181018_222343_drop_userpermissions_from_config','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','f7f2577a-b250-4ecc-ac1d-0cdbc908b766'),
	(112,'craft','m181029_130000_add_transforms_routes_to_config','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','f64e3ec9-dbd2-4ea8-ae86-15714255d64a'),
	(113,'craft','m181112_203955_sequences_table','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','5c90e341-3113-4ce7-9cb7-f4431cc60887'),
	(114,'craft','m181121_001712_cleanup_field_configs','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','d2931b49-845a-4f7a-825c-14132bc6d3c2'),
	(115,'craft','m181128_193942_fix_project_config','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','1365c7f5-ec01-4593-829f-62d1faed91a5'),
	(116,'craft','m181130_143040_fix_schema_version','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','13a08f4d-3802-4be3-bbe1-2795dd6e991e'),
	(117,'craft','m181211_143040_fix_entry_type_uids','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','ec048189-e02c-4a49-891a-92b0bc950c53'),
	(118,'craft','m181217_153000_fix_structure_uids','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','dfb00f3e-84c4-4dac-b6b9-0d8d6b2a6e02'),
	(119,'craft','m190104_152725_store_licensed_plugin_editions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','3fcc6ead-0b5e-4e61-b0c1-c1543179a44d'),
	(120,'craft','m190108_110000_cleanup_project_config','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','8fa9ce53-5d0d-46b9-8dd0-ab5d6856171c'),
	(121,'craft','m190108_113000_asset_field_setting_change','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','8570f80a-667f-4c15-aea8-e23aab97fbfa'),
	(122,'craft','m190109_172845_fix_colspan','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c62dcf20-2725-42c7-8fd4-a9b57fddf1e6'),
	(123,'craft','m190110_150000_prune_nonexisting_sites','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','e0a8f37d-9779-4c5a-aa4a-b7a492959d3e'),
	(124,'craft','m190110_214819_soft_delete_volumes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','2f83754c-7deb-4419-9d79-ea851a0e5869'),
	(125,'craft','m190112_124737_fix_user_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','0eb84e59-51d4-489d-aafc-bf6db213ac7a'),
	(126,'craft','m190112_131225_fix_field_layouts','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','3c8907f3-976b-41f7-982c-8ee950dff2fa'),
	(127,'craft','m190112_201010_more_soft_deletes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c7353209-2703-48c1-844c-9bfbd691eb72'),
	(128,'craft','m190114_143000_more_asset_field_setting_changes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','d172f5b1-692a-4043-bf22-245cc6a588e1'),
	(129,'craft','m190121_120000_rich_text_config_setting','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','6b0beb27-cc98-4aaa-ae23-9d9e1080ded7'),
	(130,'craft','m190125_191628_fix_email_transport_password','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b632ab2e-5fea-4d77-a431-1da1200b8eea'),
	(131,'craft','m190128_181422_cleanup_volume_folders','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','b779eba9-830a-477a-a811-4b7f2c0734bf'),
	(132,'craft','m190205_140000_fix_asset_soft_delete_index','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4dbca9a3-ac15-4698-9c48-00a1f2a15680'),
	(133,'craft','m190218_143000_element_index_settings_uid','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c57d9f4b-cc79-45a3-99b0-e7c76b085edb'),
	(134,'craft','m190312_152740_element_revisions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4815cc00-45a8-4aef-a177-22a2beb2a150'),
	(135,'craft','m190327_235137_propagation_method','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','f0bd2e66-8d81-4aa0-8336-c468af591997'),
	(136,'craft','m190401_223843_drop_old_indexes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','87a20e1a-6003-4a5f-9165-a7f0c38b0919'),
	(137,'craft','m190416_014525_drop_unique_global_indexes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','a18dd83d-56c0-4a36-9302-e7406c9fe88d'),
	(138,'craft','m190417_085010_add_image_editor_permissions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','398e2f86-fb73-4c4f-9748-dae545b30af5'),
	(139,'craft','m190502_122019_store_default_user_group_uid','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','12e04372-79d4-42d0-81ad-5ed979821eeb'),
	(140,'craft','m190504_150349_preview_targets','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','e755e2ad-44b9-4b97-91f6-f648e9f0bb56'),
	(141,'craft','m190516_184711_job_progress_label','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','3aa11693-f826-478b-b0fd-ed53e82d0a6a'),
	(142,'craft','m190523_190303_optional_revision_creators','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','0784ccb0-5632-4613-96bc-dbd048522c04'),
	(143,'craft','m190529_204501_fix_duplicate_uids','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','082dc86d-866b-4378-99da-f9e19ee33133'),
	(144,'craft','m190605_223807_unsaved_drafts','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','9fdd7b0b-3021-4971-b7f7-d24961e32fa6'),
	(145,'craft','m190607_230042_entry_revision_error_tables','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','8dd92349-46e6-4ff6-b730-81742cc4fe32'),
	(146,'craft','m190608_033429_drop_elements_uid_idx','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','13358dd5-ce72-4eda-a2e4-79ed0131d77a'),
	(147,'craft','m190617_164400_add_gqlschemas_table','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','443388fc-9583-4afb-9ac2-ab8785f5403e'),
	(148,'craft','m190624_234204_matrix_propagation_method','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','feaed117-9d78-494d-ac31-84e73682647b'),
	(149,'craft','m190711_153020_drop_snapshots','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','51364037-0467-4257-82f0-e53ef04ca06c'),
	(150,'craft','m190712_195914_no_draft_revisions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','65dccff7-a1e1-4c87-8fd7-e43224308848'),
	(151,'craft','m190723_140314_fix_preview_targets_column','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c02db310-ed45-4a44-8c1c-e1ded2b298d8'),
	(152,'craft','m190820_003519_flush_compiled_templates','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','38889a8d-5ad5-44a3-9495-d98d4904fe27'),
	(153,'craft','m190823_020339_optional_draft_creators','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','ee605ad9-e4a1-47f1-8b81-07c99b712284'),
	(154,'craft','m190913_152146_update_preview_targets','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','167a5af6-e78d-4c65-8d56-2a25e76c7f90'),
	(155,'craft','m191107_122000_add_gql_project_config_support','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','735980fb-7f82-4f44-b517-22a750b91f3c'),
	(156,'craft','m191204_085100_pack_savable_component_settings','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','55f285a7-d77a-4e47-a6db-6b5d7f853439'),
	(157,'craft','m191206_001148_change_tracking','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4bc75ee8-8cd0-49c3-930a-ecdba6e91209'),
	(158,'craft','m191216_191635_asset_upload_tracking','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','9c06e420-ec87-4f4c-8e48-93a531562f59'),
	(159,'craft','m191222_002848_peer_asset_permissions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','3d366fc0-0aa5-45b1-abfa-59a8f9fa75b0'),
	(160,'craft','m200127_172522_queue_channels','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','f44d2762-0339-423a-b61e-4c0d2687f4fe'),
	(161,'craft','m200211_175048_truncate_element_query_cache','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','ec63edc4-dfd7-4115-a3ad-36f9a816f819'),
	(162,'craft','m200213_172522_new_elements_index','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','21f6bc8c-7fc2-46a8-8ec3-2831d3da0a6a'),
	(163,'craft','m200228_195211_long_deprecation_messages','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','a9656b81-f27f-4d1c-803f-f0a308cd2d36'),
	(164,'craft','m200306_054652_disabled_sites','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','bdcdc16f-e424-4016-bc30-9afd40b17898'),
	(165,'craft','m200522_191453_clear_template_caches','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','e3e3e619-dfdf-41a6-b3b8-9ba3b6223570'),
	(166,'craft','m200606_231117_migration_tracks','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','81e30c10-2cb5-4eda-9d3a-5eabb29cdeea'),
	(167,'craft','m200619_215137_title_translation_method','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','99878ea1-5fcf-4168-8adc-3f79f505b3a2'),
	(168,'craft','m200620_005028_user_group_descriptions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','ee40a803-f000-4f56-83c7-1c9f39b86557'),
	(169,'craft','m200620_230205_field_layout_changes','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','2a3b17e8-3381-4771-8517-0bff6f5d32d1'),
	(170,'craft','m200625_131100_move_entrytypes_to_top_project_config','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c04cd48e-d71e-41cb-afd0-10bcc5971418'),
	(171,'craft','m200629_112700_remove_project_config_legacy_files','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','4e9daee2-ea82-4ada-bfe2-e98ccaf46caa'),
	(172,'craft','m200630_183000_drop_configmap','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c2064789-e30b-4e6f-956d-cbb660544d60'),
	(173,'craft','m200715_113400_transform_index_error_flag','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','c96d88e0-96f1-4f08-9b40-3382d65aac98'),
	(174,'craft','m200716_110900_replace_file_asset_permissions','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','73f88575-c9f8-4166-a8e2-1fd4217d71cd'),
	(175,'craft','m200716_153800_public_token_settings_in_project_config','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','da90edf8-1edc-4a5d-aaf3-9e61366f6d87'),
	(176,'craft','m200720_175543_drop_unique_constraints','2020-08-18 13:00:39','2020-08-18 13:00:39','2020-08-18 13:00:39','a84cf0f7-10d2-40c1-a5a1-38aa84517f42'),
	(177,'craft','m200825_051217_project_config_version','2021-01-04 14:00:59','2021-01-04 14:00:59','2021-01-04 14:00:59','f8f3e36c-efec-44cb-8120-8f41a0f3a326'),
	(178,'plugin:redactor','m180430_204710_remove_old_plugins','2021-01-13 15:27:58','2021-01-13 15:27:58','2021-01-13 15:27:58','0cd37fcd-acdd-4575-a58c-06a54c97add7'),
	(179,'plugin:redactor','Install','2021-01-13 15:27:58','2021-01-13 15:27:58','2021-01-13 15:27:58','58bff8d9-1cce-41fb-acfe-611258bb17d3'),
	(180,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2021-01-13 15:27:58','2021-01-13 15:27:58','2021-01-13 15:27:58','d2201f47-3821-470d-9d49-290178afd4e7');

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'redactor','2.8.5','2.3.0','unknown',NULL,'2021-01-13 15:27:58','2021-01-13 15:27:58','2026-06-06 01:53:30','73ceaab5-3ba3-466c-867b-eca147d637c4');

/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projectconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projectconfig`;

CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;

INSERT INTO `projectconfig` (`path`, `value`)
VALUES
	('dateModified','1618938197'),
	('email.fromEmail','\"perry@perrygarvinstudio.com\"'),
	('email.fromName','\"Black Lives Matter in Higher Education\"'),
	('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.class','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.disabled','false'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.id','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.instructions','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.label','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.max','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.min','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.name','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.orientation','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.placeholder','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.readonly','false'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.requirable','false'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.size','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.step','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.tip','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.title','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.warning','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.0.width','100'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.1.fieldUid','\"64f783bd-b58d-4f2a-9fae-dfe244e0dec0\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.1.instructions','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.1.label','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.1.required','false'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.1.tip','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.1.warning','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.1.width','100'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.2.fieldUid','\"7084bbf0-9dbf-4035-a276-0f85d0a72615\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.2.instructions','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.2.label','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.2.required','false'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.2.tip','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.2.warning','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.2.width','100'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.3.fieldUid','\"5e7c6023-c4fc-4da3-83f6-a7af11294f06\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.3.instructions','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.3.label','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.3.required','false'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.3.tip','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.3.warning','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.elements.3.width','100'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.name','\"Content\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.fieldLayouts.4688c411-3746-4c66-994b-f926e1cc60aa.tabs.0.sortOrder','1'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.handle','\"interview\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.hasTitleField','true'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.name','\"Interview\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.section','\"ff48fc6a-8822-48fe-be61-52c2a6202be4\"'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.sortOrder','1'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.titleFormat','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.titleTranslationKeyFormat','null'),
	('entryTypes.8bb0f0ea-235d-4d57-b0fb-049eaf5f2d94.titleTranslationMethod','\"site\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.autocapitalize','true'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.autocomplete','false'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.autocorrect','true'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.class','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.disabled','false'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.id','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.instructions','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.label','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.max','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.min','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.name','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.orientation','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.placeholder','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.readonly','false'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.requirable','false'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.size','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.step','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.tip','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.title','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.warning','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.0.width','100'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.1.fieldUid','\"148023a6-1f40-4234-9ded-c793fff78f53\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.1.instructions','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.1.label','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.1.required','false'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.1.tip','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.1.warning','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.1.width','100'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.2.fieldUid','\"cdf4dfdf-d663-4279-9d57-044b12bc5dc2\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.2.instructions','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.2.label','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.2.required','false'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.2.tip','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.2.warning','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.2.width','100'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.3.fieldUid','\"1d467e78-3165-4634-b031-fc8df5ab0245\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.3.instructions','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.3.label','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.3.required','false'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.3.tip','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.3.warning','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.elements.3.width','100'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.name','\"Content\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.fieldLayouts.1b9f63de-75d3-4f35-a71f-141febe10688.tabs.0.sortOrder','1'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.handle','\"timelineEntry\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.hasTitleField','true'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.name','\"Timeline Entry\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.section','\"9795823c-2974-45f0-9621-f40407319855\"'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.sortOrder','1'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.titleFormat','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.titleTranslationKeyFormat','null'),
	('entryTypes.f3f75b1e-8bde-4010-8289-007cd6d78b74.titleTranslationMethod','\"site\"'),
	('fieldGroups.f33009e6-e6ee-48c3-9dc3-861195670ed1.name','\"Common\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.contentColumnType','\"string\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.handle','\"image\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.instructions','\"\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.name','\"Image\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.searchable','false'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.allowedKinds.0','\"image\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.allowSelfRelations','false'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.allowUploads','true'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.defaultUploadLocationSource','\"volume:7afbbfc1-ad51-49ae-aa35-8833b06027e0\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.defaultUploadLocationSubpath','\"\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.limit','\"1\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.localizeRelations','false'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.previewMode','\"full\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.restrictFiles','\"1\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.selectionLabel','\"Add an image\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.showSiteMenu','false'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.showUnpermittedFiles','false'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.showUnpermittedVolumes','false'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.singleUploadLocationSource','\"volume:7afbbfc1-ad51-49ae-aa35-8833b06027e0\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.singleUploadLocationSubpath','\"\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.source','null'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.sources','\"*\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.targetSiteId','null'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.useSingleFolder','false'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.validateRelatedElements','false'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.settings.viewMode','\"list\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.translationKeyFormat','null'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.translationMethod','\"site\"'),
	('fields.148023a6-1f40-4234-9ded-c793fff78f53.type','\"craft\\\\fields\\\\Assets\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.contentColumnType','\"text\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.handle','\"timelineDescription\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.instructions','\"\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.name','\"Timeline Description\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.searchable','false'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.availableTransforms','\"*\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.availableVolumes','\"\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.cleanupHtml','true'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.columnType','\"text\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.configSelectionMode','\"choose\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.defaultTransform','\"\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.manualConfig','\"\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.purifierConfig','\"\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.purifyHtml','\"1\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.redactorConfig','\"Simple.json\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.removeEmptyTags','\"1\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.removeInlineStyles','\"1\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.removeNbsp','\"1\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.showHtmlButtonForNonAdmins','\"\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.showUnpermittedFiles','false'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.showUnpermittedVolumes','false'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.settings.uiMode','\"normal\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.translationKeyFormat','null'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.translationMethod','\"none\"'),
	('fields.1d467e78-3165-4634-b031-fc8df5ab0245.type','\"craft\\\\redactor\\\\Field\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.contentColumnType','\"text\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.handle','\"bibliography\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.instructions','\"\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.name','\"Bibliography\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.searchable','false'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.availableTransforms','\"*\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.availableVolumes','\"\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.cleanupHtml','true'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.columnType','\"text\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.configSelectionMode','\"choose\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.defaultTransform','\"\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.manualConfig','\"\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.purifierConfig','\"\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.purifyHtml','\"1\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.redactorConfig','\"Simple.json\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.removeEmptyTags','\"1\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.removeInlineStyles','\"1\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.removeNbsp','\"1\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.showHtmlButtonForNonAdmins','\"\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.showUnpermittedFiles','false'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.showUnpermittedVolumes','false'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.settings.uiMode','\"normal\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.translationKeyFormat','null'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.translationMethod','\"none\"'),
	('fields.1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526.type','\"craft\\\\redactor\\\\Field\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.contentColumnType','\"text\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.handle','\"interviewsIntroduction\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.instructions','\"\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.name','\"Interviews Introduction\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.searchable','false'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.availableTransforms','\"*\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.availableVolumes','\"\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.cleanupHtml','true'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.columnType','\"text\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.configSelectionMode','\"choose\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.defaultTransform','\"\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.manualConfig','\"\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.purifierConfig','\"\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.purifyHtml','\"1\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.redactorConfig','\"Simple.json\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.removeEmptyTags','\"1\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.removeInlineStyles','\"1\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.removeNbsp','\"1\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.showHtmlButtonForNonAdmins','\"\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.showUnpermittedFiles','false'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.showUnpermittedVolumes','false'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.settings.uiMode','\"normal\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.translationKeyFormat','null'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.translationMethod','\"none\"'),
	('fields.36802a24-ca63-44ea-85ed-e4e0e99f72cc.type','\"craft\\\\redactor\\\\Field\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.contentColumnType','\"string\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.handle','\"transcript\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.instructions','\"\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.name','\"Transcript\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.searchable','false'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.allowedKinds','null'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.allowSelfRelations','false'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.allowUploads','true'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.defaultUploadLocationSource','\"volume:7afbbfc1-ad51-49ae-aa35-8833b06027e0\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.defaultUploadLocationSubpath','\"\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.limit','\"\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.localizeRelations','false'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.previewMode','\"full\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.restrictFiles','\"\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.selectionLabel','\"\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.showSiteMenu','true'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.showUnpermittedFiles','false'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.showUnpermittedVolumes','false'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.singleUploadLocationSource','\"volume:7afbbfc1-ad51-49ae-aa35-8833b06027e0\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.singleUploadLocationSubpath','\"\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.source','null'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.sources','\"*\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.targetSiteId','null'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.useSingleFolder','false'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.validateRelatedElements','false'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.settings.viewMode','\"list\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.translationKeyFormat','null'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.translationMethod','\"site\"'),
	('fields.5e7c6023-c4fc-4da3-83f6-a7af11294f06.type','\"craft\\\\fields\\\\Assets\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.contentColumnType','\"text\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.handle','\"description\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.instructions','\"\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.name','\"Description\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.searchable','false'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.settings.byteLimit','null'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.settings.charLimit','null'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.settings.code','\"\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.settings.columnType','null'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.settings.initialRows','\"4\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.settings.multiline','\"\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.settings.placeholder','\"\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.settings.uiMode','\"normal\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.translationKeyFormat','null'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.translationMethod','\"none\"'),
	('fields.64f783bd-b58d-4f2a-9fae-dfe244e0dec0.type','\"craft\\\\fields\\\\PlainText\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.contentColumnType','\"text\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.handle','\"videoEmbed\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.instructions','\"Copy and paste in embed code\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.name','\"Video Embed\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.searchable','false'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.settings.byteLimit','null'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.settings.charLimit','null'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.settings.code','\"1\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.settings.columnType','null'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.settings.initialRows','\"4\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.settings.multiline','\"1\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.settings.placeholder','\"\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.settings.uiMode','\"normal\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.translationKeyFormat','null'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.translationMethod','\"none\"'),
	('fields.7084bbf0-9dbf-4035-a276-0f85d0a72615.type','\"craft\\\\fields\\\\PlainText\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.contentColumnType','\"text\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.handle','\"credits\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.instructions','\"\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.name','\"Credits\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.searchable','false'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.availableTransforms','\"*\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.availableVolumes','\"\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.cleanupHtml','true'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.columnType','\"text\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.configSelectionMode','\"choose\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.defaultTransform','\"\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.manualConfig','\"\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.purifierConfig','\"\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.purifyHtml','\"1\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.redactorConfig','\"Simple.json\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.removeEmptyTags','\"1\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.removeInlineStyles','\"1\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.removeNbsp','\"1\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.showHtmlButtonForNonAdmins','\"\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.showUnpermittedFiles','false'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.showUnpermittedVolumes','false'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.settings.uiMode','\"normal\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.translationKeyFormat','null'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.translationMethod','\"none\"'),
	('fields.8c74863d-2f83-4f23-a757-64de973ee40c.type','\"craft\\\\redactor\\\\Field\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.contentColumnType','\"text\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.handle','\"projectIntroduction\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.instructions','\"\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.name','\"Project Introduction\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.searchable','false'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.availableTransforms','\"*\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.availableVolumes','\"\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.cleanupHtml','true'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.columnType','\"text\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.configSelectionMode','\"choose\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.defaultTransform','\"\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.manualConfig','\"\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.purifierConfig','\"\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.purifyHtml','\"1\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.redactorConfig','\"Simple.json\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.removeEmptyTags','\"1\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.removeInlineStyles','\"1\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.removeNbsp','\"1\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.showHtmlButtonForNonAdmins','\"\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.showUnpermittedFiles','false'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.showUnpermittedVolumes','false'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.settings.uiMode','\"normal\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.translationKeyFormat','null'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.translationMethod','\"none\"'),
	('fields.ca9239ef-7150-4714-8ed8-661dc27b85b2.type','\"craft\\\\redactor\\\\Field\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.contentColumnType','\"string\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.fieldGroup','\"f33009e6-e6ee-48c3-9dc3-861195670ed1\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.handle','\"timelineType\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.instructions','\"\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.name','\"Timeline Type\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.searchable','false'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.optgroups','true'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.0.__assoc__.0.0','\"label\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.0.__assoc__.0.1','\"National\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.0.__assoc__.1.0','\"value\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.0.__assoc__.1.1','\"national\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.0.__assoc__.2.0','\"default\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.0.__assoc__.2.1','\"1\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.1.__assoc__.0.0','\"label\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.1.__assoc__.0.1','\"Local\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.1.__assoc__.1.0','\"value\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.1.__assoc__.1.1','\"local\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.1.__assoc__.2.0','\"default\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.settings.options.1.__assoc__.2.1','\"\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.translationKeyFormat','null'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.translationMethod','\"none\"'),
	('fields.cdf4dfdf-d663-4279-9d57-044b12bc5dc2.type','\"craft\\\\fields\\\\Dropdown\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.0.fieldUid','\"ca9239ef-7150-4714-8ed8-661dc27b85b2\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.0.instructions','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.0.label','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.0.required','false'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.0.tip','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.0.warning','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.0.width','100'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.1.fieldUid','\"36802a24-ca63-44ea-85ed-e4e0e99f72cc\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.1.instructions','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.1.label','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.1.required','false'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.1.tip','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.1.warning','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.1.width','100'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.2.fieldUid','\"1d5f3757-8fd0-4ecd-b8fe-2fb60b0fb526\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.2.instructions','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.2.label','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.2.required','false'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.2.tip','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.2.warning','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.2.width','100'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.3.fieldUid','\"8c74863d-2f83-4f23-a757-64de973ee40c\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.3.instructions','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.3.label','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.3.required','false'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.3.tip','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.3.warning','null'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.elements.3.width','100'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.name','\"General\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.fieldLayouts.259d8f15-4323-4613-a9db-a3bdf191d8e8.tabs.0.sortOrder','1'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.handle','\"general\"'),
	('globalSets.7b370c96-0fd0-4ffd-be32-b1466c1853be.name','\"General\"'),
	('plugins.redactor.edition','\"standard\"'),
	('plugins.redactor.enabled','true'),
	('plugins.redactor.schemaVersion','\"2.3.0\"'),
	('routes.71e28ab2-cd47-4f86-8a55-8e9913c60c7c.siteUid','null'),
	('routes.71e28ab2-cd47-4f86-8a55-8e9913c60c7c.sortOrder','2'),
	('routes.71e28ab2-cd47-4f86-8a55-8e9913c60c7c.template','\"_templates/_home\"'),
	('routes.71e28ab2-cd47-4f86-8a55-8e9913c60c7c.uriPattern','\"\"'),
	('routes.e98999fa-2a44-47a6-b753-261c7abfbee4.siteUid','null'),
	('routes.e98999fa-2a44-47a6-b753-261c7abfbee4.sortOrder','1'),
	('routes.e98999fa-2a44-47a6-b753-261c7abfbee4.template','\"components\"'),
	('routes.e98999fa-2a44-47a6-b753-261c7abfbee4.uriParts.0','\"components\"'),
	('routes.e98999fa-2a44-47a6-b753-261c7abfbee4.uriPattern','\"components\"'),
	('sections.9795823c-2974-45f0-9621-f40407319855.enableVersioning','false'),
	('sections.9795823c-2974-45f0-9621-f40407319855.handle','\"timelineEntry\"'),
	('sections.9795823c-2974-45f0-9621-f40407319855.name','\"Timeline Entry\"'),
	('sections.9795823c-2974-45f0-9621-f40407319855.propagationMethod','\"all\"'),
	('sections.9795823c-2974-45f0-9621-f40407319855.siteSettings.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.enabledByDefault','true'),
	('sections.9795823c-2974-45f0-9621-f40407319855.siteSettings.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.hasUrls','false'),
	('sections.9795823c-2974-45f0-9621-f40407319855.siteSettings.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.template','null'),
	('sections.9795823c-2974-45f0-9621-f40407319855.siteSettings.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.uriFormat','null'),
	('sections.9795823c-2974-45f0-9621-f40407319855.type','\"channel\"'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.enableVersioning','true'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.handle','\"interview\"'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.name','\"Interview\"'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.propagationMethod','\"all\"'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.siteSettings.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.enabledByDefault','true'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.siteSettings.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.hasUrls','false'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.siteSettings.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.template','null'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.siteSettings.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.uriFormat','null'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.structure.maxLevels','null'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.structure.uid','\"393fc514-b1e2-4131-849e-bd33c24d10e5\"'),
	('sections.ff48fc6a-8822-48fe-be61-52c2a6202be4.type','\"structure\"'),
	('siteGroups.9ce96b15-4ee3-4148-b3ec-8a3ef826b120.name','\"Black Lives Matter in Higher Education\"'),
	('sites.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.baseUrl','\"$PRIMARY_SITE_URL\"'),
	('sites.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.handle','\"default\"'),
	('sites.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.hasUrls','true'),
	('sites.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.language','\"en-US\"'),
	('sites.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.name','\"Black Lives Matter in Higher Education\"'),
	('sites.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.primary','true'),
	('sites.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.siteGroup','\"9ce96b15-4ee3-4148-b3ec-8a3ef826b120\"'),
	('sites.54cfc1fa-f6ef-4e85-b5d2-333a954f035c.sortOrder','1'),
	('system.edition','\"solo\"'),
	('system.live','true'),
	('system.name','\"$SYSTEM_NAME\"'),
	('system.schemaVersion','\"3.5.13\"'),
	('system.timeZone','\"America/New_York\"'),
	('users.allowPublicRegistration','false'),
	('users.defaultGroup','null'),
	('users.photoSubpath','\"/user-photos\"'),
	('users.photoVolumeUid','\"7afbbfc1-ad51-49ae-aa35-8833b06027e0\"'),
	('users.requireEmailVerification','true'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.autocapitalize','true'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.autocomplete','false'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.autocorrect','true'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.autofocus','false'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.class','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.disabled','false'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.id','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.instructions','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.label','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.max','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.min','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.name','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.orientation','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.placeholder','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.readonly','false'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.requirable','false'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.required','false'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.size','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.step','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.tip','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.title','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\TitleField\"'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.warning','null'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.elements.0.width','100'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.name','\"Content\"'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.fieldLayouts.0a13f35f-3709-46e8-8b6e-02a43e3e6c54.tabs.0.sortOrder','1'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.handle','\"assets\"'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.hasUrls','true'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.name','\"Assets\"'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.settings.path','\"client-uploads/files\"'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.sortOrder','1'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.type','\"craft\\\\volumes\\\\Local\"'),
	('volumes.7afbbfc1-ad51-49ae-aa35-8833b06027e0.url','\"/client-uploads/files\"');

/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(9,5,29,NULL,28,1,'2021-04-13 21:41:15','2021-04-13 21:41:15','4c3d4c36-c5b7-4ca8-9482-ac8f41b61c15'),
	(10,5,30,NULL,28,1,'2021-04-13 21:41:15','2021-04-13 21:41:15','0400a735-e128-470b-beca-98c035a15273'),
	(16,5,37,NULL,36,1,'2021-04-13 21:49:44','2021-04-13 21:49:44','2a49e88c-68a2-4b15-969d-1c0c6e7dcf9e'),
	(17,5,38,NULL,36,1,'2021-04-13 21:49:44','2021-04-13 21:49:44','c66e05b2-d8be-40a8-b717-1898bf38c4ba'),
	(19,5,41,NULL,40,1,'2021-04-13 21:51:11','2021-04-13 21:51:11','b046b804-4035-4fb9-8f3d-f51875ec0986'),
	(20,5,42,NULL,40,1,'2021-04-13 21:51:11','2021-04-13 21:51:11','59ac1011-76e2-41cb-b51f-15a1d1530e79'),
	(23,5,45,NULL,36,1,'2021-04-20 14:38:26','2021-04-20 14:38:26','ca965ca2-4e80-49eb-9981-7f526a48f680'),
	(24,8,15,NULL,46,1,'2021-04-21 14:42:37','2021-04-21 14:42:37','3afc38b0-71dc-4e1e-8d06-864d2a79d05d'),
	(25,8,17,NULL,47,1,'2021-04-21 14:45:50','2021-04-21 14:45:50','82707845-5d0a-46bc-84a0-35eb5158e19d'),
	(29,8,65,NULL,64,1,'2021-04-21 15:20:10','2021-04-21 15:20:10','b4c68d21-f80f-4a7d-9115-a3cf099787e0'),
	(31,8,72,NULL,71,1,'2021-04-21 15:23:52','2021-04-21 15:23:52','7f4b9e93-681d-4d06-918e-dfd47aaf1f29'),
	(32,8,67,NULL,73,1,'2021-04-21 15:24:08','2021-04-21 15:24:08','64694090-57a8-4852-8386-898636cdaf2c'),
	(33,8,69,NULL,74,1,'2021-04-21 15:24:20','2021-04-21 15:24:20','c0fab1c1-6f4d-46a0-aad0-c0038360283a'),
	(35,8,78,NULL,77,1,'2021-04-21 15:26:04','2021-04-21 15:26:04','aad16f8a-8fd2-4758-8595-047d5b1d14a0'),
	(37,8,81,NULL,80,1,'2021-04-21 15:27:42','2021-04-21 15:27:42','36d9d48d-ca97-43f5-a828-7c3cd39de313'),
	(39,8,84,NULL,83,1,'2021-04-21 15:29:09','2021-04-21 15:29:09','a80f1be5-c312-46f6-b54a-bb8e57b80d1e'),
	(41,8,87,NULL,86,1,'2021-04-21 15:30:28','2021-04-21 15:30:28','fd2a556e-3acb-4179-8ad4-544235da902c'),
	(43,8,90,NULL,89,1,'2021-04-21 15:32:06','2021-04-21 15:32:06','b3bb3f23-fda1-4c7b-8f38-023baab7a2ee'),
	(44,8,49,NULL,91,1,'2021-04-21 15:34:25','2021-04-21 15:34:25','130d8e8d-5d44-44ab-bff1-b6f590738465'),
	(45,8,51,NULL,92,1,'2021-04-21 15:36:15','2021-04-21 15:36:15','3130bb9a-466a-4c7a-86ba-b4e91f91d0cf'),
	(46,8,55,NULL,93,1,'2021-04-21 17:38:24','2021-04-21 17:38:24','34a57246-7226-451b-9a09-2f41fff66a3f'),
	(47,8,57,NULL,94,1,'2021-04-21 17:39:03','2021-04-21 17:39:03','4ee99168-53e2-4181-ba7a-29ffcdc087f6'),
	(48,8,59,NULL,95,1,'2021-04-21 17:40:02','2021-04-21 17:40:02','e1c6c20b-1450-4a00-8e09-7c94805144d7'),
	(49,8,62,NULL,96,1,'2021-04-21 17:43:31','2021-04-21 17:43:31','bb8088c7-87bf-4ca7-aee0-a5bb42df61d4'),
	(50,5,97,NULL,36,1,'2021-04-21 18:17:31','2021-04-21 18:17:31','b15c5b6a-c324-4c60-a432-76809a490290'),
	(51,8,53,NULL,98,1,'2021-04-21 18:36:24','2021-04-21 18:36:24','fae091fe-428c-4f95-950f-7b769d970998'),
	(52,5,99,NULL,36,1,'2021-04-22 22:48:31','2021-04-22 22:48:31','f4d18b55-fb21-43ba-8746-7eb59528dd4a'),
	(53,5,100,NULL,40,1,'2021-04-22 22:49:24','2021-04-22 22:49:24','942a5355-50f9-49cd-a0dc-3bcc3449c973'),
	(54,5,101,NULL,28,1,'2021-07-21 14:18:19','2021-07-21 14:18:19','3748e325-68b6-41b6-8973-da9a7ba1021e'),
	(55,5,105,NULL,40,1,'2021-07-21 15:11:55','2021-07-21 15:11:55','5ad07eb8-d4ce-4390-a863-008e47b09c52'),
	(58,5,111,NULL,109,1,'2021-07-21 16:19:09','2021-07-21 16:19:09','41622fe1-9c0e-4aa9-b253-ab90aa7abfd7'),
	(60,5,113,NULL,112,1,'2021-07-21 16:19:19','2021-07-21 16:19:19','de3c7d28-6000-4a0f-b99c-1053617dc8d7'),
	(61,5,114,NULL,109,1,'2021-07-21 16:26:19','2021-07-21 16:26:19','aa82b9fe-cf35-40ba-bdc6-fc9f2d5b0da2'),
	(63,5,117,NULL,116,1,'2021-07-21 16:43:26','2021-07-21 16:43:26','4375329d-fb56-47c9-b395-b139337ae107'),
	(64,5,118,NULL,116,1,'2021-07-21 16:43:26','2021-07-21 16:43:26','70e9c631-7938-4a0a-a761-3dbd611283ad'),
	(65,5,119,NULL,116,1,'2021-07-21 16:45:03','2021-07-21 16:45:03','39eb2474-3518-4684-9f44-77fa578d1ffb'),
	(67,5,122,NULL,121,1,'2021-07-21 17:07:43','2021-07-21 17:07:43','79eb6f7c-7d05-45ce-a148-8425feb2a910'),
	(68,5,123,NULL,121,1,'2021-07-21 17:07:43','2021-07-21 17:07:43','e14fdeec-1924-4f3d-8fbf-637469c748ae'),
	(69,5,110,NULL,124,1,'2021-08-03 14:06:30','2021-08-03 14:06:30','7b2aa0a6-f13f-41f6-be9a-92277a5af29c'),
	(70,5,125,NULL,124,1,'2021-08-03 14:06:30','2021-08-03 14:06:30','75f13579-52ed-4322-8621-f9f2525836a4'),
	(71,5,103,NULL,126,1,'2021-08-03 14:06:54','2021-08-03 14:06:54','09509aa9-7311-41bb-a91f-72b735730dc5'),
	(72,5,127,NULL,126,1,'2021-08-03 14:06:54','2021-08-03 14:06:54','609f4202-5f0a-4792-a2b2-08aea25eb5da');

/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resourcepaths`;

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;

INSERT INTO `resourcepaths` (`hash`, `path`)
VALUES
	('10ef45b8','@lib/velocity'),
	('14175588','@lib/garnishjs'),
	('160b2c5','@bower/jquery/dist'),
	('16967515','@lib/iframe-resizer'),
	('18d66d06','@craft/redactor/assets/field/dist'),
	('1a354a02','@lib/fileupload'),
	('1b3c5771','@app/web/assets/updater/dist'),
	('1eb8f4a2','@lib/timepicker'),
	('1f3c9a5e','@app/web/assets/sites/dist'),
	('20f6f763','@craft/redactor/assets/redactor-plugins/dist/video'),
	('2147acd7','@lib/xregexp'),
	('222319c','@lib/picturefill'),
	('289e60ad','@app/web/assets/cp/dist'),
	('29e0f586','@lib/velocity'),
	('29f1f3d0','@app/web/assets/dashboard/dist'),
	('2a83a815','@lib/fabric'),
	('2bb5234d','@lib/fileupload'),
	('2ca075d3','@app/web/assets/login/dist'),
	('2cdc6b2f','@lib/jquery.payment'),
	('2dd4bfc','@lib/picturefill'),
	('2ef01930','@lib/element-resize-detector'),
	('33a62d86','@app/web/assets/pluginstore/dist'),
	('340f25ae','@lib/vue'),
	('360c3ca1','@app/web/assets/updates/dist'),
	('3a7abfb6','@craft/redactor/assets/redactor/dist'),
	('3cd2facd','@lib/element-resize-detector'),
	('3f44c703','@lib/vue'),
	('3fc57c2b','@lib/garnishjs'),
	('417f4303','@app/web/assets/edituser/dist'),
	('41e075ab','@app/web/assets/editentry/dist'),
	('42e7b13c','@app/web/assets/utilities/dist'),
	('44f5c3f0','@lib/axios'),
	('463c48b5','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
	('477634f8','@app/web/assets/admintable/dist'),
	('4ae5223c','@app/web/assets/utilities/dist'),
	('4b5f3e98','@app/web/assets/fieldsettings/dist'),
	('4bf7f66d','@app/web/assets/deprecationerrors/dist'),
	('4c824de4','@craft/redactor/assets/field/dist'),
	('4cd335d6','@lib/fabric'),
	('4ee20e3e','@app/web/assets/login/dist'),
	('5370d529','@app/web/assets/dashboard/dist'),
	('54919e54','@lib/axios'),
	('56a36678','@lib/selectize'),
	('5739b2f8','@lib/jquery-ui'),
	('579773e','@lib/jquery-touch-events'),
	('5860d5e','@lib/jquery-touch-events'),
	('5a020035','@craft/redactor/assets/field/dist'),
	('5b3125be','@app/web/assets/utilities/dist'),
	('5ccf22f2','@lib/xregexp'),
	('5e46de1d','@lib/jquery-ui'),
	('628a67e6','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),
	('62ace557','@app/web/assets/fields/dist'),
	('646a7e9a','@lib/selectize'),
	('65eb7822','@app/web/assets/cp/dist'),
	('67bdc427','@lib/fileupload'),
	('694c19e3','@app/web/assets/pluginstore/dist'),
	('6b1efb30','@lib/iframe-resizer'),
	('6b46d665','@app/web/assets/recententries/dist'),
	('70007d7','@lib/prismjs'),
	('77343780','@app/web/assets/admintable/dist'),
	('78a65faf','@app/web/assets/recententries/dist'),
	('7903ab3','@app/web/assets/utilities/dist'),
	('797a3d21','@lib/vue'),
	('7a61126e','@app/web/assets/clearcaches/dist'),
	('7dc9d986','@lib/datepicker-i18n'),
	('7e3092d3','@app/web/assets/routes/dist'),
	('7ed33509','@app/web/assets/pluginstore/dist'),
	('7ff7db7','@lib/prismjs'),
	('81fde20','@bower/jquery/dist'),
	('831d9e32','@app/web/assets/edituser/dist'),
	('836fae13','@lib/d3'),
	('83df2fee','@lib/jquery.payment'),
	('8640f46e','@app/web/assets/editentry/dist'),
	('8730dd26','@app/web/assets/dashboard/dist'),
	('8872c3ef','@app/web/assets/fieldsettings/dist'),
	('8887ff0d','@app/web/assets/utilities/dist'),
	('89dd09ab','@lib/garnishjs'),
	('8a10c2f6','@lib/d3'),
	('8a6eb280','@lib/jquery-touch-events'),
	('8c29bca1','@app/web/assets/cp/dist'),
	('8dca8e42','@lib/picturefill'),
	('8e77777b','@bower/jquery/dist'),
	('932ec46c','@lib/element-resize-detector'),
	('9386dcb','@app/web/assets/admintable/dist'),
	('93e7f622','@app/web/assets/feed/dist'),
	('95228fbc','@lib/fileupload'),
	('9981b0ab','@lib/iframe-resizer'),
	('9a0aef24','@lib/jquery-touch-events'),
	('9b41f58e','@app/web/assets/editentry/dist'),
	('9f07fa66','@lib/velocity'),
	('9fe86dbf','@lib/picturefill'),
	('9ff88006','@lib/velocity'),
	('a08e0095','@lib/iframe-resizer'),
	('a152a7b6','@lib/timepicker'),
	('a1811820','@app/web/assets/fields/dist'),
	('a1e7dc8e','@lib/element-resize-detector'),
	('a5946dab','@lib/fabric'),
	('a60ed5cf','@lib/axios'),
	('a6e6366e','@app/web/assets/dashboard/dist'),
	('a6f7155c','@craft/redactor/assets/redactor/dist'),
	('acd99586','@lib/jquery-ui'),
	('b0d2b995','@lib/garnishjs'),
	('b1e70837','@lib/prismjs'),
	('b3e04194','@app/web/assets/updates/dist'),
	('b556eab1','@app/web/assets/admintable/dist'),
	('b91bf91f','@app/web/assets/updates/dist'),
	('ba21cb5d','@app/web/assets/login/dist'),
	('bc524fe2','@app/web/assets/routes/dist'),
	('bcbe6f99','@bower/jquery/dist'),
	('c59da086','@lib/prismjs'),
	('c786bad','@lib/d3'),
	('c79974be','@app/web/assets/craftsupport/dist'),
	('c8711cd','@lib/d3'),
	('c90bd87f','@app/web/assets/updateswidget/dist'),
	('cc333e46','@lib/timepicker'),
	('cc8ea50','@lib/jquery.payment'),
	('cd5b380f','@craft/redactor/assets/redactor-plugins/dist/video'),
	('cf0e2bac','@craft/redactor/assets/redactor/dist'),
	('d1340292','@app/web/assets/deprecationerrors/dist'),
	('d1511ba3','@lib/jquery-ui'),
	('d3d8e74c','@lib/xregexp'),
	('d4f4a824','@lib/iframe-resizer'),
	('d95e8a40','@app/web/assets/updater/dist'),
	('d9b4a3c6','@lib/selectize'),
	('db865bea','@lib/axios'),
	('ddafb46e','@app/web/assets/generalsettings/dist'),
	('df0371f3','@app/web/assets/cp/dist'),
	('e0bb13f8','@lib/selectize'),
	('e186f97b','@app/web/assets/fields/dist'),
	('e3aa9789','@lib/fabric'),
	('e3f04135','@app/web/assets/fieldsettings/dist'),
	('e42d7b7d','@app/web/assets/plugins/dist'),
	('e74c908a','@lib/jquery.payment'),
	('ea0f3ce4','@app/web/assets/deprecationerrors/dist'),
	('eafcbd9c','@app/web/assets/cp/dist'),
	('eb932ee1','@app/web/assets/dashboard/dist'),
	('ee12b045','@app/web/assets/editsection/dist'),
	('eec2a8e2','@app/web/assets/login/dist'),
	('f1c4f0b7','@app/web/assets/pluginstore/dist'),
	('f3cc6633','@lib/xregexp'),
	('f4ca341f','@app/web/assets/recententries/dist'),
	('f66df89f','@lib/vue'),
	('f69282ff','@lib/vue'),
	('f7b19a11','@app/web/assets/recententries/dist'),
	('f823f23e','@app/web/assets/admintable/dist'),
	('fda7a11a','@lib/garnishjs');

/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`)
VALUES
	(7,29,1,1,NULL),
	(11,37,1,1,NULL),
	(12,41,1,1,NULL),
	(15,37,1,2,''),
	(16,37,1,3,''),
	(17,37,1,4,''),
	(18,41,1,2,''),
	(19,29,1,2,''),
	(20,103,1,1,NULL),
	(21,41,1,3,''),
	(22,103,1,2,''),
	(23,103,1,3,''),
	(24,110,1,1,NULL),
	(25,103,1,4,''),
	(26,110,1,2,''),
	(27,117,1,1,NULL),
	(28,117,1,2,''),
	(29,122,1,1,NULL),
	(30,110,1,3,''),
	(31,103,1,5,'');

/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'username',0,1,' blm '),
	(1,'firstname',0,1,' black lives '),
	(1,'lastname',0,1,' matter '),
	(1,'fullname',0,1,' black lives matter '),
	(1,'slug',0,1,''),
	(1,'email',0,1,' perry perrygarvinstudio com '),
	(7,'slug',0,1,''),
	(15,'title',0,1,' blmhe kick off event '),
	(16,'filename',0,1,' test png '),
	(16,'extension',0,1,' png '),
	(16,'kind',0,1,' image '),
	(16,'slug',0,1,''),
	(16,'title',0,1,' test '),
	(17,'slug',0,1,' test timeline entry '),
	(17,'title',0,1,' blm movement begins '),
	(19,'filename',0,1,' sample pdf '),
	(19,'extension',0,1,' pdf '),
	(19,'kind',0,1,' pdf '),
	(19,'slug',0,1,''),
	(19,'title',0,1,' sample '),
	(24,'filename',0,1,' sample pdf '),
	(24,'extension',0,1,' pdf '),
	(24,'kind',0,1,' pdf '),
	(24,'slug',0,1,''),
	(24,'title',0,1,' sample '),
	(25,'filename',0,1,' hpse allen pdf '),
	(25,'extension',0,1,' pdf '),
	(25,'kind',0,1,' pdf '),
	(25,'slug',0,1,''),
	(25,'title',0,1,' hpse allen '),
	(28,'filename',0,1,' hpse mcneil pdf '),
	(28,'extension',0,1,' pdf '),
	(28,'kind',0,1,' pdf '),
	(28,'slug',0,1,''),
	(28,'title',0,1,' hpse mc neil '),
	(29,'title',0,1,' interview with charlen mcneill '),
	(29,'slug',0,1,' interview with charlen mcneill '),
	(36,'filename',0,1,' hpse stephens pdf '),
	(36,'extension',0,1,' pdf '),
	(36,'kind',0,1,' pdf '),
	(36,'slug',0,1,''),
	(36,'title',0,1,' hpse stephens '),
	(37,'title',0,1,' interview with kat stephens '),
	(40,'filename',0,1,' hpse allen pdf '),
	(40,'extension',0,1,' pdf '),
	(40,'kind',0,1,' pdf '),
	(40,'slug',0,1,''),
	(40,'title',0,1,' hpse allen '),
	(41,'slug',0,1,' interview with brian allen '),
	(41,'title',0,1,' interview with brian allen '),
	(46,'filename',0,1,' screen shot 2021 04 21 at 10 42 07 am png '),
	(46,'extension',0,1,' png '),
	(46,'kind',0,1,' image '),
	(46,'slug',0,1,''),
	(46,'title',0,1,' screen shot 2021 04 21 at 10 42 07 am '),
	(47,'filename',0,1,' screen shot 2021 04 21 at 10 45 35 am png '),
	(47,'extension',0,1,' png '),
	(47,'kind',0,1,' image '),
	(47,'slug',0,1,''),
	(47,'title',0,1,' screen shot 2021 04 21 at 10 45 35 am '),
	(15,'slug',0,1,' test timeline entry '),
	(49,'title',0,1,' deaths of walter scott freddie gray and meagan hockaday black trans lives matter '),
	(49,'slug',0,1,' deaths of walter scott freddie gray and meagan hockaday black trans lives matter '),
	(51,'title',0,1,' deaths of danner and sterling kaepernick protest '),
	(51,'slug',0,1,' deaths of danner and sterling kaepernick protest '),
	(53,'title',0,1,' first blm art exhibit castile court ruling and protest unite the right rally '),
	(53,'slug',0,1,' first blm art exhibit castile court ruling and protest unite the right rally '),
	(55,'title',0,1,' abc news interview blacklivesmatter deaths of mack and ross jr '),
	(55,'slug',0,1,' abc news interview blacklivesmatter deaths of mack and ross jr '),
	(57,'title',0,1,' 21 savage arrest death of isaiah lewis '),
	(57,'slug',0,1,' 21 savage arrest death of isaiah lewis '),
	(59,'title',0,1,' death of george floyd global protests biden elected '),
	(61,'filename',0,1,' screen shot 2021 04 21 at 10 57 54 am png '),
	(61,'extension',0,1,' png '),
	(61,'kind',0,1,' image '),
	(61,'slug',0,1,''),
	(61,'title',0,1,' screen shot 2021 04 21 at 10 57 54 am '),
	(62,'title',0,1,' blm nominated for nobel peace prize chauvin guilty of murder in floyds death '),
	(64,'filename',0,1,' screen shot 2021 04 21 at 11 19 19 am png '),
	(64,'extension',0,1,' png '),
	(64,'kind',0,1,' image '),
	(64,'slug',0,1,''),
	(64,'title',0,1,' screen shot 2021 04 21 at 11 19 19 am '),
	(65,'title',0,1,' mental health and wellness in the blm movement '),
	(65,'slug',0,1,' mental health and wellness in the blm movement '),
	(67,'slug',0,1,' reckoning with the past columbia university slavery and black lives matter '),
	(67,'title',0,1,' reckoning with the past columbia university slavery and black lives matter '),
	(69,'title',0,1,' examining the movement student activism and blm in theory and practice '),
	(69,'slug',0,1,' examining the movement student activism and blm in theory and practice '),
	(71,'filename',0,1,' screen shot 2021 04 21 at 11 23 29 am png '),
	(71,'extension',0,1,' png '),
	(71,'kind',0,1,' image '),
	(71,'slug',0,1,''),
	(71,'title',0,1,' screen shot 2021 04 21 at 11 23 29 am '),
	(72,'title',0,1,' fall 2017 kick off informational '),
	(72,'slug',0,1,' fall 2017 kick off informational '),
	(73,'filename',0,1,' screen shot 2021 04 21 at 11 22 49 am png '),
	(73,'extension',0,1,' png '),
	(73,'kind',0,1,' image '),
	(73,'slug',0,1,''),
	(73,'title',0,1,' screen shot 2021 04 21 at 11 22 49 am '),
	(74,'filename',0,1,' screen shot 2021 04 21 at 11 23 07 am png '),
	(74,'extension',0,1,' png '),
	(74,'kind',0,1,' image '),
	(74,'slug',0,1,''),
	(74,'title',0,1,' screen shot 2021 04 21 at 11 23 07 am '),
	(77,'filename',0,1,' screen shot 2021 04 21 at 11 25 48 am png '),
	(77,'extension',0,1,' png '),
	(77,'kind',0,1,' image '),
	(77,'slug',0,1,''),
	(77,'title',0,1,' screen shot 2021 04 21 at 11 25 48 am '),
	(78,'slug',0,1,' all black lives matter '),
	(78,'title',0,1,' all black lives matter '),
	(80,'filename',0,1,' screen shot 2021 04 21 at 11 27 21 am png '),
	(80,'extension',0,1,' png '),
	(80,'kind',0,1,' image '),
	(80,'slug',0,1,''),
	(80,'title',0,1,' screen shot 2021 04 21 at 11 27 21 am '),
	(81,'slug',0,1,' whose speech is free speech '),
	(81,'title',0,1,' whose speech is free speech '),
	(83,'filename',0,1,' screen shot 2021 04 21 at 11 28 22 am png '),
	(83,'extension',0,1,' png '),
	(83,'kind',0,1,' image '),
	(83,'slug',0,1,''),
	(83,'title',0,1,' screen shot 2021 04 21 at 11 28 22 am '),
	(84,'slug',0,1,' women of wakanda parallels of strength and innovation to women in the academy '),
	(84,'title',0,1,' women of wakanda parallels of strength and innovation to women in the academy '),
	(86,'filename',0,1,' screen shot 2021 04 21 at 11 30 10 am png '),
	(86,'extension',0,1,' png '),
	(86,'kind',0,1,' image '),
	(86,'slug',0,1,''),
	(86,'title',0,1,' screen shot 2021 04 21 at 11 30 10 am '),
	(87,'slug',0,1,' days of resistance blmhe oral history exhibit opening '),
	(87,'title',0,1,' days of resistance blmhe oral history exhibit opening '),
	(89,'filename',0,1,' screen shot 2021 04 21 at 11 30 55 am png '),
	(89,'extension',0,1,' png '),
	(89,'kind',0,1,' image '),
	(89,'slug',0,1,''),
	(89,'title',0,1,' screen shot 2021 04 21 at 11 30 55 am '),
	(90,'slug',0,1,' imposter syndrome open dialogue '),
	(90,'title',0,1,' imposter syndrome open dialogue '),
	(91,'filename',0,1,' screen shot 2021 04 21 at 11 33 24 am png '),
	(91,'extension',0,1,' png '),
	(91,'kind',0,1,' image '),
	(91,'slug',0,1,''),
	(91,'title',0,1,' screen shot 2021 04 21 at 11 33 24 am '),
	(92,'filename',0,1,' screen shot 2021 04 21 at 11 35 54 am png '),
	(92,'extension',0,1,' png '),
	(92,'kind',0,1,' image '),
	(92,'slug',0,1,''),
	(92,'title',0,1,' screen shot 2021 04 21 at 11 35 54 am '),
	(93,'filename',0,1,' screen shot 2021 04 21 at 1 37 38 pm png '),
	(93,'extension',0,1,' png '),
	(93,'kind',0,1,' image '),
	(93,'slug',0,1,''),
	(93,'title',0,1,' screen shot 2021 04 21 at 1 37 38 pm '),
	(94,'filename',0,1,' screen shot 2021 04 21 at 1 38 48 pm png '),
	(94,'extension',0,1,' png '),
	(94,'kind',0,1,' image '),
	(94,'slug',0,1,''),
	(94,'title',0,1,' screen shot 2021 04 21 at 1 38 48 pm '),
	(95,'filename',0,1,' screen shot 2021 04 21 at 1 37 38 pm 2021 04 21 173955 png '),
	(95,'extension',0,1,' png '),
	(95,'kind',0,1,' image '),
	(95,'slug',0,1,''),
	(95,'title',0,1,' screen shot 2021 04 21 at 1 37 38 pm '),
	(59,'slug',0,1,' death of george floyd global protests '),
	(96,'filename',0,1,' screen shot 2021 04 21 at 1 37 38 pm 2021 04 21 174256 png '),
	(96,'extension',0,1,' png '),
	(96,'kind',0,1,' image '),
	(96,'slug',0,1,''),
	(96,'title',0,1,' screen shot 2021 04 21 at 1 37 38 pm '),
	(62,'slug',0,1,' chauvin guilty of murder in floyds death '),
	(37,'slug',0,1,' interview with kat stephens '),
	(98,'filename',0,1,' screen shot 2021 04 21 at 2 36 07 pm png '),
	(98,'extension',0,1,' png '),
	(98,'kind',0,1,' image '),
	(98,'slug',0,1,''),
	(98,'title',0,1,' screen shot 2021 04 21 at 2 36 07 pm '),
	(103,'slug',0,1,' interview with ashley ogwo part 1 '),
	(103,'title',0,1,' interview with ashley ogwo part 1 '),
	(109,'filename',0,1,' hpse ogwo pt2 docx pdf '),
	(109,'extension',0,1,' pdf '),
	(109,'kind',0,1,' pdf '),
	(109,'slug',0,1,''),
	(109,'title',0,1,' hpse ogwo pt2 docx '),
	(110,'slug',0,1,' interview with ashley ogwo part 2 '),
	(110,'title',0,1,' interview with ashley ogwo part 2 '),
	(112,'filename',0,1,' hpse ogwo pt 1 docx pdf '),
	(112,'extension',0,1,' pdf '),
	(112,'kind',0,1,' pdf '),
	(112,'slug',0,1,''),
	(112,'title',0,1,' hpse ogwo pt 1 docx '),
	(116,'filename',0,1,' hpse willis docx pdf '),
	(116,'extension',0,1,' pdf '),
	(116,'kind',0,1,' pdf '),
	(116,'slug',0,1,''),
	(116,'title',0,1,' hpse willis docx '),
	(117,'title',0,1,' interview with jenay willis '),
	(117,'slug',0,1,' interview with jenay willis '),
	(121,'filename',0,1,' hpse campbell docx pdf '),
	(121,'extension',0,1,' pdf '),
	(121,'kind',0,1,' pdf '),
	(121,'slug',0,1,''),
	(121,'title',0,1,' hpse campbell docx '),
	(122,'slug',0,1,' interview with dr corbin campbell '),
	(122,'title',0,1,' interview with dr corbin campbell '),
	(124,'filename',0,1,' hpse ogwo pt2 ao 1 pdf '),
	(124,'extension',0,1,' pdf '),
	(124,'kind',0,1,' pdf '),
	(124,'slug',0,1,''),
	(124,'title',0,1,' hpse ogwo pt2 ao 1 '),
	(126,'filename',0,1,' hpse ogwo pt 1 ao pdf '),
	(126,'extension',0,1,' pdf '),
	(126,'kind',0,1,' pdf '),
	(126,'slug',0,1,''),
	(126,'title',0,1,' hpse ogwo pt 1 ao ');

/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,'Interview','interview','structure',1,'all',NULL,'2021-01-13 15:33:50','2021-01-13 15:33:50',NULL,'ff48fc6a-8822-48fe-be61-52c2a6202be4'),
	(2,NULL,'Timeline Entry','timelineEntry','channel',0,'all',NULL,'2021-01-13 15:48:53','2021-01-13 15:48:53',NULL,'9795823c-2974-45f0-9621-f40407319855');

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_sites`;

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,0,NULL,NULL,1,'2021-01-13 15:33:50','2021-01-13 15:33:50','d17ce67e-5498-45fd-a591-99da1b97eb21'),
	(2,2,1,0,NULL,NULL,1,'2021-01-13 15:48:53','2021-01-13 15:48:53','5e7f467c-6dab-44e9-87ea-72fde7a67259');

/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shunnedmessages`;

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitegroups`;

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Black Lives Matter in Higher Education','2020-08-18 13:00:37','2020-08-18 13:00:37',NULL,'9ce96b15-4ee3-4148-b3ec-8a3ef826b120');

/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,1,'Black Lives Matter in Higher Education','default','en-US',1,'$PRIMARY_SITE_URL',1,'2020-08-18 13:00:37','2020-08-18 13:00:37',NULL,'54cfc1fa-f6ef-4e85-b5d2-333a954f035c');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structureelements`;

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,1,78,0,'2021-01-13 15:36:37','2021-08-03 14:06:54','7c0b9069-71bb-4953-96d0-cce4e64ec0a0'),
	(14,1,29,1,18,19,1,'2021-04-13 21:41:15','2021-04-13 21:52:00','25a7097c-eea8-477a-9b53-d94213024e7c'),
	(15,1,30,1,22,23,1,'2021-04-13 21:41:15','2021-07-21 14:18:19','f36e8388-9746-4d61-8c45-7c8614d8baa2'),
	(21,1,37,1,30,31,1,'2021-04-13 21:49:44','2021-07-21 14:18:19','74077182-7a92-4e44-aea0-7f2140602d27'),
	(22,1,38,1,38,39,1,'2021-04-13 21:49:44','2021-07-21 14:18:19','657e43aa-8db2-4985-a1ae-02e8244d4f4b'),
	(24,1,41,1,40,41,1,'2021-04-13 21:51:11','2021-07-21 14:18:19','b4efd3ec-c84b-402c-a42f-43e3e601d3ea'),
	(25,1,42,1,46,47,1,'2021-04-13 21:51:11','2021-07-21 15:11:55','091e47e4-2eec-40c7-afa5-5067b92b1406'),
	(28,1,45,1,36,37,1,'2021-04-20 14:38:26','2021-07-21 14:18:19','9a5e8696-1cce-4a21-b5f6-9bb10803b9b6'),
	(29,1,97,1,34,35,1,'2021-04-21 18:17:31','2021-07-21 14:18:19','cb5c0b70-2f72-494a-b6ed-4fe69b8692b0'),
	(30,1,99,1,32,33,1,'2021-04-22 22:48:31','2021-07-21 14:18:19','ae741a9f-12ef-44a9-822a-e422b659483c'),
	(31,1,100,1,44,45,1,'2021-04-22 22:49:24','2021-07-21 15:11:55','7b10eff1-ff94-4149-a563-305504b9eb37'),
	(32,1,101,1,20,21,1,'2021-07-21 14:18:19','2021-07-21 14:18:19','f25fe78a-7dc5-4730-ab10-ee8515ea9aab'),
	(34,1,103,1,48,49,1,'2021-07-21 14:21:22','2021-07-21 15:11:55','6bfba9d1-31e9-4dd0-a716-1a9543836cb8'),
	(35,1,104,1,58,59,1,'2021-07-21 14:21:22','2021-08-03 14:06:54','c6b05e22-af2a-4bf6-9b70-3cf276595795'),
	(36,1,105,1,42,43,1,'2021-07-21 15:11:55','2021-07-21 15:11:55','c25a2aea-07e3-47c6-b81d-b919dd410f2f'),
	(37,1,106,1,56,57,1,'2021-07-21 15:49:02','2021-08-03 14:06:54','aeacd8a6-b5c0-45ee-ab28-e8742d989f4d'),
	(38,1,107,1,54,55,1,'2021-07-21 15:50:40','2021-08-03 14:06:54','2cfd774b-3163-403a-9c6b-9dd6987f3773'),
	(40,1,110,1,60,61,1,'2021-07-21 16:19:09','2021-08-03 14:06:54','0a1868d2-4947-4075-a636-c635783907f9'),
	(41,1,111,1,66,67,1,'2021-07-21 16:19:09','2021-08-03 14:06:54','a1e6168c-be50-4c55-84a4-60b27b22db1a'),
	(42,1,113,1,52,53,1,'2021-07-21 16:19:19','2021-08-03 14:06:54','cef60b9a-59ef-493f-a45b-228b3d56c927'),
	(43,1,114,1,64,65,1,'2021-07-21 16:26:19','2021-08-03 14:06:54','9ef6cdd5-abc7-4d15-83b7-ade21df68c68'),
	(45,1,117,1,68,69,1,'2021-07-21 16:43:26','2021-08-03 14:06:54','03b74f2c-a3eb-499f-84e7-a8a26aa00ba5'),
	(46,1,118,1,72,73,1,'2021-07-21 16:43:26','2021-08-03 14:06:54','492ffd4a-1955-465d-bebb-c15684c1e76d'),
	(47,1,119,1,70,71,1,'2021-07-21 16:45:03','2021-08-03 14:06:54','efeefcd8-21d1-4fbc-abf3-67bc7b0ad0c2'),
	(49,1,122,1,74,75,1,'2021-07-21 17:07:43','2021-08-03 14:06:54','72c45f5b-878b-42b2-b82b-5f134db8e8a5'),
	(50,1,123,1,76,77,1,'2021-07-21 17:07:43','2021-08-03 14:06:54','0d3f85b2-23ba-46be-95ef-f53795bfbe71'),
	(51,1,125,1,62,63,1,'2021-08-03 14:06:30','2021-08-03 14:06:54','00caffb5-422d-4460-8a82-655aac7b1cac'),
	(52,1,127,1,50,51,1,'2021-08-03 14:06:54','2021-08-03 14:06:54','9792b364-9291-45e7-bd5b-ad65e048eac1');

/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'2021-01-13 15:33:50','2021-01-13 15:33:50',NULL,'393fc514-b1e2-4131-849e-bd33c24d10e5');

/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `systemmessages`;

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggroups`;

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecacheelements`;

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecachequeries`;

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecaches`;

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups`;

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usergroups_handle_idx` (`handle`),
  KEY `usergroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups_users`;

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions`;

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_usergroups`;

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_users`;

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpreferences`;

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;

INSERT INTO `userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":true,\"enableDebugToolbarForSite\":true,\"enableDebugToolbarForCp\":true,\"showExceptionView\":true,\"profileTemplates\":true}');

/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'blm',NULL,'Black Lives','Matter','perry@perrygarvinstudio.com','$2y$13$vOLnghrUUT5IxNexyaTgle5do8rk1uLwlHc5qDDhf1I.7fkatqqy.',1,0,0,0,'2022-05-06 16:44:25',NULL,NULL,NULL,'2021-04-13 19:19:30',NULL,1,NULL,NULL,NULL,0,'2021-01-18 13:27:08','2020-08-18 13:00:39','2022-05-06 16:44:25','462b91c2-fd11-4068-9f46-47612d7781eb');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumefolders`;

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Assets','','2020-08-18 15:17:52','2020-08-18 15:29:48','118fbc73-508f-458a-aef9-5ce7786031d0'),
	(2,NULL,NULL,'Temporary source',NULL,'2020-08-18 15:28:16','2020-08-18 15:28:16','62c3b921-c410-479e-8582-aba9054bf7b3'),
	(3,2,NULL,'user_1','user_1/','2020-08-18 15:28:16','2020-08-18 15:28:16','a4704e52-bb6c-46f2-8494-70d6c23d2b42'),
	(7,1,1,'Images','Images/','2020-08-18 17:42:31','2020-08-18 17:42:31','b6499c8d-ad83-4d8f-b41a-863295123839'),
	(8,1,1,'Files','Files/','2020-08-18 17:42:36','2020-08-18 17:42:36','55b4ad26-be33-46a4-8773-0c1ebfaece7e');

/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumes`;

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,'Assets','assets','craft\\volumes\\Local',1,'/client-uploads/files','{\"path\":\"client-uploads/files\"}',1,'2020-08-18 15:17:52','2020-08-18 17:41:56',NULL,'7afbbfc1-ad51-49ae-aa35-8833b06027e0');

/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widgets`;

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2020-08-18 13:00:41','2020-08-18 13:00:41','dd74bb54-5b99-4556-a342-e0d576282f9f');

/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
