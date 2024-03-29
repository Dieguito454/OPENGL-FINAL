USE [master]
GO
/****** Object:  Database [OPENGL]    Script Date: 06/27/2019 17:02:57 ******/
CREATE DATABASE [OPENGL] ON  PRIMARY 
( NAME = N'OPENGL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.CHADB2008R2\MSSQL\DATA\OPENGL.mdf' , SIZE = 63360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'OPENGL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.CHADB2008R2\MSSQL\DATA\OPENGL_log.ldf' , SIZE = 517184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OPENGL] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OPENGL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OPENGL] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [OPENGL] SET ANSI_NULLS OFF
GO
ALTER DATABASE [OPENGL] SET ANSI_PADDING OFF
GO
ALTER DATABASE [OPENGL] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [OPENGL] SET ARITHABORT OFF
GO
ALTER DATABASE [OPENGL] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [OPENGL] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [OPENGL] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [OPENGL] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [OPENGL] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [OPENGL] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [OPENGL] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [OPENGL] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [OPENGL] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [OPENGL] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [OPENGL] SET  DISABLE_BROKER
GO
ALTER DATABASE [OPENGL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [OPENGL] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [OPENGL] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [OPENGL] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [OPENGL] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [OPENGL] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [OPENGL] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [OPENGL] SET  READ_WRITE
GO
ALTER DATABASE [OPENGL] SET RECOVERY FULL
GO
ALTER DATABASE [OPENGL] SET  MULTI_USER
GO
ALTER DATABASE [OPENGL] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [OPENGL] SET DB_CHAINING OFF
GO
USE [OPENGL]
GO
/****** Object:  User [openGL]    Script Date: 06/27/2019 17:02:57 ******/
CREATE USER [openGL] FOR LOGIN [openGL] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [gestiongastos]    Script Date: 06/27/2019 17:02:57 ******/
CREATE USER [gestiongastos] FOR LOGIN [gestiongastos] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 06/27/2019 17:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movimiento](
	[Id_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[Id_movimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModeloTablaFinal]    Script Date: 06/27/2019 17:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModeloTablaFinal](
	[TransaccionId] [varchar](max) NULL,
	[CodigoCuenta] [bigint] NULL,
	[CuentaDescripcion] [varchar](max) NULL,
	[ID_Secundaria] [bigint] NULL,
	[ID_CTA_Secundaria] [bigint] NULL,
	[Nombre_Secundaria] [varchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[TipoComprobante] [bigint] NULL,
	[CodigoComprobante] [varchar](max) NULL,
	[JornalDescripcion] [varchar](max) NULL,
	[MontoNeto] [decimal](18, 2) NULL,
	[Fecha_Contabilizacion] [datetime] NULL,
	[LineaDescripcion] [varchar](max) NULL,
	[Id_movimiento] [bigint] NULL,
	[UserId] [bigint] NULL,
	[FechaCargaSistema] [datetime] NULL,
	[id_cliente] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mayorizacion3]    Script Date: 06/27/2019 17:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mayorizacion3](
	[TransaccionId] [varchar](max) NULL,
	[CodigoCuenta] [bigint] NULL,
	[CuentaDescripcion] [varchar](max) NULL,
	[ID_Secundaria] [bigint] NULL,
	[ID_CTA_Secundaria] [bigint] NULL,
	[Nombre_Secundaria] [varchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[TipoComprobante] [bigint] NULL,
	[CodigoComprobante] [varchar](max) NULL,
	[JornalDescripcion] [varchar](max) NULL,
	[MontoNeto] [decimal](18, 2) NULL,
	[Fecha_Contabilizacion] [datetime] NULL,
	[LineaDescripcion] [varchar](max) NULL,
	[Id_movimiento] [bigint] NULL,
	[UserId] [bigint] NULL,
	[FechaCargaSistema] [datetime] NULL,
	[id_cliente] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetUsuario]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsuario]

@username varchar(50)= null,
@contraseña varchar(50) = null

AS
BEGIN

declare @consulta varchar(1000)
set @consulta = N'SELECT u.id_usuario, u.nombreapellido_usuario, u.email,    '
set @consulta = @consulta + 'CASE esAdmin WHEN 1 THEN ''Si'' ELSE ''No'' END as esAdmin, '
set @consulta = @consulta  + ' u.fecha_alta , u.contraseña  ' 

--set @consulta = @consulta  + '  u.home,  u.stockVendedor,  u.ordenVenta,  u.consultasAux,  u.stockAdmin, '
--set @consulta = @consulta  + '  u.ordenCompra,  u.remitosProveedor,  u.remitosCliente,  '
--set @consulta = @consulta  + '  u.caja,  u.datosMaestros '

set @consulta = @consulta + '	FROM Usuarios  u' 
--set @consulta = @consulta  +  ' left join Usuario_Nivel un on u.id_usuario = un.id_usuario ' 
--set @consulta = @consulta  +  ' left join Nivel n on n.id_nivel = un.id_nivel ' 
	

	if @username is not null and @contraseña is not null
	begin
set @consulta = @consulta +  ' WHERE u.username = ''' +  CAST ( @username   as  varchar (50)  )  + ''''
set @consulta = @consulta + ' and u.contraseña = ''' + CAST ( @contraseña   as  varchar (50)  )  + ''''
	end
	--set @consulta = @consulta + ' and u.estado  =  1' 


 exec (@consulta)
	
END
GO
/****** Object:  Table [dbo].[CuentasOriginal]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentasOriginal](
	[codigoCuenta_Original] [nvarchar](max) NULL,
	[nombreCuenta_Original] [nvarchar](max) NULL,
	[movimientoCuenta_Original] [nchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [nvarchar](max) NULL,
	[direccion_cliente] [nvarchar](max) NULL,
	[rubro_cliente] [nvarchar](max) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Cliente]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Buscar_Cliente]

	@cliente varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;



declare @consulta varchar(3000)

set @consulta = ' select t.name as nombreTabla '
set @consulta = @consulta + ' from sys.tables t '

declare @aux int

set @aux = 0

			
		if  @cliente is not null 
		begin
			set @aux = 1 
			set @consulta = @consulta + ' Where t.name LIKE  ''%' + @cliente  + '%'' '
		end
	
	
		exec(@consulta)		


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_Cuenta]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Agregar_Cuenta]
@codigo int,
@descripcion varchar(100)




AS
BEGIN

	INSERT INTO Cuentas(id_cuenta, Description)
	VALUES (@codigo, @descripcion)
 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_Cuenta]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_Cuenta]
@id int

AS
BEGIN

	delete from Cuentas
	where id_cuenta = @id
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_CuentasMasImputadas]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_CuentasMasImputadas]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)


set @consulta = ' select top 10 AccountCode, Description, COUNT(AccountCode) as cantidad from TablaPrincipal'
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta'



	declare @aux int
		set @aux = 0
		
		if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ '''' 
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
				end
		end
		
			if @cuenta is not null
				begin
					if @aux = 1
						begin
						set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
						end
					else
						begin
						set @aux = 1
						set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
						end
				end
		
set @consulta = @consulta + ' group by AccountCode, Description'
set @consulta = @consulta + ' having COUNT(AccountCode) > 5'
set @consulta = @consulta + ' order by COUNT(AccountCode) desc'

exec(@consulta)


  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_CuentaSinMovimientos]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_CuentaSinMovimientos]

@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

	SET NOCOUNT ON;
		
		
	declare @consulta varchar(3000)
	
	set @consulta = ' select t.TransaccionId,t.AccountCode ,Cuentas.Description ,t.NetAmount,t.UserId, u.cargo, t.documentType, '
	set @consulta = @consulta + ' t.JournalDescription, t.LineDescription, '
	set @consulta = @consulta + ' DateName(  day , t.EffectiveDate) + ' + '''  ''' + ' + DateName(  month , t.EffectiveDate) + ' + '''  ''' + ' + DateName(  year , t.EffectiveDate) as fecha,    '
	set @consulta = @consulta + ' t.CreatedDate, u.nombreApellido_usuario, TiposComprobante.codigo_comprobante,t.Id_movimiento, Movimiento.Descripcion '
	set @consulta = @consulta + ' from TablaPrincipal t'
	set @consulta = @consulta + ' Left join Usuarios u on t.UserId = u.Id_usuario'
	set @consulta = @consulta + ' left join Cuentas on t.AccountCode = Cuentas.id_cuenta'
	set @consulta = @consulta + ' left join TiposComprobante on t.TipoComprobante = TiposComprobante.id_comprobante '
	set @consulta = @consulta + ' left join Movimiento on t.Id_movimiento = Movimiento.Id_movimiento '
	
declare @aux int
set @aux = 0 


	if @fechaDesde is null
		if @fechaHasta is null
			if @comprobante is null
				if @cuenta is null	
					begin
						set @consulta = @consulta + ' where t.Id_movimiento is null '
					end
		
		 if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and t.CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''  
					set @consulta = @consulta + ' and t.Id_movimiento is null '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where t.CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''  
					set @consulta = @consulta + ' and t.Id_movimiento is null '
				end
		end 
		
		
			 if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and t.CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + '''' 
					set @consulta = @consulta + ' and t.Id_movimiento is null '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where t.CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					set @consulta = @consulta + ' and t.Id_movimiento is null '
				end
		end 
		
		 if @comprobante is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + ' and t.Id_movimiento is null'
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + ' and t.Id_movimiento is null '
				end
		end
			
		if @cuenta is not null
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and  ' + CAST ( @cuenta as  varchar (max) ) 
						set @consulta = @consulta + ' and t.Id_movimiento is null '
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) ) 
						set @consulta = @consulta + ' and t.Id_movimiento is null '
					end
			end
	
	exec(@consulta)
		

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_CuentaConMovimientoSaldoCero]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_CuentaConMovimientoSaldoCero]

@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = N'select CreatedDate, TransaccionId, TiposComprobante.codigo_comprobante, AccountCode,Cuentas.Description, NetAmount, '
set @consulta = @consulta + ' DateName( day , EffectiveDate) + DateName(  month , EffectiveDate) + DateName(  year , EffectiveDate) as fecha,'
set @consulta = @consulta + ' nombreApellido_usuario, Movimiento.Descripcion, DocumentType, JournalDescription, LineDescription '
set @consulta = @consulta + ' from TablaPrincipal'
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento'
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta'
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario'
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante'


		declare @aux int
		set @aux = 0
		
		
		if	 @fechaDesde is null
			if @fechaHasta is null
				if @comprobante is null	
					if @cuenta is null	
						begin
						set @consulta = @consulta + ' where NetAmount = 0 '
						end
		
		if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					set @consulta = @consulta + ' and NetAmount = 0 '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ ''''
					set @consulta = @consulta + ' and NetAmount = 0 '
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
					set @consulta = @consulta + ' and NetAmount = 0 '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
					set @consulta = @consulta + ' and NetAmount = 0 '
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
					set @consulta = @consulta + ' and NetAmount = 0 '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + ' and NetAmount = 0 '
				end
		end
		
			if @cuenta is not null
				begin
					if	@aux = 1
						begin
							set @consulta = @consulta + '  and  ' + CAST ( @cuenta as  varchar (max) ) 
							set @consulta = @consulta + 'and NetAmount = 0 '
						end
					else
						begin
							set @aux = 1
							set @consulta = @consulta + '  where ' + CAST ( @cuenta as  varchar (max) ) 
							set @consulta = @consulta + ' and NetAmount = 0 '
						end
				end
		
		
		


exec(@consulta)



END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_Cuenta]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_Cuenta]

@id int =  null,
@cliente nvarchar(50) =  null,
@descripcion nvarchar(100) =  null,
@esAdmin bit  = null,
@orden nvarchar(100) =  null,

@consultaComplicada nvarchar(2000) = null

AS
BEGIN

	SET NOCOUNT ON;
	
declare @consulta varchar(2000)





set @consulta = ' select distinct CodigoCuenta, CuentaDescripcion, nombre_cliente from Mayorizacion3 '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


--declare @est varchar (1)
--if @estado is not null 
--begin
--set @est = @estado
--end

declare @esAdm varchar (1)
if @esAdmin is not null 
begin
set @esAdm = @esAdmin
end




declare @aux int
set @aux = 0 
		
if @id is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CodigoCuenta =  ' +  CAST ( @id as  varchar (8) )
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CodigoCuenta = ' +  CAST ( @id as  varchar (8) )
				end
		end
	
	
	if @descripcion is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CuentaDescripcion LIKE  ''%' + @descripcion  + '%'' '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CuentaDescripcion LIKE  ''%' + @descripcion  + '%'' '
				end
		end
	
		 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
					end
			end
	
	
	set @consulta = @consulta + 'order by CodigoCuenta asc'
		
	exec (@consulta)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_clientes]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_clientes]
@id int =  null,
@userName nvarchar(50) =  null,
@contraseña nvarchar(50) =  null,
@nombreApellido nvarchar(100) =  null,
@esAdmin bit  = null,
@orden nvarchar(100) =  null,

@consultaComplicada nvarchar(2000) = null

AS
BEGIN

	SET NOCOUNT ON;
	
declare @consulta varchar(2000)

set @consulta = N'select id_cliente, nombre_cliente, direccion_cliente, rubro_cliente  '
set @consulta = @consulta  + 'from Clientes '


declare @esAdm varchar (1)
if @esAdmin is not null 
begin
set @esAdm = @esAdmin
end




declare @aux int
set @aux = 0 			
	
	
	if @nombreApellido is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and nombre_cliente LIKE  ''%' + @nombreApellido  + '%'' '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where nombre_cliente LIKE  ''%' + @nombreApellido  + '%'' '
				end
		end
	
			
		
		if @id is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and id_cliente =  ' +  CAST ( @id as  varchar (8) )
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where id_cliente = ' +  CAST ( @id as  varchar (8) )
				end
		end			

		
	exec (@consulta)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_AsientosMayoresMontos]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_AsientosMayoresMontos]

