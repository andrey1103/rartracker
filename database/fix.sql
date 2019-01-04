ALTER TABLE `users` ADD `downloadban` INT(1) NOT NULL AFTER `uploadban`;
ALTER TABLE `users` CHANGE `uploadban` `uploadban` INT(1) NOT NULL;