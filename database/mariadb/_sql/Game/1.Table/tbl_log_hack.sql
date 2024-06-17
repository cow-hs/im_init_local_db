# modified tbl_log_hack.sql
USE game;
DROP TABLE IF EXISTS `tbl_log_hack`;
CREATE TABLE IF NOT EXISTS `tbl_log_hack` (
    `Idx` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `AccountId` BIGINT(20) NOT NULL,
    `CharacterId` BIGINT(20) NOT NULL,
    `NickName` VARCHAR(48) NOT NULL COLLATE 'utf8mb4_general_ci',
    `Reason` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
    `RegisterTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`Idx`) USING BTREE,
    INDEX `ix_tbl_log_hack_AccountId` (`AccountId`),
    INDEX `ix_tbl_log_hack_CharacterId` (`CharacterId`),
    FULLTEXT INDEX `ft_idx_tbl_log_hack_Reason` (`Reason`),
    INDEX `ix_tbl_log_hack_RegisterTime` (`RegisterTime`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;
DROP INDEX IF EXISTS `ix_tbl_log_hack_AccountId` ON tbl_log_hack;
CREATE INDEX `ix_tbl_log_hack_AccountId` ON tbl_log_hack(AccountId);
DROP INDEX IF EXISTS `ix_tbl_log_hack_CharacterId` ON tbl_log_hack;
CREATE INDEX `ix_tbl_log_hack_CharacterId` ON tbl_log_hack(CharacterId);
ALTER TABLE tbl_log_hack ADD FULLTEXT (Reason);
DROP INDEX IF EXISTS `ix_tbl_log_hack_RegisterTime` ON tbl_log_hack;
CREATE INDEX `ix_tbl_log_hack_RegisterTime` ON tbl_log_hack(RegisterTime);