@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


	declare @consulta varchar(3000)
	
	set @consulta = ' select distinct top 10 TransaccionId,EffectiveDate,TiposComprobante.codigo_comprobante,AccountCode, '
	set @consulta = @consulta + ' Cuentas.Description ,NetAmount,DocumentType,JournalDescription,LineDescription, Movimiento.Descripcion as movimiento,'
	set @consulta = @consulta + ' CreatedDate, nombreApellido_usuario, cargo' 
	set @consulta = @consulta + ' from TablaPrincipal'
	set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario'
	set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta'
	set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante' 
	set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento'
	
	
	
	declare @aux int
		set @aux = 0
		
		if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ '''' 
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
				end
		end
		
		
		if @cuenta is not null
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
					end
				else	
					begin
						set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
						set @aux = 1
					end
			end
	
	set @consulta = @consulta + ' order by NetAmount desc'
	

	
	exec(@consulta)
	
	
	--select top 15 TransaccionId,EffectiveDate,TiposComprobante.codigo_comprobante,AccountCode, 
	--Cuentas.Description ,NetAmount,DocumentType,JournalDescription,LineDescription, Movimiento.Descripcion as movimiento,
	--CreatedDate, nombreApellido_usuario, cargo
	--from TablaPrincipal
	--left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
	--left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
	--left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
	--left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
	--order by NetAmount desc


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_FechasCercanasAlCierre]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_FechasCercanasAlCierre]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@fechaDesdeDespues varchar(20) = null,
	@fechaHastaDespues varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, '
set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
set @consulta = @consulta + ' codigo_comprobante,AccountCode, Cuentas.Description, NetAmount, DocumentType, JournalDescription, LineDescription, '
set @consulta = @consulta + ' nombreApellido_usuario, CreatedDate, Movimiento.Descripcion '
set @consulta = @consulta + ' from TablaPrincipal ' 
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '


 declare @aux int
 
 set @aux = 0
 

 
 
			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						
					end
			end 
			
			---------------------------------------------------
			
			if @fechaDesdeDespues is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' or CreatedDate >=  ''' +  CAST ( @fechaDesdeDespues as  varchar (12) ) + ''''
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' and CreatedDate >=   ''' +  CAST ( @fechaDesdeDespues as  varchar (12) ) + ''''
						
						
					end
			end 
			
			
			if @fechaHastaDespues is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHastaDespues as  varchar (12) ) + ''''
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHastaDespues as  varchar (12) ) + ''''
						
						
					end
			end 
			
			---------------------------------------------------
			
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						
						
					end
			end
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							
							
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
														
						end
				end
		
		set @consulta = @consulta + ' order by CreatedDate asc '
		
		exec(@consulta)
		


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_FechaDistintaCarga]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_FechaDistintaCarga]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)


set @consulta = ' select TransaccionId, '
set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
set @consulta = @consulta + ' AccountCode, Cuentas.Description , NetAmount, JournalDescription, DocumentType, LineDescription, CreatedDate,  '
set @consulta = @consulta + ' nombreApellido_usuario, Movimiento.Descripcion,codigo_comprobante '  
set @consulta = @consulta + ' from TablaPrincipal ' 
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '

declare @aux int

set @aux = 0

if @fechaDesde is null	
			if @fechaHasta is null
				if @comprobante is null
					if @cuenta is null	
						begin
							set @consulta = @consulta + ' where CreatedDate != EffectiveDate '
						end
							
	if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (CreatedDate != EffectiveDate) '
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (CreatedDate != EffectiveDate) '
						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (CreatedDate != EffectiveDate) '
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (CreatedDate != EffectiveDate) '
						
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and (CreatedDate != EffectiveDate) '
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and (CreatedDate != EffectiveDate) '
						
					end
			end
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and (CreatedDate != EffectiveDate) '
							
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and (CreatedDate != EffectiveDate) '
							
						end
				end
	
	
		set @consulta = @consulta + ' order by AccountCode asc '
	
		exec(@consulta)
		


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_Dias_NoLaborables]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_Dias_NoLaborables]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, '
set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
set @consulta = @consulta + ' codigo_comprobante,AccountCode, Cuentas.Description, NetAmount, DocumentType, JournalDescription, LineDescription, '
set @consulta = @consulta + ' nombreApellido_usuario, CreatedDate, Movimiento.Descripcion '
set @consulta = @consulta + ' from TablaPrincipal ' 
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '


 declare @aux int
 
 set @aux = 0
 
	if @fechaDesde is null
		if @fechaHasta is null	
			if @comprobante is null
				if @cuenta is null
					begin
						set @consulta = @consulta + ' where (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
					end
 
 
 if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
						
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
						
					end
			end
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							--set @consulta = @consulta + ' and (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
							
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
							--set @consulta = @consulta + ' and (DATEPART(DW,CreatedDate)=6) or (DATEPART(DW,CreatedDate)=7) '
							
						end
				end
	
	
		exec(@consulta)
		


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_CuentaUsoMinimo]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_CuentaUsoMinimo]

@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;

    declare @consulta varchar(3000)
    
    set @consulta = ' select TransaccionId,CreatedDate,AccountCode,Cuentas.Description ,COUNT(AccountCode) as cantidad ,  '
    set @consulta = @consulta + ' DateName( day , EffectiveDate) + DateName(  month , EffectiveDate) + DateName(  year , EffectiveDate) as fecha, '
    set @consulta =  @consulta + ' NetAmount, nombreApellido_usuario, DocumentType, JournalDescription, LineDescription, Movimiento.Descripcion, TiposComprobante.codigo_comprobante '
    set @consulta = @consulta + ' from TablaPrincipal'
    set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
    set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta'
    set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '
    set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
    
    declare @aux int
    
    set @aux = 0
    
     if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
				end
		end 
		
		
			 if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
				end
		end 
		
		 if @comprobante is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
				end
		end
		
		if @cuenta is not null	
		begin
			if @aux = 1
				begin 
					set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) ) 
				end
			else
				begin
					set @aux = 1
					set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) ) 
				end
		end
		
		
		

set @consulta = @consulta + ' group by AccountCode, NetAmount, nombreApellido_usuario, Cuentas.Description, CreatedDate,   '
set @consulta = @consulta + ' TransaccionId, DocumentType, JournalDescription, LineDescription, EffectiveDate, Movimiento.Descripcion, TiposComprobante.codigo_comprobante '
set @consulta = @consulta + ' having COUNT(AccountCode) <= 1 and NetAmount >= 10000 '
set @consulta = @consulta + ' order by NetAmount Desc'

exec(@consulta)
  
  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_Movimiento]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_Movimiento]
@id int = null,
@descripcion nvarchar(100) =  null,
@orden nvarchar(100) =  null,
@DDLnoCargados nvarchar(150) = null
AS
BEGIN

	SET NOCOUNT ON;
	
declare @consulta varchar(1000)
set @consulta = N' select id_movimiento, descripcion  from Movimiento   '



declare @aux int
set @aux = 0 
		
	 
	
		if  @descripcion is not null 
		begin
			 
			set @aux = 1 
			set @consulta = @consulta + ' Where Descripcion LIKE  ''%' + @descripcion  + '%'' '
	
				end
		

		if @id is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and id_movimiento  =  ' +  CAST ( @id as  varchar (8) )
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where id_movimiento  = ' +  CAST ( @id as  varchar (8) )
				end
		end
	
	if @orden is not null
		begin
			set @consulta = @consulta + ' ORDER BY  ' + @orden
		end
		
		if @DDLnoCargados is not null
		begin
			set @consulta = @consulta + ' where  id_movimiento not in ( select ' + @DDLnoCargados + ' ) '
		end
		
	exec (@consulta)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_ListaDeCuentasDeterminadas]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_ListaDeCuentasDeterminadas]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, AccountCode, Cuentas.Description, NetAmount, CreatedDate, DocumentType, '
	set @consulta = @consulta + ' DateName( day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha, '
	set @consulta = @consulta + ' JournalDescription, LineDescription, nombreApellido_usuario, cargo, Movimiento.Descripcion, TiposComprobante.codigo_comprobante '
	set @consulta = @consulta + ' from TablaPrincipal '
	set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
	set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '

	declare @aux int


	set @aux = 0

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_ImportesRedondos]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_ImportesRedondos]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @condicion varchar(3000)



	set @condicion = ' where NetAmount in ( '
	set @condicion = @condicion + ' 100, 1000, 10000, 100000, '
	set @condicion = @condicion + ' 200, 2000, 20000, 200000, '
	set @condicion = @condicion + ' 300, 3000, 30000, 300000, '
	set @condicion = @condicion + ' 400, 4000, 40000, 400000, '
	set @condicion = @condicion + ' 500, 5000, 50000, 500000, '
	set @condicion = @condicion + ' 600, 6000, 60000, 600000, '
	set @condicion = @condicion + ' 700, 7000, 70000, 700000, '
	set @condicion = @condicion + ' 800, 8000, 80000, 800000, '
	set @condicion = @condicion + ' 900, 9000, 90000, 900000 '
	set @condicion = @condicion + ' ) '
	
 
declare @condicion2 varchar(3000)

	set @condicion2 = ' and NetAmount in ( '
	set @condicion2 = @condicion2 + ' 100, 1000, 10000, 100000, '
	set @condicion2 = @condicion2 + ' 200, 2000, 20000, 200000, '
	set @condicion2 = @condicion2 + ' 300, 3000, 30000, 300000, '
	set @condicion2 = @condicion2 + ' 400, 4000, 40000, 400000, '
	set @condicion2 = @condicion2 + ' 500, 5000, 50000, 500000, '
	set @condicion2 = @condicion2 + ' 600, 6000, 60000, 600000, '
	set @condicion2 = @condicion2 + ' 700, 7000, 70000, 700000, '
	set @condicion2 = @condicion2 + ' 800, 8000, 80000, 800000, '
	set @condicion2 = @condicion2 + ' 900, 9000, 90000, 900000 '
	set @condicion2 = @condicion2 + ' ) '


declare @consulta varchar(3000)

set @consulta = ' select CreatedDate,codigo_comprobante ,AccountCode,Description, TransaccionId, ' 
set @consulta = @consulta + ' DATENAME(DAY,EffectiveDate) + DATENAME(MONTH,EffectiveDate) + DATENAME(YEAR,EffectiveDate) as fecha,'
set @consulta = @consulta + ' NetAmount,JournalDescription,LineDescription ,Usuarios.nombreApellido_usuario, '
set @consulta = @consulta + ' Movimiento.Descripcion from TablaPrincipal'
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario'
set @consulta = @consulta + ' LEFT join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento'
set @consulta = @consulta + ' LEFT join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante'




	declare @aux int
		set @aux = 0
		
		
		if @fechaDesde is null
			if @fechaHasta is null
				if @comprobante is null
					if @cuenta is null
						begin
							set @consulta = @consulta + @condicion
						end
		
		if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' 
					set @consulta = @consulta + @condicion2 
					
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ ''''  
					set @consulta = @consulta + @condicion2 
					
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
					set @consulta = @consulta + @condicion2 
					
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
					set @consulta = @consulta + @condicion2 
					
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
					set @consulta = @consulta + @condicion2 
				
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + @condicion2 
					
				end
		end
		
		if @cuenta is not null
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
						set @consulta = @consulta + @condicion2 
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where '  + CAST ( @cuenta as  varchar (max) )
						set @consulta = @consulta + @condicion2 
					end
			end
	

	
	exec(@consulta)


 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_Importes99]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_Importes99]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)

	set @consulta = ' select t.TransaccionId,t.CreatedDate, t.DocumentType, t.AccountCode, t.LineDescription,codigo_comprobante,Cuentas.Description, t.NetAmount, '
	set @consulta = @consulta + ' DATENAME(DAY,t.EffectiveDate) + DATENAME(MONTH,t.EffectiveDate) + DATENAME(YEAR,t.EffectiveDate) as fecha,'
	set @consulta = @consulta + ' Usuarios.nombreApellido_usuario,JournalDescription ,Movimiento.Descripcion from TablaPrincipal t'
	set @consulta = @consulta + ' left join Cuentas on t.AccountCode = Cuentas.id_cuenta'
	set @consulta = @consulta + ' left join Usuarios on t.UserId = Usuarios.Id_usuario'
	set @consulta = @consulta + ' left join Movimiento on t.Id_movimiento = Movimiento.Id_movimiento'
	set @consulta = @consulta + ' LEFT join TiposComprobante on t.TipoComprobante = TiposComprobante.id_comprobante '

	declare @aux int
			set @aux = 0
			
			
			if @fechaDesde is null
				if @fechaHasta is null
					if @comprobante is null
						if @cuenta is null
							begin
								set @consulta = @consulta + ' where NetAmount like ''%99'' and NetAmount like ''%99%'' '
							end
			
			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and t.CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''  
						set @consulta = @consulta + ' and NetAmount like ''%99'' and NetAmount like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where t.CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12))  + '''' 
						set @consulta = @consulta + ' and NetAmount like ''%99'' and NetAmount like ''%99%'' '
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and t.CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
						set @consulta = @consulta + ' and NetAmount like ''%99'' and NetAmount like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where t.CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
						set @consulta = @consulta + ' and NetAmount like ''%99'' and NetAmount like ''%99%'' '
					end
			end 
			
				 if @comprobante is not null	
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and t.TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
						set @consulta = @consulta + ' and NetAmount like ''%99'' and NetAmount like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where t.TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
						set @consulta = @consulta + ' and NetAmount like ''%99'' and NetAmount like ''%99%'' '
					end
			end
			
				if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and NetAmount like ''%99'' and NetAmount like ''%99%'' '
						end
					else
						begin
							set @aux = 1
							set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and NetAmount like ''%99'' and NetAmount like ''%99%'' '
						end
				end
			
								
		
		exec(@consulta)


	 
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_HorasNoHabituales2]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_HorasNoHabituales2]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

	set @consulta = ' select  TransaccionId, '	
	set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
	set @consulta = @consulta + ' AccountCode, Cuentas.Description , NetAmount, JournalDescription, DocumentType, LineDescription, CreatedDate,  '
	set @consulta = @consulta + ' nombreApellido_usuario, Movimiento.Descripcion,codigo_comprobante '
	set @consulta = @consulta + ' from TablaPrincipal '
	set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
	set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
	
	
	declare @aux int
	
	set  @aux = 0
	
		if @fechaDesde is null	
			if @fechaHasta is null
				if @comprobante is null
					if @cuenta is null	
						begin
							set @consulta = @consulta + ' where DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
						end
							
	if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and  (DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 )'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and  (DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 )'
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and  (DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 )'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and  (DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 )'
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and  (DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 )'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and  (DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 )'
					end
			end
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and  (DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 )'
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and  (DATEPART(HH,CreatedDate) > 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 )'
						end
				end
	
	
		exec(@consulta)
		


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_HorasNoHabituales]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_HorasNoHabituales]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

	set @consulta = ' select  TransaccionId, '	
	set @consulta = @consulta + ' DateName(  day , t.EffectiveDate) + ' + '''  ''' + ' + DateName(  month , t.EffectiveDate) + ' + '''  ''' + ' + DateName(  year , t.EffectiveDate) as fecha,  '
	set @consulta = @consulta + ' AccountCode,Cuentas.Description ,NetAmount,JournalDescription, DocumentType,LineDescription,CreatedDate,  '
	set @consulta = @consulta + ' Usuarios.nombreApellido_usuario, Movimiento.Descripcion,codigo_comprobante '
	set @consulta = @consulta + ' from TablaPrincipal '
	set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
	set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
	
	
	declare @aux int
	
	set  @aux = 0
	
	if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						--set @consulta = @consulta + ' and DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ ''''
						--set @consulta = @consulta + ' and DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
						--set @consulta = @consulta + ' and DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
						--set @consulta = @consulta + ' and DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						--set @consulta = @consulta + ' and DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						--set @consulta = @consulta + ' and DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
					end
			end
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							--set @consulta = @consulta + ' and DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
							--set @consulta = @consulta + ' and DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 and DATEPART(HH,CreatedDate) <= 23 '
						end
				end
	
	
		exec(@consulta)
		
		
		
		
		
	
	--set @consulta = @consulta + ' order by DATEPART(HH,CreatedDate) asc '



