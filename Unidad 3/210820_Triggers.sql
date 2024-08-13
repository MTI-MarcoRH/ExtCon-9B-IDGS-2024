-- TRIGGER AFTER_INSERT

CREATE DEFINER=`aldair`@`%` TRIGGER `tbb_indicadores_nutricionales_AFTER_INSERT` AFTER INSERT ON `tbb_indicadores_nutricionales` FOR EACH ROW BEGIN
	declare usuario varchar(50);
    set usuario=(select nombre from tbb_personas p where new.id = p.id);
    INSERT INTO tbi_bitacora VALUES(
	DEFAULT,
	USER(),
	"Create",
	"indicadores_nutricionales",
	CONCAT_WS("","Se ha registrado un nuevo indicador nutricional con los siguientes datos: ",
    "ID =", NEW.id,
    "ALTURA =",new.altura,
    "PESO_KG =",new.peso_kg,
    "IMC =",new.imc,
    "PORCENTAJE_GRASA =",new.porcentaje_grasa,
    "NIVEL_ACTIVIDAD =",new.nivel_actividad,
    "FECHA_REGISTRO =",new.fecha_registro,
    "FECHA_ACTUALIZACION =",new.fecha_actualizacion,
    "USUARIO", usuario
    ),
	DEFAULT,
	DEFAULT
);

END

-- TRIGGER BEFORE_UPDATE

CREATE DEFINER=`aldair`@`%` TRIGGER `tbb_indicadores_nutricionales_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_indicadores_nutricionales` FOR EACH ROW BEGIN
	set new.fecha_actualizacion = current_timestamp();
END

-- TRIGGER AFTER UPDATE

CREATE DEFINER=`aldair`@`%` TRIGGER `tbb_indicadores_nutricionales_AFTER_UPDATE` AFTER UPDATE ON `tbb_indicadores_nutricionales` FOR EACH ROW BEGIN
	declare usuario_new varchar(50);
	declare usuario_old varchar(50);
    set usuario_new=(select nombre from tbb_personas p where new.id = p.id);
    set usuario_old=(select nombre from tbb_personas p where old.id = p.id);
    insert into tbi_bitacora values(
	DEFAULT,
	current_user(),
	'Update',
	"indicadores_nutricionales",
	CONCAT_WS(" ","Se ha modificado un nuevo indicador nutricional con los siguientes datos:",
	"ID =",NEW.id,
	"ALTURA =", old.altura,"--",NEW.altura,
	"PESO_KG =", old.peso_kg,"--",NEW.peso_kg,
	"IMC =", old.imc,"--",NEW.imc,
	"PORCENTAJE_GRASA =", old.porcentaje_grasa,"--",NEW.porcentaje_grasa,
	"NIVEL_ACTIVIDAD =", old.nivel_actividad,"--",NEW.nivel_actividad,
	"FECHA_REGISTRO =", old.fecha_registro,"--",NEW.fecha_registro,
	"FECHA_ACTUALIZACION =", old.fecha_actualizacion,"--",NEW.fecha_actualizacion,
    "USUARIO", usuario_old,"--", usuario_new
    ),
	DEFAULT,
	DEFAULT
    );
END

-- TRIGGER AFTER DELETE

CREATE DEFINER=`aldair`@`%` TRIGGER `tbb_indicadores_nutricionales_AFTER_DELETE` AFTER DELETE ON `tbb_indicadores_nutricionales` FOR EACH ROW BEGIN
	declare usuario varchar(50);
    set usuario=(select nombre from tbb_personas p where old.id = p.id);
    insert into tbi_bitacora values(
	DEFAULT,
	current_user(),
	"Delete",
	"indicadores_nutricionales",
	CONCAT_WS(" ","Se ha eliminado un indicador nutricional con los siguientes datos：",
	"ID =",old.id,
	"ALTURA =", old.altura,
	"PESO_KG =", old.peso_kg,
	"IMC =", old.imc,
	"PORCENTAJE_GRASA =", old.porcentaje_grasa,
	"NIVEL_ACTIVIDAD =", old.nivel_actividad,
	"FECHA_REGISTRO =", old.fecha_registro,
	"FECHA_ACTUALIZACION =", old.fecha_actualizacion,
    "USUARIO", usuario
    ),
	DEFAULT,
	DEFAULT
    );
END

