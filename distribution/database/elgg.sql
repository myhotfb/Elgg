#
# ELGG database schema
#
# This must be installed into your chosen Elgg database before you can run Elgg
#

# --------------------------------------------------------


-- 
-- Table structure for table `content_flags`
-- 

CREATE TABLE `content_flags` (
  `ident` int(11) NOT NULL auto_increment,
  `url` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`ident`),
  KEY `url` (`url`)
) ;


-- --------------------------------------------------------

-- 
-- Table structure for table `file_folders`
-- 

CREATE TABLE `file_folders` (
  `ident` int(11) NOT NULL auto_increment,
  `owner` int(11) NOT NULL default '0',
  `files_owner` int(11) NOT NULL default '0',
  `parent` int(11) NOT NULL default '0',
  `name` varchar(128) NOT NULL default '',
  `access` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`,`parent`,`name`,`access`)
) ;


-- --------------------------------------------------------

-- 
-- Table structure for table `file_metadata`
-- 

CREATE TABLE `file_metadata` (
  `ident` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `value` text NOT NULL,
  `file_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ident`),
  KEY `name` (`name`,`file_id`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

-- 
-- Table structure for table `files`
-- 

CREATE TABLE `files` (
  `ident` int(11) NOT NULL auto_increment,
  `owner` int(11) NOT NULL default '0',
  `files_owner` int(11) NOT NULL default '0',
  `folder` int(11) NOT NULL default '-1',
  `community` int(11) NOT NULL default '-1',
  `title` varchar(255) NOT NULL default '',
  `originalname` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  `location` varchar(255) NOT NULL default '',
  `access` varchar(255) NOT NULL default '',
  `size` int(11) NOT NULL default '0',
  `time_uploaded` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`,`folder`,`access`),
  KEY `size` (`size`),
  KEY `time_uploaded` (`time_uploaded`),
  KEY `originalname` (`originalname`),
  KEY `community` (`community`),
  KEY `files_owner` (`files_owner`)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `friends`
-- 

CREATE TABLE `friends` (
  `ident` int(11) NOT NULL auto_increment,
  `owner` int(11) NOT NULL default '0',
  `friend` int(11) NOT NULL default '0',
  `status` varchar(4) NOT NULL default 'perm',
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`,`friend`),
  KEY `friend` (`friend`),
  KEY `status` (`status`)
) ;

-- 
-- Table structure for table `friends_requests`
-- 

CREATE TABLE `friends_requests` (
`ident` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
`owner` INT NOT NULL ,
`friend` INT NOT NULL ,
PRIMARY KEY ( `ident` ) ,
INDEX ( `owner` )
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `group_membership`
-- 

CREATE TABLE `group_membership` (
  `ident` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `group_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ident`),
  KEY `user_id` (`user_id`,`group_id`)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `groups`
-- 

CREATE TABLE `groups` (
  `ident` int(11) NOT NULL auto_increment,
  `owner` int(11) NOT NULL default '0',
  `name` varchar(128) NOT NULL default '',
  `access` varchar(255) NOT NULL default 'PUBLIC',
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`,`name`),
  KEY `access` (`access`)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `icons`
-- 

CREATE TABLE `icons` (
  `ident` int(11) NOT NULL auto_increment,
  `owner` int(11) NOT NULL default '0',
  `filename` varchar(128) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`,`filename`,`description`)
) ;

INSERT INTO icons SET ident = -1, filename = "default.png";

-- --------------------------------------------------------

-- 
-- Table structure for table `invitations`
-- 

CREATE TABLE `invitations` (
  `ident` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `code` varchar(128) NOT NULL default '',
  `owner` int(11) NOT NULL default '0',
  `added` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ident`),
  KEY `name` (`name`,`email`,`code`,`owner`,`added`)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `password_requests`
-- 

CREATE TABLE `password_requests` (
  `ident` int(11) NOT NULL auto_increment,
  `owner` int(11) NOT NULL default '0',
  `code` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`,`code`)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `profile_data`
-- 

CREATE TABLE `profile_data` (
  `ident` int(10) unsigned NOT NULL auto_increment,
  `owner` int(10) unsigned NOT NULL default '0',
  `access` varchar(16) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`,`access`,`name`)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `tags`
-- 

