
/* tbluser 
	This table holds registred users data.
*/
DROP TABLE IF EXISTS tbrecipeimages, tblrecipesteps, tblrecipeingredients, tblrecipe, tbluser;
CREATE TABLE `recipe`.`tbluser` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `pass` VARCHAR(50) NULL,
  `email_address` VARCHAR(500) NULL,
  `FirstName` VARCHAR(100) NULL,
  `MiddleName` VARCHAR(100) NULL,
  `LastName` VARCHAR(100) NULL,
  `CreatedDate` DATETIME NULL,
  `LastUpdatedDate` DATETIME NULL,
  PRIMARY KEY (`user_id`));

/* tblrecipecategory 
	This table holds data from pre defined as well user defined categories.
*/
DROP TABLE IF EXISTS tblrecipe, tblrecipecategory;
CREATE TABLE `recipe`.`tblrecipecategory` (
  `Cat_id` INT NOT NULL AUTO_INCREMENT,
  `Cat_name` VARCHAR(100) NOT NULL,
  `CreatedDate` DATETIME NULL DEFAULT now(),
  `CreatedBy` INT NULL,
  `LastUpdatedDate` DATETIME NULL DEFAULT now(),
  `LastUpdatedBy` INT NULL,
  PRIMARY KEY (`Cat_id`));



/* tblrecipe 
	Core table that hold all the Recipies
*/
DROP TABLE IF EXISTS tblrecipe;
CREATE TABLE `recipe`.`tblrecipe` (
  `Recipe_id` INT NOT NULL AUTO_INCREMENT,
  `Recipe_name` VARCHAR(100) NOT NULL,
  `cat_id` INT NULL,
  `desc` LONGTEXT NULL,
  `cusine_id` INT NULL,
  `spice_level_1to10` INT NULL,
  `owner_id` INT NULL,
  `CreatedDate` DATETIME NULL,
  `LastUpdatedDate` DATETIME NULL,
  PRIMARY KEY (`Recipe_id`),
  UNIQUE INDEX `Recipe_name_UNIQUE` (`Recipe_name` ASC),
  INDEX `fk_tblrecipe_tblrecipecategory_cat_id_idx` (`cat_id` ASC),
  CONSTRAINT `fk_tblrecipe_tblrecipecategory_cat_id`
    FOREIGN KEY (`cat_id`)
    REFERENCES `recipe`.`tblrecipecategory` (`Cat_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
    
ALTER TABLE `recipe`.`tblrecipe` 
ADD INDEX `fk_tblrecipe_tbluser_idx` (`owner_id` ASC);
ALTER TABLE `recipe`.`tblrecipe` 
ADD CONSTRAINT `fk_tblrecipe_tbluser`
  FOREIGN KEY (`owner_id`)
  REFERENCES `recipe`.`tbluser` (`user_id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

DROP TABLE IF EXISTS tblrecipeingredients;
CREATE TABLE `recipe`.`tblrecipeingredients` (
  `Ing_id` INT NOT NULL AUTO_INCREMENT,
  `Ing_name` VARCHAR(100) NULL,
  `recipe_id` INT NULL,
  `quantity` VARCHAR(100) NULL,
  `image_url` VARCHAR(3000) NULL,
  `CreatedDate` DATETIME NULL,
  PRIMARY KEY (`Ing_id`),
  INDEX `fk_tblrecipeingredients_tblrecipe_recipe_id_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_tblrecipeingredients_tblrecipe_recipe_id`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe`.`tblrecipe` (`Recipe_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

DROP TABLE IF EXISTS tblrecipesteps;
CREATE TABLE `recipe`.`tblrecipesteps` (
  `step_id` INT NOT NULL AUTO_INCREMENT,
  `recipe_id` INT NULL,
  `step_desc` TEXT NULL,
  `CreatedDate` DATETIME NULL,
  `LastUpdatedDate` DATETIME NULL,
  PRIMARY KEY (`step_id`),
  INDEX `fk_tblrecipesteps_tblrecipe_recipe_id_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_tblrecipesteps_tblrecipe_recipe_id`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe`.`tblrecipe` (`Recipe_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);

DROP TABLE IF EXISTS tbrecipeimages;
CREATE TABLE `recipe`.`tbrecipeimages` (
  `img_id` INT NOT NULL AUTO_INCREMENT,
  `recipe_id` INT NULL,
  `image_url` VARCHAR(3000) NULL,
  `CreatedDate` DATETIME NULL,
  PRIMARY KEY (`img_id`),
  INDEX `fk_tbrecipeimages_tblrecipe_recipe_id_idx` (`recipe_id` ASC),
  CONSTRAINT `fk_tbrecipeimages_tblrecipe_recipe_id`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe`.`tblrecipe` (`Recipe_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);
