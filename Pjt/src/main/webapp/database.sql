--유저 테이블
CREATE TABLE `user` (
   `number` INT(11) NOT NULL AUTO_INCREMENT,
   `email` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
   `name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
   `pwd` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
   `nickname` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
   PRIMARY KEY (`number`) USING BTREE,
   UNIQUE INDEX `nickname` (`nickname`) USING BTREE,
   UNIQUE INDEX `email` (`email`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=9
;

--커뮤니티 테이블
CREATE TABLE `com_board` (
   `number` INT(10) NOT NULL AUTO_INCREMENT,
   `title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `reply_cnt` INT(11) NULL DEFAULT NULL,
   `writer` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `content` VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `view_cnt` INT(11) NOT NULL DEFAULT '0',
   `like` INT(10) NOT NULL DEFAULT '0',
   `regdate` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`number`) USING BTREE,
   INDEX `writer` (`writer`) USING BTREE,
   CONSTRAINT `` FOREIGN KEY (`writer`) REFERENCES `jsppjt`.`user` (`nickname`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=12
;

--커뮤니티 댓글 테이블
CREATE TABLE `com_reply` (
   `number` INT(11) NOT NULL AUTO_INCREMENT,
   `board_num` INT(11) NULL DEFAULT NULL,
   `writer` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `content` VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `like` INT(10) NULL DEFAULT NULL,
   `regdate` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`number`) USING BTREE,
   INDEX `FK_knowledge_reply_knowledge_board` (`board_num`) USING BTREE,
   INDEX `FK_com_reply_user` (`writer`) USING BTREE,
   CONSTRAINT `FK_com_reply_com_board` FOREIGN KEY (`board_num`) REFERENCES `jsppjt`.`com_board` (`number`) ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT `FK_com_reply_user` FOREIGN KEY (`writer`) REFERENCES `jsppjt`.`user` (`nickname`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=22
;

--지식 테이블
CREATE TABLE `knowledge_board` (
   `number` INT(10) NOT NULL AUTO_INCREMENT,
   `title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `reply_cnt` INT(11) UNSIGNED NULL DEFAULT '0',
   `writer` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `content` VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `view_cnt` INT(11) NULL DEFAULT '0',
   `like` INT(10) NOT NULL DEFAULT '0',
   `regdate` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`number`) USING BTREE,
   INDEX `user_nickname` (`writer`) USING BTREE,
   CONSTRAINT `user_nickname` FOREIGN KEY (`writer`) REFERENCES `jsppjt`.`user` (`nickname`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=11
;

--지식 댓글 테이블
CREATE TABLE `knowledge_reply` (
   `number` INT(11) NOT NULL AUTO_INCREMENT,
   `board_num` INT(11) NULL DEFAULT NULL,
   `writer` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `content` VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `like` INT(10) NULL DEFAULT NULL,
   `regdate` TIMESTAMP NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`number`) USING BTREE,
   INDEX `FK_knowledge_reply_knowledge_board` (`board_num`) USING BTREE,
   INDEX `FK_knowledge_reply_user` (`writer`) USING BTREE,
   CONSTRAINT `FK_knowledge_reply_knowledge_board` FOREIGN KEY (`board_num`) REFERENCES `jsppjt`.`knowledge_board` (`number`) ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT `FK_knowledge_reply_user` FOREIGN KEY (`writer`) REFERENCES `jsppjt`.`user` (`nickname`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=7
;

--질문 테이블
CREATE TABLE `qa_board` (
   `number` INT(10) NOT NULL AUTO_INCREMENT,
   `title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `reply_cnt` INT(11) NULL DEFAULT '0',
   `writer` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `content` VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `view_cnt` INT(11) NULL DEFAULT '0',
   `like` INT(10) NULL DEFAULT '0',
   `regdate` TIMESTAMP NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   PRIMARY KEY (`number`) USING BTREE,
   INDEX `user_nickname` (`writer`) USING BTREE,
   CONSTRAINT `nickname` FOREIGN KEY (`writer`) REFERENCES `jsppjt`.`user` (`nickname`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=4
;

--답변 테이블
CREATE TABLE `qa_reply` (
   `number` INT(11) NOT NULL AUTO_INCREMENT,
   `board_num` INT(11) NULL DEFAULT NULL,
   `writer` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `content` VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
   `like` INT(10) NULL DEFAULT NULL,
   `regdate` TIMESTAMP NULL DEFAULT current_timestamp(),
   PRIMARY KEY (`number`) USING BTREE,
   INDEX `FK_knowledge_reply_knowledge_board` (`board_num`) USING BTREE,
   INDEX `FK_qa_reply_user` (`writer`) USING BTREE,
   CONSTRAINT `FK_qa_reply_qa_board` FOREIGN KEY (`board_num`) REFERENCES `jsppjt`.`qa_board` (`number`) ON UPDATE NO ACTION ON DELETE NO ACTION,
   CONSTRAINT `FK_qa_reply_user` FOREIGN KEY (`writer`) REFERENCES `jsppjt`.`user` (`nickname`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=6
;