CREATE TABLE `tags` (
  `ident` int(11) NOT NULL auto_increment,
  `tag` varchar(128) NOT NULL default '',
  `tagtype` varchar(128) NOT NULL default '',
  `ref` int(11) NOT NULL default '0',
  `access` varchar(128) NOT NULL default '',
  `owner` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ident`),
  KEY `tag` (`tag`,`tagtype`,`ref`),
  KEY `owner` (`owner`),
  FULLTEXT KEY `tag_2` (`tag`)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `template_elements`
-- 

CREATE TABLE `template_elements` (
  `ident` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL default '',
  `content` text NOT NULL,
  `template_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ident`),
  KEY `name` (`name`,`template_id`)
) ;

INSERT INTO `template_elements` VALUES (40115, 'pageshell', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n<title>{{title}}</title>\r\n{{metatags}}\r\n</head>\r\n<body>\r\n<!-- elgg banner and logo -->\r\n<div id="container"><!-- start container -->\r\n	<div id="statusbar"><!-- start statusbar -->\r\n		<div id="welcome"><!-- start welcome -->\r\n			<p>Welcome {{userfullname}}</p>\r\n		</div><!-- end welcome -->\r\n		{{topmenu}}\r\n	</div><!-- end statusbar -->\r\n	<div id="header"><!-- start header -->\r\n		<h1>Elgg</h1>\r\n			<h2>Community learning space</h2>\r\n			<ul id="navigation">\r\n				{{menu}}\r\n			</ul>\r\n	</div><!-- end header -->\r\n	<div id="content_holder"><!-- start contentholder -->\r\n		<div id="maincontent_container"><!-- start main content -->\r\n			{{messageshell}}\r\n			{{mainbody}}\r\n		</div><!-- end main content -->\r\n		<div id="sidebar_container">\r\n			<div id="sidebar"><!-- start sidebar -->\r\n				<ul><!-- open sidebar lists -->\r\n				{{sidebar}}\r\n				</ul>\r\n			</div><!-- end sidebar -->\r\n		</div><!-- end sidebar_container -->\r\n	</div><!-- end contentholder -->\r\n	<div class="clearall" />\r\n	<div id="footer"><!-- start footer -->\r\n               Using the <a href="http://www.ifelse.co.uk/gentle-calm">Gentle Calm theme</a> designed by <a href="http://www.ifelse.co.uk">Phu Ly</a>.<br />\r\n		<a href="http://elgg.net"><img src="http://development.apcala.com/_templates/elgg_powered.png" alt="Powered by Elgg" title="Powered by Elgg" border="0" /></a>\r\n	</div><!-- end footer -->\r\n</div><!-- end container -->\r\n</body>\r\n</html>', 5);
INSERT INTO `template_elements` VALUES (40120, 'css', '/* \r\nTheme Name: Connections\r\nTheme URI: http://wpthemes.info\r\nVersion: 1.0\r\nDescription: A Theme from wpthemes.Info\r\nAuthor: Patricia Muller\r\nAuthor URI: http://www.vanillamist.com/blog/\r\n*/\r\nbody {\r\n	margin:0;\r\n	padding:0;\r\n	font-family: ''Trebuchet MS'',Georgia, Times, Times New Roman, sans-serif;\r\n	font-size: 80%;\r\n	text-align:center;\r\n	color:#29303B;\r\n	line-height:1.3em;\r\n	background: #F3F6ED;\r\n}\r\na {\r\n	color: #909D73;	\r\n	text-decoration:none;\r\n	font-size:100%;\r\n}\r\na:visited {\r\n	color: #8a3207;\r\n}\r\na:hover {\r\n	color: #753206;\r\n	text-decoration:underline;\r\n}\r\n\r\nh1 {\r\n       margin:0px 0px 15px 0px;\r\n	padding:0px;\r\n	font-size:120%;\r\n	font-weight:900;\r\n}\r\n\r\n\r\nh2, h3, h4, h5 {\r\n	margin:0px 0px 5px 0px;\r\n	padding:0px;\r\n	font-size:100%\r\n}\r\n\r\nblockquote {\r\n	/*margin: 15px 30px 0 45px;*/\r\n	padding: 0 0 0 45px;\r\n	background: url(''/_templates/connections/blockquote.gif'') no-repeat left top;\r\n	font-style:italic;\r\n}\r\n\r\n\r\nh3 {\r\n	margin: 0;\r\n	padding: 0;\r\n	font-size:1.3em;\r\n}\r\np {\r\n	margin: 0 0 1em;\r\n	padding: 0;\r\n	line-height: 1.5em;\r\n}\r\nh1, h2, h3, h4 {\r\n	font-family: Georgia, "Lucida Sans Unicode", lucida, Verdana, sans-serif;\r\n	font-weight: normal;\r\n	letter-spacing: 1px;\r\n}\r\n\r\ninput, textarea \r\n{\r\n	background: #F3F6ED;\r\n	border: #E1D6C6 1px solid;\r\n}\r\n\r\n#container \r\n{\r\n	background:#fff url(''/_templates/connections/rap.jpg'') center repeat-y;\r\n	width:760px;\r\n	margin:0 auto;\r\n	padding:0px 8px;\r\n	text-align:left;\r\n	font-family: Trebuchet MS,Georgia, Arial, serif;\r\n}\r\n\r\n/*-----------------------------------------\r\nTOP STATUS BAR \r\n-------------------------------------------*/\r\n#header {\r\n	background:#fff url(''/_templates/connections/top.jpg'') no-repeat bottom; 	\r\n 	height: 183px;\r\n	margin: 0 auto;\r\n	width:760px;\r\n	padding:0;\r\n	border:#fc9 0px solid;\r\n}\r\n\r\n#welcome {\r\n	float: left;\r\n}\r\n\r\n#welcome p{\r\n	font-weight:bold;\r\n       font-size:110%;\r\n	padding:0 0 0 4px;\r\n	margin:0px;\r\n}\r\n\r\n#global_menuoptions {\r\n	text-align: right;\r\n	padding:0 5px 0 0;\r\n	margin:0px;\r\n    float:right;\r\n}\r\n\r\n#global_menuoptions ul {\r\n	margin: 0; \r\n	padding: 0;\r\n}\r\n\r\n#global_menuoptions li {\r\n	margin: 0; \r\n	padding: 0;\r\n	display: inline;\r\n	list-style-type: none;\r\n	border: none;\r\n}\r\n\r\n#global_menuoptions a {\r\n	text-decoration: none;\r\n	font-size:80%;\r\n}\r\n\r\n#global_menuoptions a:hover{\r\n    text-decoration:underline;\r\n}\r\n\r\n	\r\n/*-------------------------------------------------\r\nnavigation\r\n-------------------------------------------------*/\r\n\r\n#navigation {\r\n	height: 21px;\r\n	margin: 0;\r\n	padding-left: 20px;\r\n	text-align:left;\r\n    padding-top:155px;\r\n}\r\n\r\n#navigation li {\r\n	margin: 0; \r\n	padding: 0;\r\n	display: inline;\r\n	list-style-type: none;\r\n	border: none;\r\n}\r\n	\r\n#navigation a:link, #navigation a:visited {\r\n\r\n	background: #524B21; /*#9BBB38;*/\r\n	font-size:85%;\r\n	font-weight: normal;\r\n	padding: 4px 6px;\r\n	margin: 0 2px 0 0;\r\n	border: 0px solid #036;\r\n	border-bottom: #9BBB38;\r\n	text-decoration: none;\r\n	color: #fff;\r\n}\r\n\r\n#navigation a:link.current, #navigation a:visited.current {\r\n	border-bottom: 0px solid #9BBB38;\r\n	background: #F5F5E7;\r\n	color: #9BBB38;\r\n	font-weight: bold;\r\n}\r\n\r\n#navigation a:hover {\r\n	color: #fff;\r\n	background: #000;\r\n}\r\n#navigation li a:hover{\r\n	background:#000;\r\n	}\r\n\r\n#content_holder \r\n{\r\n	margin:0 auto;\r\n	padding:0;\r\n	background:#000 url(''/_templates/connections/content_bg.gif'') repeat;\r\n	width:740px;\r\n}\r\n#maincontent_container {\r\n	width:510px;\r\n	float:left;\r\n	padding:5px;\r\n	margin:0;\r\n	overflow:hidden;\r\n	display:inline;\r\n}\r\n\r\n/*-----------------------------------------------------------------------\r\nDIV''s to help control look and feel - infoholder holds all the profile data\r\nand is always located in within ''maincontentdisplay''\r\n\r\n-------------------------------------------------------------------------*/\r\n\r\n/*------ holds profile data -------*/\r\n.infoholder {\r\n    border:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n    margin:0 0 5px 0;\r\n}\r\n\r\n.infoholder p {\r\n   padding:0 0 0 5px;\r\n}\r\n\r\n.infoholder .fieldname h2 {\r\n	      border:0;\r\n          border-bottom:1px;\r\n    	  border-color:#eee;\r\n    	  border-style:solid;\r\n	      padding:5px;\r\n          color:#666;\r\n          background:#fff;\r\n}   \r\n\r\n.infoholder_twocolumn {\r\n    padding:4px;\r\n    border:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n    margin:0 0 10px 0;\r\n }\r\n\r\n.infoholder_twocolumn .fieldname h3{\r\n    color:#666;\r\n    background:#fff;\r\n    border:0px;\r\n    border-bottom:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n}\r\n\r\n/*----------- holds administration data---------*/\r\n\r\n.admin_datatable {\r\n  border:1px;\r\n  border-color:#eee;\r\n  border-style:solid;\r\n  margin:0 0 5px 0;\r\n}\r\n\r\n.admin_datatable p {\r\n     padding:0px;\r\n     margin:0px;\r\n}\r\n\r\n.admin_datatable a {\r\n   \r\n}\r\n\r\n\r\n.admin_datatable td {\r\n   text-align:left;\r\n}\r\n\r\n.admin_datatable h3{\r\n     color:#666;\r\n     background:#fff;\r\n     font-size:85%;\r\n}\r\n\r\n.admin_datatable h5 {\r\n     padding:0px;\r\n     margin:0px;\r\n}\r\n\r\n/*---- header plus one row of content ------*/\r\n\r\n.databox_vertical {\r\n   border:1px;\r\n   border-style:solid;\r\n   border-color:#DDD;\r\n   margin:0 0 5px 0;\r\n   padding:5px;\r\n }\r\n\r\n .databox_vertical p{\r\n   padding:0px;\r\n   margin:0px;\r\n }\r\n\r\n.databox_vertical .fieldname h3 {\r\n  padding:0px;\r\n  margin:0px;\r\n  font-size:90%;\r\n}\r\n\r\n/*------- holds file content ----*/\r\n\r\n.filetable {\r\n   background-color: #F9F9F9;\r\n   color:#000;\r\n   border:1px;\r\n   border-style:solid;\r\n   border-color:#DDD;\r\n   margin:0 0 5px 0;\r\n   width:100%;\r\n }\r\n\r\n .filetable p{\r\n   padding:0px;\r\n   margin:0px;\r\n   color:#000; /*#1181AA;*/\r\n   background:#fff;\r\n }\r\n\r\n.filetable a{\r\n   \r\n }\r\n\r\n\r\n.filetable table {\r\n    text-align:left;\r\n}\r\n\r\n#edit_files h4 {\r\n     \r\n}\r\n  \r\n\r\n/*------- holds fodler content ------*/\r\n\r\n.foldertable {\r\n   background-color: #F9F9F9;\r\n   color:#000;\r\n   border:1px;\r\n   border-style:solid;\r\n   border-color:#DDD;\r\n   margin:0 0 5px 0;\r\n   width:100%;\r\n }\r\n\r\n.foldertable a{\r\n  \r\n }\r\n\r\n .foldertable p{\r\n   padding:0px;\r\n   margin:0px;\r\n   color:#1181AA;\r\n   background:#fff;\r\n }\r\n\r\n.foldertable table {\r\n    text-align:left;\r\n}\r\n\r\n/*------- holds network data ------*/\r\n\r\n.networktable {\r\n   \r\n}\r\n\r\n#sidebar {\r\n	width:186px;\r\n	float:right;\r\n	padding:0px 8px 10px 8px;\r\n	margin:0;\r\n	font-size:1em;\r\n	color:#333;\r\n	display:inline;\r\n}\r\n\r\n\r\n#header h1 \r\n{\r\n	margin: 0;	\r\n	font-size: 1.6em;	\r\n	padding:10px 20px 0 0;\r\n	text-align:right;	\r\n}\r\n#header h1 a \r\n{\r\n	color:#B5C09D;\r\n	text-decoration:none;\r\n}\r\n#header h1 a:hover \r\n{\r\n	color:#F7F3ED;\r\n}\r\n\r\n#sidebar h2 {\r\n	margin: 10px 0 0 0;\r\n	padding:2px;\r\n	font-size: 90%;\r\n	color: #676E04;\r\n	text-align:center;\r\n	background:url(''/_templates/connections/sidenav_top.jpg'') no-repeat center;\r\n	border:#ccc 0px solid;\r\n	height:22px;\r\n	font-weight:bold;\r\n}\r\n#sidebar ul {\r\n	list-style-type: none;\r\n	padding: 0px;\r\n	margin: 0;\r\n}\r\n\r\n#sidebar ul li ul{\r\n	list-style-type: none;\r\n	padding: 0;\r\n	margin: 0;\r\n	font-size: 0.9em;	\r\n	padding-bottom:3em;\r\n	background:#F3F6ED url(''/_templates/connections/sidenav_bottom.jpg'') no-repeat bottom;\r\n	border:#E1D6c6 1px solid;\r\n	border-top:#f3f6ed 1px solid;\r\n}\r\n\r\n#sidebar ul li ul li{\r\n	margin: 0.1em 0 0 0;\r\n	padding: 2px;	\r\n}\r\n#sidebar li a {\r\n	text-decoration: none;\r\n	border:none;\r\n}\r\n#sidebar li a:link {\r\n	color: #909D73;	\r\n}\r\n#sidebar li a:visited {\r\n	color: #999999;	\r\n}\r\n#sidebar li a:hover, #sidebar li a:active {\r\n	color: #990000;\r\n}\r\n\r\n/*-------------------------------------------\r\nSIDEBAR DISPLAY COMPONENTS \r\n----------------------------------------------*/\r\n\r\n#sidebar_user {\r\n}\r\n\r\n#recent_activity {\r\n}\r\n\r\n#community_owned {\r\n}\r\n\r\n#community_membership {\r\n}\r\n\r\n#sidebar_friends {\r\n}\r\n\r\n#search {\r\n}\r\n\r\n/*--- extra div''s when looking at someone else''s page ---*/\r\n\r\n#sidebar_weblog {\r\n}\r\n\r\n#sidebar_files {\r\n}\r\n\r\n#me {\r\n        padding: 0 3px 3px 3px;\r\n	min-height: 71px;\r\n	font-size: 0.9em;	\r\n	padding-bottom:3em;\r\n	background:#F3F6ED url(''/_templates/connections/sidenav_bottom.jpg'') no-repeat bottom;\r\n	border:#E1D6c6 1px solid;\r\n	border-top:#f3f6ed 1px solid;\r\n}\r\n\r\n#me a {\r\n   \r\n  }\r\n\r\n#me #icon {\r\n   margin:3px 0 0 0;\r\n   float: left; \r\n   width: 70px;\r\n}\r\n\r\n#me #contents {\r\n   margin: 0 0 0 75px;\r\n   text-align: left;\r\n}\r\n\r\n#searchform {\r\n	font-size: 0.9em;	\r\n	padding-bottom:1em;\r\n	background:#F3F6ED;\r\n	border:#E1D6c6 1px solid;\r\n	border-top:#f3f6ed 1px solid;\r\n	text-align:center;\r\n}\r\n\r\n#maincontent_holder ul {\r\n	margin-left: 0;\r\n	padding-left: 45px;\r\n	list-style-type: none;\r\n}\r\n\r\n#maincontent_holder ul li {\r\n	background: url(''img/bullet.gif'') no-repeat 0 7px;\r\n	padding-left: 1.5em;\r\n}\r\n\r\n/*-------------------------------------------\r\n  INDIVIDUAL BLOG POSTS \r\n  -------------------------------------------*/\r\n\r\n\r\n.weblog_posts {\r\n}\r\n\r\n.user {\r\n	float: left;\r\n	margin: 4px;\r\n        padding:0 0 5px 0;\r\n	width: 105px;\r\n	text-align: left;\r\n}\r\n\r\n.entry  \r\n{\r\n	font-size:0.85em;\r\n	font-family: Verdana, Arial, Sans-Serif;\r\n	margin:0 0 30px 0;\r\n	padding:0;\r\n	color:#333;\r\n}\r\n.entry  a\r\n{\r\n	color:#990000;\r\n}\r\n.entry  a:hover \r\n{\r\n	color:#000;\r\n}\r\n\r\n.weblog_title h3 {\r\n	font-family:Georgia, Arial, Serif;\r\n	font-size:1.3em;\r\n	margin:0;\r\n	font-weight:bold;\r\n        text-decoration:none;\r\n	color:#676E04;\r\n	border:0px\r\n	font-size:80%;\r\n        margin: 3px 10px 5px 0;\r\n        padding: 8px 3px;\r\n}\r\n\r\n/* .entry h3 {\r\n	color:#676E04;\r\n	font-family: Georgia,''Lucida sans ms'', Verdana, Arial, Helvetica, sans-serif;\r\n	text-align: center;\r\n	font-size:80%;\r\n	font-weight: bold;\r\n	margin: 3px 10px 5px 0;\r\n	padding: 8px 3px;\r\n	/*background: #E7EBDE;*/\r\n	line-height:1em;\r\n	border:0px;\r\n        text-decoration:none;\r\n} */\r\n\r\n.post {\r\n	padding:10px 0;\r\n	margin:3px 0;\r\n	border-top:#BBC4A3 1px solid;	\r\n	font-family: Georgia, Verdana, Arial, serif;\r\n	font-size:100%;\r\n}\r\n\r\n.info\r\n{\r\n	padding-top:20px;\r\n	background:url(''/_templates/connections/divider.gif'') no-repeat center;\r\n}\r\n\r\n.weblog_dateheader {\r\n	padding: 0px;\r\n	margin: 0px;\r\n	color: #333;\r\n	background:#fff;\r\n	font-weight: normal;\r\n       font-size:90%;\r\n	font-style: italic;\r\n	line-height: 12px;\r\n	border:0px;\r\n	border-bottom: 1px solid #ccc;\r\n}\r\n\r\n#footer {\r\n	margin:0 auto;\r\n	padding: 7px 0;\r\n	border-top:#BBC4A3 1px solid;\r\n	clear: both;\r\n	font-size: 0.8em;\r\n	color: #999;\r\n	text-align:center;\r\n	width:740px;\r\n}\r\n#footer a {\r\nborder:none;\r\ncolor:#7A7636;\r\n}\r\n\r\n.comments {\r\n	font-size:1em;\r\n	font-weight:normal;	\r\n}\r\n#comments\r\n{\r\n	margin:0 0 0 40px;\r\n}\r\n#comments textarea {\r\n	width: 80%;\r\n}\r\n#comments p {\r\n	margin: 0 0 1em;\r\n}\r\n#comments,#respond {\r\n	text-transform: uppercase;\r\n	margin: 3em 0 1em 40px;\r\n	color: #676E04;\r\n	font: 0.9em verdana, helvetica, sans-serif;\r\n}\r\n#comments li \r\n{\r\n	margin:5px 0;\r\n	padding:10px 10px 20px 10px;\r\n	background:#F3F6ED url(_template/connections/comments_bottom.jpg) repeat-x bottom;\r\n	border:#E1D6C6 1px solid;\r\n}\r\n#comments .alt \r\n{\r\n\r\n}\r\n\r\n#global_menuoptions \r\n{\r\n	list-style:none;\r\n	font-size:0.9em;\r\n	margin:0 auto;	\r\n	padding:12px 20px 0 0;\r\n	text-align:right;	\r\n	font-family:Verdana, Arial, Sans-Serif;\r\n}\r\n#global_menuoptions li \r\n{\r\n	list-style:none;\r\n	display:inline;\r\n	padding:0;\r\n	margin:0;\r\n	font-weight:bold;\r\n}\r\n\r\n#global_menuoptions li a:link, #global_menuoptions li a:visited\r\n{\r\n	text-decoration:none;	\r\n	color:#BBC4A3;\r\n}\r\n#global_menuoptions li a:hover, #global_menuoptions li a:active\r\n{\r\n	color:#F7F3ED;	\r\n}\r\n\r\n/*-------------------------------------\r\n  Input forms\r\n--------------------------------------*/\r\n\r\n.textarea{\r\n	border: 1px solid #7F9DB9;\r\n	color:#71717B;\r\n	width: 95%;\r\n       height:200px;\r\n	padding:3px;\r\n	-moz-border-radius: 3px;\r\n}\r\n\r\n.medium_textarea {\r\n   width:95%;\r\n   height:100px;\r\n}\r\n\r\n.small_textarea {\r\n    width:95%;\r\n}\r\n\r\n.keywords_textarea {\r\n    width:95%;\r\n    height:100px;\r\n}', 4);
INSERT INTO `template_elements` VALUES (40114, 'css', '/*\r\n	Theme Name: Gentle Calm\r\n	Theme URI: http://ifelse.co.uk/gentlecalm\r\n	Description: Liquid Serenity\r\n	Version: 1.0\r\n	Author: Phu Ly\r\n	Author URI: http://ifelse.co.uk/\r\n*/\r\n\r\n/************************************************\r\n *	Main structure															*\r\n ************************************************/\r\nbody {\r\n  margin:0px;\r\n  padding:0px;\r\n  text-align:center;\r\n  font:11px "Lucida Grande", "Lucida Sans Unicode", Verdana, Helvetica, Arial, sans-serif;\r\n	color: #474E44;\r\n	background:#F3F4EC;\r\n}\r\n\r\n/*-------------------------------------------------\r\nSTATUS BAR\r\n-------------------------------------------------*/\r\n\r\n#statusbar {\r\n	padding: 3px 10px 2px 0;\r\n	margin: 0px;\r\n	text-align: bottom;\r\n	height:15px;\r\n}\r\n\r\n\r\n#welcome {\r\n	float: left;\r\n}\r\n\r\n#welcome p{\r\n	font-weight:bold;\r\n       font-size:110%;\r\n	padding:0 0 0 4px;\r\n	margin:0px;\r\n}\r\n\r\n#global_menuoptions {\r\n	text-align: right;\r\n	padding:0 5px 0 0;\r\n	margin:0px;\r\n    float:right;\r\n}\r\n\r\n#global_menuoptions a:hover{\r\n    text-decoration:underline;\r\n}\r\n\r\n#global_menuoptions ul {\r\n	margin: 0; \r\n	padding: 0;\r\n}\r\n\r\n#global_menuoptions li {\r\n	margin: 0; \r\n	padding: 0;\r\n	display: inline;\r\n	list-style-type: none;\r\n	border: none;\r\n}\r\n\r\n#global_menuoptions a {\r\n	text-decoration: none;\r\n}\r\n\r\n#global_menuoptions a:hover{\r\n    text-decoration:underline;\r\n}\r\n\r\n#maincontent_container {\r\n  width:72%;\r\n  float:left;\r\n}\r\n#maincontent_container .col {\r\n	padding-bottom: 0.5em;\r\n	padding-left:2.5em;\r\n	padding-right:8.5em;\r\n	line-height:1.6em;\r\n}\r\n#sidebar {\r\n	padding:0.5em;\r\n	padding-top: 2em;\r\n	clear:right;\r\n	width:25%;\r\n  right:0px;\r\n	float:right;\r\n  font-size:1em; \r\n}\r\n#content_holder {	\r\n width:80%;\r\n text-align:left;\r\n margin-left: auto;\r\n display:block;\r\n margin-right: auto;\r\n padding-bottom:0;\r\n}\r\n\r\n#content_holder:after {\r\n    content: "."; \r\n    display: block; \r\n    height: 0; \r\n    clear: both; \r\n    visibility: hidden;\r\n}\r\n#footer{\r\n	border-top:1px solid #324031;\r\n	border-bottom:1px solid #324031;\r\n	color: #eee;\r\n	background: #87a284;\r\n	clear:both;\r\n	padding: 0.8em;\r\n	text-align:center;\r\n	margin-left: auto;\r\n	display:block;\r\n  margin-right: auto;\r\n  font-size: 0.9em;\r\n  margin-top:5em;\r\n}\r\n#footer a{\r\n	color: #fff;\r\n	font-weight:bold;\r\n}\r\na{\r\n	color: #3C657B;\r\n	text-decoration: none;\r\n}\r\na:hover {\r\n	text-decoration:underline;\r\n}\r\n/************************************************\r\n *	Header																			*\r\n ************************************************/\r\n#header {\r\n	padding: 0px;	\r\n	margin-top: 0.3em;\r\n	padding-top:1em;	\r\n	padding-bottom:1em;\r\n	margin-bottom:0px;\r\n	border-bottom: 1px solid #bab1b1;\r\n	background: #CCCFBC;\r\n	text-align:right;\r\n	padding-right:2em;\r\n	padding-left:-.5em;\r\n}\r\n\r\n#header h1{\r\n	padding:0px;\r\n	margin: 0px;\r\n	font-size: 1.6em;\r\n	letter-spacing:0.2em;\r\n}\r\n#header h1 {\r\n	color:#5B7B57;\r\n}\r\n#header h1 a:hover {\r\n	text-decoration:none;\r\n	color: #bb4444;\r\n	\r\n}\r\n#header img {\r\n	border:none;\r\n}\r\n#header h2 {\r\n	margin-bottom:0.3em;\r\n	font-size: 0.8em;\r\n	text-transform:uppercase;\r\n	color:#A37B45;\r\n}\r\n\r\n/*-------------------------------------------------\r\nnavigation\r\n-------------------------------------------------*/\r\n\r\n#navigation {\r\n	height: 21px;\r\n	margin: 0;\r\n	padding: 0 0 0 20px;\r\n	text-align:left;\r\n}\r\n\r\n#navigation li {\r\n	margin: 0; \r\n	padding: 0;\r\n	display: inline;\r\n	list-style-type: none;\r\n	border: none;\r\n}\r\n	\r\n#navigation a:link, #navigation a:visited {\r\n\r\n	background: #524B21; /*#9BBB38;*/\r\n	font-size:85%;\r\n	font-weight: normal;\r\n	padding: 4px 6px;\r\n	margin: 0 2px 0 0;\r\n	border: 0px solid #036;\r\n	border-bottom: #9BBB38;\r\n	text-decoration: none;\r\n	color: #fff;\r\n}\r\n\r\n#navigation a:link.current, #navigation a:visited.current {\r\n	border-bottom: 0px solid #9BBB38;\r\n	background: #F5F5E7;\r\n	color: #9BBB38;\r\n	font-weight: bold;\r\n}\r\n\r\n#navigation a:hover {\r\n	color: #fff;\r\n	background: #000;\r\n}\r\n#navigation li a:hover{\r\n	background:#000;\r\n	}\r\n\r\n/************************************************\r\n *	Content																			*\r\n ************************************************/\r\nh1, h2, h3, h4 {\r\n	font-family:"Century Gothic", "Lucida Grande", "Lucida Sans Unicode", Verdana, Helvetica, Arial, sans-serif;\r\n}\r\nh1 {\r\n  font-size:130%;\r\n  padding:10px 0 0 0;\r\n }\r\nh3 {\r\n  font-size:100%;\r\n }\r\n\r\nh4 {\r\n  font-size:100%;\r\n }\r\n\r\nh2 {\r\n	font-size: 1.2em;\r\n	margin-bottom:0.5em;\r\n}\r\nh2.entrydate{\r\n	margin-bottom:0.3em;\r\n	font-size: 1.8em;\r\n	font-weight:normal;\r\n	color:#86942A;\r\n	text-transform:uppercase;\r\n}\r\n.entrymeta{\r\n	font-weight:bold;\r\n	color:#99A879;\r\n}\r\nh3.entrytitle a{\r\n	color: #507642;\r\n}\r\nh3.weblog_title{\r\n	margin-top:0px;\r\n	margin-bottom:0.1em;\r\n	font-size: 1.8em;\r\n}\r\n\r\n.user {\r\n	float: left;\r\n	margin: 4px;\r\n        padding:0 0 5px 0;\r\n	width: 105px;\r\n	text-align: left;\r\n}\r\n\r\n.post p {\r\n	margin-top:0.8em;\r\n	margin-bottom:1.6em;\r\n}\r\n.weblog_posts{\r\n	padding-bottom: 2em;\r\n	font-family:"Trebuchet MS","Lucida Grande", "Lucida Sans Unicode", Verdana, Helvetica, Arial, sans-serif;\r\n}\r\n/************************************************\r\n *	Navigation Sidebar													*\r\n ************************************************/\r\nul {\r\n margin:0 0 1em 0;\r\n padding-left:0px;\r\n list-style-type:none;\r\n}\r\n/************************************************\r\n *	Comments													*\r\n ************************************************/\r\nh2#comments{\r\n	text-align:center;\r\n	border-top:1px solid #9ba1aa;\r\n	background:#E2ECD5;\r\n	padding:0.7em;\r\n	border-bottom:1px solid #9ba1aa;\r\n	margin-bottom:1em;\r\n	margin-top:8em;\r\n}\r\nol#commentlist {\r\n	margin-top:0px;\r\n	padding: 0.5em;\r\n	margin-left: 0px;\r\n	color: #9b9b9b;\r\n	list-style-type: none;\r\n	font-size:0.9em;\r\n}\r\n#comments li  p{\r\n	padding: 0px;\r\n	margin: 0px;\r\n}\r\n.commentname {\r\n	float: left;\r\n	margin: 0;\r\n	padding: 0 0 0.2em 0;\r\n}\r\n.commentinfo{\r\n	width: 20em;\r\n	float: right;\r\n	text-align: right;\r\n}\r\n.commenttext {\r\n	clear: both;\r\n	padding-top: 0px;\r\n	margin-top: 0px;\r\n	margin-bottom: 3em;\r\n	border-top: 1px solid #ebebeb;\r\n	line-height:1.2em;\r\n	color: #5b5b5b;\r\n}\r\n#commentsformheader{\r\n	padding-left:1.5em;\r\n	font-size: 1.4em;\r\n}\r\n#commentsform{\r\n	margin-top:none;\r\n	text-align:center;\r\n	border:1px solid #ddd;\r\n	background:#ecefdf;\r\n	padding:0em 1em;\r\n}\r\n#commentsform form{\r\n	text-align:left;\r\n	margin:0px;\r\n}\r\n#commentsform p{\r\n	margin:0.5em;\r\n}\r\n#commentsform form textarea{\r\n	width:100%;\r\n}\r\n/************************************************\r\n *	Extra																				*\r\n ************************************************/\r\ncode{\r\n	font-family: ''lucida console'', ''Courier New'', monospace;\r\n	font-size: 0.8em;\r\n	display:block;\r\n	padding:0.5em;\r\n	background-color: #E5EaE4;\r\n	border: 1px solid #d2d8d1;\r\n}\r\ninput[type="text"], textarea {\r\n	padding:0.3em;\r\n	border: 1px solid #CCCFBC;\r\n	color: #656F5C;\r\n	-moz-border-radius: 0.5em;\r\n}\r\ninput[type="submit"]{\r\n	padding:0.2em;\r\n	font-size: 1.25em;\r\n	border: 1px solid #CCCFBC;\r\n	color: #353F2f;\r\n	background: #fefff8;\r\n	-moz-border-radius: 0.5em;\r\n}\r\nblockquote {\r\n	border-left: 3px solid #686868;\r\n	color: #888;\r\n	padding-left: 0.8em;\r\n	margin-left: 2.5em;\r\n}\r\na img {\r\n	border:none;\r\n}\r\n.imgborder img{\r\n	border: 1px solid #87a284;\r\n	background:#CCCFBC;\r\n	padding:0.3em;\r\n}\r\n.imgborder{\r\n	text-align: center;\r\n}\r\n\r\n#system_message{ \r\n	border:1px solid #5B7B57;\r\n	background:#CCCFBC;\r\n	margin:20px 0 0 0;\r\n}\r\n\r\n#system_message p{\r\n   padding:0px;\r\n   margin:2px;\r\n }\r\n\r\n /*-------------------------------------\r\n  Input forms\r\n--------------------------------------*/\r\n\r\n.textarea{\r\n	border: 1px solid #7F9DB9;\r\n	color:#71717B;\r\n	width: 95%;\r\n       height:200px;\r\n	padding:3px;\r\n	-moz-border-radius: 3px;\r\n}\r\n\r\n.medium_textarea {\r\n   width:95%;\r\n   height:100px;\r\n}\r\n\r\n.small_textarea {\r\n    width:95%;\r\n}\r\n\r\n.keywords_textarea {\r\n    width:95%;\r\n    height:100px;\r\n}\r\n\r\n/*-----------------------------------------------------------------------\r\nDIV''s to help control look and feel - infoholder holds all the profile data\r\nand is always located in within ''maincontentdisplay''\r\n\r\n-------------------------------------------------------------------------*/\r\n\r\n/*------ holds profile data -------*/\r\n.infoholder {\r\n    border:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n    margin:0 0 5px 0;\r\n}\r\n\r\n.infoholder p {\r\n   padding:0 0 0 5px;\r\n}\r\n\r\n.infoholder .fieldname h2 {\r\n	      border:0;\r\n          border-bottom:1px;\r\n    	  border-color:#eee;\r\n    	  border-style:solid;\r\n	      padding:5px;\r\n}   \r\n\r\n.infoholder_twocolumn {\r\n    padding:4px;\r\n    border:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n    margin:0 0 10px 0;\r\n }\r\n\r\n.infoholder_twocolumn .fieldname h3{\r\n    border:0px;\r\n    border-bottom:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n}', 5);
INSERT INTO `template_elements` VALUES (40121, 'pageshell', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n<title>{{title}}</title>\r\n{{metatags}}\r\n</head>\r\n<body>\r\n <!-- elgg banner and logo -->\r\n<div id="container"><!-- start container -->\r\n<div id="header"><!-- start header -->\r\n             {{topmenu}}\r\n	    <ul id="navigation">\r\n          {{menu}}\r\n		 </ul>\r\n</div><!-- end header -->\r\n<div id="content_holder"><!-- start contentholder -->\r\n<div id="maincontent_container"><!-- start main content -->\r\n    	{{messageshell}}\r\n  	{{mainbody}}\r\n</div><!-- end main content -->\r\n<div id="sidebar_container">\r\n<div id="sidebar"><!-- start sidebar -->\r\n    <ul><!-- open sidebar lists -->\r\n    	{{sidebar}}\r\n    </ul>\r\n</div><!-- end sidebar -->\r\n</div>\r\n</div><!-- end contentholder -->\r\n<div class="clearall" />\r\n <div id="footer"><!-- start footer -->\r\n		<a href="http://elgg.net"><img src="/_templates/elgg_powered.png" border="0"></a>\r\n </div><!-- end footer -->\r\n</div><!-- end container -->\r\n </body>\r\n </html>', 4);
INSERT INTO `template_elements` VALUES (40048, 'css', '/*\r\nTheme Name: Northern-Web-Coders\r\nTheme URI: http://www.northern-web-coders.de/\r\nDescription: Northern-Web-Coders Theme\r\nVersion: 1.0\r\n\r\nAuthor: Kai Ackermann\r\n*/\r\n\r\nbody\r\n{\r\nbackground: #d8d8d3;\r\nfont-family: Lucida Grande, Verdana, sans-serif;\r\nmargin: 0;\r\npadding: 0;\r\nfont-size:80%;\r\ntext-align: center;\r\n}\r\n\r\na\r\n{\r\nfont-size:100%;\r\ncolor: #495865;\r\n}\r\n\r\na:hover\r\n{\r\ncolor: #6F6F6F;\r\n}\r\n\r\nh2, h3, h4, h5 {\r\n	margin:0px 0px 5px 0px;\r\n	padding:0px;\r\n	font-size:100%\r\n}\r\n\r\n#container\r\n{\r\nbackground: #FFFFFF;\r\nmargin: 0 auto 0 auto;\r\nwidth: 769px;\r\ntext-align: left;\r\nborder: 2px solid #5F707A;\r\n}\r\n\r\n/*-----------------------------------------\r\nSTATUS BAR \r\n-------------------------------------------*/\r\n\r\n#statusbar {\r\n	padding: 3px 5px 0 0;\r\n	margin: 0px;\r\n	height:16px;\r\n	background:#eee;\r\n	color: #333;\r\n	font-size:80%;\r\n}\r\n\r\n#statusbar a {\r\n	color: #666;\r\n	background:#eee;\r\n}\r\n\r\n#welcome {\r\n	float: left;\r\n}\r\n\r\n#welcome p{\r\n	font-weight:bold;\r\n	padding:0 0 0 4px;\r\n	margin:0px;\r\n}\r\n\r\n#global_menuoptions {\r\n	text-align: right;\r\n	padding:0px;\r\n	margin:0px;\r\n	float:right;\r\n}\r\n\r\n#global_menuoptions ul {\r\n	margin: 0; \r\n	padding: 0;\r\n}\r\n\r\n#global_menuoptions li {\r\n	margin: 0; \r\n	padding: 0;\r\n	display: inline;\r\n	list-style-type: none;\r\n	border: none;\r\n}\r\n\r\n#global_menuoptions a {\r\n	text-decoration: none;\r\n}\r\n\r\n#global_menuoptions a:hover{\r\n	text-decoration:underline;\r\n}\r\n\r\n/*--------------------------------------------\r\n  Header\r\n  -------------------------------------------*/\r\n\r\n#header\r\n{\r\nbackground: url(/_templates/northern/totems_2.jpg);\r\nwidth: 769px;\r\nheight: 200px;\r\nmargin: 0;\r\npadding: 0;\r\ntext-align: right;\r\n}\r\n\r\n#header h1 {\r\n    padding:0 5px 0 5px;\r\n    margin:0px;\r\n    color:#fff;\r\n    }\r\n\r\n#header h2 {\r\n    padding:0 5px 0 5px;\r\n    margin:0px;\r\n    color:#fff;\r\n    }\r\n\r\n/*--------------------------------------------\r\nNAVIGATION \r\n----------------------------------------------*/\r\n\r\n#navigation ul\r\n{\r\npadding: 0;\r\nmargin: 0;\r\nbackground: #5F707A;\r\nborder-top: 1px solid #DFDFDF;\r\nborder-bottom: 0px solid #DFDFDF;\r\nfloat: left;\r\nwidth: 769px;\r\nfont-family: arial, helvetica, sans-serif;\r\n}\r\n\r\n\r\n\r\n#navigation ul li { display: inline; }\r\n\r\n#navigation ul li a\r\n{\r\npadding: 10px 14px 11px 14px;\r\nbackground: #9C9D95;\r\ncolor: #ffffff;\r\ntext-decoration: none;\r\nfont-weight: bold;\r\nfloat: left;\r\nfont-size:85%;\r\nborder-right: 1px solid #FFFFFF;\r\n}\r\n\r\n#navigation ul li a:hover\r\n{\r\ncolor: #990000;\r\nbackground: #C9C0B0;\r\n}\r\n\r\n#navigation a:link.current, #navigation a:visited.current\r\n{\r\npadding: 10px 14px 11px 14px;\r\nbackground: #C9C0B0;\r\ncolor: #990000;\r\ntext-decoration: none;\r\nfont-weight: bold;\r\nfloat: left;\r\nborder-right: 1px solid #DFDFDF;\r\n}\r\n\r\n#navigation a:link.current, #navigation a:visited.current a:hover\r\n{\r\nbackground: #6F6F6F;\r\n}\r\n\r\n\r\n/*-------------------------------------------------\r\nHOLDS THE MAIN CONTENT E.G. BLOG, PROFILE ETC \r\n----------------------------------------------------*/\r\n\r\n#maincontent_container\r\n{\r\nposition: relative;\r\nleft: 20px;\r\nfloat: left;\r\npadding: 0;\r\nwidth: 68%;\r\ncolor: #495865;\r\nfont-size:85%;\r\n}\r\n\r\n/*#maincontent_container h2\r\n{\r\nborder-bottom: 1px solid #6F6F6F;\r\ncolor: #5F707A;\r\nmargin: 20px 0 5px 0;\r\npadding: 0 0 3px 3px;\r\ntext-align: right;\r\n}*/\r\n\r\n/*-------------------------------------------------------------\r\nTHIS DISPLAYS THE ACTUAL CONTENT WITHIN maincontent_container\r\n--------------------------------------------------------------*/\r\n\r\n#maincontent_display h1 {\r\n	padding-bottom: 2px;\r\n	border-bottom: 1px solid #666;\r\n	margin: 10px 0 0 0;\r\n	font-size:120%;\r\n	color: #666;\r\n}\r\n\r\n#maincontent_display #sub_menu {\r\n	font-family: verdana;\r\n	padding: 2px 0 0 0;\r\n	margin: 0 0 15px 0;\r\n	font-weight: normal;\r\n	color: #990000;\r\n}\r\n\r\n#maincontent_display #sub_menu a {\r\n	font-weight:bold;\r\n    margin:0px;\r\n    padding:0px;\r\n    color: #990000;\r\n}\r\n\r\n#maincontent_display #sub_menu a:hover {\r\n	text-decoration: underline;\r\n}\r\n\r\n#maincontent_display #sub_menu p {\r\n      margin:0px;\r\n      padding:0px;\r\n}\r\n\r\n/*-----------------------------------------\r\n  SIDEBAR\r\n  ----------------------------------------*/\r\n\r\n#sidebar\r\n{\r\nclear: right;\r\nfloat: left;\r\nposition: relative;\r\ntop: 10px;\r\nleft: 50px;\r\nmargin: 0 0 10px 0;\r\nwidth: 30%;\r\nfont-size:90%;\r\n}\r\n\r\n#sidebar ul\r\n{\r\nlist-style-type: none;\r\nmargin: 10px 0;\r\npadding: 0;\r\n}\r\n\r\n#sidebar ul li\r\n{\r\ncolor: #5F5F5F;\r\nmargin: 0;\r\npadding: 0;\r\n}\r\n\r\n#sidebar ul li p\r\n{\r\nwidth: 190px;\r\nfont-weight: bold;\r\n}\r\n\r\n#sidebar ul li h2\r\n{\r\nborder-bottom: 1px solid;\r\nwidth: 190px;\r\nfont-weight: bold;\r\nmargin: 0;\r\npadding: 0;\r\n}\r\n\r\n#sidebar ul li ul\r\n{\r\n/*margin: 5px 0 15px 10px;*/\r\n}\r\n\r\n#sidebar ul li ul li\r\n{\r\nfont-weight: normal;\r\nmargin: 0 0 3px 0;\r\npadding: 0;\r\nline-height: 12px\r\n}\r\n\r\n#sidebar ul li#winamp ul li\r\n{\r\nwidth: 190px\r\n}\r\n\r\n#sidebar ul li ul li a\r\n{\r\ncolor: #5F5F5F;\r\ntext-decoration: none;\r\n}\r\n\r\n#sidebar ul li ul li a:hover\r\n{\r\nfont-weight: bold;\r\ntext-decoration: none\r\n}\r\n\r\n/*-------------------------------------------\r\nSIDEBAR DISPLAY COMPONENTS \r\n----------------------------------------------*/\r\n\r\n#sidebar_user {\r\n}\r\n\r\n#recent_activity {\r\n}\r\n\r\n#community_owned {\r\n}\r\n\r\n#community_membership {\r\n}\r\n\r\n#sidebar_friends {\r\n}\r\n\r\n#search {\r\n}\r\n\r\n#me {\r\n     padding: 3px;\r\n     margin:0;\r\n}\r\n\r\n#me p{\r\n   font-weight:normal;\r\n   font-weight: normal;\r\n   margin:0;\r\n }\r\n\r\n#sidebar #sidebar_user p {\r\n  padding:4px 0 0 0;\r\n  font-weight: normal;\r\n }\r\n\r\n\r\n/*--- extra div''s when looking at someone else''s page ---*/\r\n\r\n#sidebar_weblog {\r\n}\r\n\r\n#sidebar_files {\r\n}\r\n\r\n#searchform\r\n{\r\nmargin: 2px 0 15px 0;\r\n}\r\n\r\n#searchform input\r\n{\r\nbackground: #FFFFFF;\r\nborder: 1px solid #6F6F6F;\r\nfont-size: 11px;\r\nmargin-top: 3px;\r\npadding: 2px;\r\n}\r\n\r\n/*--------------------------------------\r\n  FOOTER\r\n  --------------------------------------*/\r\n\r\n#footer\r\n{\r\ncolor: #FFFFFF;\r\nbackground: #5F707A;\r\nborder-top: 1px solid #DFDFDF;\r\nclear: both;\r\nmargin: 0 auto 0 auto;\r\npadding: 16px 0 17px 0;\r\ntext-align: center;\r\nwidth: 769px;\r\n}\r\n\r\n#footer a\r\n{\r\ncolor: #ffffff\r\n}\r\n\r\n/*-------------------------------------\r\n  Blog classes\r\n  ------------------------------------*/\r\n\r\n.weblog_posts {\r\n    margin:0 0 30px 0;\r\n}\r\n\r\n.weblog_posts .entry h3 {\r\n   color:#1181AA;\r\n   background:#fff;\r\n   padding: 0 0 10px 110px;\r\n}\r\n\r\n.user {\r\n	float: left;\r\n	margin: 0px;\r\n	/* padding: 0.3em 2em 2em 0; */\r\n	width: 105px;\r\n	text-align: left;\r\n}\r\n\r\n.post {\r\n	margin: 0 0 0 77px;\r\n    padding:0 0 0 40px;\r\n    font-family: arial;\r\n}\r\n\r\n.post p {\r\n	padding: 0;\r\n	margin: 3px 0 10px 0;\r\n	line-height: 16px;\r\n}\r\n\r\n.post ol, .post ul {\r\n	margin: 3px 0 10px 0;\r\n	padding: 0;\r\n}\r\n\r\n.post li {\r\n	margin: 0 0 0 30px;\r\n	line-height: 16px;\r\n}\r\n\r\n.post ul li {\r\n	list-style-type: square;\r\n}\r\n\r\n.post .blog_edit_functions p {\r\n      \r\n}\r\n\r\n.post .blog_edit_functions a {\r\n      \r\n}\r\n\r\n.post .weblog_keywords p {\r\n     \r\n}\r\n\r\n.post .weblog_keywords a {\r\n     \r\n}\r\n\r\n.info p {\r\n	padding: 0px;\r\n	margin: 0 0 5px 0;\r\n	color: #666;\r\n    background:#fff;\r\n	font-family: verdana;\r\n	font-weight: normal;\r\n	line-height: 14px;\r\n	text-align: left;\r\n}\r\n\r\n.info p a {\r\n	color: #666;\r\n    background:#fff;\r\n	text-decoration: none;\r\n	border-bottom: 1px dotted #666;\r\n	padding-bottom: 0;\r\n}\r\n\r\n#comments ol, #comments ul {\r\n	margin: 3px 0 10px 0;\r\n	padding: 0;\r\n}\r\n\r\n#comments li {\r\n	margin: 0 0 0 30px;\r\n	line-height: 16px;\r\n}\r\n\r\n#comments ul li {\r\n	list-style-type: square;\r\n}\r\n\r\n#comments h4 {\r\n	color:#1181AA;\r\n}\r\n\r\n.weblog_dateheader {\r\n	padding: 0px;\r\n	margin: 0 0 5px 0;\r\n	color: #333;\r\n       background:#fff;\r\n	font-weight: normal;\r\n	font-style: italic;\r\n	line-height: 12px;\r\n       border:0px;\r\n	border-bottom: 1px solid #ccc;\r\n}\r\n\r\n.clearing{clear:both;}\r\n\r\n.post p, post li\r\n{\r\nfont-family: Lucida Grande, Verdana, sans-serif;\r\nline-height: 130%;\r\n}\r\n\r\n.post blockquote\r\n{\r\nbackground: #fef7e9;\r\nborder: 1px solid #e6ddcb;\r\nborder-left: 2px solid #6F6F6F;\r\nfont-family: Georgia, Times New Roman, serif;\r\npadding: 4px 4px 4px 7px;\r\n}\r\n\r\n/*-------------------------------------\r\n  Input forms\r\n--------------------------------------*/\r\n\r\n.textarea {\r\n	border: 1px solid #7F9DB9;\r\n	color:#71717B;\r\n	width: 95%;\r\n	height:200px;\r\n	padding:3px;\r\n}\r\n\r\n.medium_textarea {\r\n	width:95%;\r\n	height:100px;\r\n}\r\n\r\n.small_textarea {\r\n	width:95%;\r\n}\r\n\r\n.keywords_textarea {\r\n	width:95%;\r\n	height:100px;\r\n}\r\n\r\n/*----- System Messages ------*/\r\n\r\n#system_message { \r\n	border:1px solid #D3322A;\r\n	background:#F7DAD8;\r\n	padding:3px 50px;\r\n	margin:5px 0 0 0;	\r\n}\r\n\r\n#system_message p{\r\n   padding:0px;\r\n   margin:2px;\r\n }\r\n\r\n/*-----------------------------------------------------------------------\r\nDIV''s to help control look and feel - infoholder holds all the profile data\r\nand is always located in within ''maincontentdisplay''\r\n\r\n-------------------------------------------------------------------------*/\r\n\r\n/*------ holds profile data -------*/\r\n.infoholder {\r\n    border:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n    margin:0 0 5px 0;\r\n}\r\n\r\n.infoholder p {\r\n   padding:0 0 0 5px;\r\n}\r\n\r\n.infoholder .fieldname {\r\n	    /*  border:0;\r\n	      margin:0;\r\n          border-bottom:1px;\r\n    	  border-color:#eee;\r\n    	  border-style:solid;\r\n	      padding:5px;\r\n          color:#666;\r\n          background:#fff; */\r\ncolor: #5F707A;\r\nmargin: 0px 0 5px 0;\r\npadding: 0 0 0px 3px;\r\ntext-align: left;\r\nborder:0px;\r\n}   \r\n\r\n.infoholder_twocolumn {\r\n    padding:4px;\r\n    border:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n    margin:0 0 10px 0;\r\n }\r\n\r\n.infoholder_twocolumn .fieldname h3{\r\n    color:#666;\r\n    background:#fff;\r\n    border:0px;\r\n    border-bottom:1px;\r\n    border-color:#eee;\r\n    border-style:solid;\r\n}\r\n\r\n/*----------- holds administration data---------*/\r\n\r\n.admin_datatable {\r\n  border:1px;\r\n  border-color:#eee;\r\n  border-style:solid;\r\n  margin:0 0 5px 0;\r\n}\r\n\r\n.admin_datatable p {\r\n     padding:0px;\r\n     margin:0px;\r\n}\r\n\r\n.admin_datatable a {\r\n   \r\n}\r\n\r\n\r\n.admin_datatable td {\r\n   text-align:left;\r\n}\r\n\r\n.admin_datatable h3{\r\n     color:#666;\r\n     background:#fff;\r\n}\r\n\r\n.admin_datatable h4 {\r\n}\r\n\r\n/*---- header plus one row of content ------*/\r\n\r\n.databox_vertical {\r\n   background-color: #F9F9F9;\r\n   color:#000;\r\n   border:1px;\r\n   border-style:solid;\r\n   border-color:#DDD;\r\n   margin:0 0 5px 0;\r\n   padding:5px;\r\n }\r\n\r\n .databox_vertical p{\r\n   padding:0px;\r\n   margin:0px;\r\n   color:#1181AA;\r\n   background:#fff;\r\n }\r\n\r\n.databox_vertical .fieldname h3 {\r\n  padding:0px;\r\n  margin:0px;\r\n  color:#1181AA;\r\n  background:#fff;\r\n}\r\n\r\n/*------- holds file content ----*/\r\n\r\n.filetable {\r\n   background-color: #F9F9F9;\r\n   color:#000;\r\n   border:1px;\r\n   border-style:solid;\r\n   border-color:#DDD;\r\n   margin:0 0 5px 0;\r\n   width:100%;\r\n }\r\n\r\n .filetable p{\r\n   padding:0px;\r\n   margin:0px;\r\n   color:#000; /*#1181AA;*/\r\n   background:#fff;\r\n }\r\n\r\n.filetable a{\r\n   \r\n }\r\n\r\n\r\n.filetable table {\r\n    text-align:left;\r\n}\r\n\r\n#edit_files h4 {\r\n     \r\n}\r\n  \r\n\r\n/*------- holds fodler content ------*/\r\n\r\n.foldertable {\r\n   background-color: #F9F9F9;\r\n   color:#000;\r\n   border:1px;\r\n   border-style:solid;\r\n   border-color:#DDD;\r\n   margin:0 0 5px 0;\r\n   width:100%;\r\n }\r\n\r\n.foldertable a{\r\n  \r\n }\r\n\r\n .foldertable p{\r\n   padding:0px;\r\n   margin:0px;\r\n   color:#1181AA;\r\n   background:#fff;\r\n }\r\n\r\n.foldertable table {\r\n    text-align:left;\r\n}\r\n\r\n/*------- holds network data ------*/\r\n\r\n.networktable {\r\n   \r\n}\r\n\r\n/*---------------------------------------------\r\n  Your Resources\r\n-----------------------------------------------*/\r\n\r\n.feeds {\r\n  border-bottom: 1px dotted #aaaaaa;\r\n  background: transparent url("//_templates/sunflower.jpg") bottom right no-repeat;\r\n}\r\n\r\n.feed_content a {\r\n    color:black;\r\n    border:0px;\r\n}\r\n\r\n.feed_content a:hover{\r\n	background:#fff;\r\n	}\r\n\r\n.feed_content img {\r\n  border: 1px solid #666666;\r\n  padding:5px;\r\n}\r\n\r\n.feed_content h3 {\r\n      padding:0 0 4px 0;\r\n      margin:0px;\r\n}\r\n\r\n.feed_content h3 a{\r\n     color:black;\r\n     border:0px;\r\n     border-bottom:1px;\r\n     border-style:dotted;\r\n     border-color:grey;\r\n}\r\n\r\n.feed_content h3 a:hover{\r\n	background:#FCD63F;\r\n       color:#000;\r\n	}\r\n\r\n.feed_date {\r\n    line-height: 21px;\r\n  font-weight: bold;\r\n  padding: 5px 10px 4px 5px;\r\n  margin:0 0 10px 0;\r\n  background-color: #D0DEDF;\r\n  color:#000;\r\n  text-decoration:none;\r\n}\r\n\r\n.via a {\r\n    color:#1181AA;\r\n    background:#fff;\r\n    border:0px;\r\n}\r\n\r\n.via a:hover {\r\n    background:#ffc;\r\n    color:#1181AA;\r\n}', 3);
INSERT INTO `template_elements` VALUES (40049, 'pageshell', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n<head>\r\n<title>{{title}}</title>\r\n{{metatags}}\r\n</head>\r\n<body>\r\n <!-- elgg banner and logo -->\r\n<div id="container"><!-- start container -->\r\n<div id="statusbar"><!-- start statusbar -->\r\n	<div id="welcome"><!-- start welcome -->\r\n		<p>Welcome {{userfullname}}</p>\r\n	</div><!-- end welcome -->\r\n	     {{topmenu}}\r\n</div><!-- end statusbar -->\r\n<div id="header"><!-- start header -->\r\n			 <h1>Elgg</h1>\r\n       		<h2>Community learning space</h2>\r\n</div><!-- end header -->\r\n<div id="navigation">\r\n   <ul>\r\n       {{menu}}\r\n   </ul>\r\n</div>\r\n<div id="content_holder"><!-- start contentholder -->\r\n<div id="maincontent_container"><!-- start main content -->\r\n    	{{messageshell}}\r\n  	{{mainbody}}\r\n</div><!-- end main content -->\r\n<div id="sidebar_container">\r\n<div id="sidebar"><!-- start sidebar -->\r\n    <ul><!-- open sidebar lists -->\r\n    	{{sidebar}}\r\n    </ul>\r\n</div><!-- end sidebar -->\r\n</div>\r\n</div><!-- end contentholder -->\r\n<div class="clearall" />\r\n <div id="footer"><!-- start footer -->\r\n		<a href="http://elgg.net"><img src="/_templates/elgg_powered.png" border="0"></a>\r\n </div><!-- end footer -->\r\n</div><!-- end container -->\r\n </body>\r\n </html>', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `templates`
-- 

CREATE TABLE `templates` (
  `ident` int(11) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL default '',
  `owner` int(11) NOT NULL default '0',
  `public` enum('yes','no') NOT NULL default 'yes',
  PRIMARY KEY  (`ident`),
  KEY `name` (`name`,`owner`,`public`)
) ;

INSERT INTO `templates` VALUES (4, 'Connections', 1, 'yes');
INSERT INTO `templates` VALUES (3, 'Northern', 1, 'yes');
INSERT INTO `templates` VALUES (5, 'Gentle Calm', 1, 'yes');

-- --------------------------------------------------------

-- 
-- Table structure for table `user_flags`
-- 

CREATE TABLE `user_flags` (
  `ident` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `flag` varchar(64) NOT NULL default '',
  `value` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`ident`),
  KEY `user_id` (`user_id`,`flag`,`value`)
) ;

INSERT INTO `user_flags` VALUES (0,1,'admin','1');

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `ident` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(32) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  `email` varchar(128) NOT NULL default '',
  `name` varchar(128) NOT NULL default '',
  `icon` int(11) NOT NULL default '-1',
  `active` enum('yes','no') NOT NULL default 'yes',
  `alias` varchar(128) NOT NULL default '',
  `code` varchar(32) NOT NULL default '',
  `icon_quota` int(11) NOT NULL default '10',
  `file_quota` int(11) NOT NULL default '10000000',
  `template_id` int(11) NOT NULL default '-1',
  `owner` int(11) NOT NULL default '-1',
  `user_type` varchar(128) NOT NULL default 'person',
  `moderation` varchar(4) NOT NULL default 'no',
  `last_action` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ident`),
  KEY `username` (`username`,`password`,`name`,`active`),
  KEY `code` (`code`),
  KEY `icon` (`icon`),
  KEY `icon_quota` (`icon_quota`),
  KEY `file_quota` (`file_quota`),
  KEY `email` (`email`),
  KEY `template_id` (`template_id`),
  KEY `community` (`owner`),
  KEY `user_type` (`user_type`),
  KEY `last_action` (`last_action`),
  FULLTEXT KEY `name` (`name`)
) ;

