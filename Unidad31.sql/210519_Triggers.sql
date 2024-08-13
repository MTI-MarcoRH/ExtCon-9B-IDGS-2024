-- Triggers Pedidos
CREATE DEFINER=`edgar`@`%` TRIGGER `tbd_pedido_AFTER_INSERT` AFTER INSERT ON `tbb_pedidos` FOR EACH ROW BEGIN
	
    DECLARE v_estatus varchar(20) default 'Activo';
	DECLARE v_nombre_producto varchar(60) default null;
    
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if not NEW.estatus then
		set v_estatus = "Inactivo";
	end if;
    
    if new.producto_id is not null then
        -- En caso de tener el id del usuario debemos recuperar su nombre
        set v_nombre_producto = (SELECT CONCAT_WS(" ", p.nombre, p.marca, p.descripcion) FROM tbb_productos p WHERE id = NEW.producto_id);
    else
        SET v_nombre_producto = "Sin producto asignado";
    end if;
    
    
    
	-- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbb_pedido",
        CONCAT_WS(" ","Se ha insertado un nuevo pedido con los siguientes datos: ",
        "ID PRODUCTOS = ", v_nombre_producto,
        "TIPO = ", new.Tipo,
		"FECHA REGISTRO = ", new.fecha_registro,
        "FECHA ACTUALIZACION = ", new.fecha_actualizacion, 
        "ESTATUS = ", v_estatus,
        "TOTAL PRODUCTOS = ", new.Total_Productos,
        "COSTO TOTAL = ", new.Costo_Total),
        DEFAULT,
		DEFAULT  
    );
END
-- ------------------------------------------------------------------------------------------------
CREATE DEFINER=`edgar`@`%` TRIGGER `tbd_pedido_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_pedidos` FOR EACH ROW BEGIN
	set new.Fecha_Actualizacion = current_timestamp();
END
-- -----------------------------------------------------------------------------------------------
CREATE DEFINER=`edgar`@`%` TRIGGER `tbd_pedido_AFTER_UPDATE` AFTER UPDATE ON `tbb_pedidos` FOR EACH ROW BEGIN
	
    declare v_estatus_old varchar(20) default 'Activo';
    declare v_estatus_new varchar(20) default 'Activo';
    DECLARE v_producto_old varchar(60) default null;
    DECLARE v_producto_new varchar(60) default null;
    
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if not old.estatus then
		set v_estatus_old = "Inactivo";
	end if;
    if not NEW.estatus then
		set v_estatus_new = "Inactivo";
	end if;
    
    IF NEW.producto_id IS NOT NULL THEN 
		-- En caso de tener el id del usuario
		SET v_producto_new = (SELECT CONCAT_WS(" ", p.nombre, p.marca, p.descripcion) FROM tbb_productos p WHERE id = NEW.producto_id);
    else
		SET v_producto_new = "Sin usuario asignado.";
    END IF;
    
    IF OLD.producto_id IS NOT NULL THEN 
		-- En caso de tener el id del usuario
		SET v_producto_old = (SELECT CONCAT_WS(" ", p.nombre, p.marca, p.descripcion) FROM tbb_productos p WHERE id = old.producto_id);
    else
		SET v_producto_old = "Sin usuario asignado.";
    END IF;
    
    
	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Update' ,
		'tbb_pedido',
		concat_ws(" ","Se ha modificado un pedido de un producto existente con los siguientes datos: ",
        "ID PRODUCTO = ", v_producto_old, '-', v_producto_new,
        "TIPO = ", old.Tipo, ' - ', new.Tipo,
        "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new,
        "TOTAL PRODUCTOS", old.Total_Productos, ' - ', new.Total_Productos,
        "COSTO TOTAL", old.Costo_Total, ' - ', new.Costo_Total),
	DEFAULT,
	DEFAULT  
);
END
-- --------------------------------------------------------------------------------------------------
CREATE DEFINER=`edgar`@`%` TRIGGER `tbd_pedido_BEFORE_DELETE` BEFORE DELETE ON `tbb_pedidos` FOR EACH ROW BEGIN
declare v_estatus varchar(20) default 'Activo';
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if  not old.estatus then
		set v_estatus = "Inactivo";
	end if;
    
	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Delete' ,
		'tbb_pedido',
		CONCAT_WS(" ","Se ha eliminado un pedido de un producto con los siguientes datos: ",
        "TIPO = ", old.Tipo, 
        "ESTATUS = ", v_estatus,
        "TOTAL PROCUTOS =", old.Total_Productos,
        "COSTO TOTAL =", old.Costo_Total),
	DEFAULT,
	DEFAULT );
END

