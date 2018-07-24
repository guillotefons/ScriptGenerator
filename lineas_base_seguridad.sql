-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2018 a las 20:32:20
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lineas_base_seguridad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_capitulo`
--

CREATE TABLE `app_capitulo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `app_capitulo`
--

INSERT INTO `app_capitulo` (`id`, `nombre`, `descripcion`) VALUES
(11, 'Seguridad en Boot', ''),
(12, 'Procesos adicionales de endurecimiento', ''),
(13, 'Servicios', ''),
(14, 'Configuración de red y firewall', ''),
(15, 'Auditoria', ''),
(16, 'Acceso al sistema , autenticación y autorización', ''),
(17, 'Cuentas de usuarios', ''),
(18, 'Mensajes de alerta', ''),
(19, 'Permisos en archivos', ''),
(20, 'Control de acceso mandatorio', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_capitulo_sistema_operativo`
--

CREATE TABLE `app_capitulo_sistema_operativo` (
  `id` int(11) NOT NULL,
  `capitulo_id` int(11) NOT NULL,
  `sistemaoperativo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `app_capitulo_sistema_operativo`
--

INSERT INTO `app_capitulo_sistema_operativo` (`id`, `capitulo_id`, `sistemaoperativo_id`) VALUES
(28, 11, 1),
(29, 11, 4),
(30, 11, 5),
(31, 12, 1),
(32, 12, 4),
(33, 12, 5),
(34, 13, 1),
(35, 13, 4),
(36, 13, 5),
(37, 14, 1),
(38, 14, 4),
(39, 14, 5),
(40, 15, 1),
(41, 15, 4),
(42, 15, 5),
(43, 16, 1),
(44, 16, 4),
(45, 16, 5),
(46, 17, 1),
(47, 17, 4),
(48, 17, 5),
(49, 18, 1),
(50, 18, 4),
(51, 18, 5),
(52, 19, 1),
(53, 19, 4),
(54, 19, 5),
(55, 20, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_sistemaoperativo`
--

CREATE TABLE `app_sistemaoperativo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `app_sistemaoperativo`
--

INSERT INTO `app_sistemaoperativo` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Ubuntu Server TLS 14.04', ''),
(4, 'CentOS 6', ''),
(5, 'Debian 8', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_subcapitulo`
--

CREATE TABLE `app_subcapitulo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `comandos` longtext NOT NULL,
  `descripcion` longtext NOT NULL,
  `capitulo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `app_subcapitulo`
--

INSERT INTO `app_subcapitulo` (`id`, `nombre`, `comandos`, `descripcion`, `capitulo_id`) VALUES
(11, 'Establecer propietario de usuario / grupo en la configuración del gestor de arranque (ubuntu/debian)', 'stat -c \"%u %g\" /boot/grub/grub.cfg | egrep \"^0 0\"', 'Si el comando no emite salidas el sistema no esta configurado como se recomienda', 11),
(12, 'Establecer permisos en la configuración del gestor de arranque', 'stat -L -c \"%a\" /boot/grub/grub.cfg | egrep \".00\"', 'el primer comando es para distribucion ubuntu/debian\r\n\r\nSi el comando no emite salidas el sistema no esta configurado como se recomienda', 11),
(13, 'Establecer la contraseña del cargador de inicio - ubuntu/debian', 'grep \"^set superusers\" /boot/grub/grub.cfg\r\ngrep \"^password\" /boot/grub/grub.cfg', 'Al menos un usuario debe ser especificado como un súper usuario y debe tener una contraseña asignada.', 11),
(14, 'Requerir autenticación para el modo de usuario - ubuntu/debian', 'grep ^root:[*\\!]: /etc/shadow', 'No se deben devolver resultados.', 11),
(15, 'Restringir los volcados del núcleo - ubuntu/debian', 'grep \"hard core\" /etc/security/limits.conf\r\nsysctl fs.suid_dumpable', '', 12),
(16, 'Habilite la ubicación de la memoria virtual aleatorizada', 'sysctl kernel.randomize_va_space', '', 12),
(17, 'Deshabilitar Prelink - ubuntu/debian', 'dpkg -s prelink', '', 12),
(21, 'Verificar servicios en Centos', 'chkconfig --list', 'verificar si estan instalados los siguientes servicios: Chargen, daytime, rsh, discard, echo, talk, time, telnet,  tftp-server, xinetd , rsync ,  X Window, Avahi Server, CUPS, DHCP Server, LDAP server, mail transfer, DNS Server, FTP Server, HTTP server,  IMAP and POP3, Samba, HTTP Proxy, SNMP Server,', 13),
(22, 'Verificar servicios en Ubuntu/Debian', 'dpkg -s nis\r\ngrep ^chargen /etc/inetd.conf\r\ngrep ^daytime /etc/inetd.conf\r\ngrep ^shell /etc/inetd.conf\r\ngrep ^login /etc/inetd.conf\r\ngrep ^exec /etc/inetd.conf\r\ngrep ^talk /etc/inetd.conf\r\ngrep ^ntalk /etc/inetd.conf\r\ngrep ^time /etc/inetd.conf\r\ngrep ^telnet /etc/inetd.conf\r\ngrep ^tftp /etc/inetd.conf\r\ninitctl show-config xinetd\r\ngrep ^echo /etc/inetd.conf\r\ngrep ^discard /etc/inetd.conf\r\ndpkg -l xserver-xorg-core*\r\ninitctl show-config avahi-daemon\r\ninitctl show-config cups\r\ninitctl show-config isc-dhcp-server\r\ninitctl show-config isc-dhcp-server6\r\ndpkg -s slapd\r\ngrep ^RSYNC_ENABLE /etc/default/rsync\r\ndpkg -s biosdevname', '', 13),
(23, 'Deshabilitar el reenvío de IP Ubuntu/Debian', '/sbin/sysctl net.ipv4.ip_forward', '', 14),
(24, 'Deshabilitar el reenvio de IP Centos', 'sysctl net.ipv4.ip_forward', '', 14),
(25, 'Establecer propietario de usuario / grupo en la configuración del gestor de arranque - Centos', 'stat /boot/grub/grub.conf', '', 11),
(26, 'Establecer la contraseña del cargador de inicio - centos', 'grep \"^password\" /boot/grub/grub.conf', '', 11),
(27, 'Requerir autenticación para el modo de usuario - centos', 'grep ^SINGLE /etc/sysconfig/init', '', 11),
(28, 'Restringir los volcados del núcleo - centos', 'grep \"hard core\" /etc/security/limits.conf /etc/security/limits.d/*\r\nsysctl fs.suid_dumpable', '', 12),
(29, 'Deshabilitar Prelink - centos', 'rpm -q prelink', '', 12),
(30, 'Desactivar redireccionamientos de paquetes - Ubuntu/debian', '/sbin/sysctl net.ipv4.conf.all.send_redirects\r\n/sbin/sysctl net.ipv4.conf.default.send_redirects', '', 14),
(31, 'Asegúrese de que el envío de redirección de paquetes esté desactivado - centos', 'sysctl net.ipv4.conf.all.send_redirects\r\nsysctl net.ipv4.conf.default.send_redirects', '', 14),
(32, 'Deshabilitar la aceptación de paquete enrutado de origen - ubuntu/debian', '/sbin/sysctl net.ipv4.conf.all.accept_source_route\r\n/sbin/sysctl net.ipv4.conf.default.accept_source_route', '', 14),
(33, 'Deshabilitar la aceptación de paquete enrutado de origen - centos', 'sysctl net.ipv4.conf.all.accept_source_route\r\nsysctl net.ipv4.conf.default.accept_source_route', '', 14),
(34, 'Deshabilitar la aceptación de redireccionamiento ICMP - ubuntu/debian', '/sbin/sysctl net.ipv4.conf.all.accept_redirects\r\n/sbin/sysctl net.ipv4.conf.default.accept_redirects', '', 14),
(35, 'Deshabilitar la aceptación de redireccionamiento ICMP - centos', 'sysctl net.ipv4.conf.all.accept_redirects\r\nsysctl net.ipv4.conf.default.accept_redirects', '', 14),
(36, 'Deshabilitar la aceptación de redireccionamiento seguro ICMP - ubuntu/debian', '/sbin/sysctl net.ipv4.conf.all.secure_redirects\r\n/sbin/sysctl net.ipv4.conf.default.secure_redirects', '', 14),
(37, 'Deshabilitar la aceptación de redireccionamiento seguro ICMP - centos', 'sysctl net.ipv4.conf.all.secure_redirects\r\nsysctl net.ipv4.conf.default.secure_redirects', '', 14),
(38, 'Registrar paquetes sospechosos - ubuntu/debian', '/sbin/sysctl net.ipv4.conf.all.log_martians\r\n/sbin/sysctl net.ipv4.conf.default.log_martians', '', 14),
(39, 'Registrar paquetes sospechosos - centos', 'sysctl net.ipv4.conf.all.log_martians\r\nsysctl net.ipv4.conf.default.log_martians', '', 14),
(40, 'Habilitar Ignorar solicitudes de difusión - ubuntu/debian', '/sbin/sysctl net.ipv4.icmp_echo_ignore_broadcasts', '', 14),
(41, 'Habilitar Ignorar solicitudes de difusión - centos', 'sysctl net.ipv4.icmp_echo_ignore_broadcasts', '', 14),
(42, 'Habilitar la protección de mensaje de error - ubuntu/debian', '/sbin/sysctl net.ipv4.icmp_ignore_bogus_error_responses', '', 14),
(43, 'Habilitar la protección de mensaje de error - centos', 'sysctl net.ipv4.icmp_ignore_bogus_error_responses', '', 14),
(44, 'Habilitar las cookies TCP SYN - ubuntu/debian', '/sbin/sysctl net.ipv4.tcp_syncookies', '', 14),
(45, 'Habilitar las cookies TCP SYN - centos', 'sysctl net.ipv4.tcp_syncookies', '', 14),
(46, 'Instalar encapsuladores TCP - ubuntu/debian', 'dpkg -s tcpd', '', 14),
(47, 'Instalar encapsuladores TCP - centos', 'rpm -q tcp_wrappers', '', 14),
(48, 'Verificar los permisos en /etc/hosts.allow - ubuntu/debian', '/bin/ls -l /etc/hosts.allow', '', 14),
(49, 'Verificar los permisos en /etc/hosts.allow - centos', 'stat /etc/hosts.allow', '', 14),
(50, 'Verificar los permisos en /etc/hosts.deny - ubuntu/debian', '/bin/ls -l /etc/hosts.deny', '', 14),
(51, 'Verificar los permisos en /etc/hosts.deny - centos', 'stat /etc/hosts.deny', '', 14),
(52, 'Asegúrese de que el cortafuegos esté activo - ubuntu/debian', 'ufw status', '', 14),
(53, 'Asegúrese de que el cortafuegos esté activo - centos', 'rpm -q iptables', '', 14),
(54, 'Asegurar la política predeterminada de denegar firewall', 'iptables -L', '', 14),
(55, 'Mantenga toda la información de auditoría - ubuntu/debian', 'grep max_log_file_action /etc/audit/auditd.conf', 'max_log_file_action = keep_logs', 15),
(56, 'Instalar y habilitar el servicio de auditoría - ubuntu/debian', 'dpkg -s auditd', 'Asegúrese de que el estado del paquete esté instalado', 15),
(57, 'Instalar y habilitar el servicio de auditoría - centos', 'chkconfig --list auditd', '', 15),
(58, 'Habilitar la auditoría para los procesos que comienzan antes de la auditoría - ubuntu/debian', 'grep \"linux\" /boot/grub/grub.cfg', '', 15),
(59, 'Habilitar la auditoría para los procesos que comienzan antes de la auditoría - centos', 'grep \"^\\s*kernel\" /boot/grub/grub.conf', '', 15),
(61, 'Registrar eventos que modifiquen la información de fecha y hora', 'grep time-change /etc/audit/audit.rules', '', 15),
(63, 'Registrar eventos que modifiquen la información de usuario / grupo', 'grep identity /etc/audit/audit.rules', '', 15),
(64, 'Registrar eventos que modifiquen el entorno de red del sistema', 'grep system-locale /etc/audit/audit.rules', '', 15),
(66, 'Registrar eventos que modifiquen los controles de acceso obligatorios del sistema', 'grep MAC-policy /etc/audit/audit.rules', '', 15),
(67, 'Recopilar eventos de inicio y cierre de sesión', 'grep logins /etc/audit/audit.rules', '', 15),
(68, 'Recoger información de inicio de sesión', 'grep session /etc/audit/audit.rules', '', 15),
(69, 'Asegurar que se recopilen los eventos de modificación de permisos de control de acceso discrecional - centos', 'grep perm_mod /etc/audit/audit.rules', '', 15),
(70, 'Recopilar intentos fallidos de acceso no autorizado a los archivos', 'grep access /etc/audit/audit.rules', '', 15),
(72, 'Recoge los montajes del sistema de archivos exitosos', 'grep mounts /etc/audit/audit.rules', '', 15),
(73, 'Recopilar eventos de eliminación de archivos por usuario', 'grep delete /etc/audit/audit.rules', '', 15),
(74, 'Recoger cambios en el alcance de la administración del sistema (sudoers)', 'grep scope /etc/audit/audit.rules', '', 15),
(75, 'Recopilar acciones del administrador del sistema (sudolog)', 'grep actions /etc/audit/audit.rules', '', 15),
(76, 'Colectar eventos de la carga y descarga del módulo Kernel', 'grep modules /etc/audit/audit.rules', '', 15),
(77, 'Hacer la configuración de auditoría inmutable - ubuntu/debian', 'tail -n 1 /etc/audit/audit.rules', '', 15),
(78, 'Hacer la configuración de auditoría inmutable - centos', 'grep \"^\\s*[^#]\" /etc/audit/audit.rules | tail -1 -e 2', '', 15),
(79, 'Asegúrese de que el Servicio rsyslog esté activado - ubuntu/debian', 'initctl show-config rsyslog', '', 15),
(80, 'Asegúrese de que el Servicio rsyslog esté activado - centos', 'chkconfig --list rsyslog', '', 15),
(81, 'Asegúrese de que rsyslog esté configurado para enviar registros a un host de registro remoto', 'grep \"^*.*[^I][^I]*@\" /etc/rsyslog.conf', '', 15),
(82, 'Habilitar cron Daemon - ubuntu/debian', '/sbin/initctl show-config cron', '', 16),
(83, 'Habilitar cron Daemon - centos', 'chkconfig --list crond', '', 16),
(84, 'Establecer usuario / propietario de grupo y permiso en / etc / crontab - ubuntu/debian', 'stat -c \"%a %u %g\" /etc/crontab | egrep \".00 0 0\"', '', 16),
(85, 'Establecer usuario / propietario de grupo y permiso en / etc / crontab - centos', 'stat /etc/crontab', '', 16),
(86, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.hourly - ubuntu/debian', 'stat -c \"%a %u %g\" /etc/cron.hourly | egrep \".00 0 0\"', '', 16),
(87, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.hourly - centos', 'stat /etc/cron.hourly', '', 16),
(88, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.daily - ubuntu/debian', 'stat -c \"%a %u %g\" /etc/cron.daily | egrep \".00 0 0\"', '', 16),
(89, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.daily - centos', 'stat /etc/cron.daily', '', 16),
(90, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.weekly - ubuntu/debian', 'stat -c \"%a %u %g\" /etc/cron.weekly | egrep \".00 0 0\"', '', 16),
(91, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.weekly - centos', 'stat /etc/cron.weekly', '', 16),
(92, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.monthly - ubuntu/debian', 'stat -c \"%a %u %g\" /etc/cron.monthly | egrep \".00 0 0\"', '', 16),
(93, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.monthly - centos', 'stat /etc/cron.monthly', '', 16),
(94, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.d - ubuntu/debian', 'stat -c \"%a %u %g\" /etc/cron.d | egrep \".00 0 0\"', '', 16),
(95, 'Establecer usuario / propietario de grupo y permiso en /etc/cron.d - centos', 'stat /etc/cron.d', '', 16),
(96, 'Restringir at / cron a usuarios autorizados -ubuntu/debian', 'ls -l /etc/cron.deny\r\nls -l /etc/at.deny\r\nls -l /etc/cron.allow\r\nls -l /etc/at.allow', '', 16),
(97, 'Restringir at / cron a usuarios autorizados - centos', 'stat /etc/cron.deny\r\nstat /etc/at.deny\r\nstat /etc/cron.allow\r\nstat /etc/at.allow', '', 16),
(98, 'Limitar la reutilización de contraseña - ubuntu/debian', 'grep \"remember\" /etc/pam.d/common-password', '', 17),
(99, 'Limitar la reutilización de contraseña - centos', 'egrep \'^password\\s+sufficient\\s+pam_unix.so\' /etc/pam.d/password-auth\r\negrep \'^password\\s+sufficient\\s+pam_unix.so\' /etc/pam.d/system-auth', '', 17),
(100, 'Establecer los días de caducidad de la contraseña', 'grep PASS_MAX_DAYS /etc/login.defs', '', 17),
(102, 'Establecer cambio de contraseña Número mínimo de días', 'grep PASS_MIN_DAYS /etc/login.defs', '', 17),
(103, 'Asegúrese de que los días de advertencia de caducidad de la contraseña sean 7 o más', 'grep PASS_WARN_AGE /etc/login.defs', '', 17),
(104, 'Asegúrese de que el bloqueo de contraseña inactivo sea de 30 días o menos', 'useradd -D | grep INACTIVE', '', 17),
(105, 'Asegúrese de que las cuentas del sistema no inicien sesión', 'egrep -v \"^\\+\" /etc/passwd | awk -F: \'($1!=\"root\" && $1!=\"sync\" && $1!=\"shutdown\" && $1!=\"halt\" && $3<500 && $7!=\"/sbin/nologin\" && $7!=\"/bin/false\") {print}\'', '', 17),
(106, 'Establezca SSH MaxAuthTries en 4 o menos', 'grep \"^MaxAuthTries\" /etc/ssh/sshd_config', '', 17),
(107, 'Establezca SSH IgnoreRhosts en Sí', 'grep \"^IgnoreRhosts\" /etc/ssh/sshd_config', '', 17),
(108, 'Deshabilitar el inicio de sesión root de SSH', 'grep \"^PermitRootLogin\" /etc/ssh/sshd_config', '', 17),
(109, 'Establezca SSH PermitEmptyPasswords en No', 'grep \"^PermitEmptyPasswords\" /etc/ssh/sshd_config', '', 17),
(110, 'Establecer el intervalo de tiempo de espera inactivo para el inicio de sesión de usuario', 'grep \"^ClientAliveInterval\" /etc/ssh/sshd_config\r\ngrep \"^ClientAliveCountMax\" /etc/ssh/sshd_config', '', 17),
(111, 'Establecer Banner SSH', 'grep \"^Banner\" /etc/ssh/sshd_config', '', 17),
(112, 'Asegúrese de que SELinux no esté deshabilitado en la configuración del gestor de arranque', 'grep \"^\\s*kernel\" /boot/grub/grub.conf', '', 20),
(113, 'Asegúrese de que el estado de SELinux esté haciendo cumplir', 'grep SELINUX=enforcing /etc/selinux/config\r\nsestatus', '', 20),
(114, 'Asegúrese de que la política de SELinux esté configurada', 'grep SELINUXTYPE=targeted /etc/selinux/config\r\nsestatus', '', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_subcapitulo_sistema_operativo`
--

CREATE TABLE `app_subcapitulo_sistema_operativo` (
  `id` int(11) NOT NULL,
  `subcapitulo_id` int(11) NOT NULL,
  `sistemaoperativo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `app_subcapitulo_sistema_operativo`
--

INSERT INTO `app_subcapitulo_sistema_operativo` (`id`, `subcapitulo_id`, `sistemaoperativo_id`) VALUES
(11, 11, 1),
(13, 11, 5),
(14, 12, 1),
(16, 12, 5),
(17, 13, 1),
(18, 13, 5),
(20, 14, 1),
(22, 14, 5),
(23, 15, 1),
(25, 15, 5),
(26, 16, 1),
(27, 16, 4),
(28, 16, 5),
(29, 17, 1),
(31, 17, 5),
(40, 21, 4),
(41, 22, 1),
(42, 22, 5),
(43, 23, 1),
(44, 23, 5),
(45, 24, 4),
(46, 25, 4),
(47, 26, 4),
(48, 27, 4),
(49, 28, 4),
(50, 29, 4),
(51, 30, 1),
(52, 30, 5),
(53, 31, 4),
(54, 32, 1),
(55, 32, 5),
(56, 33, 4),
(57, 34, 1),
(58, 34, 5),
(59, 35, 4),
(60, 36, 1),
(61, 36, 5),
(62, 37, 4),
(63, 38, 1),
(64, 38, 5),
(65, 39, 4),
(66, 40, 1),
(67, 40, 5),
(68, 41, 4),
(69, 42, 1),
(70, 42, 5),
(71, 43, 4),
(72, 44, 1),
(73, 44, 5),
(74, 45, 4),
(75, 46, 1),
(76, 46, 5),
(77, 47, 4),
(78, 48, 1),
(79, 48, 5),
(80, 49, 4),
(81, 50, 1),
(82, 50, 5),
(83, 51, 4),
(84, 52, 1),
(85, 52, 5),
(86, 53, 4),
(87, 54, 4),
(88, 55, 1),
(89, 55, 5),
(90, 56, 1),
(91, 56, 5),
(92, 57, 4),
(93, 58, 1),
(94, 58, 5),
(95, 59, 4),
(111, 61, 1),
(98, 61, 4),
(112, 61, 5),
(109, 63, 1),
(101, 63, 4),
(110, 63, 5),
(102, 64, 1),
(108, 64, 4),
(103, 64, 5),
(105, 66, 1),
(107, 66, 4),
(106, 66, 5),
(113, 67, 1),
(114, 67, 4),
(115, 67, 5),
(116, 68, 1),
(117, 68, 4),
(118, 68, 5),
(119, 69, 1),
(121, 69, 4),
(120, 69, 5),
(122, 70, 1),
(123, 70, 4),
(124, 70, 5),
(127, 72, 1),
(128, 72, 4),
(129, 72, 5),
(130, 73, 1),
(131, 73, 4),
(132, 73, 5),
(133, 74, 1),
(134, 74, 4),
(135, 74, 5),
(136, 75, 1),
(137, 75, 4),
(138, 75, 5),
(139, 76, 1),
(140, 76, 4),
(141, 76, 5),
(142, 77, 1),
(143, 77, 5),
(144, 78, 4),
(145, 79, 1),
(146, 79, 5),
(147, 80, 4),
(148, 81, 1),
(149, 81, 4),
(150, 81, 5),
(151, 82, 1),
(152, 82, 5),
(153, 83, 4),
(154, 84, 1),
(155, 84, 5),
(156, 85, 4),
(157, 86, 1),
(158, 86, 5),
(159, 87, 4),
(160, 88, 1),
(161, 88, 5),
(162, 89, 4),
(163, 90, 1),
(164, 90, 5),
(165, 91, 4),
(166, 92, 1),
(167, 92, 5),
(168, 93, 4),
(169, 94, 1),
(170, 94, 5),
(171, 95, 4),
(172, 96, 1),
(173, 96, 5),
(174, 97, 4),
(175, 98, 1),
(176, 98, 5),
(177, 99, 4),
(178, 100, 1),
(181, 100, 4),
(179, 100, 5),
(182, 102, 1),
(183, 102, 4),
(184, 102, 5),
(185, 103, 1),
(186, 103, 4),
(187, 103, 5),
(188, 104, 1),
(189, 104, 4),
(190, 104, 5),
(191, 105, 4),
(192, 106, 1),
(193, 106, 4),
(194, 106, 5),
(195, 107, 1),
(196, 107, 4),
(197, 107, 5),
(198, 108, 1),
(199, 108, 4),
(200, 108, 5),
(201, 109, 1),
(202, 109, 4),
(203, 109, 5),
(204, 110, 1),
(205, 110, 4),
(206, 110, 5),
(207, 111, 1),
(208, 111, 4),
(209, 111, 5),
(210, 112, 4),
(211, 113, 4),
(212, 114, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Auditores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add Capítulo', 7, 'add_capitulo'),
(20, 'Can change Capítulo', 7, 'change_capitulo'),
(21, 'Can delete Capítulo', 7, 'delete_capitulo'),
(22, 'Can add Sistema Operativo', 8, 'add_sistemaoperativo'),
(23, 'Can change Sistema Operativo', 8, 'change_sistemaoperativo'),
(24, 'Can delete Sistema Operativo', 8, 'delete_sistemaoperativo'),
(25, 'Can add Sub-Capítulo', 9, 'add_subcapitulo'),
(26, 'Can change Sub-Capítulo', 9, 'change_subcapitulo'),
(27, 'Can delete Sub-Capítulo', 9, 'delete_subcapitulo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$xzX1FI6X8QPj$vwSsl8ge+Pc7yKIGQP44BkiTeO5oCVuYCNtg01W1xOE=', '2018-07-22 18:08:01.480223', 1, 'gfonseca003', '', '', 'guillofonseca8@gmail.com', 1, 1, '2018-06-01 01:27:06.571609');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-06-04 03:38:04.146139', '1', 'Ubuntu Server TLS 14.04', 1, '[{\"added\": {}}]', 8, 1),
(2, '2018-06-04 03:38:19.161912', '2', 'Red Hat Enterprise 7', 1, '[{\"added\": {}}]', 8, 1),
(3, '2018-06-04 03:38:33.121158', '3', 'SUSE Enterprise Server 10', 1, '[{\"added\": {}}]', 8, 1),
(4, '2018-06-04 04:24:57.497041', '1', 'Auditoria', 1, '[{\"added\": {}}]', 7, 1),
(5, '2018-06-04 16:37:39.075994', '1', 'Auditores', 1, '[{\"added\": {}}]', 3, 1),
(6, '2018-06-04 16:42:02.301306', '2', '1. Configuración de sistema de archivos', 1, '[{\"added\": {}}]', 7, 1),
(7, '2018-06-04 16:42:20.418805', '3', '2. Seguridad en configuración de Boot', 1, '[{\"added\": {}}]', 7, 1),
(8, '2018-06-04 16:42:49.470702', '4', '3. Procesos adicionales de endurecimiento', 1, '[{\"added\": {}}]', 7, 1),
(9, '2018-06-04 16:43:07.962815', '5', '4 Servicios', 1, '[{\"added\": {}}]', 7, 1),
(10, '2018-06-04 16:43:20.043446', '5', '4. Servicios', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(11, '2018-06-04 16:44:24.248116', '6', '5. Configuración de red y cortafuegos', 1, '[{\"added\": {}}]', 7, 1),
(12, '2018-06-04 16:44:43.225948', '1', '6. Auditoria', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(13, '2018-06-04 16:52:59.791737', '1', 'Asegurar que NIS no está instalado', 1, '[{\"added\": {}}]', 9, 1),
(14, '2018-06-04 16:53:38.710093', '2', 'Asegúrese de que el servidor rsh no está habilitado', 1, '[{\"added\": {}}]', 9, 1),
(15, '2018-06-04 16:54:09.351206', '3', 'Asegúrese de que el cliente rsh no esté instalado', 1, '[{\"added\": {}}]', 9, 1),
(16, '2018-06-04 16:54:38.540961', '4', 'Asegurar que el servidor telnet no está habilitado', 1, '[{\"added\": {}}]', 9, 1),
(17, '2018-06-04 16:55:12.949847', '5', 'Asegúrese de que tftp-server no esté habilitado', 1, '[{\"added\": {}}]', 9, 1),
(18, '2018-06-04 16:55:33.944816', '6', 'Asegúrese de que el sistema X Window no esté instalado', 1, '[{\"added\": {}}]', 9, 1),
(19, '2018-06-04 16:56:26.454358', '7', 'Asegurece que  DHCP Server no este habilitado', 1, '[{\"added\": {}}]', 9, 1),
(20, '2018-06-04 16:56:55.983134', '8', 'Asegúrese que LDAP no este habilitado', 1, '[{\"added\": {}}]', 9, 1),
(21, '2018-06-04 16:57:22.394028', '9', 'Asegúrese de que el servidor FTP no está habilitado', 1, '[{\"added\": {}}]', 9, 1),
(22, '2018-06-04 16:57:52.933778', '10', 'Asegúrese que el servicio rsync no este habilitado', 1, '[{\"added\": {}}]', 9, 1),
(23, '2018-07-20 18:28:15.020467', '7', 'Autenticación y Autorización', 1, '[{\"added\": {}}]', 7, 1),
(24, '2018-07-20 18:28:44.801333', '7', '7. Autenticación y Autorización', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(25, '2018-07-20 18:29:00.772129', '8', '8. Cuentas de usuarios', 1, '[{\"added\": {}}]', 7, 1),
(26, '2018-07-20 18:35:01.017933', '9', '9. Configuración de Banners', 1, '[{\"added\": {}}]', 7, 1),
(27, '2018-07-20 18:37:01.077741', '2', '1. Configuración de sistema de archivos', 2, '[]', 7, 1),
(28, '2018-07-20 18:37:27.429910', '3', '2. Seguridad en configuración de Boot', 2, '[]', 7, 1),
(29, '2018-07-20 18:37:32.396854', '3', '2. Seguridad en configuración de Boot', 2, '[]', 7, 1),
(30, '2018-07-20 18:37:37.612322', '4', '3. Procesos adicionales de endurecimiento', 2, '[]', 7, 1),
(31, '2018-07-20 18:44:27.815570', '10', '10. Control de acceso mandatorio', 1, '[{\"added\": {}}]', 7, 1),
(32, '2018-07-20 18:44:57.358640', '10', '10 . Control de acceso mandatorio', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(33, '2018-07-20 18:45:05.184087', '2', '1 . Configuración de sistema de archivos', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(34, '2018-07-20 18:45:45.844066', '9', '9. Configuración de Banners', 2, '[]', 7, 1),
(35, '2018-07-20 18:46:56.679546', '6', '5. Configuración de red y cortafuegos', 2, '[]', 7, 1),
(36, '2018-07-20 18:47:58.621651', '7', '7. Autenticación y Autorización', 2, '[]', 7, 1),
(37, '2018-07-20 18:48:20.237951', '8', '8. Cuentas de usuarios', 2, '[]', 7, 1),
(38, '2018-07-20 18:48:54.510872', '8', '8. Cuentas de usuarios', 2, '[]', 7, 1),
(39, '2018-07-20 18:49:04.260804', '7', '7. Autenticación y Autorización', 2, '[]', 7, 1),
(40, '2018-07-20 18:57:39.204122', '2', '1 . Permisos en directorios criticos', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(41, '2018-07-20 18:57:49.260675', '10', '*10 . Control de acceso mandatorio', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(42, '2018-07-20 18:58:14.936474', '10', '10 . Control de acceso mandatorio', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(43, '2018-07-20 18:58:40.935152', '2', 'Permisos en directorios criticos', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(44, '2018-07-20 18:58:47.375339', '10', 'Control de acceso mandatorio', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(45, '2018-07-20 18:58:52.967387', '3', 'Seguridad en configuración de Boot', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(46, '2018-07-20 18:58:59.167593', '4', 'Procesos adicionales de endurecimiento', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(47, '2018-07-20 18:59:05.709542', '5', 'Servicios', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(48, '2018-07-20 18:59:11.199546', '6', 'Configuración de red y cortafuegos', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(49, '2018-07-20 18:59:16.700692', '1', 'Auditoria', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(50, '2018-07-20 18:59:22.286212', '7', 'Autenticación y Autorización', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(51, '2018-07-20 18:59:27.611022', '8', 'Cuentas de usuarios', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(52, '2018-07-20 18:59:37.162474', '9', 'Configuración de Banners', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 7, 1),
(53, '2018-07-20 19:20:39.582186', '3', 'SUSE Enterprise Server 10', 3, '', 8, 1),
(54, '2018-07-20 19:29:07.685012', '2', 'Red Hat Enterprise 7', 3, '', 8, 1),
(55, '2018-07-21 00:00:24.423399', '4', 'CentOS 6', 1, '[{\"added\": {}}]', 8, 1),
(56, '2018-07-21 00:00:31.406660', '5', 'Debian 8', 1, '[{\"added\": {}}]', 8, 1),
(57, '2018-07-21 00:01:01.725662', '10', 'Control de acceso mandatorio', 3, '', 7, 1),
(58, '2018-07-21 00:01:01.765736', '9', 'Configuración de Banners', 3, '', 7, 1),
(59, '2018-07-21 00:01:01.797824', '8', 'Cuentas de usuarios', 3, '', 7, 1),
(60, '2018-07-21 00:01:01.823892', '7', 'Autenticación y Autorización', 3, '', 7, 1),
(61, '2018-07-21 00:01:01.855977', '6', 'Configuración de red y cortafuegos', 3, '', 7, 1),
(62, '2018-07-21 00:01:01.882047', '5', 'Servicios', 3, '', 7, 1),
(63, '2018-07-21 00:01:01.914130', '4', 'Procesos adicionales de endurecimiento', 3, '', 7, 1),
(64, '2018-07-21 00:01:01.972287', '3', 'Seguridad en configuración de Boot', 3, '', 7, 1),
(65, '2018-07-21 00:01:02.030440', '2', 'Permisos en directorios criticos', 3, '', 7, 1),
(66, '2018-07-21 00:01:02.057554', '1', 'Auditoria', 3, '', 7, 1),
(67, '2018-07-21 00:01:17.597493', '11', 'Seguridad en Boot', 1, '[{\"added\": {}}]', 7, 1),
(68, '2018-07-21 00:01:35.694444', '12', 'Procesos adicionales de endurecimiento', 1, '[{\"added\": {}}]', 7, 1),
(69, '2018-07-21 00:01:48.478200', '13', 'Servicios', 1, '[{\"added\": {}}]', 7, 1),
(70, '2018-07-21 00:16:44.121784', '14', 'Configuración de red y firewall', 1, '[{\"added\": {}}]', 7, 1),
(71, '2018-07-21 03:06:07.150401', '15', 'Auditoria', 1, '[{\"added\": {}}]', 7, 1),
(72, '2018-07-21 03:06:26.623903', '16', 'Acceso al sistema , autenticación y autorización', 1, '[{\"added\": {}}]', 7, 1),
(73, '2018-07-21 03:06:38.458187', '17', 'Cuentas de usuarios', 1, '[{\"added\": {}}]', 7, 1),
(74, '2018-07-21 03:06:49.947700', '18', 'Mensajes de alerta', 1, '[{\"added\": {}}]', 7, 1),
(75, '2018-07-21 03:07:14.089254', '19', 'Permisos en archivos', 1, '[{\"added\": {}}]', 7, 1),
(76, '2018-07-21 03:07:26.780780', '20', 'Control de acceso mandatorio', 1, '[{\"added\": {}}]', 7, 1),
(77, '2018-07-21 03:11:22.602020', '11', 'Set User/Group Owner on bootloader config', 1, '[{\"added\": {}}]', 9, 1),
(78, '2018-07-21 03:14:02.758947', '12', 'stat -L -c \"%a\" /boot/grub/grub.cfg | egrep \".00\"', 1, '[{\"added\": {}}]', 9, 1),
(79, '2018-07-21 03:14:33.626705', '11', 'Establecer propietario de usuario / grupo en la configuración del gestor de arranque', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(80, '2018-07-21 03:15:09.192285', '12', 'Establecer permisos en la configuración del gestor de arranque', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(81, '2018-07-21 03:23:25.695931', '13', 'Establecer la contraseña del cargador de inicio', 1, '[{\"added\": {}}]', 9, 1),
(82, '2018-07-21 03:24:45.887379', '12', 'Establecer permisos en la configuración del gestor de arranque', 2, '[{\"changed\": {\"fields\": [\"comandos\", \"descripcion\"]}}]', 9, 1),
(83, '2018-07-21 03:25:33.959245', '13', 'Establecer la contraseña del cargador de inicio', 2, '[{\"changed\": {\"fields\": [\"comandos\", \"descripcion\"]}}]', 9, 1),
(84, '2018-07-21 03:27:29.308123', '14', 'Requerir autenticación para el modo de usuario único', 1, '[{\"added\": {}}]', 9, 1),
(85, '2018-07-22 01:11:28.849966', '14', 'Requerir autenticación para el modo de usuario', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(86, '2018-07-22 01:14:42.162241', '15', 'Restringir los volcados del núcleo', 1, '[{\"added\": {}}]', 9, 1),
(87, '2018-07-22 01:16:28.958951', '16', 'Habilite la ubicación de la memoria virtual aleatorizada', 1, '[{\"added\": {}}]', 9, 1),
(88, '2018-07-22 01:57:24.109599', '17', 'Deshabilitar Prelink', 1, '[{\"added\": {}}]', 9, 1),
(89, '2018-07-22 01:57:39.392392', '17', 'Deshabilitar Prelink', 2, '[{\"changed\": {\"fields\": [\"comandos\"]}}]', 9, 1),
(90, '2018-07-22 01:57:55.231263', '15', 'Restringir los volcados del núcleo', 2, '[]', 9, 1),
(91, '2018-07-22 01:59:07.962291', '18', 'Activar AppArmor', 1, '[{\"added\": {}}]', 9, 1),
(92, '2018-07-22 02:02:38.747290', '18', 'Activar AppArmor', 3, '', 9, 1),
(93, '2018-07-22 02:02:57.385306', '17', 'Deshabilitar Prelink', 2, '[]', 9, 1),
(94, '2018-07-22 02:03:14.118255', '14', 'Requerir autenticación para el modo de usuario', 2, '[]', 9, 1),
(95, '2018-07-22 14:57:14.547313', '19', 'Asegúrese de que NIS no esté instalado', 1, '[{\"added\": {}}]', 9, 1),
(96, '2018-07-22 14:59:15.359315', '20', 'Asegúrese de que Chargen no esté habilitado', 1, '[{\"added\": {}}]', 9, 1),
(97, '2018-07-22 15:01:35.447149', '20', 'Asegúrese de que Chargen no esté habilitado', 2, '[{\"changed\": {\"fields\": [\"comandos\", \"descripcion\"]}}]', 9, 1),
(98, '2018-07-22 15:12:48.855563', '21', 'Verificar servicios en Centos', 1, '[{\"added\": {}}]', 9, 1),
(99, '2018-07-22 15:23:10.759758', '22', 'Verificar servicios en Ubuntu/Debian', 1, '[{\"added\": {}}]', 9, 1),
(100, '2018-07-22 15:25:30.061539', '23', 'Deshabilitar el reenvío de IP Ubuntu/Debian', 1, '[{\"added\": {}}]', 9, 1),
(101, '2018-07-22 15:25:51.172659', '24', 'Deshabilitar el reenvio de IP Centos', 1, '[{\"added\": {}}]', 9, 1),
(102, '2018-07-22 15:26:50.388636', '11', 'Establecer propietario de usuario / grupo en la configuración del gestor de arranque', 2, '[{\"changed\": {\"fields\": [\"comandos\", \"descripcion\"]}}]', 9, 1),
(103, '2018-07-22 15:27:14.357613', '25', 'Establecer propietario de usuario / grupo en la configuración del gestor de arranque - Centos', 1, '[{\"added\": {}}]', 9, 1),
(104, '2018-07-22 15:27:37.010550', '11', 'Establecer propietario de usuario / grupo en la configuración del gestor de arranque (ubuntu/debian)', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(105, '2018-07-22 15:28:02.733809', '12', 'Establecer permisos en la configuración del gestor de arranque', 2, '[]', 9, 1),
(106, '2018-07-22 15:28:44.573910', '13', 'Establecer la contraseña del cargador de inicio - ubuntu/debian', 2, '[{\"changed\": {\"fields\": [\"nombre\", \"comandos\", \"descripcion\"]}}]', 9, 1),
(107, '2018-07-22 15:29:07.794951', '26', 'Establecer la contraseña del cargador de inicio - centos', 1, '[{\"added\": {}}]', 9, 1),
(108, '2018-07-22 15:29:38.671668', '14', 'Requerir autenticación para el modo de usuario - ubuntu/debian', 2, '[{\"changed\": {\"fields\": [\"nombre\", \"comandos\"]}}]', 9, 1),
(109, '2018-07-22 15:29:55.408841', '27', 'Requerir autenticación para el modo de usuario - centos', 1, '[{\"added\": {}}]', 9, 1),
(110, '2018-07-22 15:30:26.328568', '15', 'Restringir los volcados del núcleo - ubuntu/debian', 2, '[{\"changed\": {\"fields\": [\"nombre\", \"comandos\", \"descripcion\"]}}]', 9, 1),
(111, '2018-07-22 15:30:42.940032', '28', 'Restringir los volcados del núcleo - centos', 1, '[{\"added\": {}}]', 9, 1),
(112, '2018-07-22 15:31:04.224832', '16', 'Habilite la ubicación de la memoria virtual aleatorizada', 2, '[]', 9, 1),
(113, '2018-07-22 15:31:28.347677', '17', 'Deshabilitar Prelink - ubuntu/debian', 2, '[{\"changed\": {\"fields\": [\"nombre\", \"comandos\"]}}]', 9, 1),
(114, '2018-07-22 15:31:45.619746', '29', 'Deshabilitar Prelink - centos', 1, '[{\"added\": {}}]', 9, 1),
(115, '2018-07-22 15:33:05.720581', '19', 'Asegúrese de que NIS no esté instalado', 2, '[{\"changed\": {\"fields\": [\"comandos\", \"descripcion\"]}}]', 9, 1),
(116, '2018-07-22 15:33:26.350679', '20', 'Asegúrese de que Chargen no esté habilitado', 2, '[{\"changed\": {\"fields\": [\"descripcion\"]}}]', 9, 1),
(117, '2018-07-22 15:33:42.433756', '22', 'Verificar servicios en Ubuntu/Debian', 2, '[]', 9, 1),
(118, '2018-07-22 15:33:58.690490', '20', 'Asegúrese de que Chargen no esté habilitado', 3, '', 9, 1),
(119, '2018-07-22 15:34:09.254518', '19', 'Asegúrese de que NIS no esté instalado', 3, '', 9, 1),
(120, '2018-07-22 15:34:29.999055', '22', 'Verificar servicios en Ubuntu/Debian', 2, '[]', 9, 1),
(121, '2018-07-22 15:35:51.515062', '30', 'Desactivar redireccionamientos de paquetes - Ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(122, '2018-07-22 15:37:02.517053', '31', 'Asegúrese de que el envío de redirección de paquetes esté desactivado - centos', 1, '[{\"added\": {}}]', 9, 1),
(123, '2018-07-22 15:38:25.020666', '32', 'Deshabilitar la aceptación de paquete enrutado de origen - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(124, '2018-07-22 15:39:12.126369', '33', 'Deshabilitar la aceptación de paquete enrutado de origen - centos', 1, '[{\"added\": {}}]', 9, 1),
(125, '2018-07-22 15:45:12.519012', '34', 'Deshabilitar la aceptación de redireccionamiento ICMP - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(126, '2018-07-22 15:47:04.985847', '35', 'Deshabilitar la aceptación de redireccionamiento ICMP - centos', 1, '[{\"added\": {}}]', 9, 1),
(127, '2018-07-22 15:48:10.890788', '36', 'Disable Secure ICMP Redirect Acceptance - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(128, '2018-07-22 15:48:29.915786', '36', 'Deshabilitar la aceptación de redireccionamiento seguro ICMP - ubuntu/debian', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(129, '2018-07-22 15:49:14.423161', '37', 'Deshabilitar la aceptación de redireccionamiento seguro ICMP - centos', 1, '[{\"added\": {}}]', 9, 1),
(130, '2018-07-22 15:50:43.372899', '38', 'Registrar paquetes sospechosos - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(131, '2018-07-22 15:51:25.681911', '39', 'Registrar paquetes sospechosos - centos', 1, '[{\"added\": {}}]', 9, 1),
(132, '2018-07-22 15:52:18.579941', '40', 'Habilitar Ignorar solicitudes de difusión - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(133, '2018-07-22 15:52:47.144156', '41', 'Habilitar Ignorar solicitudes de difusión - centos', 1, '[{\"added\": {}}]', 9, 1),
(134, '2018-07-22 16:01:06.042934', '42', 'Habilitar la protección de mensaje de error - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(135, '2018-07-22 16:01:49.241346', '43', 'Habilitar la protección de mensaje de error - centos', 1, '[{\"added\": {}}]', 9, 1),
(136, '2018-07-22 16:18:52.245193', '44', 'Habilitar las cookies TCP SYN - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(137, '2018-07-22 16:19:24.727055', '45', 'Habilitar las cookies TCP SYN - centos', 1, '[{\"added\": {}}]', 9, 1),
(138, '2018-07-22 16:20:15.181704', '46', 'Instalar encapsuladores TCP - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(139, '2018-07-22 16:20:50.939142', '47', 'Instalar encapsuladores TCP - centos', 1, '[{\"added\": {}}]', 9, 1),
(140, '2018-07-22 16:22:00.994396', '48', 'Verificar los permisos en /etc/hosts.allow - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(141, '2018-07-22 16:22:21.694268', '49', 'Verificar los permisos en /etc/hosts.allow - centos', 1, '[{\"added\": {}}]', 9, 1),
(142, '2018-07-22 16:23:15.107271', '50', 'Verificar los permisos en /etc/hosts.deny - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(143, '2018-07-22 16:26:17.904785', '51', 'Verificar los permisos en /etc/hosts.deny - centos', 1, '[{\"added\": {}}]', 9, 1),
(144, '2018-07-22 16:27:00.212308', '52', 'Asegúrese de que el cortafuegos esté activo - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(145, '2018-07-22 16:27:39.127435', '53', 'Asegúrese de que el cortafuegos esté activo - centos', 1, '[{\"added\": {}}]', 9, 1),
(146, '2018-07-22 16:28:48.382592', '54', 'Asegurar la política predeterminada de denegar firewall', 1, '[{\"added\": {}}]', 9, 1),
(147, '2018-07-22 16:32:39.263194', '55', 'Mantenga toda la información de auditoría - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(148, '2018-07-22 16:33:49.126398', '56', 'Instalar y habilitar el servicio de auditoría - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(149, '2018-07-22 16:34:24.978635', '57', 'Instalar y habilitar el servicio de auditoría - centos', 1, '[{\"added\": {}}]', 9, 1),
(150, '2018-07-22 16:40:27.064198', '58', 'Habilitar la auditoría para los procesos que comienzan antes de la auditoría - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(151, '2018-07-22 16:41:04.262617', '59', 'Habilitar la auditoría para los procesos que comienzan antes de la auditoría - centos', 1, '[{\"added\": {}}]', 9, 1),
(152, '2018-07-22 16:43:38.456551', '60', 'Registrar eventos que modifiquen la información de fecha y hora - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(153, '2018-07-22 16:44:29.901514', '61', 'Registrar eventos que modifiquen la información de fecha y hora - centos', 1, '[{\"added\": {}}]', 9, 1),
(154, '2018-07-22 16:45:20.074213', '62', 'Registrar eventos que modifiquen la información de usuario / grupo - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(155, '2018-07-22 16:45:52.164338', '63', 'Registrar eventos que modifiquen la información de usuario / grupo - centos', 1, '[{\"added\": {}}]', 9, 1),
(156, '2018-07-22 16:47:17.122548', '64', 'Registrar eventos que modifiquen el entorno de red del sistema - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(157, '2018-07-22 16:48:50.463694', '65', 'Registrar eventos que modifiquen el entorno de red del sistema - centos', 1, '[{\"added\": {}}]', 9, 1),
(158, '2018-07-22 16:48:57.675431', '64', 'Registrar eventos que modifiquen el entorno de red del sistema - ubuntu/debian', 2, '[]', 9, 1),
(159, '2018-07-22 16:49:45.528622', '66', 'Registrar eventos que modifiquen los controles de acceso obligatorios del sistema - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(160, '2018-07-22 16:52:28.500335', '66', 'Registrar eventos que modifiquen los controles de acceso obligatorios del sistema', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(161, '2018-07-22 16:52:42.979805', '64', 'Registrar eventos que modifiquen el entorno de red del sistema - ubuntu/debian', 2, '[]', 9, 1),
(162, '2018-07-22 16:52:52.554090', '63', 'Registrar eventos que modifiquen la información de usuario / grupo - centos', 2, '[]', 9, 1),
(163, '2018-07-22 16:53:20.199616', '64', 'Registrar eventos que modifiquen el entorno de red del sistema', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(164, '2018-07-22 16:53:28.662881', '65', 'Registrar eventos que modifiquen el entorno de red del sistema - centos', 3, '', 9, 1),
(165, '2018-07-22 16:53:54.323941', '63', 'Registrar eventos que modifiquen la información de usuario / grupo', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(166, '2018-07-22 16:54:01.874443', '62', 'Registrar eventos que modifiquen la información de usuario / grupo - ubuntu/debian', 3, '', 9, 1),
(167, '2018-07-22 16:54:14.376850', '60', 'Registrar eventos que modifiquen la información de fecha y hora - ubuntu/debian', 2, '[]', 9, 1),
(168, '2018-07-22 16:54:32.489206', '61', 'Registrar eventos que modifiquen la información de fecha y hora', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(169, '2018-07-22 16:54:39.640225', '60', 'Registrar eventos que modifiquen la información de fecha y hora - ubuntu/debian', 3, '', 9, 1),
(170, '2018-07-22 16:55:56.896949', '67', 'Recopilar eventos de inicio y cierre de sesión', 1, '[{\"added\": {}}]', 9, 1),
(171, '2018-07-22 16:56:54.414879', '68', 'Recoger información de inicio de sesión', 1, '[{\"added\": {}}]', 9, 1),
(172, '2018-07-22 16:56:59.926761', '67', 'Recopilar eventos de inicio y cierre de sesión', 2, '[]', 9, 1),
(173, '2018-07-22 16:58:07.766586', '69', 'Asegurar que se recopilen los eventos de modificación de permisos de control de acceso discrecional - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(174, '2018-07-22 16:59:36.687686', '69', 'Asegurar que se recopilen los eventos de modificación de permisos de control de acceso discrecional - centos', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(175, '2018-07-22 17:00:39.666702', '70', 'Recopilar intentos fallidos de acceso no autorizado a los archivos', 1, '[{\"added\": {}}]', 9, 1),
(176, '2018-07-22 17:02:13.861456', '71', 'Recopilar el uso de comandos privilegiados - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(177, '2018-07-22 17:02:35.479770', '71', 'Recopilar el uso de comandos privilegiados - ubuntu/debian', 2, '[{\"changed\": {\"fields\": [\"comandos\"]}}]', 9, 1),
(178, '2018-07-22 17:03:25.368613', '71', 'Recopilar el uso de comandos privilegiados - ubuntu/debian', 3, '', 9, 1),
(179, '2018-07-22 17:04:20.575377', '72', 'Recoge los montajes del sistema de archivos exitosos', 1, '[{\"added\": {}}]', 9, 1),
(180, '2018-07-22 17:04:59.071559', '73', 'Recopilar eventos de eliminación de archivos por usuario', 1, '[{\"added\": {}}]', 9, 1),
(181, '2018-07-22 17:05:59.809630', '74', 'Recoger cambios en el alcance de la administración del sistema (sudoers)', 1, '[{\"added\": {}}]', 9, 1),
(182, '2018-07-22 17:07:40.612798', '75', 'Recopilar acciones del administrador del sistema (sudolog)', 1, '[{\"added\": {}}]', 9, 1),
(183, '2018-07-22 17:09:05.496441', '76', 'Colectar eventos de la carga y descarga del módulo Kernel', 1, '[{\"added\": {}}]', 9, 1),
(184, '2018-07-22 17:10:13.783815', '77', 'Hacer la configuración de auditoría inmutable - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(185, '2018-07-22 17:10:42.145737', '78', 'Hacer la configuración de auditoría inmutable - centos', 1, '[{\"added\": {}}]', 9, 1),
(186, '2018-07-22 17:11:56.733642', '79', 'Asegúrese de que el Servicio rsyslog esté activado - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(187, '2018-07-22 17:12:26.590831', '80', 'Asegúrese de que el Servicio rsyslog esté activado - centos', 1, '[{\"added\": {}}]', 9, 1),
(188, '2018-07-22 17:14:33.166754', '81', 'Asegúrese de que rsyslog esté configurado para enviar registros a un host de registro remoto', 1, '[{\"added\": {}}]', 9, 1),
(189, '2018-07-22 17:16:09.521861', '82', 'Habilitar cron Daemon - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(190, '2018-07-22 17:20:35.197861', '83', 'Habilitar cron Daemon - centos', 1, '[{\"added\": {}}]', 9, 1),
(191, '2018-07-22 17:26:46.986931', '84', 'Establecer usuario / propietario de grupo y permiso en / etc / crontab - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(192, '2018-07-22 17:27:09.569223', '85', 'Establecer usuario / propietario de grupo y permiso en / etc / crontab - centos', 1, '[{\"added\": {}}]', 9, 1),
(193, '2018-07-22 17:28:02.415668', '86', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.hourly - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(194, '2018-07-22 17:28:45.814054', '87', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.hourly - centos', 1, '[{\"added\": {}}]', 9, 1),
(195, '2018-07-22 17:29:30.311169', '88', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.daily - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(196, '2018-07-22 17:29:55.235891', '89', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.daily - centos', 1, '[{\"added\": {}}]', 9, 1),
(197, '2018-07-22 17:30:49.907981', '90', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.weekly - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(198, '2018-07-22 17:31:18.324030', '91', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.weekly - centos', 1, '[{\"added\": {}}]', 9, 1),
(199, '2018-07-22 17:32:28.379045', '92', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.monthly - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(200, '2018-07-22 17:32:54.677026', '93', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.monthly - centos', 1, '[{\"added\": {}}]', 9, 1),
(201, '2018-07-22 17:33:31.667045', '94', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.d - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(202, '2018-07-22 17:33:59.399000', '95', 'Establecer usuario / propietario de grupo y permiso en /etc/cron.d - centos', 1, '[{\"added\": {}}]', 9, 1),
(203, '2018-07-22 17:35:31.585840', '96', 'Restringir at / cron a usuarios autorizados -ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(204, '2018-07-22 17:36:16.242098', '97', 'Restringir at / cron a usuarios autorizados - centos', 1, '[{\"added\": {}}]', 9, 1),
(205, '2018-07-22 17:46:25.777934', '98', 'Limitar la reutilización de contraseña - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(206, '2018-07-22 17:47:17.958931', '99', 'Limitar la reutilización de contraseña - centos', 1, '[{\"added\": {}}]', 9, 1),
(207, '2018-07-22 17:48:12.015480', '100', 'Establecer los días de caducidad de la contraseña - ubuntu/debian', 1, '[{\"added\": {}}]', 9, 1),
(208, '2018-07-22 17:48:44.653367', '101', 'Establecer los días de caducidad de la contraseña - centos', 1, '[{\"added\": {}}]', 9, 1),
(209, '2018-07-22 17:48:52.801468', '101', 'Establecer los días de caducidad de la contraseña - centos', 2, '[]', 9, 1),
(210, '2018-07-22 17:49:01.687519', '100', 'Establecer los días de caducidad de la contraseña - ubuntu/debian', 2, '[]', 9, 1),
(211, '2018-07-22 17:49:24.450029', '100', 'Establecer los días de caducidad de la contraseña', 2, '[{\"changed\": {\"fields\": [\"nombre\"]}}]', 9, 1),
(212, '2018-07-22 17:49:29.643213', '101', 'Establecer los días de caducidad de la contraseña - centos', 3, '', 9, 1),
(213, '2018-07-22 17:51:21.338166', '102', 'Establecer cambio de contraseña Número mínimo de días', 1, '[{\"added\": {}}]', 9, 1),
(214, '2018-07-22 17:55:43.317135', '103', 'Asegúrese de que los días de advertencia de caducidad de la contraseña sean 7 o más', 1, '[{\"added\": {}}]', 9, 1),
(215, '2018-07-22 18:08:25.212570', '104', 'Asegúrese de que el bloqueo de contraseña inactivo sea de 30 días o menos', 1, '[{\"added\": {}}]', 9, 1),
(216, '2018-07-22 18:09:47.988322', '105', 'Asegúrese de que las cuentas del sistema no inicien sesión', 1, '[{\"added\": {}}]', 9, 1),
(217, '2018-07-22 18:10:39.571463', '106', 'Establezca SSH MaxAuthTries en 4 o menos', 1, '[{\"added\": {}}]', 9, 1),
(218, '2018-07-22 18:11:22.451449', '107', 'Establezca SSH IgnoreRhosts en Sí', 1, '[{\"added\": {}}]', 9, 1),
(219, '2018-07-22 18:12:28.639542', '108', 'Deshabilitar el inicio de sesión root de SSH', 1, '[{\"added\": {}}]', 9, 1),
(220, '2018-07-22 18:13:15.621017', '109', 'Establezca SSH PermitEmptyPasswords en No', 1, '[{\"added\": {}}]', 9, 1),
(221, '2018-07-22 18:14:07.450989', '110', 'Establecer el intervalo de tiempo de espera inactivo para el inicio de sesión de usuario', 1, '[{\"added\": {}}]', 9, 1),
(222, '2018-07-22 18:15:06.023409', '111', 'Establecer Banner SSH', 1, '[{\"added\": {}}]', 9, 1),
(223, '2018-07-22 18:16:43.476566', '112', 'Asegúrese de que SELinux no esté deshabilitado en la configuración del gestor de arranque', 1, '[{\"added\": {}}]', 9, 1),
(224, '2018-07-22 18:17:52.690578', '113', 'Asegúrese de que el estado de SELinux esté haciendo cumplir', 1, '[{\"added\": {}}]', 9, 1),
(225, '2018-07-22 18:18:37.154446', '114', 'Asegúrese de que la política de SELinux esté configurada', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'app', 'capitulo'),
(8, 'app', 'sistemaoperativo'),
(9, 'app', 'subcapitulo'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-06-01 01:23:37.155860'),
(2, 'auth', '0001_initial', '2018-06-01 01:23:44.420141'),
(3, 'admin', '0001_initial', '2018-06-01 01:23:46.645540'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-06-01 01:23:46.682637'),
(5, 'app', '0001_initial', '2018-06-01 01:23:50.723745'),
(6, 'app', '0002_auto_20180511_2016', '2018-06-01 01:23:53.694163'),
(7, 'contenttypes', '0002_remove_content_type_name', '2018-06-01 01:23:55.222162'),
(8, 'auth', '0002_alter_permission_name_max_length', '2018-06-01 01:23:56.189344'),
(9, 'auth', '0003_alter_user_email_max_length', '2018-06-01 01:23:57.419322'),
(10, 'auth', '0004_alter_user_username_opts', '2018-06-01 01:23:57.514456'),
(11, 'auth', '0005_alter_user_last_login_null', '2018-06-01 01:23:58.017078'),
(12, 'auth', '0006_require_contenttypes_0002', '2018-06-01 01:23:58.082550'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2018-06-01 01:23:58.155710'),
(14, 'auth', '0008_alter_user_username_max_length', '2018-06-01 01:23:58.875386'),
(15, 'sessions', '0001_initial', '2018-06-01 01:24:00.117077');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1pz62ou8n33dsyfqq8gu6m1bytpo4fnn', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-06-04 17:06:30.050641'),
('23kvmynogcxs0byv9tnrrp3wn0rb7tr8', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-21 00:30:00.026198'),
('2h1ptq2ye1823viu8fk76x6htev61ovs', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-06-01 01:59:02.171591'),
('6cck5m1z0fy7p0y2vj5aam2t9y3rmwpa', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-06-04 04:07:42.372904'),
('6hd93kkjiym9b8m3hgnpha8ec2dq8qhg', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-06-04 04:44:03.078421'),
('6zekmxig5a8p2un22lssk05yvahgz4eh', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-20 18:41:18.497517'),
('81g9yu1xicsz9yeo08z3str16677vouj', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-22 01:41:18.241250'),
('9vnx4pjnxytd58r9w5sfb8ziq91g5ezi', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-21 03:35:57.319730'),
('csusnpl1nf877nu46n4rmszgglzuyhdy', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-22 02:26:38.853823'),
('dv46k9gv29sjnhbjimj2gn3y8qs32d1m', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-22 17:01:40.738658'),
('ezd3rve3zxahxp79csh76ydm3a12a8pj', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-22 17:31:55.774949'),
('gel8tyb418qt4yg7g2fxiewlf3gj32ya', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-22 15:56:26.583139'),
('hc6524aara2bkiq56ltjpdbbiym7e9bq', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-06-03 16:14:52.534336'),
('jrllmrcdu0ecnkjk7utgz2t2tae8milp', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-20 19:14:14.243947'),
('kb853j85w1s57kdbdu8eeqh0b98s3rsv', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-22 18:02:09.903086'),
('pxhpjqu635umf2hjlsw1yw7f484hh5bx', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-22 15:26:00.018607'),
('vzr66tlo8wgkv24pajclbj78561quf17', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-22 16:30:46.203134'),
('ytr2uxnsf823gpjqqskvfc484mum87bf', 'MmUyZDVlNmM3ZjI4NDk5ZmFiMWQ2ZDZmZjViOWJlNjhmYjJlMmNiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNTUwODRjM2RlYTBiMTZjZWI4YmE5NzU3YmQzYzAxYThkYjY1NDY2In0=', '2018-07-20 19:50:18.087720');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `app_capitulo`
--
ALTER TABLE `app_capitulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_capitulo_sistema_operativo`
--
ALTER TABLE `app_capitulo_sistema_operativo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_capitulo_sistema_ope_capitulo_id_sistemaopera_b1bf020c_uniq` (`capitulo_id`,`sistemaoperativo_id`),
  ADD KEY `app_capitulo_sistema_sistemaoperativo_id_68ab3c23_fk_app_siste` (`sistemaoperativo_id`);

--
-- Indices de la tabla `app_sistemaoperativo`
--
ALTER TABLE `app_sistemaoperativo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `app_subcapitulo`
--
ALTER TABLE `app_subcapitulo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_subcapitulo_capitulo_id_a24e836b_fk_app_capitulo_id` (`capitulo_id`);

--
-- Indices de la tabla `app_subcapitulo_sistema_operativo`
--
ALTER TABLE `app_subcapitulo_sistema_operativo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_subcapitulo_sistema__subcapitulo_id_sistemaop_040bbca6_uniq` (`subcapitulo_id`,`sistemaoperativo_id`),
  ADD KEY `app_subcapitulo_sist_sistemaoperativo_id_dd1784e5_fk_app_siste` (`sistemaoperativo_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `app_capitulo`
--
ALTER TABLE `app_capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `app_capitulo_sistema_operativo`
--
ALTER TABLE `app_capitulo_sistema_operativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `app_sistemaoperativo`
--
ALTER TABLE `app_sistemaoperativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `app_subcapitulo`
--
ALTER TABLE `app_subcapitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de la tabla `app_subcapitulo_sistema_operativo`
--
ALTER TABLE `app_subcapitulo_sistema_operativo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `app_capitulo_sistema_operativo`
--
ALTER TABLE `app_capitulo_sistema_operativo`
  ADD CONSTRAINT `app_capitulo_sistema_capitulo_id_ea11e379_fk_app_capit` FOREIGN KEY (`capitulo_id`) REFERENCES `app_capitulo` (`id`),
  ADD CONSTRAINT `app_capitulo_sistema_sistemaoperativo_id_68ab3c23_fk_app_siste` FOREIGN KEY (`sistemaoperativo_id`) REFERENCES `app_sistemaoperativo` (`id`);

--
-- Filtros para la tabla `app_subcapitulo`
--
ALTER TABLE `app_subcapitulo`
  ADD CONSTRAINT `app_subcapitulo_capitulo_id_a24e836b_fk_app_capitulo_id` FOREIGN KEY (`capitulo_id`) REFERENCES `app_capitulo` (`id`);

--
-- Filtros para la tabla `app_subcapitulo_sistema_operativo`
--
ALTER TABLE `app_subcapitulo_sistema_operativo`
  ADD CONSTRAINT `app_subcapitulo_sist_sistemaoperativo_id_dd1784e5_fk_app_siste` FOREIGN KEY (`sistemaoperativo_id`) REFERENCES `app_sistemaoperativo` (`id`),
  ADD CONSTRAINT `app_subcapitulo_sist_subcapitulo_id_e7d89968_fk_app_subca` FOREIGN KEY (`subcapitulo_id`) REFERENCES `app_subcapitulo` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
