-- -----------------------------------------------------------------------------
-- Trivadis AG, Infrastructure Managed Services
-- Saegereistrasse 29, 8152 Glattbrugg, Switzerland
-- -----------------------------------------------------------------------------
-- Name.......: guacamole_connections.sql
-- Author.....: Stefan Oehrli (oes) stefan.oehrli@trivadis.com
-- Editor.....: Stefan Oehrli
-- Date.......: 2021.06.17
-- Revision...: 
-- Purpose....: Template file for guacamole connections
-- Notes......: 
-- Reference..: --
-- -----------------------------------------------------------------------------

-- Set guacamole DB ------------------------------------------------------------
use guacadb;

-- Create connection host win --------------------------------------------------
-- INSERT INTO guacamole_connection (connection_name, protocol) VALUES ('Windows Server (ad - 10.0.1.50)', 'rdp');
-- SET @host_id = (SELECT connection_id FROM guacamole_connection WHERE connection_name LIKE '%10.0.1.50%');

-- Add parameters to host winad connection -------------------------------------
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'hostname', '10.0.1.50');
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'port', '3389');
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'username', '${tvd_os_user}');
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'password', '${tvd_def_password}');
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'enable-wallpaper', 'true');

-- Create connection host db19 -------------------------------------------------
-- INSERT INTO guacamole_connection (connection_name, protocol) VALUES ('Database Server (db19 - 10.0.1.19)', 'ssh');
-- SET @host_id = (SELECT connection_id FROM guacamole_connection WHERE connection_name LIKE '%10.0.1.19%');

-- Add parameters to host db19 connection ------------------------------------
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'hostname', '10.0.1.19');
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'port', '22');
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'username', '${tvd_os_user}');
-- INSERT INTO guacamole_connection_parameter VALUES (@host_id, 'private-key', '${avocado_key}');