--select  CreatedDate,TransaccionId, AccountCode,Cuentas.Description ,NetAmount,JournalDescription,
--DATEPART(HH,CreatedDate) as Hora,
--Usuarios.nombreApellido_usuario, Movimiento.Descripcion from TablaPrincipal	
--left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
--left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
--left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
--where TablaPrincipal.CreatedDate >= @fechaDesde and TablaPrincipal.CreatedDate <= @fechaHasta
--and TipoComprobante = @comprobante
--or DATEPART(HH,CreatedDate) >= 0 and DATEPART(HH,CreatedDate) <= 9 or DATEPART(HH,CreatedDate) >= 18 
--and DATEPART(HH,CreatedDate) <= 23
--order by DATEPART(HH,CreatedDate) asc


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_RepeticionesMonto]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_RepeticionesMonto]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;

declare @consulta varchar(3000)

set @consulta = ' select TransaccionId,AccountCode,Cuentas.Description ,COUNT(NetAmount) as repeticiones, NetAmount '
set @consulta = @consulta + ' from TablaPrincipal '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '

declare @aux int
		set @aux = 0
		
		if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ '''' 
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
				end
		end
		
			if @cuenta is not null
			begin
				if @aux = 1
					begin	
						set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
					end
			end


	set @consulta = @consulta + ' group by TransaccionId, AccountCode, NetAmount, Cuentas.Description '
	set @consulta = @consulta + ' having COUNT(NetAmount) >= 2 '

exec (@consulta)


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_PorPeriodoDeterminado]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_PorPeriodoDeterminado]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, '
set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
set @consulta = @consulta + ' AccountCode, Cuentas.Description , NetAmount, JournalDescription, DocumentType, LineDescription, CreatedDate, '
set @consulta = @consulta + ' nombreApellido_usuario, Movimiento.Descripcion,codigo_comprobante '
set @consulta = @consulta + ' from TablaPrincipal '
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '

declare @aux int

set @aux = 0

						
	if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						
					end
			end
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
							
						end
				end
	
	exec(@consulta)
 

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_PocaDescripcion]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_PocaDescripcion]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;



declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, '
set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
set @consulta = @consulta + ' codigo_comprobante,AccountCode, Cuentas.Description, NetAmount, DocumentType, JournalDescription, LineDescription, '
set @consulta = @consulta + ' nombreApellido_usuario, CreatedDate, Movimiento.Descripcion '
set @consulta = @consulta + ' from TablaPrincipal '
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '


declare @aux int

set @aux = 0

	if @fechaDesde is null
		if @fechaHasta is null
			if @comprobante is null
				if @cuenta is null	
					begin
						set @consulta = @consulta  + ' where LEN(JournalDescription) <= 5 or LEN (LineDescription) <= 5 '
					end

 if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ( LEN(JournalDescription) <= 5 or LEN(LineDescription) <= 5  ) '											
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ( LEN(JournalDescription) <= 5 or LEN(LineDescription) <= 5  ) '											
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ( LEN(JournalDescription) <= 5 or LEN(LineDescription) <= 5  ) '											
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ( LEN(JournalDescription) <= 5 or LEN(LineDescription) <= 5  ) '											
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and ( LEN(JournalDescription) <= 5 or LEN(LineDescription) <= 5  ) '											
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and ( LEN(JournalDescription) <= 5 or LEN(LineDescription) <= 5  ) '											
					end
			end
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and ( LEN(JournalDescription) <= 5 or LEN(LineDescription) <= 5  ) '											
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and ( LEN(JournalDescription) <= 5 or LEN(LineDescription) <= 5  ) '											
						end
				end
	
	
		exec(@consulta)
		


--select CreatedDate, TransaccionId, AccountCode,Description, NetAmount, JournalDescription, 
--LineDescription, nombreApellido_usuario, Movimiento.Descripcion
-- from TablaPrincipal
-- left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
-- left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
-- left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
-- where TablaPrincipal.CreatedDate >= @fechaDesde and TablaPrincipal.CreatedDate <= @fechaHasta
-- and LEN(JournalDescription) <= 6
-- and TipoComprobante = @comprobante


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_Transaccion]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_Transaccion]
@id int =  null,
@userName nvarchar(50) =  null,
@contraseña nvarchar(50) =  null,
@nombreApellido nvarchar(100) =  null,
@esAdmin bit  = null,
@orden nvarchar(100) =  null,

@consultaComplicada nvarchar(2000) = null

AS
BEGIN

	SET NOCOUNT ON;
	
declare @consulta varchar(2000)
set @consulta = N'select p.AccountCode, c.Description ,p.NetAmount, p.EffectiveDate, p.CreatedDate,  p.DocumentType ,'
set @consulta = @consulta  +  ' u.nombreApellido_usuario, p.JournalDescription, p.LineDescription, m.descripcion  ' 
--set @consulta = @consulta  +  '  CASE u.adminContrasena WHEN 1 THEN ''A cambiar'' ELSE ''Cambiado'' END as admContrasena ,  ' 
--set @consulta = @consulta  + '  u.home,  u.stockVendedor,  u.ordenVenta,  u.consultasAux,  u.stockAdmin, '
--set @consulta = @consulta  + '  u.ordenCompra,  u.remitosProveedor,  u.remitosCliente,  '
--set @consulta = @consulta  + '  u.caja,  u.datosMaestros '
--set @consulta = @consulta  + '  '
--set @consulta = @consulta  + '  '
--set @consulta = @consulta  + ' , n.descripcion as nivel, n.id_nivel, UsNiv.id_usuario_nivel , ud.id_usuario_departamento  '
--set @consulta = @consulta  + ' , d.descripcion as departamento, d.id_departamento '
set @consulta = @consulta  + ' from TablaPrincipal p '
set @consulta = @consulta  + ' left join Usuarios u on p.UserId = u.id_usuario ' 
set @consulta = @consulta +  ' left join Movimiento m on p.Id_movimiento = m.Id_movimiento ' 
--set @consulta = @consulta + 'left join Cuentas c on p.AccountCode = c.id_cuenta'
		
	exec (@consulta)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TopTen]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TopTen]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;

declare @consulta  varchar(3000)

set @consulta = ' select top 10 TransaccionId, '
set @consulta = @consulta + ' DATENAME(DAY,EffectiveDate) + DATENAME(MONTH,EffectiveDate) + DATENAME(YEAR,EffectiveDate) as fecha, '
set @consulta = @consulta + ' codigo_comprobante, AccountCode, Cuentas.Description, NetAmount, '
set @consulta = @consulta + ' DocumentType, JournalDescription, LineDescription, CreatedDate,nombreApellido_usuario, Movimiento.Descripcion '
set @consulta = @consulta + ' from TablaPrincipal '
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante'
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario'
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta'
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '

declare @aux int
		set @aux = 0
		
		if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ '''' 
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
				end
		end
		
		if @cuenta is not null
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
					end
			end

 
set @consulta = @consulta + ' order by NetAmount desc'

exec (@consulta)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_SinDescripcion]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_SinDescripcion]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)


set @consulta = ' select TransaccionId, '
set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
set @consulta = @consulta + ' AccountCode, Cuentas.Description , NetAmount, JournalDescription, DocumentType, LineDescription, CreatedDate,  '
set @consulta = @consulta + ' nombreApellido_usuario, Movimiento.Descripcion,codigo_comprobante '  
set @consulta = @consulta + ' from TablaPrincipal ' 
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '

declare @aux int

set @aux = 0

if @fechaDesde is null	
			if @fechaHasta is null
				if @comprobante is null
					if @cuenta is null	
						begin
							set @consulta = @consulta + ' where (LineDescription is null or JournalDescription is null) '
						end
							
	if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + '  and (LineDescription is null or JournalDescription is null) '
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (LineDescription is null or JournalDescription is null) '
						
						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (LineDescription is null or JournalDescription is null) '
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and (LineDescription is null or JournalDescription is null) ' 
						
						
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and (LineDescription is null or JournalDescription is null) '
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						set @consulta = @consulta + ' and (LineDescription is null or JournalDescription is null) '
						
						
					end
			end
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and (LineDescription is null or JournalDescription is null) '
							
							
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
							set @consulta = @consulta + ' and (LineDescription is null or JournalDescription is null) '
						
							
						end
				end
	
	
		set @consulta = @consulta + ' order by AccountCode asc '
	
		exec(@consulta)
		


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TransaccionesPorUsuario]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TransaccionesPorUsuario]



@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null


AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = 'select nombreApellido_usuario, COUNT(TransaccionId) as cantidad '
set @consulta = @consulta + ' from TablaPrincipal '
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '


declare @aux int

set @aux = 0

if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ '''' 
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
				end
		end
		
			if @cuenta is not null
			begin
				if @aux = 1
					begin	
						set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
					end
			end
			
			
	set @consulta = @consulta + ' group by nombreApellido_usuario '  
	
	exec(@consulta)
	
 --select AccountCode,Cuentas.Description ,SUM(NetAmount) as total, Usuarios.nombreApellido_usuario from TablaPrincipal
 --left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
 --left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
 -- where TablaPrincipal.CreatedDate >= @fechaDesde and TablaPrincipal.CreatedDate <= @fechaHasta
 --group by Cuentas.Description,  nombreApellido_usuario, AccountCode
 --order by Description desc
 

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_HistogramaUsoCuentas]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_HistogramaUsoCuentas]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = ' select AccountCode, Cuentas.Description,  COUNT(AccountCode) as cantidad '
set @consulta = @consulta + ' from TablaPrincipal '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '


declare @aux int
set @aux = 0

		if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ ''''
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
				end
		end 
		
			 if @comprobante is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
				end
		end
		
		
					 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
		

set @consulta = @consulta + ' group by AccountCode, Cuentas.Description '


exec(@consulta)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TransaccionesPorUsuarioNoCorrespondeAlArea]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TransaccionesPorUsuarioNoCorrespondeAlArea]



@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null


AS
BEGIN

SET NOCOUNT ON;

declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, '
set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
set @consulta = @consulta + ' codigo_comprobante, AccountCode, Cuentas.Description, NetAmount, DocumentType, JournalDescription, LineDescription, '
set @consulta = @consulta + ' nombreApellido_usuario,cargo,email,CreatedDate, Movimiento.Descripcion '
set @consulta = @consulta + ' from TablaPrincipal '
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '



declare @aux int

set @aux = 0


	if @fechaDesde is null
		if @fechaHasta	is null
			if @comprobante is null
				if @cuenta is null	
					begin
						set  @consulta = @consulta + ' where cargo != ''programador '' '
					end

if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' 
					set @consulta = @consulta + ' and cargo  != '' programador '' '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ '''' 
					set @consulta = @consulta + '  and cargo  != '' programador '' '
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
					set @consulta = @consulta + ' and cargo  != '' programador ''  '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
					set @consulta = @consulta + '  and cargo  != '' programador ''  '
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + '  and cargo  != '' programador ''  '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + '  and cargo  != '' programador '' ' 
				end
		end
		
			if @cuenta is not null
			begin
				if @aux = 1
					begin	
						set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
						set @consulta = @consulta +  '  and cargo  != '' programador '' '
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
						set @consulta = @consulta + '  and cargo  != '' programador ''  ' 
					end
			end
			
			set @consulta = @consulta + ' order by CreatedDate asc'
	
	
	exec(@consulta)
	

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_ValoresMenoresParametro]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_ValoresMenoresParametro]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;

	declare @consulta varchar(3000)
	
	set @consulta = ' select TransaccionId, codigo_comprobante, AccountCode,Cuentas.Description,NetAmount, '
	set @consulta = @consulta + ' DateName( day , EffectiveDate) + DateName(  month , EffectiveDate) + DateName(  year , EffectiveDate) as fecha, '
	set @consulta = @consulta + ' DocumentType, JournalDescription, LineDescription, CreatedDate, nombreApellido_usuario, Movimiento.Descripcion '
	set @consulta = @consulta + ' from TablaPrincipal '
	set @consulta = @consulta + ' left join  TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
	set @consulta = @consulta + ' left join  Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
	set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario ' 
	
declare @aux int
set @aux = 0


	if @fechaDesde is null
		if @fechaDesde is null
			if @comprobante is null
				if @cuenta is null
					begin
						set @consulta = @consulta + ' where netAmount <= 5000'
					end

		if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					set @consulta = @consulta + ' and netAmount <= 5000 '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ '''' 
					set @consulta = @consulta + ' and netAmount <= 5000 '
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
					set @consulta = @consulta + ' and netAmount <= 5000 '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''
					set @consulta = @consulta + ' and netAmount <= 5000 '
				end
		end 
		
			 if @comprobante is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + ' and netAmount <= 5000 '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + ' and netAmount <= 5000 '
				end
		end
		
		if @cuenta is not null
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
					set @consulta = @consulta + ' and netAmount <= 5000 '
				end
			else	
				begin
					set @aux = 1
					set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
					set @consulta = @consulta + ' and netAmount <= 5000 '
				end
			
		end
		
		
		set @consulta = @consulta + ' order by NetAmount desc '
		
		exec(@consulta)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_Usuario]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_Usuario]
