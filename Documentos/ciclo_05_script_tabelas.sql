ALTER TABLE `sgesc`.`usuario` 
DROP FOREIGN KEY `usuario_ibfk_1`;
ALTER TABLE `sgesc`.`usuario` 
DROP INDEX `fk_perfil_usuario_id` ;

truncate table perfil_usuario;