INSERT INTO `users` VALUES (1, 'news', '5f4dcc3b5aa765d61d8327deb882cf99', '', 'News', -1, 'yes', '', '', 10, 10000000, -1, -1, 'person', 'no', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `weblog_comments`
-- 

CREATE TABLE `weblog_comments` (
  `ident` int(11) NOT NULL auto_increment,
  `post_id` int(11) NOT NULL default '0',
  `owner` int(11) NOT NULL default '0',
  `postedname` varchar(128) NOT NULL default '',
  `body` text NOT NULL,
  `posted` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`),
  KEY `posted` (`posted`),
  KEY `post_id` (`post_id`),
  KEY `postedname` (`postedname`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `weblog_posts`
--

CREATE TABLE `weblog_posts` (
  `ident` int(11) NOT NULL auto_increment,
  `owner` int(11) NOT NULL default '0',
  `weblog` int(11) NOT NULL default '-1',
  `access` varchar(255) NOT NULL default '',
  `posted` int(11) NOT NULL default '0',
  `title` text NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY  (`ident`),
  KEY `owner` (`owner`,`access`,`posted`),
  KEY `community` (`weblog`)
) ;


INSERT INTO `weblog_posts` VALUES (15, 1, 1, 'PUBLIC', 1119422380, 'Hello', 'Welcome to this Elgg installation.');

--
-- Table structure for table `weblog_watchlist`
--

CREATE TABLE `weblog_watchlist` (
`ident` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`owner` INT NOT NULL ,
`weblog_post` INT NOT NULL ,
INDEX ( `owner` , `weblog_post` )
) ;

-- --------------------------------------------------------

--
-- Table for antispam and more
--

CREATE TABLE `datalists` (
  `ident` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL default '',
  `value` text NOT NULL,
  PRIMARY KEY  (`ident`),
  KEY `name` (`name`)
) ;


-- 
-- Table structure for table `feed_posts`
-- 

CREATE TABLE feed_posts (
  ident int(11) NOT NULL auto_increment,
  posted varchar(64) NOT NULL default '0',
  added int(11) NOT NULL default '0',
  feed int(11) NOT NULL default '0',
  title text NOT NULL,
  body text NOT NULL,
  url varchar(128) NOT NULL default '',
  PRIMARY KEY  (ident),
  KEY url (url),
  KEY feed (feed),
  KEY posted (posted,added)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `feed_subscriptions`
-- 

CREATE TABLE feed_subscriptions (
  ident int(10) unsigned NOT NULL auto_increment,
  user_id int(10) unsigned NOT NULL default '0',
  feed_id int(10) unsigned NOT NULL default '0',
  autopost enum('yes','no') NOT NULL default 'no',
  autopost_tag varchar(128) NOT NULL default '',
  PRIMARY KEY  (ident),
  KEY feed_id (feed_id),
  KEY user_id (user_id),
  KEY autopost (autopost)
) ;

-- --------------------------------------------------------

-- 
-- Table structure for table `feeds`
-- 

CREATE TABLE feeds (
  ident int(10) unsigned NOT NULL auto_increment,
  url varchar(128) NOT NULL default '',
  feedtype varchar(16) NOT NULL default '',
  `name` text NOT NULL,
  tagline varchar(128) NOT NULL default '',
  siteurl varchar(128) NOT NULL default '',
  last_updated int(11) NOT NULL default '0',
  PRIMARY KEY  (ident),
  KEY url (url,feedtype),
  KEY last_updates (last_updated),
  KEY siteurl (siteurl),
  KEY tagline (tagline)
) ;