-- Promociones
CREATE DEFINER=`edgar`@`%` TRIGGER `tbd_promocion_AFTER_INSERT` AFTER INSERT ON `tbb_promociones` FOR EACH ROW begin
	
    declare v_estatus varchar(20) default 'Activo';
    DECLARE v_nombre_producto varchar(60) default null;
    DECLARE v_producto_old varchar(60) default null;
    DECLARE v_producto_new varchar(60) default null;
    
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if not NEW.estatus then
		set v_estatus = "Inactivo";
	end if;
    
    if new.producto_id is not null then
        -- En caso de tener el id del usuario debemos recuperar su nombre
        set v_nombre_producto = (SELECT CONCAT_WS(" ", p.nombre, p.marca, p.descripcion) FROM tbb_productos p WHERE id = NEW.producto_id);
    else
        SET v_nombre_producto = "Sin producto asignado";
    end if;
    
	-- Insertar en la bitacora
    INSERT INTO tbi_bitacora VALUES(
        DEFAULT,
        USER(),
        "Create",
        "tbb_promocion",
        CONCAT_WS(" ","Se ha insertado una nueva promocion con los siguientes datos: ",
        "ID PRODUCTOS = ", v_nombre_producto,
        "TIPO = ", new.Tipo,
        "APLICACION EN = ", NEW.Aplicacion_en, 
		"FECHA REGISTRO = ", new.fecha_registro,
        "FECHA ACTUALIZACION = ", NEW.fecha_actualizacion, 
        "ESTATUS = ", v_estatus),
        DEFAULT,
		DEFAULT  
    );
END
-- -------------------------------------------------------------------------------
CREATE DEFINER=`edgar`@`%` TRIGGER `tbd_promocion_BEFORE_UPDATE` BEFORE UPDATE ON `tbb_promociones` FOR EACH ROW BEGIN
	set new.Fecha_Actualizacion = current_timestamp();
END
-- --------------------------------------------------------------------------------
CREATE DEFINER=`edgar`@`%` TRIGGER `tbd_promocion_AFTER_UPDATE` AFTER UPDATE ON `tbb_promociones` FOR EACH ROW BEGIN
	
    declare v_estatus_old varchar(20) default 'Activo';
    declare v_estatus_new varchar(20) default 'Activo';
    DECLARE v_producto_old varchar(60) default null;
    DECLARE v_producto_new varchar(60) default null;
    
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if not old.estatus then
		set v_estatus_old = "Inactivo";
	end if;
    if not NEW.estatus then
		set v_estatus_new = "Inactivo";
	end if;
    
    
    IF NEW.producto_id IS NOT NULL THEN 
		-- En caso de tener el id del usuario
		SET v_producto_new = (SELECT CONCAT_WS(" ", p.nombre, p.marca, p.descripcion) FROM tbb_productos p WHERE id = NEW.producto_id);
    else
		SET v_producto_new = "Sin usuario asignado.";
    END IF;
    
    IF OLD.producto_id IS NOT NULL THEN 
		-- En caso de tener el id del usuario
		SET v_producto_old = (SELECT CONCAT_WS(" ", p.nombre, p.marca, p.descripcion) FROM tbb_productos p WHERE id = old.producto_id);
    else
		SET v_producto_old = "Sin usuario asignado.";
    END IF;
    
    
	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Update' ,
		'tbb_promocion',
		concat_ws(" ","Se ha modificado una promocion de un producto existente con los siguientes datos: ",
        "ID PRODUCTO = ", v_producto_old, '-', v_producto_new,
        "TIPO = ", old.Tipo, ' - ', new.Tipo,
        "APLICACION EN =", old.Aplicacion_en, ' - ', new.Aplicacion_en,
        "ESTATUS = ", v_estatus_old, ' - ', v_estatus_new),
	DEFAULT,
	DEFAULT  
);
END
-- -------------------------------------------------------------------------
CREATE DEFINER=`edgar`@`%` TRIGGER `tbd_promocion_BEFORE_DELETE` BEFORE DELETE ON `tbb_promociones` FOR EACH ROW BEGIN
declare v_estatus varchar(20) default 'Activo';
    -- verificamos si el estatus del rol, para ubicar el valor en la descripcion de la bitacora
    if  not old.estatus then
		set v_estatus = "Inactivo";
	end if;
    
	insert into tbi_bitacora values(
		DEFAULT,current_user(),
		'Delete' ,
		'tbb_promocion',
		CONCAT_WS(" ","Se ha eliminado una promoción de un producto con los siguientes datos: ",
        "TIPO = ", old.Tipo, 
        "APLICACION EN =", old.Aplicacion_en,
        "ESTATUS = ", v_estatus),
	DEFAULT,
	DEFAULT );
END