@id int =  null,
@userName nvarchar(50) =  null,
@contraseña nvarchar(50) =  null,
@nombreApellido nvarchar(100) =  null,
@esAdmin bit  = null,
@orden nvarchar(100) =  null,

@consultaComplicada nvarchar(2000) = null

AS
BEGIN

	SET NOCOUNT ON;
	
declare @consulta varchar(2000)
set @consulta = N'select u.id_usuario, u.username, u.contraseña, u.nombreapellido_usuario,  u.email , u.esAdmin, u.fecha_alta,u.cargo  '
--set @consulta = @consulta  +  '  u.esAdmin, u.id_cargo,  u.estado, u.id_d, d.descripcion as departamento, ' 
--set @consulta = @consulta  +  '  CASE u.adminContrasena WHEN 1 THEN ''A cambiar'' ELSE ''Cambiado'' END as admContrasena ,  ' 
--set @consulta = @consulta  + '  u.home,  u.stockVendedor,  u.ordenVenta,  u.consultasAux,  u.stockAdmin, '
--set @consulta = @consulta  + '  u.ordenCompra,  u.remitosProveedor,  u.remitosCliente,  '
--set @consulta = @consulta  + '  u.caja,  u.datosMaestros '
--set @consulta = @consulta  + '  '
--set @consulta = @consulta  + '  '
--set @consulta = @consulta  + ' , n.descripcion as nivel, n.id_nivel, UsNiv.id_usuario_nivel , ud.id_usuario_departamento  '
--set @consulta = @consulta  + ' , d.descripcion as departamento, d.id_departamento '
set @consulta = @consulta  + 'from Usuarios u '
--set @consulta = @consulta  +  ' left join departamento d on u.id_d = d.id_d ' 
--set @consulta = @consulta  +  ' left join Unidad_De_Negocio  un on  u.id_unidad_de_negocio =  un.id_unidad_de_negocio ' 
--set @consulta = @consulta  +  ' left join Usuario_Nivel UsNiv on UsNiv.id_usuario = u.id_usuario ' 
--set @consulta = @consulta  +  ' left join Nivel n on UsNiv.id_nivel = n.id_nivel ' 
--set @consulta = @consulta  +  ' left join Usuario_Departamento ud on ud.id_usuario =  u.id_usuario ' 
--set @consulta = @consulta  +  ' left join dbo.Departamento d on  d.id_departamento = ud.id_departamento ' 


--declare @est varchar (1)
--if @estado is not null 
--begin
--set @est = @estado
--end

declare @esAdm varchar (1)
if @esAdmin is not null 
begin
set @esAdm = @esAdmin
end




declare @aux int
set @aux = 0 
		
	if  @userName is not null 
		begin
			set @aux = 1 
			set @consulta = @consulta + ' Where u.username LIKE  ''%' + @userName  + '%'' '
		end
	
	
	if @nombreApellido is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and u.nombreapellido_usuario LIKE  ''%' + @nombreApellido  + '%'' '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where u.nombreapellido_usuario LIKE  ''%' + @nombreApellido  + '%'' '
				end
		end
	
	
	
		if @contraseña is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and u.contraseña LIKE  ''%' + @contraseña  + '%'' '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where u.contraseña LIKE  ''%' + @contraseña  + '%'' '
				end
		end
	
	
	if @esAdmin is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and u.esAdmin =  ' + @esAdm   
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where u.esAdmin = ' + @esAdm  
				end
		end
		
		--if @idCargo is not null 
		--begin
		--	if @aux = 1
		--		begin
		--			set @consulta = @consulta + ' and u.id_cargo =  ' + CAST ( @idCargo as  varchar (8) )
				
		--		end
		--	else
		--		begin
		--			set @aux = 1 
		--			set @consulta = @consulta + ' where u.id_cargo = ' + CAST ( @idCargo as  varchar (8) )
		--		end
		--end
		
		if @id is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and u.id_usuario =  ' +  CAST ( @id as  varchar (8) )
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where u.id_usuario = ' +  CAST ( @id as  varchar (8) )
				end
		end
		
		
	--if @estado is not null 
	--	begin
	--		if @aux = 1
	--			begin
	--				set @consulta = @consulta + ' and u.estado =  ' + @est
	--			end
	--		else
	--			begin
	--				set @consulta = @consulta + ' where u.estado =  ' + @est
	--				set @aux = 1
	--			end
	--	end

	--if @DDLnoCargados is not null
	--	begin
	--		set @consulta = @consulta + ' where  u.id_usuario not in ( select ' + @DDLnoCargados + ' ) '
	--	set @aux = 1
	--	end
	
	
	if @consultaComplicada is not null
		begin
			set @consulta = @consulta + ' where ' + @consultaComplicada  
		set @aux = 1
		end
	
	if @orden is null 
		begin
			set @consulta = @consulta + ' ORDER BY  u.nombreapellido_usuario ' 
		end
		
		if @orden is not null 
		begin
			set @consulta = @consulta + ' ORDER BY  ' + @orden
		end
		
	--if @aux = 1
	--			begin
	--				set @consulta = @consulta + ' and esAdmin <> 1 '
				
	--			end
	--	else
	--			begin
	--				set @aux = 1 
	--				set @consulta = @consulta + ' where esAdmin <> 1 '
	--			end
				
				
	
		--if @orden is not null and @consultaComplicada is null
		--begin
		--	set @consulta = @consulta + ' ORDER BY  ' + @orden
		--end
		--if @orden is not null and @consultaComplicada is not null
		--begin
		--	set @consulta = @consulta + ' ORDER BY n.id_nivel desc, ' + @orden
		--end
		
		
		--if @orden is null and @consultaComplicada is null
		--begin
		--	set @consulta = @consulta + ' ORDER BY  u.nombreapellido_usuario ' 
		--end
		
		--if @orden is null and @consultaComplicada is not null
		--begin
		--	set @consulta = @consulta + ' ORDER BY  n.id_nivel desc, u.nombreapellido_usuario ' 
		--end
		
	exec (@consulta)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_CuentasMasImputadas]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_CuentasMasImputadas]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)


set @consulta = ' select top 25 CodigoCuenta , CuentaDescripcion , COUNT(CodigoCuenta) as Imputadas '
set @consulta = @consulta + ' from Mayorizacion3 '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


declare @aux int


	set @aux = 0

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
						
					end
			end	
			
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
		
set @consulta = @consulta + ' group by CodigoCuenta, CuentaDescripcion '
set @consulta = @consulta + ' having COUNT(CodigoCuenta) >= 5 '
set @consulta = @consulta + ' order by COUNT(CodigoCuenta) desc '

exec(@consulta)


  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_CuentaSinMovimientoDETALLE]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_CuentaSinMovimientoDETALLE]


@nroTransaccion varchar(20) = null,
	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@codigoComprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@comprobante varchar(20) = null,	
	@codigoCuenta varchar(20) = null,
	@monto varchar(20) = null


AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario '
set @consulta = @consulta + ' from Mayorizacion3 '
set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


declare @aux int

set @aux = 0
				
				
				if @codigoCuenta is not null
				begin
					if @aux	= 1
						begin
							set @consulta = @consulta + ' and CodigoCuenta  =  ''' +  CAST ( @codigoCuenta as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1
							set @consulta = @consulta + ' where CodigoCuenta  = ''' +  CAST ( @codigoCuenta as  varchar (20) )  + ''''																								
						end
				end	
				
				if @nroTransaccion is not null
				begin
					if @aux	= 1
						begin
							set @consulta = @consulta + ' and  TransaccionId =  ''' +  CAST ( @nroTransaccion as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1
							set @consulta = @consulta + ' where TransaccionId  = ''' +  CAST ( @nroTransaccion as  varchar (20) )  + ''''																								
						end
				end			

				if @fechaDesde is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						end
				end 
				
				
					if @monto is not null
				begin
					if @aux	= 1
						begin
							set @consulta = @consulta + ' and  MontoNeto =  ''' +  REPLACE( CAST ( @monto as  varchar(20)  ),',','.' )  + ''''																								
						end
					else
						begin
							set @aux = 1
							set @consulta = @consulta + ' where MontoNeto  = ''' + REPLACE( CAST ( @monto as  varchar(20)  ),',','.' )  + ''''																								
						end
				end	
				


				if @fechaHasta is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						end
				end 
				

				 if @comprobante is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						end
				end						
					
				if @cliente is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Clientes.id_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Clientes.id_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																								
						end
				end
				
				
				exec(@consulta)
				
				--print(@consulta)



END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_CuentaConSaldoSinMovimiento]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_CuentaConSaldoSinMovimiento]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null
	
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = ' select CodigoCuenta, CuentaDescripcion, COUNT(Id_movimiento) as cantidad '
	set @consulta = @consulta + ' from Mayorizacion3 '
	
	declare @aux int
	set @aux = 0

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
			
			
			--	if @importe is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and MontoNeto <=  ''' +  CAST ( @importe as  varchar (12) ) + ''''
					
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where MontoNeto <=  ''' +  CAST ( @importe as  varchar (12) ) + ''''
			--		end
			--end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
			
			set @consulta = @consulta + ' group by CodigoCuenta, CuentaDescripcion '
			set @consulta = @consulta + ' having COUNT(Id_movimiento) = 1 '
			set @consulta = @consulta + ' order by CodigoCuenta asc '
			
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_CuentaConMovimientoSaldoCero]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_CuentaConMovimientoSaldoCero]

@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null

AS 
BEGIN

SET NOCOUNT ON;

	declare @consulta varchar(3000)
	
	set @consulta = ' select CodigoCuenta, CuentaDescripcion,'
	set @consulta = @consulta + ' SUM(case when Id_movimiento = 1 then MontoNeto else 0 end) as Debitos, '
	set @consulta = @consulta + ' SUM(case when Id_movimiento = 2 then MontoNeto else 0 end) as Creditos, '
	set @consulta = @consulta + ' SUM(case when Id_movimiento = 2 then MontoNeto * -1 else MontoNeto end) as Diferencia '
	set @consulta = @consulta + ' from Mayorizacion3  '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	
	declare @aux int
	set @aux = 0
		

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''						
					end
			end 
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''						
					end
			end	
			
			--	 if @comprobante is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''						
					
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''						
			--		end
			--end
			
			--	 if @cuenta is not null 
			--begin
			--	if @aux = 1
			--		begin						
			--			set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																												
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																													
			--		end
			--end			
			
			
			set @consulta = @consulta + ' group by CodigoCuenta, CuentaDescripcion '
			
			set @consulta = @consulta + ' HAVING SUM(case when Id_movimiento = 2 then MontoNeto * -1 else MontoNeto end) = 0 and COUNT(CuentaDescripcion) > 1 '
			
			set @consulta = @consulta + ' order by CodigoCuenta asc '
			
						 
			exec(@consulta)
			
			--print(@consulta)							

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_AsientosMayoresMontos]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_AsientosMayoresMontos]

@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null,
@importeDesde varchar(max) = null,
@importeHasta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;
	
	
	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '

	
	declare @aux int
	set @aux = 0
			

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion between  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion between  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and '''  +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
			
			--if @fechaHasta is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
			--		end
			--end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
						
					end
			end	
			
				if @importeDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and MontoNeto not between ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where MontoNeto not between ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
					end
			end 
			
			
			--	if @importeHasta is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and MontoNeto > ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''						
					
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where MontoNeto >  ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
			--		end
			--end 
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end							
	
	set @consulta = @consulta + ' order by Fecha_Creacion asc'	
	
	exec(@consulta)
	--print(@consulta)
	

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_ValoresMenoresParametro]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_ValoresMenoresParametro]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null,
@cliente varchar(20) = null,
@limite varchar(20) = null

AS
BEGIN

SET NOCOUNT ON;

	declare @consulta varchar(3000)
	
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '

		declare @aux int							
		
			set @aux = 0											
			
			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''																							
					end
					
				else
				
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''																
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''																							
					end
					
				else
				
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''					
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
																				
					end
					
				else
				
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''						
						
					end
			end
			
		if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''						
					end
			end							
			
				if @limite is not null
					begin
						if @aux = 1
							begin
								set @consulta = @consulta + ' and MontoNeto > (' + CAST ( @limite as varchar (20)) + ' * 0.95) '
								set @consulta = @consulta + ' and MontoNeto < ' + CAST ( @limite as varchar (20))   
							end
						else
							begin
								set @aux = 1
								set @consulta = @consulta + ' where MontoNeto > (' + CAST ( @limite as varchar (20)) + ' * 0.95) '
								set @consulta = @consulta + ' and MontoNeto <  ' + CAST ( @limite as varchar (20))  
							end
					end
					
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																															
					end
					
				else
				
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																																
												
					end
			end			
			
			set @consulta = @consulta + ' order by MontoNeto desc '
									 
		 exec(@consulta)
	 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_ValoresInusuales]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_ValoresInusuales]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @condicion3 varchar(3000)
set  @condicion3 = ' where MontoNeto in ( ''123'',''1234'',''12345'',''123456'',''1234567'',''12345678'',''123456789'', ''0123'',''01234'',''012345'',''0123456'',''01234567'',''012345678'',''0123456789'', ''456'',''4567'',''45678'',''456789'', ''0456'',''04567'',''045678'',''0456789'', ''789'',''789123'',''789456'',''789789'', ''0789'',''0789123'',''0789456'',''0789789'',''1111 '',''2222 '',''3333 '',''4444'',''5555 '',''6666 '',''7777 '',''8888 '',''9999 '' )'


--set  @condicion3 = ' where MontoNeto in ( ''123,00'',''1234,00'',''12345,00'',''123456,0,'',''1234567,00'',''12345678,00'',''123456789,00'', ''0123,00'',''01234,00'',''012345,00'',''0123456,00'',''01234567,00'',''012345678,00'',''0123456789,00'', ''456,00'',''4567,00'',''45678,00'',''456789,00'', ''0456,00'',''04567,00'',''045678,00'',''0456789,00'', ''789,00'',''789123,00'',''789456,00'',''789789,00'', ''0789,00'',''0789123,00'',''0789456,00'',''0789789,00'' )'

--declare @condicion varchar(3000)

