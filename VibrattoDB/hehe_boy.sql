-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema vibrattomusicdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vibrattomusicdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vibrattomusicdb` DEFAULT CHARACTER SET latin1 ;
USE `vibrattomusicdb` ;

-- -----------------------------------------------------
-- Table `vibrattomusicdb`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibrattomusicdb`.`professores` (
  `idProfessor` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeProfessor` VARCHAR(100) NOT NULL,
  `sobrenomeProfessor` VARCHAR(100) NOT NULL,
  `sexoProfessor` CHAR(1) NOT NULL,
  `emailProfessor` VARCHAR(100) NOT NULL,
  `telefoneProfessor` VARCHAR(100) NOT NULL,
  `cpfProfessor` VARCHAR(100) NOT NULL,
  `enderecoProfessor` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idProfessor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vibrattomusicdb`.`instrumentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibrattomusicdb`.`instrumentos` (
  `idInstrumento` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeInstrumento` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idInstrumento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vibrattomusicdb`.`turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibrattomusicdb`.`turmas` (
  `idTurma` INT(11) NOT NULL AUTO_INCREMENT,
  `nivelTurma` VARCHAR(100) NOT NULL,
  `periodoTurma` VARCHAR(100) NOT NULL,
  `dtInicioTurma` DATE NOT NULL,
  `dtFimTurma` DATE NOT NULL,
  `professores_idProfessor` INT(11) NOT NULL,
  `instrumentos_idInstrumento` INT(11) NOT NULL,
  PRIMARY KEY (`idTurma`, `professores_idProfessor`, `instrumentos_idInstrumento`),
  INDEX `fk_turmas_professores1_idx` (`professores_idProfessor` ASC),
  INDEX `fk_turmas_instrumentos1_idx` (`instrumentos_idInstrumento` ASC),
  CONSTRAINT `fk_turmas_professores1`
    FOREIGN KEY (`professores_idProfessor`)
    REFERENCES `vibrattomusicdb`.`professores` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turmas_instrumentos1`
    FOREIGN KEY (`instrumentos_idInstrumento`)
    REFERENCES `vibrattomusicdb`.`instrumentos` (`idInstrumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vibrattomusicdb`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibrattomusicdb`.`alunos` (
  `idAluno` INT(11) NOT NULL AUTO_INCREMENT,
  `nomeAluno` VARCHAR(100) NOT NULL,
  `cpfAluno` INT(11) NOT NULL,
  `sobrenomeAluno` VARCHAR(100) NOT NULL,
  `sexoAluno` CHAR(1) NOT NULL,
  `emailAluno` VARCHAR(100) NOT NULL,
  `telefoneAluno` VARCHAR(100) NOT NULL,
  `enderecoAluno` VARCHAR(100) NOT NULL,
  `senhaAluno` VARCHAR(100) NOT NULL,
  `turmas_idTurma` INT(11) NOT NULL,
  PRIMARY KEY (`idAluno`, `turmas_idTurma`),
  INDEX `fk_alunos_turmas_idx` (`turmas_idTurma` ASC),
  CONSTRAINT `fk_alunos_turmas`
    FOREIGN KEY (`turmas_idTurma`)
    REFERENCES `vibrattomusicdb`.`turmas` (`idTurma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `vibrattomusicdb`.`salas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vibrattomusicdb`.`salas` (
  `idSala` INT(11) NOT NULL AUTO_INCREMENT,
  `numeroSala` VARCHAR(100) NOT NULL,
  `statusSala` VARCHAR(100) NOT NULL,
  `qtdSala` INT(11) NOT NULL,
  `turmas_idTurma` INT(11) NOT NULL,
  `turmas_professores_idProfessor` INT(11) NOT NULL,
  PRIMARY KEY (`idSala`, `turmas_idTurma`, `turmas_professores_idProfessor`),
  INDEX `fk_salas_turmas1_idx` (`turmas_idTurma` ASC, `turmas_professores_idProfessor` ASC),
  CONSTRAINT `fk_salas_turmas1`
    FOREIGN KEY (`turmas_idTurma` , `turmas_professores_idProfessor`)
    REFERENCES `vibrattomusicdb`.`turmas` (`idTurma` , `professores_idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
