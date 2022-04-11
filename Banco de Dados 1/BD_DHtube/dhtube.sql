-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DHTube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DHTube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DHTube` DEFAULT CHARACTER SET utf8 ;
USE `DHTube` ;

-- -----------------------------------------------------
-- Table `DHTube`.`PAIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`PAIS` (
  `idPAIS` INT(11) NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idPAIS`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`AVATAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`AVATAR` (
  `idAVATAR` INT(11) NOT NULL,
  `NOME` VARCHAR(45) NULL,
  `URL_IMAGEM` VARCHAR(100) NULL,
  PRIMARY KEY (`idAVATAR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`USUARIO` (
  `idUSUARIO` INT NOT NULL,
  `NOME_USUARIO` VARCHAR(45) NOT NULL,
  `EMAIL_USUARIO` VARCHAR(100) NOT NULL,
  `SENHA_USUARIO` VARCHAR(45) NOT NULL,
  `DATA_NAS_USUARIO` DATE NOT NULL,
  `CEP` VARCHAR(45) NULL,
  `PAIS_IDPais` INT(11) NULL,
  `AVATAR_IDAVATAR` INT(11) NULL,
  PRIMARY KEY (`idUSUARIO`),
  INDEX `FK_PAIS_idx` (`PAIS_IDPais` ASC) VISIBLE,
  INDEX `FK_AVATAR_idx` (`AVATAR_IDAVATAR` ASC) VISIBLE,
  CONSTRAINT `FK_PAIS`
    FOREIGN KEY (`PAIS_IDPais`)
    REFERENCES `DHTube`.`PAIS` (`idPAIS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_AVATAR`
    FOREIGN KEY (`AVATAR_IDAVATAR`)
    REFERENCES `DHTube`.`AVATAR` (`idAVATAR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`PLAYLIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`PLAYLIST` (
  `idPLAYLIST` INT(11) NOT NULL,
  `NOME_PLAYLIST` VARCHAR(45) NULL,
  `DATACRIACAO` DATETIME NULL,
  `PRIVADO` SMALLINT(6) NULL,
  `USUARIO_IDUSUARIO` INT(11) NULL,
  PRIMARY KEY (`idPLAYLIST`),
  INDEX `FK_USUARIO_idx` (`USUARIO_IDUSUARIO` ASC) VISIBLE,
  CONSTRAINT `FK_USUARIO`
    FOREIGN KEY (`USUARIO_IDUSUARIO`)
    REFERENCES `DHTube`.`USUARIO` (`idUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`VIDEO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`VIDEO` (
  `idVIDEO` INT(11) NOT NULL,
  `USUARIO_IDUSER` INT(11) NULL,
  `DESCRICAO` TEXT NULL,
  `TAMANHO` DOUBLE NULL,
  `NOME_ARQUIVO` VARCHAR(100) NULL,
  `DURACAO` DOUBLE NULL,
  `IMAGEM` VARCHAR(100) NULL,
  `QTD_REPRODUCOES` INT(11) NULL,
  `QTD_LIKES` INT(11) NULL,
  `QTD_DSLIKES` INT(11) NULL,
  `PRIVADO` SMALLINT(6) NULL,
  `DATA_PUBLICACAO` DATETIME NULL,
  PRIMARY KEY (`idVIDEO`),
  INDEX `FK_USER_idx` (`USUARIO_IDUSER` ASC) VISIBLE,
  CONSTRAINT `FK_USER`
    FOREIGN KEY (`USUARIO_IDUSER`)
    REFERENCES `DHTube`.`USUARIO` (`idUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`PLAYLIST_VIDEO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`PLAYLIST_VIDEO` (
  `VIDEO_IDVIDEO` INT(11) NULL,
  `PLAYLIST_IDPLAYKIST` INT(11) NULL,
  INDEX `FK_VIDEO_idx` (`VIDEO_IDVIDEO` ASC) VISIBLE,
  INDEX `FK_PLAYLIST_idx` (`PLAYLIST_IDPLAYKIST` ASC) VISIBLE,
  CONSTRAINT `FK_VIDEO`
    FOREIGN KEY (`VIDEO_IDVIDEO`)
    REFERENCES `DHTube`.`VIDEO` (`idVIDEO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PLAYLIST`
    FOREIGN KEY (`PLAYLIST_IDPLAYKIST`)
    REFERENCES `DHTube`.`PLAYLIST` (`idPLAYLIST`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`CANAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`CANAL` (
  `idCANAL` INT(11) NOT NULL,
  `NOME_CANAL` VARCHAR(45) NULL,
  `DESCRICAO` MEDIUMTEXT NULL,
  `DATA_CRIAÇAO` DATETIME NULL,
  `USUARIO_ID` INT(11) NULL,
  PRIMARY KEY (`idCANAL`),
  INDEX `FK_USUARI_idx` (`USUARIO_ID` ASC) VISIBLE,
  CONSTRAINT `FK_USUARIO`
    FOREIGN KEY (`USUARIO_ID`)
    REFERENCES `DHTube`.`USUARIO` (`idUSUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;