--	set @condicion = ' where TransaccionId in ( ''123'',''1234'',''12345'',''123456'',''1234567'',''12345678'',''123456789'', ''0123'',''01234'',''012345'',''0123456'',''01234567'',''012345678'',''0123456789'',  ''456'',''4567'',''45678'',''456789'', ''0456'',''04567'',''045678'',''0456789'', ''789'',''789123'',''789456'',''789789'', ''0789'',''0789123'',''0789456'',''0789789'' )  '
--	--set @condicion = @condicion + '  '
--	--set @condicion = @condicion + '  '
	--set @condicion = @condicion + '  '
	--set @condicion = @condicion + '  '
	--set @condicion = @condicion + '  '
	--set @condicion = @condicion + '  '	
	--set @condicion = @condicion + ' ) '
	
 
declare @condicion2 varchar(3000)

	set @condicion2 = ' and MontoNeto in ( ''123'',''1234'',''12345'',''123456'',''1234567'',''12345678'',''123456789'', ''0123'',''01234'',''012345'',''0123456'',''01234567'',''012345678'',''0123456789'', ''456'',''4567'',''45678'',''456789'', ''0456'',''04567'',''045678'',''0456789'', ''789'',''789123'',''789456'',''789789'', ''0789'',''0789123'',''0789456'',''0789789'',''1111 '',''2222 '',''3333 '',''4444'',''5555 '',''6666 '',''7777 '',''8888 '',''9999 '' )'		

	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '




	declare @aux int
		set @aux = 0
		
		
		--if @fechaDesde is null
		--	if @fechaHasta is null
		--		if @comprobante is null
		--			if @cuenta is null
		--				begin
		--					set @consulta = @consulta + @condicion3
		--				end
		
		if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + @condicion2 
					end
			end
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
						set @consulta = @consulta + @condicion2 
					end
			end	
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + @condicion2 
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + @condicion2 
					end
			end			
			
	exec(@consulta)
 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_TransaccionesUsuarioNuevo]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_TransaccionesUsuarioNuevo]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null,
	@usuario varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int
	set @aux = 0
	
	
			--if @fechaDesde is null	
			--	if @fechaHasta is null	
			--		if @comprobante is null	
			--			if @cuenta is null	
			--			begin
			--				set  @consulta = @consulta + '  where DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
			--			end

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					end
			end
			
			
				 if @usuario is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombreApellido_usuario   =  ''' +  CAST ( @usuario as  varchar (20) ) + ''''
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombreApellido_usuario  = ''' +  CAST ( @usuario as  varchar (20) )  + ''''
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					end
			end
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''												
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''												
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						--set  @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '						
					end
			end			
			
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_TransaccionesUsuarioNoCorrrespondeArea]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_TransaccionesUsuarioNoCorrrespondeArea]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Efectiva,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, '
	set @consulta = @consulta + ' cargo, email, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int
	set @aux = 0
	
	
			if @fechaDesde is null	
				if @fechaHasta is null	
					if @comprobante is null	
						if @cuenta is null	
						begin
							set  @consulta = @consulta + ' where cargo != ''contador '' '
						end

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					end
			end
			
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																		
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																		
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set  @consulta = @consulta + ' and cargo != ''contador '' '
					end
			end			
			
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_TransaccionesPorUsuario]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_TransaccionesPorUsuario]



@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null


AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = ' select nombreApellido_usuario, COUNT(TransaccionId) as cantidad, CodigoComprobante '
set @consulta = @consulta + ' from Mayorizacion3 '
set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


declare @aux int

set @aux = 0

if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''												
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''												
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
			
	set @consulta = @consulta + ' group by nombreApellido_usuario, CodigoComprobante '  
	set @consulta = @consulta + ' order by cantidad desc'
	
	exec(@consulta) 
	--print(@consulta)
	
 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_TotalTransaccionesPorUsuarioDETALLE]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_TotalTransaccionesPorUsuarioDETALLE]

	@usuario varchar(20) = null,
	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@codigoComprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@comprobante varchar(20) = null,
	@codigoCuenta varchar(20) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion ,LineaDescripcion, '
set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
set @consulta = @consulta + ' from Mayorizacion3 '
set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '

declare @aux int

set @aux = 0

			if @fechaDesde is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						end
				end 				

				if @fechaHasta is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						end
				end 
				

				 if @comprobante is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						end
				end						
					
				if @cliente is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Clientes.id_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Clientes.id_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																								
						end
				end
				
					if @usuario is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and  nombreApellido_usuario  =  ''' +  CAST ( @usuario as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where nombreApellido_usuario  = ''' +  CAST ( @usuario as  varchar (20) )  + ''''																								
						end
				end
				
				
					exec(@consulta)
					
					--print(@consulta)


END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_TopTen]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_TopTen]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;

declare @consulta varchar(3000)

	set @consulta = N' select top 10 TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '
	
		declare @aux int
			set @aux = 0
								
			
			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''											
					end
				else
					begin
						set @aux = 1 
						set @consulta =  @consulta + ' where MontoNeto in( select MontoNeto from Mayorizacion3 group by MontoNeto having COUNT(MontoNeto) = 1) '
						set @consulta = @consulta + ' and Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						
					end
			end
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''						
					end
			end	
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						
					end
			end			
			
			
			
			set @consulta = @consulta + ' order by MontoNeto desc'
			
						 
			exec(@consulta)



END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_SinDescripcion]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_SinDescripcion]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int
	set @aux = 0
	


			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
						
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''						
						
					end
			end
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																								
												
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																														
						
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																												
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																													
						
					end
			end			
			
				--set @consulta = @consulta + ' and ( LineaDescripcion is null or JornalDescripcion is null )'
				set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 4 or LEN (JornalDescripcion) <= 4 )'	 
				
			exec(@consulta)
			
			--print(@consulta)	


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_SaldoSinMovimiento]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_SaldoSinMovimiento]

	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@fechaDesdeDespues varchar(20) = null,
	@fechaHastaDespues varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null,
	@importeDesde varchar(max) = null,
	@importeHasta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;

declare @consulta varchar(3000)

set @consulta = ' select CodigoCuenta,MontoNeto, CuentaDescripcion, COUNT(Id_movimiento) as cantidadMovimiento '
set @consulta = @consulta + ' from Mayorizacion3 '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


 declare @aux int
 
 set @aux = 0
 
 --set @consulta = @consulta + ' where CodigoCuenta in (select CodigoCuenta from Mayorizacion3 group by CodigoCuenta having COUNT(CodigoCuenta) = 1) '
 
				if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion between  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoCuenta in (select CodigoCuenta from Mayorizacion3 group by CodigoCuenta having COUNT(CodigoCuenta) = 1) '
						set @consulta = @consulta + ' and Fecha_Creacion between  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and '''  +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
			
			--if @fechaHasta is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
																	
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						
			--		end
			--end 
			
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
					end
			end		
			
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) )
						
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) )
						
						
					end
			end
			
			
				if @importeDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and MontoNeto not between ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where MontoNeto not between ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
					end
			end 
			
			--	if @importeDesde is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and MontoNeto <  ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''												
					
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where MontoNeto <  ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
												
			--		end
			--end 
			
			
			--	if @importeHasta is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and MontoNeto >  ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''												
					
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where MontoNeto >  ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
												
			--		end
			--end 
			
			if @cuenta is not null
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
							
							
						end
					else
						begin
							set  @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
														
						end
				end
		
		set @consulta = @consulta + ' group by CodigoCuenta , CuentaDescripcion, MontoNeto '		
		set @consulta = @consulta + ' order by MontoNeto desc '
		exec(@consulta)
		--print(@consulta)
		


END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_RepeticionesMontoDETALLE]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_RepeticionesMontoDETALLE]

	@nroTransaccion varchar(20) = null,
	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@codigoComprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@comprobante varchar(20) = null,	
	@codigoCuenta varchar(20) = null,
	@monto varchar(200) = null

AS
BEGIN

SET NOCOUNT ON;



declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, fecha_contabilizacion,LineaDescripcion,MontoNeto, '
set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
set @consulta = @consulta + ' from Mayorizacion3 '
set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '

declare @aux int

set @aux = 0


	if @codigoCuenta is not null
				begin
					if @aux	= 1
						begin
							set @consulta = @consulta + ' and CodigoCuenta  =  ''' +  CAST ( @codigoCuenta as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1
							set @consulta = @consulta + ' where CodigoCuenta  = ''' +  CAST ( @codigoCuenta as  varchar (20) )  + ''''																								
						end
				end	
				
				if @nroTransaccion is not null
				begin
					if @aux	= 1
						begin
							set @consulta = @consulta + ' and  TransaccionId =  ''' +  CAST ( @nroTransaccion as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1
							set @consulta = @consulta + ' where TransaccionId  = ''' +  CAST ( @nroTransaccion as  varchar (20) )  + ''''																								
						end
				end			

				if @fechaDesde is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						end
				end 
				


				if @fechaHasta is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						end
				end 
				

				 if @comprobante is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						end
				end						
					
				if @cliente is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Clientes.id_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Clientes.id_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																								
						end
				end
				
				
				if @monto is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and MontoNeto   =  ''' +  REPLACE( CAST ( @monto as  varchar(20)  ),',','.' )  + ''''																								
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where MontoNeto  = ''' +  REPLACE( CAST ( @monto as  varchar(20)  ),',','.' )  + ''''																								
						end
				end
				
				
				
				exec(@consulta)
				--print(@consulta)


END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_RepeticionesMonto]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_RepeticionesMonto]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;

declare @consulta varchar(3000)

set @consulta = ' select CodigoCuenta,CuentaDescripcion,MontoNeto, COUNT(MontoNeto) as cantidadRepeticiones, nombre_cliente '
set @consulta = @consulta + ' from Mayorizacion3 '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '



	declare @aux int


	set @aux = 0

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																								
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																								
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			


	set @consulta = @consulta + ' group by MontoNeto, CodigoCuenta,CuentaDescripcion, nombre_cliente '
	set @consulta = @consulta + ' having COUNT(MontoNeto) > 1 '
	set @consulta = @consulta + ' order by COUNT(MontoNeto) desc '

exec (@consulta)


END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_PocaDescripcion]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_PocaDescripcion]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int
	set @aux = 0
	
			if @fechaDesde is null
				if @fechaHasta is null
					if @comprobante is null
						if @cuenta is null	
							if @cliente is null
							begin
								set @consulta = @consulta  + ' where LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 '
							end

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					end
			end
			
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																								
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																								
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta  + ' and ( LEN(LineaDescripcion) <= 5 or LEN (JornalDescripcion) <= 5 )'
					end
			end			
			
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_PalabrasClave]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_PalabrasClave]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null,
	@palabra varchar(max) = null,
	@palabraJornal varchar(max) = null
	

	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int
	set @aux = 0
										

			if @fechaDesde is not null 
			begin								
				if @aux = 1
					begin					
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''						
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''						
				end											
			end 
			
			
			if @fechaHasta is not null 
			begin			
					
					
				if @aux = 1
					begin					
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''						
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where Fecha_Creacion <=   ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''						
					end
					
						
			end 
			
			
			
				 if @comprobante is not null 
			begin
				
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''						
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''						
					end							
								
				end
			
			
				 if @cliente is not null 
			begin										
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																														
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																														
				end
					
			end
			
			if @palabra is not null
				begin
					if @aux = 1
						begin 
							set @consulta = @consulta + ' and LineaDescripcion like ''%' + CAST (@palabra as varchar (12) ) + '%'''												
						end
					else
						begin
							set @aux = 1						
							set @consulta = @consulta + ' where LineaDescripcion like ''%' + CAST (@palabra as varchar (12) ) + '%'''
						end																				
			end	
				
				if @palabraJornal is not null
				begin
					if @aux = 1
						begin 
							set @consulta = @consulta + ' and JornalDescripcion like ''%' + CAST (@palabraJornal as varchar (12) ) + '%'''												
						end
					else
						begin
							set @aux = 1						
							set @consulta = @consulta + ' where JornalDescripcion like ''%' + CAST (@palabraJornal as varchar (12) ) + '%'''
					end																				
				end	
								
			
		if @cuenta is not null 
			begin

				
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																											
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																													
					end
													
		end			
			
			
			set @consulta = @consulta + ' order by Fecha_Creacion asc '															
			 
						 
			exec(@consulta)
			--print(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_ListaDeCuentasDeterminadas]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_ListaDeCuentasDeterminadas]


	@fechaDesde varchar(20) = null,
	@cliente varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario,nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int


	set @aux = 0
	
	
		 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
					end
			end

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
			set @consulta = @consulta + ' order by Fecha_Creacion asc '
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_ImportesRedondosOrdenTransaccion]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_ImportesRedondosOrdenTransaccion]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @condicion varchar(3000)



	set @condicion = ' where MontoNeto in ( '
	set @condicion = @condicion + ' 100, 1000, 10000, 100000, '
	set @condicion = @condicion + ' 200, 2000, 20000, 200000, '
	set @condicion = @condicion + ' 300, 3000, 30000, 300000, '
	set @condicion = @condicion + ' 400, 4000, 40000, 400000, '
	set @condicion = @condicion + ' 500, 5000, 50000, 500000, '
	set @condicion = @condicion + ' 600, 6000, 60000, 600000, '
	set @condicion = @condicion + ' 700, 7000, 70000, 700000, '
	set @condicion = @condicion + ' 800, 8000, 80000, 800000, '
	set @condicion = @condicion + ' 900, 9000, 90000, 900000 '
	set @condicion = @condicion + ' ) '
	
 
declare @condicion2 varchar(3000)

	set @condicion2 = ' and MontoNeto in ( '
	set @condicion2 = @condicion2 + ' 100, 1000, 10000, 100000, '
	set @condicion2 = @condicion2 + ' 200, 2000, 20000, 200000, '
	set @condicion2 = @condicion2 + ' 300, 3000, 30000, 300000, '
	set @condicion2 = @condicion2 + ' 400, 4000, 40000, 400000, '
	set @condicion2 = @condicion2 + ' 500, 5000, 50000, 500000, '
	set @condicion2 = @condicion2 + ' 600, 6000, 60000, 600000, '
	set @condicion2 = @condicion2 + ' 700, 7000, 70000, 700000, '
	set @condicion2 = @condicion2 + ' 800, 8000, 80000, 800000, '
	set @condicion2 = @condicion2 + ' 900, 9000, 90000, 900000 '
	set @condicion2 = @condicion2 + ' ) '

declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Efectiva,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '




	declare @aux int
		set @aux = 0
		
		
		if @fechaDesde is null
			if @fechaHasta is null
				if @comprobante is null
					if @cuenta is null
						begin
							set @consulta = @consulta + @condicion
						end
		
		if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + @condicion2 
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + @condicion2 
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + @condicion2 
					end
			end			
	
	set @consulta = @consulta + ' order by TransaccionId asc '
	
	exec(@consulta)


 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_ImportesRedondosOrdenMonto]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_ImportesRedondosOrdenMonto]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @condicion varchar(3000)



	set @condicion = ' where MontoNeto in ( '
	set @condicion = @condicion + ' 100, 1000, 10000, 100000, '
	set @condicion = @condicion + ' 200, 2000, 20000, 200000, '
	set @condicion = @condicion + ' 300, 3000, 30000, 300000, '
	set @condicion = @condicion + ' 400, 4000, 40000, 400000, '
	set @condicion = @condicion + ' 500, 5000, 50000, 500000, '
	set @condicion = @condicion + ' 600, 6000, 60000, 600000, '
	set @condicion = @condicion + ' 700, 7000, 70000, 700000, '
	set @condicion = @condicion + ' 800, 8000, 80000, 800000, '
	set @condicion = @condicion + ' 900, 9000, 90000, 900000 '
	set @condicion = @condicion + ' ) '
	
 
declare @condicion2 varchar(3000)

	set @condicion2 = ' and MontoNeto in ( '
	set @condicion2 = @condicion2 + ' 100, 1000, 10000, 100000, '
	set @condicion2 = @condicion2 + ' 200, 2000, 20000, 200000, '
	set @condicion2 = @condicion2 + ' 300, 3000, 30000, 300000, '
	set @condicion2 = @condicion2 + ' 400, 4000, 40000, 400000, '
	set @condicion2 = @condicion2 + ' 500, 5000, 50000, 500000, '
	set @condicion2 = @condicion2 + ' 600, 6000, 60000, 600000, '
	set @condicion2 = @condicion2 + ' 700, 7000, 70000, 700000, '
	set @condicion2 = @condicion2 + ' 800, 8000, 80000, 800000, '
	set @condicion2 = @condicion2 + ' 900, 9000, 90000, 900000 '
	set @condicion2 = @condicion2 + ' ) '

declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Efectiva,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '




	declare @aux int
		set @aux = 0
		
		
		if @fechaDesde is null
			if @fechaHasta is null
				if @comprobante is null
					if @cuenta is null
						begin
							set @consulta = @consulta + @condicion
						end
		
		if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + @condicion2 
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + @condicion2 
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + @condicion2 
					end
			end			
	
	set @consulta = @consulta + ' order by MontoNeto asc '
	
	exec(@consulta)


 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_ImportesRedondosOrdenCuenta]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_ImportesRedondosOrdenCuenta]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @condicion varchar(3000)



	set @condicion = ' where MontoNeto in ( '
	set @condicion = @condicion + ' 100, 1000, 10000, 100000, '
	set @condicion = @condicion + ' 200, 2000, 20000, 200000, '
	set @condicion = @condicion + ' 300, 3000, 30000, 300000, '
	set @condicion = @condicion + ' 400, 4000, 40000, 400000, '
	set @condicion = @condicion + ' 500, 5000, 50000, 500000, '
	set @condicion = @condicion + ' 600, 6000, 60000, 600000, '
	set @condicion = @condicion + ' 700, 7000, 70000, 700000, '
	set @condicion = @condicion + ' 800, 8000, 80000, 800000, '
	set @condicion = @condicion + ' 900, 9000, 90000, 900000 '
	set @condicion = @condicion + ' ) '
	
 
declare @condicion2 varchar(3000)

	set @condicion2 = ' and MontoNeto in ( '
	set @condicion2 = @condicion2 + ' 100, 1000, 10000, 100000, '
	set @condicion2 = @condicion2 + ' 200, 2000, 20000, 200000, '
	set @condicion2 = @condicion2 + ' 300, 3000, 30000, 300000, '
	set @condicion2 = @condicion2 + ' 400, 4000, 40000, 400000, '
	set @condicion2 = @condicion2 + ' 500, 5000, 50000, 500000, '
	set @condicion2 = @condicion2 + ' 600, 6000, 60000, 600000, '
	set @condicion2 = @condicion2 + ' 700, 7000, 70000, 700000, '
	set @condicion2 = @condicion2 + ' 800, 8000, 80000, 800000, '
	set @condicion2 = @condicion2 + ' 900, 9000, 90000, 900000 '
	set @condicion2 = @condicion2 + ' ) '

declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Efectiva,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '




	declare @aux int
		set @aux = 0
		
		
		if @fechaDesde is null
			if @fechaHasta is null
				if @comprobante is null
					if @cuenta is null
						begin
							set @consulta = @consulta + @condicion
						end
		
		if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + @condicion2 
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + @condicion2 
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + @condicion2 
					end
			end			
	
	set @consulta = @consulta + ' order by CodigoCuenta asc '
	
	exec(@consulta)


 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_ImportesRedondos]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_ImportesRedondos]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @condicion varchar(3000)



	set @condicion = ' where MontoNeto in ( '
	set @condicion = @condicion + ' 100, 1000, 10000, 100000, -100, -1000, -10000, -100000, '
	set @condicion = @condicion + ' 200, 2000, 20000, 200000, -200, -2000, -20000, -200000, '
	set @condicion = @condicion + ' 300, 3000, 30000, 300000, -300, -3000, -30000, -300000, '
	set @condicion = @condicion + ' 400, 4000, 40000, 400000, -400, -4000, -40000, -400000, '
	set @condicion = @condicion + ' 500, 5000, 50000, 500000, -500, -5000, -50000, -500000, '
	set @condicion = @condicion + ' 600, 6000, 60000, 600000, -600, -6000, -60000, -600000, '
	set @condicion = @condicion + ' 700, 7000, 70000, 700000, -700, -7000, -70000, -700000, '
	set @condicion = @condicion + ' 800, 8000, 80000, 800000, -800, -8000, -80000, -800000, '
	set @condicion = @condicion + ' 900, 9000, 90000, 900000, -900, -9000, -90000, -900000 '
	set @condicion = @condicion + ' ) '
	
 
declare @condicion2 varchar(3000)

	set @condicion2 = ' and MontoNeto in ( '
	set @condicion2 = @condicion2 + ' 100, 1000, 10000, 100000, -100, -1000, -10000, -100000, '
	set @condicion2 = @condicion2 + ' 200, 2000, 20000, 200000, -200, -2000, -20000, -200000, '
	set @condicion2 = @condicion2 + ' 300, 3000, 30000, 300000, -300, -3000, -30000, -300000, '
	set @condicion2 = @condicion2 + ' 400, 4000, 40000, 400000, -400, -4000, -40000, -400000, '
	set @condicion2 = @condicion2 + ' 500, 5000, 50000, 500000, -500, -5000, -50000, -500000, '
	set @condicion2 = @condicion2 + ' 600, 6000, 60000, 600000, -600, -6000, -60000, -600000, '
	set @condicion2 = @condicion2 + ' 700, 7000, 70000, 700000, -700, -7000, -70000, -700000, '
	set @condicion2 = @condicion2 + ' 800, 8000, 80000, 800000, -800, -8000, -80000, -800000, '
	set @condicion2 = @condicion2 + ' 900, 9000, 90000, 900000, -900, -9000, -90000, -900000 '
	set @condicion2 = @condicion2 + ' ) '

declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '




	declare @aux int
		set @aux = 0
		
		
		if @fechaDesde is null
			if @fechaHasta is null
				if @comprobante is null
					if @cuenta is null
						begin
							set @consulta = @consulta + @condicion
						end
		
		if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + @condicion2 
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + @condicion2 
					end
			end
			
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						set @consulta = @consulta + @condicion2 
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
						set @consulta = @consulta + @condicion2 
					end
			end	
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + @condicion2 
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + @condicion2 
					end
			end			
	
	set @consulta = @consulta + ' order by MontoNeto desc '
	
	exec(@consulta)


 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_Importes99OrdenTransaccion]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_Importes99OrdenTransaccion]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

	AS
	BEGIN

	SET NOCOUNT ON;

	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Efectiva,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '

	declare @aux int
			set @aux = 0
			
			
			if @fechaDesde is null
				if @fechaHasta is null
					if @comprobante is null
						if @cuenta is null
							begin
								set @consulta = @consulta + ' where MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
							end
			
			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end			
			
			
			set @consulta = @consulta + ' order by TransaccionId asc '
						 
			exec(@consulta)


	 
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_Importes99OrdenMonto]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_Importes99OrdenMonto]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

	AS
	BEGIN

	SET NOCOUNT ON;

	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Efectiva,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '

	declare @aux int
			set @aux = 0
			
			
			if @fechaDesde is null
				if @fechaHasta is null
					if @comprobante is null
						if @cuenta is null
							begin
								set @consulta = @consulta + ' where MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
							end
			
			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end			
			
			
			set @consulta = @consulta + ' order by MontoNeto asc '
						 
			exec(@consulta)


	 
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_Importes99OrdenCuenta]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_Importes99OrdenCuenta]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cuenta varchar(max) = null

	AS
	BEGIN

	SET NOCOUNT ON;

	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Efectiva,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '

	declare @aux int
			set @aux = 0
			
			
			if @fechaDesde is null
				if @fechaHasta is null
					if @comprobante is null
						if @cuenta is null
							begin
								set @consulta = @consulta + ' where MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
							end
			
			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end			
			
			
			set @consulta = @consulta + ' order by CodigoCuenta asc '
						 
			exec(@consulta)


	 
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_Importes99]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_Importes99]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null

	AS
	BEGIN

	SET NOCOUNT ON;

	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '

	declare @aux int
			set @aux = 0
			
			
			--if @fechaDesde is null
			--	if @fechaHasta is null
			--		if @comprobante is null
			--			if @cuenta is null
			--				begin
			--					set @consulta = @consulta + ' where MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
			--				end
			
			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''						
						set @consulta = @consulta + ' and MontoNeto like ''%99''  and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''						
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''						
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''						
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''						
						set @consulta = @consulta + '  and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''						
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
			end
			
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''						
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
				        set @consulta = @consulta + ' and MontoNeto like ''%99''  and MontoNeto like ''%99%'' '
						
					end
			end	
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )								
						set @consulta = @consulta + ' and MontoNeto like ''%99'' and MontoNeto like ''%99%'' '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )						
						set @consulta = @consulta + ' and MontoNeto like ''%99''  and MontoNeto like ''%99%'' '
					end
			end			
			
			
			set @consulta = @consulta + ' order by MontoNeto desc '
						 
			exec(@consulta)


	 
	END
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[nombreApellido_usuario] [varchar](100) NOT NULL,
	[cargo] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[esAdmin] [bit] NULL,
	[fecha_alta] [datetime] NOT NULL,
	[TransactionID] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposComprobante]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposComprobante](
	[id_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[codigo_comprobante] [nvarchar](50) NULL,
	[descripcion] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TablaPrincipal]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TablaPrincipal](
	[Id_tablaPrincipal] [int] IDENTITY(1,1) NOT NULL,
	[TransaccionId] [varchar](20) NOT NULL,
	[AccountCode] [int] NOT NULL,
	[TipoComprobante] [int] NOT NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[EffectiveDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[DocumentType] [varchar](100) NULL,
	[UserId] [int] NULL,
	[JournalDescription] [varchar](100) NULL,
	[LineDescription] [varchar](100) NULL,
	[Id_movimiento] [int] NULL,
 CONSTRAINT [PK_TablaPrincipal] PRIMARY KEY CLUSTERED 
(
	[Id_tablaPrincipal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_HistogramaUsoCuentasDETALLE]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_HistogramaUsoCuentasDETALLE]


	@nroTransaccion varchar(20) = null,
	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@codigoComprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@comprobante varchar(20) = null,
	@codigoCuenta varchar(20) = null

	AS
	BEGIN

	SET NOCOUNT ON;

	declare @consulta varchar(3000)

	set @consulta = ' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente, Clientes.id_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '

	declare @aux int
	set @aux = 0


				if @codigoCuenta is not null
				begin
					if @aux	= 1
						begin
							set @consulta = @consulta + ' and  CodigoCuenta =  ''' +  CAST ( @codigoCuenta as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1
							set @consulta = @consulta + ' where CodigoCuenta  = ''' +  CAST ( @codigoCuenta as  varchar (20) )  + ''''																								
						end
				end			

				if @fechaDesde is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						end
				end 
				


				if @fechaHasta is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						end
				end 
				

				 if @comprobante is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						end
				end						
					
				if @cliente is not null 
				begin
					if @aux = 1
						begin
							set @consulta = @consulta + ' and Clientes.id_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																								
						end
					else
						begin
							set @aux = 1 
							set @consulta = @consulta + ' where Clientes.id_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																								
						end
				end
				
				
					exec(@consulta)
		
					--print(@consulta)



	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_HistogramaUsoCuentas]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_HistogramaUsoCuentas]


@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;


declare @consulta varchar(3000)

set @consulta = ' select CodigoCuenta, CuentaDescripcion, COUNT(CodigoCuenta) as cantidad, nombre_cliente '
set @consulta = @consulta + ' from Mayorizacion3 '
set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '



	declare @aux int
	set @aux = 0

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''																								
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''																								
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
			
	set @consulta = @consulta + ' group by CodigoCuenta, CuentaDescripcion, nombre_cliente '
	set @consulta = @consulta + ' order by COUNT(CodigoCuenta) desc '

	exec(@consulta)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_FechasCercanasAlCierre]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_FechasCercanasAlCierre]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int
	set @aux = 0		

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >= DATEADD(DAY,-7,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						set @consulta = @consulta + ' and Fecha_Creacion <= DATEADD(DAY,8,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >= DATEADD(DAY,-7,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						set @consulta = @consulta + ' and Fecha_Creacion <= DATEADD(DAY,8,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						
					end
			end 
								
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + ' and Fecha_Creacion >= DATEADD(DAY,-7,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						set @consulta = @consulta + ' and Fecha_Creacion <= DATEADD(DAY,8,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + ' and Fecha_Creacion >= DATEADD(DAY,-7,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						set @consulta = @consulta + ' and Fecha_Creacion <= DATEADD(DAY,8,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
					
					end
			end
			
			
			
			 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						set @consulta = @consulta + ' and Fecha_Creacion >= DATEADD(DAY,-7,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						set @consulta = @consulta + ' and Fecha_Creacion <= DATEADD(DAY,8,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
						set @consulta = @consulta + ' and Fecha_Creacion >= DATEADD(DAY,-7,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						set @consulta = @consulta + ' and Fecha_Creacion <= DATEADD(DAY,8,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + ' and Fecha_Creacion >= DATEADD(DAY,-7,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						set @consulta = @consulta + ' and Fecha_Creacion <= DATEADD(DAY,8,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + ' and Fecha_Creacion >= DATEADD(DAY,-7,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						set @consulta = @consulta + ' and Fecha_Creacion <= DATEADD(DAY,8,   ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' + ' ) '
						
					end
			end									
			
			set @consulta = @consulta + ' order by Fecha_Creacion asc '
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_FechaDistintaCarga]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_FechaDistintaCarga]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion, LineaDescripcion, '
	set @consulta = @consulta + ' descripcion, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int
	set @aux = 0
	
	
			if @fechaDesde is  null
				if @fechaHasta is null
					if @comprobante is null	
						if @cuenta is null
							begin 
								set @consulta = @consulta + ' where Fecha_Creacion != fecha_contabilizacion'
							end

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					end
			end
			
			 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''						
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''						
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + ' and Fecha_Creacion != fecha_contabilizacion'
					end
			end			
			
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_DiasNoLaborables]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_DiasNoLaborables]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	
	set @consulta = ' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int
	set @aux = 0
	
	
	
		if @fechaDesde is null	
			if @fechaHasta is null	
				if @comprobante is null
					if @cuenta is null	
						begin
							set @consulta = @consulta + ' where (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) '
						end

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) ) '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7)  ) '
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) ) '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) ) '
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
						set @consulta = @consulta + ' and  ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) ) '
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
						set @consulta = @consulta + ' and ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) ) '
					end
			end
			
			
				if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						set @consulta = @consulta + ' and  ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) ) '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''						
						set @consulta = @consulta + ' and  ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) ) '
					end
			end	
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
						set @consulta = @consulta + ' and  ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) ) '
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
						set @consulta = @consulta + ' and ( (DATEPART(DW,Fecha_Creacion)=6) or (DATEPART(DW,Fecha_Creacion)=7) )a '
					end
			end			
				
				
				set @consulta = @consulta + '  order by Fecha_Creacion asc '					
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_DiasNoHabituales]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_DiasNoHabituales]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null
	


	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int


	set @aux = 0

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
			
				if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''						
					end
			end	
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
			
			
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_DeterminadoPeriodoTiempo2]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_DeterminadoPeriodoTiempo2]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null,
	@fechaDesdeContabilidad varchar (max) = null,
	@fechasHastaContabilidad varchar (max) = null
	
	
	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int


	set @aux = 0
	
		if @fechaDesdeContabilidad is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Contabilizacion >=  ''' +  CAST ( @fechaDesdeContabilidad as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Contabilizacion >=   ''' +  CAST ( @fechaDesdeContabilidad as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechasHastaContabilidad is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Contabilizacion <=  ''' +  CAST ( @fechasHastaContabilidad as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Contabilizacion <=  ''' +  CAST ( @fechasHastaContabilidad as  varchar (12) ) + ''''
					end
			end 

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''												
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''												
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
			
			set @consulta = @consulta + ' order by Fecha_Contabilizacion asc'
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_DeterminadoPeriodoTiempo]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_DeterminadoPeriodoTiempo]


	@fechaDesde varchar(20) = null,
	@fechaHasta varchar(20) = null,
	@comprobante varchar(20) = null,
	@cliente varchar(20) = null,
	@cuenta varchar(max) = null,
	@fechaDesdeContabilidad varchar (max) = null,
	@fechasHastaContabilidad varchar (max) = null
	
	
	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '


	declare @aux int


	set @aux = 0
	
		if @fechaDesdeContabilidad is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Contabilizacion >=  ''' +  CAST ( @fechaDesdeContabilidad as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Contabilizacion >=   ''' +  CAST ( @fechaDesdeContabilidad as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechasHastaContabilidad is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Contabilizacion <=  ''' +  CAST ( @fechasHastaContabilidad as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Contabilizacion <=  ''' +  CAST ( @fechasHastaContabilidad as  varchar (12) ) + ''''
					end
			end 

			if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion >=   ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
					end
			end 
			
			
			if @fechaHasta is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where Fecha_Creacion <=  ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
			
				 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''												
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''												
					end
			end
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
			
			
			set @consulta = @consulta + ' order by Fecha_Creacion asc'
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_CuentaUsoMinimo]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_CuentaUsoMinimo]

@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cliente varchar(20) = null,
@cuenta varchar(max) = null,
@importeDesde varchar(max) = null,
@importeHasta varchar(max) = null

AS
BEGIN

SET NOCOUNT ON;

   declare @consulta varchar(3000)
	set @consulta = N' select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria, '
	set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
	set @consulta = @consulta + ' Movimiento.Descripcion , UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
	set @consulta = @consulta + ' from Mayorizacion3 '
	set @consulta = @consulta + ' left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario '
	set @consulta = @consulta + ' left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento '
	set @consulta = @consulta + ' left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente '
	
   declare @aux int


	set @aux = 0
	
	if @fechaDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and Fecha_Creacion between  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoCuenta in (select  CodigoCuenta from Mayorizacion3 group by CodigoCuenta having COUNT(CodigoCuenta) <= 3) '
						set @consulta = @consulta + ' and Fecha_Creacion between  ''' +  CAST ( @fechaDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and '''  +  CAST ( @fechaHasta as  varchar (12) ) + ''''
					end
			end 					
			
				 if @comprobante is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and CodigoComprobante   =  ''' +  CAST ( @comprobante as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where CodigoComprobante  = ''' +  CAST ( @comprobante as  varchar (20) )  + ''''
					end
			end
			
			
				if @importeDesde is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and MontoNeto not between ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where MontoNeto not between ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
						set @consulta = @consulta + ' and ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
					end
			end 
			
			--if @importeDesde is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and MontoNeto <  ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
					
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where MontoNeto <  ''' +  CAST ( @importeDesde as  varchar (12) ) + ''''
			--		end
			--end 
			
			
			--	if @importeHasta is not null 
			--begin
			--	if @aux = 1
			--		begin
			--			set @consulta = @consulta + ' and MontoNeto >  ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
					
			--		end
			--	else
			--		begin
			--			set @aux = 1 
			--			set @consulta = @consulta + ' where MontoNeto >  ''' +  CAST ( @importeHasta as  varchar (12) ) + ''''
			--		end
			--end 
			
			if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and nombre_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where nombre_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
						
					end
			end	
			
				 if @cuenta is not null 
			begin
				if @aux = 1
					begin						
						set @consulta = @consulta  + ' and  ' + CAST ( @cuenta as  varchar (max) )																						
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where  ' +  CAST ( @cuenta as  varchar (max) )																							
					end
			end			
				

set @consulta = @consulta + ' group by TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria,   '
set @consulta = @consulta + ' Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion, '
set @consulta = @consulta + ' Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente '
set @consulta = @consulta + ' having COUNT(CodigoCuenta) <= 3 '
set @consulta = @consulta + ' order by CodigoCuenta asc '


exec(@consulta)
--print(@consulta)
  
  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_CuentasPertenecienteAClientes]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_CuentasPertenecienteAClientes]

	
	@cliente varchar(20) = null

	AS
	BEGIN

	SET NOCOUNT ON;


	declare @consulta varchar(3000)
	
	set @consulta = N' select distinct CodigoCuenta, CuentaDescripcion from Mayorizacion3 '	
		
	declare @aux int


	set @aux = 0
	
	
		 if @cliente is not null 
			begin
				if @aux = 1
					begin
						set @consulta = @consulta + ' and id_cliente   =  ''' +  CAST ( @cliente as  varchar (20) ) + ''''
					
					end
				else
					begin
						set @aux = 1 
						set @consulta = @consulta + ' where id_cliente  = ''' +  CAST ( @cliente as  varchar (20) )  + ''''
					end
			end				
			
			set @consulta = @consulta + ' order by CodigoCuenta asc '
						 
			exec(@consulta)
				


	END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TransaccionesUsuarioNuevo]    Script Date: 06/27/2019 17:03:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TransaccionesUsuarioNuevo]



@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null,
@comprobante varchar(20) = null,
@cuenta varchar(max) = null


AS
BEGIN

SET NOCOUNT ON;

declare @consulta varchar(3000)

set @consulta = ' select TransaccionId, '
set @consulta = @consulta + ' DateName(  day , EffectiveDate) + ' + '''  ''' + ' + DateName(  month , EffectiveDate) + ' + '''  ''' + ' + DateName(  year , EffectiveDate) as fecha,  '
set @consulta = @consulta + ' codigo_comprobante, AccountCode, Cuentas.Description, NetAmount, DocumentType, JournalDescription, LineDescription, '
set @consulta = @consulta + ' nombreApellido_usuario,cargo,email,CreatedDate, Movimiento.Descripcion '
set @consulta = @consulta + ' from TablaPrincipal '
set @consulta = @consulta + ' left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante '
set @consulta = @consulta + ' left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta '
set @consulta = @consulta + ' left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario '
set @consulta = @consulta + ' left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento '



declare @aux int

set @aux = 0


	if @fechaDesde is null
		if @fechaHasta	is null
			if @comprobante is null
				if @cuenta is null	
					begin
						set  @consulta = @consulta + '  where DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
					end

if @fechaDesde is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate >=  ''' +  CAST ( @fechaDesde as  varchar (12) ) + '''' 
					set @consulta = @consulta + '  and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '					
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate >=   ''' +  CAST ( @fechaDesde as  varchar (12) )+ '''' 
					set @consulta = @consulta + ' and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
					
				end
		end 
		
		
		if @fechaHasta is not null 
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ '''' 
					set @consulta = @consulta + ' and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where CreatedDate <=  ''' +  CAST ( @fechaHasta as  varchar (12) )+ ''''  
					set @consulta = @consulta + ' and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
					
				end
		end 
		
			 if @comprobante is not null	
		begin
			if @aux = 1
				begin
					set @consulta = @consulta + ' and TipoComprobante   =  ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + ' and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
					
				
				end
			else
				begin
					set @aux = 1 
					set @consulta = @consulta + ' where TipoComprobante  = ' +  CAST ( @comprobante as  varchar (8) ) 
					set @consulta = @consulta + ' and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
					
				end
		end
		
			if @cuenta is not null
			begin
				if @aux = 1
					begin	
						set @consulta = @consulta + ' and ' + CAST ( @cuenta as  varchar (max) )
						set @consulta = @consulta + ' and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
						
					end
				else
					begin
						set @aux = 1
						set @consulta = @consulta + ' where ' + CAST ( @cuenta as  varchar (max) )
						set @consulta = @consulta + ' and DATEDIFF(MONTH,GETDATE(),fecha_alta) >= -3  and DATEDIFF(MONTH,GETDATE(),fecha_alta) <= 0 '
						
					end
			end
			
			set @consulta = @consulta + ' order by CreatedDate asc'
	
	
	exec(@consulta)
	

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TransaccionesPorUsuarioTODAS]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TransaccionesPorUsuarioTODAS]

AS
BEGIN

SET NOCOUNT ON;


select nombreApellido_usuario,
TransaccionId,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate) + ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
AccountCode, Cuentas.Description, codigo_comprobante, NetAmount, DocumentType, LineDescription, JournalDescription,
CreatedDate, Movimiento.Descripcion
from TablaPrincipal
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento


END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_CuentasMasImputadasDETALLE]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_CuentasMasImputadasDETALLE]


@nroTransaccion varchar(20) = null

AS
BEGIN

SET NOCOUNT ON;


select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria,
Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, fecha_contabilizacion,LineaDescripcion,
Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente
from Mayorizacion3
left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario
left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento
left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente
where CodigoCuenta = @nroTransaccion


END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_ValoresMenoresParametro2]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_ValoresMenoresParametro2]


--@fechaDesde varchar(20) = null,
--@fechaHasta varchar(20) = null,
--@comprobante varchar(20) = null,
--@cuenta varchar(max) = null,
--@cliente varchar(20) = null,
@limite int = null

AS
BEGIN

SET NOCOUNT ON;

	select * from Mayorizacion3
	left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario
	left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento
	left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente
	where MontoNeto >= @limite - ( @limite * .05) AND MontoNeto <= @limite
	


END
GO
/****** Object:  StoredProcedure [dbo].[SP_TABLA1_Mostrar_HistogramaUsoCuentasDETALLE2]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TABLA1_Mostrar_HistogramaUsoCuentasDETALLE2]


@nroTransaccion varchar(20) = null,
@fechaDesde varchar(20) = null,
@fechaHasta varchar(20) = null

AS
BEGIN

SET NOCOUNT ON;


select TransaccionId, CodigoCuenta, CuentaDescripcion, ID_Secundaria, ID_CTA_Secundaria, Nombre_Secundaria,
Fecha_Creacion, TipoComprobante, CodigoComprobante, JornalDescripcion, MontoNeto, Fecha_Efectiva,LineaDescripcion,
Movimiento.Descripcion, UserId, FechaCargaSistema, nombreApellido_usuario, nombre_cliente
from Mayorizacion3
left join Usuarios on Mayorizacion3.UserId = Usuarios.Id_usuario
left join Movimiento on Mayorizacion3.Id_movimiento = Movimiento.Id_movimiento
left join Clientes on Mayorizacion3.id_cliente = Clientes.id_cliente
where CodigoCuenta = @nroTransaccion 
order by Fecha_Creacion asc


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_verEntradas]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_verEntradas]


AS
BEGIN

SET NOCOUNT ON;


SELECT tp.TransaccionId,
(
   SELECT COUNT( distinct sub.AccountCode) FROM TablaPrincipal sub WHERE sub.TransaccionId=tp.TransaccionId
) AS CantidadCuentas,
(
   SELECT SUM(sub.NetAmount) FROM TablaPrincipal sub WHERE sub.TransaccionId=tp.TransaccionId AND Id_movimiento = 1
) AS debito,
(
   SELECT SUM(sub.NetAmount) FROM TablaPrincipal sub WHERE sub.TransaccionId=tp.TransaccionId AND Id_movimiento = 2
) AS credito,
(select distinct COUNT( distinct UserId) from TablaPrincipal sub WHERE sub.TransaccionId=tp.TransaccionId
) as CantidaUsuarios,
(
select top 1 DATENAME(day, EffectiveDate) + ' '+ DATENAME(MONTH, EffectiveDate)+ ' ' + DATENAME(YEAR, EffectiveDate) from TablaPrincipal sub WHERE sub.TransaccionId=tp.TransaccionId order by EffectiveDate desc
) as FechaRegistracion,
(
   SELECT COUNT(distinct sub.EffectiveDate) FROM TablaPrincipal sub WHERE sub.TransaccionId=tp.TransaccionId
) AS CantidadFechas,
(
select top 1 CreatedDate from TablaPrincipal sub WHERE sub.TransaccionId=tp.TransaccionId order by CreatedDate asc
) as FechaCreacion
FROM TablaPrincipal tp
GROUP BY tp.TransaccionId
ORDER BY tp.TransaccionId asc


  
  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_UsoMinimoPeroSignificativoDETALLE]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_UsoMinimoPeroSignificativoDETALLE]

@nroTransaccion varchar(20) = null

AS
BEGIN


select TransaccionId,AccountCode,Cuentas.Description, TiposComprobante.codigo_comprobante,NetAmount, CreatedDate, DocumentType, nombreApellido_usuario,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate)+ ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
JournalDescription, LineDescription,Movimiento.Descripcion, TiposComprobante.codigo_comprobante
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join  Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
where TransaccionId = @nroTransaccion

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_UsoMinimoPeroSignificativo1]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_UsoMinimoPeroSignificativo1]

@fechaDesde varchar(20),
@fechaHasta varchar(20),
@comprobante int = null

AS
BEGIN

	SET NOCOUNT ON;
	

select AccountCode, Cuentas.Description, NetAmount, COUNT(AccountCode) as CantidaDeVecesImputadas,
 nombreApellido_usuario, cargo, Movimiento.Descripcion
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
where NetAmount >= 1000000
group by AccountCode, NetAmount, nombreApellido_usuario, cargo, Cuentas.Description, Movimiento.Descripcion
having COUNT(AccountCode) <= 1

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_UsoMinimoPeroSignificativo]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_UsoMinimoPeroSignificativo]

@fechaDesde varchar(20),
@fechaHasta varchar(20),
@comprobante int = null

AS
BEGIN

	SET NOCOUNT ON;
	

select AccountCode, Cuentas.Description, NetAmount, COUNT(AccountCode) as CantidaDeVecesImputadas,
 nombreApellido_usuario, cargo, Movimiento.Descripcion
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
where NetAmount >= 1000000
group by AccountCode, NetAmount, nombreApellido_usuario, cargo, Cuentas.Description, Movimiento.Descripcion
having COUNT(AccountCode) <= 1

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TransaccionPorCargo]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TransaccionPorCargo]


@fechaDesde datetime,
@fechaHasta datetime

AS
BEGIN

SET NOCOUNT ON;


select TransaccionId, AccountCode,Cuentas.Description ,NetAmount, DocumentType, JournalDescription, LineDescription, nombreApellido_usuario, cargo
 from TablaPrincipal
 left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
 left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
 where cargo = 'programador' or 
 TablaPrincipal.CreatedDate >= @fechaDesde and TablaPrincipal.CreatedDate <= @fechaHasta





END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TransaccionesPorUsuarioDetalle]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TransaccionesPorUsuarioDetalle]


@nroTransaccion varchar(20) = null

AS
BEGIN

SET NOCOUNT ON;


select nombreApellido_usuario,
TransaccionId,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate) + ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
AccountCode, Cuentas.Description, codigo_comprobante, NetAmount, DocumentType, LineDescription, JournalDescription,
CreatedDate, Movimiento.Descripcion
from TablaPrincipal
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
where nombreApellido_usuario like @nroTransaccion
order by CreatedDate asc

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_HistogramaCuentaDETALLE]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_HistogramaCuentaDETALLE]

@nroTransaccion varchar(20) = null

AS
BEGIN


select TransaccionId,AccountCode,Cuentas.Description, TiposComprobante.codigo_comprobante,NetAmount, CreatedDate, DocumentType, nombreApellido_usuario,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate)+ ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
JournalDescription, LineDescription,Movimiento.Descripcion, TiposComprobante.codigo_comprobante
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join  Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
where AccountCode = @nroTransaccion

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TransaccionesDescargas]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TransaccionesDescargas]



AS
BEGIN


select TransaccionId,AccountCode,Cuentas.Description, NetAmount, CreatedDate, DocumentType, nombreApellido_usuario,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate)+ ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
JournalDescription, LineDescription,Movimiento.Descripcion, TiposComprobante.codigo_comprobante
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join  Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_TransaccionDetalle]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_TransaccionDetalle]

@nroTransaccion varchar(20) = null

AS
BEGIN


select TransaccionId,AccountCode,Cuentas.Description, NetAmount, CreatedDate, DocumentType, nombreApellido_usuario,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate)+ ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
JournalDescription, LineDescription,Movimiento.Descripcion, TiposComprobante.codigo_comprobante
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join  Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
where NetAmount in (select NetAmount from TablaPrincipal group by NetAmount having COUNT(NetAmount) >= 2)
and TransaccionId = @nroTransaccion 

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_Transaccion1]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_Transaccion1]

AS
BEGIN


select TransaccionId,AccountCode, Cuentas.Description, NetAmount, CreatedDate,
DATENAME(DAY, EffectiveDate) + ' ' +  DATENAME(MONTH,EffectiveDate) + ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
DocumentType, nombreApellido_usuario,
JournalDescription, LineDescription,Movimiento.Descripcion, TiposComprobante.codigo_comprobante
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join  Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_RepeticionesMontoTODAS]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_RepeticionesMontoTODAS]


AS
BEGIN

SET NOCOUNT ON;


select TransaccionId,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate)+ ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
AccountCode,Cuentas.Description, NetAmount, CreatedDate, DocumentType, nombreApellido_usuario,
JournalDescription, LineDescription,Movimiento.Descripcion, TiposComprobante.codigo_comprobante
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join  Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
where NetAmount in (select NetAmount from TablaPrincipal group by NetAmount having COUNT(NetAmount) >= 2)


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_RepeticionesMontoDETALLE]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_RepeticionesMontoDETALLE]

@nroTransaccion varchar(20) = null


AS
BEGIN

SET NOCOUNT ON;

select TransaccionId,AccountCode,Cuentas.Description, NetAmount, CreatedDate, DocumentType, nombreApellido_usuario,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate)+ ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
JournalDescription, LineDescription,Movimiento.Descripcion, TiposComprobante.codigo_comprobante
from TablaPrincipal
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join  Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
where TransaccionId = @nroTransaccion


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_NumeroTransaccionNUEVO]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_NumeroTransaccionNUEVO]
 
 
@numVirtual varchar(20) = null,
@numero_orden varchar(20) = null,
@num_orden varchar(20) = null

AS
BEGIN

if @num_orden is null  
begin
set @numVirtual =  cast( ( select ISNULL( MAX( CAST(   TransaccionId   as int)) ,0)+1   from TablaPrincipal ) as varchar)
set @numero_orden = ( select  REPLICATE('0', (12 - LEN(@numVirtual))) + @numVirtual )
 
 	select @numero_orden as numero_transaccion_nuevo
 end	
 	
 	if @num_orden is not null  
begin
 
 	select TransaccionId from TablaPrincipal
 	where TransaccionId = @num_orden  
 end
 	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_MovimientosInusualesCuenta]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_MovimientosInusualesCuenta]


@fechaDesde datetime,
@fechaHasta datetime

AS
BEGIN

SET NOCOUNT ON;


select CreatedDate,TransaccionId, AccountCode, NetAmount,Cuentas.Description, Movimiento.Descripcion from  TablaPrincipal
left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
where Movimiento.Descripcion = 'debito' or Movimiento.Descripcion = 'credito'
and NetAmount > 100000 or NetAmount = 0
and  TablaPrincipal.CreatedDate >= @fechaDesde and TablaPrincipal.CreatedDate <= @fechaHasta


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_HistogramaUsoCuentasTODAS]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_HistogramaUsoCuentasTODAS]



AS
BEGIN

SET NOCOUNT ON;


select AccountCode, Cuentas.Description, TransaccionId,
 DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH, EffectiveDate) + ' ' + DATENAME(YEAR,EffectiveDate) as fecha  , 
 codigo_comprobante,
NetAmount, DocumentType, LineDescription, JournalDescription,CreatedDate, nombreApellido_usuario, Movimiento.Descripcion
from TablaPrincipal
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
order by AccountCode asc

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_CuentasMasImputadasTODAS]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_CuentasMasImputadasTODAS]


AS
BEGIN

SET NOCOUNT ON;

select TransaccionId,
DATENAME(DAY,EffectiveDate) + ' ' + DATENAME(MONTH,EffectiveDate)+ ' ' + DATENAME(YEAR,EffectiveDate) as fecha,
AccountCode,Cuentas.Description, codigo_comprobante, NetAmount, DocumentType, JournalDescription,
LineDescription, nombreApellido_usuario, CreatedDate, Movimiento.Descripcion
from TablaPrincipal
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join  Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
where AccountCode in (select AccountCode from TablaPrincipal group by AccountCode having COUNT(*) > 5)


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Mostrar_CuentasMasImputadasDETALLE]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mostrar_CuentasMasImputadasDETALLE]


@nroTransaccion varchar(20) = null

AS
BEGIN

SET NOCOUNT ON;



select AccountCode, Cuentas.Description, TransaccionId,
DATENAME(DAY,EffectiveDate) + DATENAME(MONTH,EffectiveDate) + DATENAME(YEAR,EffectiveDate) as fecha,
TiposComprobante.codigo_comprobante, NetAmount, DocumentType, JournalDescription, LineDescription,
CreatedDate, nombreApellido_usuario, cargo, Movimiento.Descripcion
from TablaPrincipal
left join Cuentas on TablaPrincipal.AccountCode = Cuentas.id_cuenta
left join TiposComprobante on TablaPrincipal.TipoComprobante = TiposComprobante.id_comprobante
left join Usuarios on TablaPrincipal.UserId = Usuarios.Id_usuario
left join Movimiento on TablaPrincipal.Id_movimiento = Movimiento.Id_movimiento
where AccountCode = @nroTransaccion



END
GO
/****** Object:  StoredProcedure [dbo].[SP_Modificar_Usuario]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Modificar_Usuario]
@id_Usuario int,
@UserName nvarchar(50),
@contraseña varchar(50),
@NombreApellido varchar(100),
@cargo varchar (100),
@esAdmin bit,
@email varchar(100)


AS
BEGIN
	UPDATE Usuarios
	SET username = @UserName, contraseña = @contraseña, nombreapellido_usuario = @NombreApellido,  
	esAdmin = @esAdmin,   email = @email, cargo = @cargo
	WHERE id_usuario = @id_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Modificar_Transaccion]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Modificar_Transaccion]
@id_Transaccion int,
@codigo int,
@monto decimal(18,2),
@fecha_creacion datetime,
@fecha_registracion datetime,
@documento varchar(100),
@jornada varchar(100),
@linea varchar(100)




AS
BEGIN
	UPDATE TablaPrincipal
	SET AccountCode = @codigo, NetAmount = @monto, EffectiveDate = @fecha_creacion,  
	CreatedDate = @fecha_registracion, DocumentType = @documento, JournalDescription = @jornada,
	LineDescription = @linea
	WHERE TransaccionId = @id_Transaccion
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_Usuario]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_Usuario]
@id int

AS
BEGIN

	delete from Usuarios
	where Id_usuario = @id
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_Cliente]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_Cliente]
@id int

AS
BEGIN

	delete from Clientes
	where id_cliente = @id
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_Cliente]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Agregar_Cliente]
@nombreCliente varchar(100),
@direccionCliente varchar(100),
@rubroCliente varchar(100)




AS
BEGIN

	INSERT INTO Clientes(nombre_cliente, direccion_cliente, rubro_cliente)
	VALUES (@nombreCliente, @direccionCliente,@rubroCliente)
 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_Usuario]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Agregar_Usuario]
@username varchar(50),
@contraseña varchar(50),
@nombreApellido varchar(100),
@cargo varchar(100),
@esAdmin bit,
@email varchar(100),
@fechaAlta datetime



AS
BEGIN

	INSERT INTO Usuarios(username, contraseña, nombreapellido_usuario, esAdmin,  email,   
	fecha_alta, cargo)
	VALUES (@username, @contraseña, @nombreApellido,  @esAdmin,   @email, @fechaAlta, @cargo)
 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_Transaccion1]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Agregar_Transaccion1]
@codigo int,
@monto decimal(18,2),
@fecha_creacion datetime,
@fecha_registracion datetime,
@documento varchar(100),
@user int,
@jornada varchar(100),
@linea varchar(100),
@movimiento int,
@comprobante int,
@transaccion bigint




AS
BEGIN

	INSERT INTO TablaPrincipal(TransaccionId ,AccountCode, NetAmount, EffectiveDate, CreatedDate,  DocumentType,   
	UserId, JournalDescription, LineDescription,Id_movimiento, TipoComprobante )
	VALUES (@transaccion,@codigo, @monto, @fecha_creacion,  @fecha_registracion,   @documento,
	 @user, @jornada, @linea, @movimiento, @comprobante)
 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Agregar_Transaccion]    Script Date: 06/27/2019 17:03:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Agregar_Transaccion]
@codigo int,
@monto decimal(18,2),
@fecha_creacion datetime,
@fecha_registracion datetime,
@documento varchar(100),
@user int,
@jornada varchar(100),
@linea varchar(100),
@movimiento int,
@comprobante int




AS
BEGIN

	INSERT INTO TablaPrincipal(AccountCode, NetAmount, EffectiveDate, CreatedDate,  DocumentType,   
	UserId, JournalDescription, LineDescription,Id_movimiento, TipoComprobante )
	VALUES (@codigo, @monto, @fecha_creacion,  @fecha_registracion,   @documento,
	 @user, @jornada, @linea, @movimiento, @comprobante)
 
	
END
GO
