-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ejemplo_nomina
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ejemplo_nomina` ;

-- -----------------------------------------------------
-- Schema ejemplo_nomina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ejemplo_nomina` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ejemplo_nomina` ;

-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`cargos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`cargos` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`cargos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`paises`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`paises` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`paises` (
  `id` VARCHAR(4) NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`departamentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`departamentos` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`departamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `id_pais` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_departamentos_pais_idx` (`id_pais` ASC) VISIBLE,
  CONSTRAINT `fk_departamentos_pais`
    FOREIGN KEY (`id_pais`)
    REFERENCES `ejemplo_nomina`.`paises` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`ciudades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`ciudades` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`ciudades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `id_departamento` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ciudades_departamentos_idx` (`id_departamento` ASC) VISIBLE,
  CONSTRAINT `fk_ciudades_departamentos`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `ejemplo_nomina`.`departamentos` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`nominas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`nominas` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`nominas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(60) NULL DEFAULT NULL,
  `mes` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`tipos_documento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`tipos_documento` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`tipos_documento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(20) NOT NULL,
  `apellidos` VARCHAR(20) NOT NULL,
  `num_documento` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(40) NULL DEFAULT NULL,
  `sueldo_basico` DOUBLE NOT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  `id_cargo` INT NOT NULL,
  `id_jefe_inmediato` INT NOT NULL,
  `id_tipo_documento` INT NOT NULL,
  `id_ciudad` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_cargo_idx` (`id_cargo` ASC) VISIBLE,
  INDEX `fk_jefe_inmediato_idx` (`id_jefe_inmediato` ASC) VISIBLE,
  INDEX `fk_tipo_documento_idx` (`id_tipo_documento` ASC) VISIBLE,
  INDEX `fk_ciudad_ciudades_idx` (`id_ciudad` ASC) VISIBLE,
  CONSTRAINT `fk_ciudad_ciudades`
    FOREIGN KEY (`id_ciudad`)
    REFERENCES `ejemplo_nomina`.`ciudades` (`id`)
    ON DELETE SET NULL,
  CONSTRAINT `fk_jefe_inmediato`
    FOREIGN KEY (`id_jefe_inmediato`)
    REFERENCES `ejemplo_nomina`.`usuarios` (`id`),
  CONSTRAINT `fk_tipo_documento`
    FOREIGN KEY (`id_tipo_documento`)
    REFERENCES `ejemplo_nomina`.`tipos_documento` (`id`)
    ON DELETE SET NULL,
  CONSTRAINT `fk_usuarios_cargo`
    FOREIGN KEY (`id_cargo`)
    REFERENCES `ejemplo_nomina`.`cargos` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`detalle_nomina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`detalle_nomina` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`detalle_nomina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dias_laborados` INT NULL DEFAULT NULL,
  `sueldo_devengado` DOUBLE NULL DEFAULT NULL,
  `auxilio_transporte` DOUBLE NULL DEFAULT NULL,
  `valor_horas_extras` DOUBLE NULL DEFAULT NULL,
  `descuento_salud` DOUBLE NULL DEFAULT NULL,
  `descuento_pension` DOUBLE NULL DEFAULT NULL,
  `descuento_fondo_solidaridad` DOUBLE NULL DEFAULT NULL,
  `otros_descuentos` DOUBLE NULL DEFAULT NULL,
  `total_devengado` DOUBLE NULL DEFAULT NULL,
  `total_descuento` DOUBLE NULL DEFAULT NULL,
  `neto_pagar` DOUBLE NULL DEFAULT NULL,
  `id_usuario` INT NULL DEFAULT NULL,
  `id_nomina` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_detalle_nomina_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_detalle_nomina_nomina_idx` (`id_nomina` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_nomina_nomina`
    FOREIGN KEY (`id_nomina`)
    REFERENCES `ejemplo_nomina`.`nominas` (`id`)
    ON DELETE SET NULL,
  CONSTRAINT `fk_detalle_nomina_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ejemplo_nomina`.`usuarios` (`id`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`roles` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`roles` (
  `id` VARCHAR(10) NOT NULL,
  `descripcion` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ejemplo_nomina`.`usuarios_has_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ejemplo_nomina`.`usuarios_has_roles` ;

CREATE TABLE IF NOT EXISTS `ejemplo_nomina`.`usuarios_has_roles` (
  `id_usuario` INT NOT NULL,
  `id_rol` VARCHAR(10) NOT NULL,
  `activo` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`, `id_rol`),
  INDEX `fk_usuarios_has_roles_roles_idx` (`id_rol` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_roles_usuarios`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ejemplo_nomina`.`usuarios` (`id`),
  CONSTRAINT `fk_usuarios_has_roles_roles`
    FOREIGN KEY (`id_rol`)
    REFERENCES `ejemplo_nomina`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
