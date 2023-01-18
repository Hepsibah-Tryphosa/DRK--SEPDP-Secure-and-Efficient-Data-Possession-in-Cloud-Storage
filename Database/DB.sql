/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.16-nt : Database - sepdp
*********************************************************************
Server version : 5.0.16-nt
*/


create database if not exists `sepdp`;

USE `sepdp`;

/*Table structure for table `downloads` */

DROP TABLE IF EXISTS `downloads`;

CREATE TABLE `downloads` (
  `id` int(11) NOT NULL auto_increment,
  `downloadedUser` varchar(50) NOT NULL,
  `file_ID` varchar(50) NOT NULL,
  `fileName` varchar(50) NOT NULL,
  `oname` varchar(50) NOT NULL,
  `sqlDate` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `downloads` */

/*Table structure for table `filedetails` */

DROP TABLE IF EXISTS `filedetails`;

CREATE TABLE `filedetails` (
  `fid` int(30) NOT NULL auto_increment,
  `ownername` varchar(30) default NULL,
  `fname` varchar(30) NOT NULL,
  `file` longblob,
  `encstr` longblob,
  `secretkey` varchar(30) NOT NULL,
  `abfile` varbinary(50) default NULL,
  `publickey` varchar(30) NOT NULL,
  `hkeystatus` varchar(30) default NULL,
  `hashkey` varchar(30) default NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `filedetails` */

insert into `filedetails` values 
(1,'Harish','mails.txt','rameshshaik35\r\nravindranarayn\r\nanuhya.yellabarthi\r\nravina.8523\r\nrajinikanth.yerra\r\nsamhith.kanchi\r\ngrande.balram\r\nmounikaswarrop\r\nakshara.garikapati\r\npayalnandhini5','qHbZbc6zH8AcKuVMM4e0Z07tA3O2ZlEj0/y7p3/1w86K3Z67DpksjBu5irgKKc5QIEL5TLk50GfX1ddKhDs+AEUNSyWZallZvvfN7wxY76xCocUBLsci+c1mzcd/+FqiS3XEB1hZcD9S0HIQ0sNcmBOV1eoQNwSpbJnwOg2ZR07vlw6C5enjKhWpXR3Lq3TQN/9+Oh+TzPFUIfvMdQ/l3A==','5085340','Harish mail file','9910305','yes','0420304'),
(2,'sai','bittu.java','class S\r\n{\r\npublic static void main(String[] args)\r\n{\r\nSystem.out.println(\"helo\");\r\n}\r\n}','km5jncEOs1pnf4OGK8BGM6Su4/6jTGjrhAL+TlH48hj0ofJx7KeI0ESh4qelNqhOwlqjbHnn+u9rLWfetlK7l/uPTv404+cHxQgQaKya5+tJOi0ibkTiaQ==','9941359','this fiole is very dangerous dont open','4931862','yes','8785149'),
(3,'sai','dggxg.txt','  String hashkey = null;\r\n    Random RANDOM = new SecureRandom();\r\n    int mac1_LENGTH = 7;\r\n    String letters = \"0123456789\";\r\n    String uid = \"\";\r\n    for (int i = 0; i < mac1_LENGTH; i++) {\r\n        int index = (int) (RANDOM.nextDouble() * letters.length());\r\n        uid += letters.substring(index, index + 1);\r\n    }\r\n  hashkey=uid;\r\n\r\nps.setString(7, publickey);','8+o6X59O0LsaPlkeWHxqu/nqFtuIk+tkWfWOEcYddrMG+Y+kG6Crak1RrAoXlBzf93Nh0Ee6L6cmZ7+g7HOHgoFEYcdSsKtgYKYu07wn31C+MeyN1IBOYkMMTwMzDeobri4+0VzpifTbwOFV3i4KkWqzTMg5gIMLFny/nlioPxaAGwpZBWONxI7DgGyUOXYudTdMfxOB7kV1zn0glR0unGydxtIopRzlvxjQ2CbUaMHIg18kPaBBmKRObghQ7WYayQQynA3hT5Oa1i0uUrC3hddgn/zrIWsMNfMGFBP27DJ44K0jbF8y0Sy5X+IHzxADaEKk560mFsZ1vsDj/aZN/RlrMDBzF7Tn2PWCLwng+C27NUNujtK/1w4EuZ1DlkdgK5ELjojSGQQZ15EVjvlH7/lKMHYXdmBttkuMcjXN7n/8cLz55haStleqdJKLcrZZOUgdi/14wj/GyU6gALQ8u4Ptg66jBQ3SiSUqUJfX1CY=','9173211','484545','4931862','yes','0981570');

/*Table structure for table `ownerreg` */

DROP TABLE IF EXISTS `ownerreg`;

CREATE TABLE `ownerreg` (
  `ownerId` bigint(10) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `password` varchar(100) default NULL,
  `repassword` varchar(100) default NULL,
  `mobile` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `address` varchar(100) default NULL,
  `publickey` varchar(100) default NULL,
  `secretkey` varchar(100) default NULL,
  PRIMARY KEY  (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ownerreg` */

insert into `ownerreg` values 
(1,'Harish','ram@508','ram@508','8019949556','gangisettyharish@gmail.com','Markapur','9910305',NULL),
(2,'sai','sai','sai','8885697874','prathap1.datapoint@gmail.com','2-140,yousufguda checkpost','4931862',NULL);

/*Table structure for table `userdetails` */

DROP TABLE IF EXISTS `userdetails`;

CREATE TABLE `userdetails` (
  `uid` bigint(10) NOT NULL auto_increment,
  `uname` varchar(300) default NULL,
  `uemail` varchar(300) NOT NULL,
  `umobile` varchar(100) default NULL,
  `upassword` varchar(100) default NULL,
  `urepassword` varchar(100) default NULL,
  `uaddress` varchar(100) default NULL,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `uemail` (`uemail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userdetails` */

insert into `userdetails` values 
(1,'ram','harish9.datapoint@gmail.com','9182345426','ram@5081','ram@5081','Markapur'),
(2,'sai','prathap1.datapoint@gmail.com','8885697874','sai','sai','2-140,yousufguda checkpost');

/*Table structure for table `userreq` */

DROP TABLE IF EXISTS `userreq`;

CREATE TABLE `userreq` (
  `fid` varchar(50) default NULL,
  `filename` varchar(50) default NULL,
  `hashkey` varchar(50) default NULL,
  `uemail` varchar(50) default NULL,
  `publickey` varchar(50) default NULL,
  `secretkey` varchar(50) default NULL,
  `ownername` varchar(50) default NULL,
  `tpaStatus` varchar(50) default NULL,
  `ownerstaus` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userreq` */

insert into `userreq` values 
('1','mails.txt','0420304','harish9.datapoint@gmail.com','9910305','5085340','Harish','yes','yes'),
('1','mails.txt','0420304','harish9.datapoint@gmail.com','9910305','5085340','Harish','yes','yes'),
('3','dggxg.txt','0981570','prathap1.datapoint@gmail.com','4931862','9173211','sai','yes','yes');
