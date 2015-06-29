
CREATE TABLE `recipe`.`tblrecipecategory` (
  `Cat_id` INT NOT NULL AUTO_INCREMENT,
  `Cat_name` VARCHAR(100) NOT NULL,
  `CreatedDate` DATETIME NULL DEFAULT now(),
  `CreatedBy` INT NULL,
  `LastUpdatedDate` DATETIME NULL DEFAULT now(),
  `LastUpdatedBy` INT NULL,
  PRIMARY KEY (`Cat_id`));
