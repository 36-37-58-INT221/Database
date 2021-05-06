-- MySQL Script generated by MySQL Workbench
-- Sat May  1 11:45:52 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Brand` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Brand` (
  `brandId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`brandId`),
  UNIQUE INDEX `brandcol_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Product` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `productId` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(70) NOT NULL,
  `price` DOUBLE(8,2) NOT NULL,
  `manufactureDate` DATE NOT NULL,
  `pathPic` VARCHAR(70) NOT NULL,
  `brandId` INT NOT NULL,
  PRIMARY KEY (`productId`, `brandId`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_Product_Brand_idx` (`brandId` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Brand`
    FOREIGN KEY (`brandId`)
    REFERENCES `mydb`.`Brand` (`brandId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Color` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Color` (
  `colorId` INT NOT NULL,
  `colorCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`colorId`),
  UNIQUE INDEX `colorCode_UNIQUE` (`colorCode` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HaveColor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`HaveColor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`HaveColor` (
  `productId` INT NOT NULL,
  `colorId` INT NOT NULL,
  PRIMARY KEY (`productId`, `colorId`),
  INDEX `fk_HaveColor_Product1_idx` (`productId` ASC) VISIBLE,
  INDEX `fk_HaveColor_Color1_idx` (`colorId` ASC) VISIBLE,
  CONSTRAINT `fk_HaveColor_Product1`
    FOREIGN KEY (`productId`)
    REFERENCES `mydb`.`Product` (`productId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HaveColor_Color1`
    FOREIGN KEY (`colorId`)
    REFERENCES `mydb`.`Color` (`colorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
