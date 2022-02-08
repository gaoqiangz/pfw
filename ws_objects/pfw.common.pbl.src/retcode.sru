$PBExportHeader$retcode.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type retcode from nonvisualobject
end type
end forward

global type retcode from nonvisualobject
end type
global retcode retcode

type variables
//* Copyright (c) 2013 - 2017
//* 著作权由金千枝（深圳）软件技术有限公司所有。著作权人保留一切权利。
//* 
//* 这份授权条款，在满足下列条件的前提下，允许使用者再发布经过或未经过
//* 修改的、源代码或二进制形式的本软件：
//* 
//* 1. 源代码的再发布，必须保留原来代码中的版权声明、这几条许可条件细目
//*    和下面的免责声明。
//* 2. 二进制形式的再发布，必须在随同提供的文档和其它媒介中，复制原来的
//*    版权声明、这几条许可条件细目和下面的免责声明。
//* 3. 所有使用到本软件功能的产品及宣传材料，都必须包还含下列之交待文字：
//*        “本产品内含有由金千枝（深圳）软件技术有限公司及其软件贡献者所开发的软件。”
//* 4. 如果没有特殊的事前书面许可，原作者的组织名称，和贡献者名字，都不能
//*    用于支持或宣传从既有软件派生的产品。
//* 
//* 免责声明：此软件由金千枝（深圳）软件技术有限公司和贡献者以“即此”方式提供，无论明示或
//* 暗示的，包括但不限于间接的关于基于某种目的的适销性、实用性，在此皆明示
//* 不予保证。在任何情况下，由于使用此软件造成的，直接、间接、连带、特别、
//* 惩戒或因此而造成的损害（包括但不限于获得替代品及服务，无法使用，丢失数
//* 据，损失盈利或业务中断），无论此类损害是如何造成的，基于何种责任推断，
//* 是否属于合同范畴，严格赔偿责任或民事侵权行为（包括疏忽和其他原因），即
//* 使预先被告知此类损害可能发生，金千枝（深圳）软件技术有限公司和贡献者均不承担任何责任。
//================================================================

/*--- PowerFramework return codes ---*/
Public:
Constant Long OK									= 0
Constant Long SUCCESS							= 0
Constant Long ALLOW							= 0
Constant Long PREVENT							= 1
Constant Long FAILED								= -1
Constant Long CANCELED						= -2
Constant Long CANCELLED						= -2
Constant Long E_INVALID_ARGUMENT		= -3
Constant Long E_INVALID_IMAGE				= -4
Constant Long E_INVALID_OBJECT				= -5
Constant Long E_INVALID_TYPE				= -6
Constant Long E_INVALID_TRANSACTION	= -7
Constant Long E_INVALID_SQL					= -8
Constant Long E_INVALID_DATA				= -9
Constant Long E_INVALID_DATAOBJECT		= -10
Constant Long E_INVALID_HANDLE				= -11
Constant Long E_OUT_OF_BOUND				= -12
Constant Long E_OUT_OF_RANGE				= -13
Constant Long E_OUT_OF_MEMORY			= -14
Constant Long E_FILE_NOT_FOUND			= -15
Constant Long E_OBJECT_NOT_FOUND		= -16
Constant Long E_DATA_NOT_FOUND			= -17
Constant Long E_FUNCTION_NOT_FOUND	= -18
Constant Long E_EVENT_NOT_FOUND		= -19
Constant Long E_MEMBER_NOT_FOUND		= -20
Constant Long E_VAR_NOT_FOUND			= -21
Constant Long E_NOT_EXISTS					= -22
Constant Long E_BUSY							= -23
Constant Long E_TIME_OUT						= -24
Constant Long E_ACCESS_DENIED				= -25
Constant Long E_WIN32_ERROR				= -26
Constant Long E_INTERNAL_ERROR			= -27
Constant Long E_DB_ERROR						= -28
Constant Long E_HTTP_ERROR					= -29
Constant Long E_WINHTTP_ERROR			= -30
Constant Long E_IO_ERROR						= -31
Constant Long E_SQL_BIND_ARG_FAILED	= -32
Constant Long E_RETRY					= -33
Constant Long E_NO_SUPPORT					= -2000
Constant Long E_NO_IMPLEMENTATION		= -2001
Constant Long UNKNOWN						= -4000

/*--- XML Parser ---*/

//Parse status (n_xmlparseresult::GetStatus)
Constant Long XML_OK 									= 0	// No error
Constant Long XML_E_FILE_NOT_FOUND 			= 1	// File was not found during load_file()
Constant Long XML_E_IO_ERROR 						= 2	// Error reading from file/stream
Constant Long XML_E_OUT_OF_MEMORY 			= 3	// Could not allocate memory
Constant Long XML_E_INTERNAL_ERROR 			= 4	// Internal error occurred
Constant Long XML_E_UNRECOGNIZED_TAG 		= 5	// Parser could not determine tag type
Constant Long XML_E_BAD_PI 							= 6	// Parsing error occurred while parsing document declaration/processing instruction
Constant Long XML_E_BAD_COMMENT 				= 7	// Parsing error occurred while parsing comment
Constant Long XML_E_BAD_CDATA 					= 8	// Parsing error occurred while parsing CDATA section
Constant Long XML_E_BAD_DOCTYPE 				= 9	// Parsing error occurred while parsing document type declaration
Constant Long XML_E_BAD_PCDATA 					= 10	// Parsing error occurred while parsing PCDATA section
Constant Long XML_E_BAD_START_ELEMENT 		= 11	// Parsing error occurred while parsing start element tag
Constant Long XML_E_BAD_ATTRIBUTE 				= 12	// Parsing error occurred while parsing element attribute
Constant Long XML_E_BAD_END_ELEMENT 			= 13	// Parsing error occurred while parsing end element tag
Constant Long XML_E_END_ELEMENT_MISMATCH	= 14	// There was a mismatch of start-end tags (closing tag had incorrect name, some tag was not closed or there was an excessive closing tag)
Constant Long XML_E_APPEND_INVALID_ROOT 	= 15	// Unable to append nodes since root type is not node_element or node_document (exclusive to xml_node::append_buffer)
Constant Long XML_E_NO_DOCUMENT_ELEMENT 	= 16	// Parsing resulted in a document without element nodes

/*--- End XML Parser ---*/

/*--- SQLite ---*/

//SQLDBCode (n_sqlite::SQLDBCode)
Constant Long SQLITE_OK          =  0   /* Successful result */
//-- beginning-of-error-codes
Constant Long SQLITE_ERROR       =  1   /* Generic error */
Constant Long SQLITE_INTERNAL    =  2   /* Internal logic error in SQLite */
Constant Long SQLITE_PERM        =  3   /* Access permission denied */
Constant Long SQLITE_ABORT       =  4   /* Callback routine requested an abort */
Constant Long SQLITE_BUSY        =  5   /* The database file is locked */
Constant Long SQLITE_LOCKED      =  6   /* A table in the database is locked */
Constant Long SQLITE_NOMEM       =  7   /* A malloc() failed */
Constant Long SQLITE_READONLY    =  8   /* Attempt to write a readonly database */
Constant Long SQLITE_INTERRUPT   =  9   /* Operation terminated by sqlite3_interrupt()*/
Constant Long SQLITE_IOERR       = 10   /* Some kind of disk I/O error occurred */
Constant Long SQLITE_CORRUPT     = 11   /* The database disk image is malformed */
Constant Long SQLITE_NOTFOUND    = 12   /* Unknown opcode in sqlite3_file_control() */
Constant Long SQLITE_FULL        = 13   /* Insertion failed because database is full */
Constant Long SQLITE_CANTOPEN    = 14   /* Unable to open the database file */
Constant Long SQLITE_PROTOCOL    = 15   /* Database lock protocol error */
Constant Long SQLITE_EMPTY       = 16   /* Internal use only */
Constant Long SQLITE_SCHEMA      = 17   /* The database schema changed */
Constant Long SQLITE_TOOBIG      = 18   /* String or BLOB exceeds size limit */
Constant Long SQLITE_CONSTRAINT  = 19   /* Abort due to constraint violation */
Constant Long SQLITE_MISMATCH    = 20   /* Data type mismatch */
Constant Long SQLITE_MISUSE      = 21   /* Library used incorrectly */
Constant Long SQLITE_NOLFS       = 22   /* Uses OS features not supported on host */
Constant Long SQLITE_AUTH        = 23   /* Authorization denied */
Constant Long SQLITE_FORMAT      = 24   /* Not used */
Constant Long SQLITE_RANGE       = 25   /* 2nd parameter to sqlite3_bind out of range */
Constant Long SQLITE_NOTADB      = 26   /* File opened that is not a database file */
Constant Long SQLITE_NOTICE      = 27   /* Notifications from sqlite3_log() */
Constant Long SQLITE_WARNING     = 28   /* Warnings from sqlite3_log() */
Constant Long SQLITE_ROW         = 100  /* sqlite3_step() has another row ready */
Constant Long SQLITE_DONE        = 101  /* sqlite3_step() has finished executing */
//-- Extended Result Codes
Constant Long SQLITE_ERROR_MISSING_COLLSEQ   	= (SQLITE_ERROR + (1*256))
Constant Long SQLITE_ERROR_RETRY             	= (SQLITE_ERROR + (2*256))
Constant Long SQLITE_ERROR_SNAPSHOT          	= (SQLITE_ERROR + (3*256))
Constant Long SQLITE_IOERR_READ              	= (SQLITE_IOERR + (1*256))
Constant Long SQLITE_IOERR_SHORT_READ        	= (SQLITE_IOERR + (2*256))
Constant Long SQLITE_IOERR_WRITE             	= (SQLITE_IOERR + (3*256))
Constant Long SQLITE_IOERR_FSYNC             	= (SQLITE_IOERR + (4*256))
Constant Long SQLITE_IOERR_DIR_FSYNC         	= (SQLITE_IOERR + (5*256))
Constant Long SQLITE_IOERR_TRUNCATE          	= (SQLITE_IOERR + (6*256))
Constant Long SQLITE_IOERR_FSTAT             	= (SQLITE_IOERR + (7*256))
Constant Long SQLITE_IOERR_UNLOCK            	= (SQLITE_IOERR + (8*256))
Constant Long SQLITE_IOERR_RDLOCK            	= (SQLITE_IOERR + (9*256))
Constant Long SQLITE_IOERR_DELETE            	= (SQLITE_IOERR + (10*256))
Constant Long SQLITE_IOERR_BLOCKED           	= (SQLITE_IOERR + (11*256))
Constant Long SQLITE_IOERR_NOMEM             	= (SQLITE_IOERR + (12*256))
Constant Long SQLITE_IOERR_ACCESS            	= (SQLITE_IOERR + (13*256))
Constant Long SQLITE_IOERR_CHECKRESERVEDLOCK 	= (SQLITE_IOERR + (14*256))
Constant Long SQLITE_IOERR_LOCK              	= (SQLITE_IOERR + (15*256))
Constant Long SQLITE_IOERR_CLOSE             	= (SQLITE_IOERR + (16*256))
Constant Long SQLITE_IOERR_DIR_CLOSE         	= (SQLITE_IOERR + (17*256))
Constant Long SQLITE_IOERR_SHMOPEN           	= (SQLITE_IOERR + (18*256))
Constant Long SQLITE_IOERR_SHMSIZE           	= (SQLITE_IOERR + (19*256))
Constant Long SQLITE_IOERR_SHMLOCK           	= (SQLITE_IOERR + (20*256))
Constant Long SQLITE_IOERR_SHMMAP            	= (SQLITE_IOERR + (21*256))
Constant Long SQLITE_IOERR_SEEK              	= (SQLITE_IOERR + (22*256))
Constant Long SQLITE_IOERR_DELETE_NOENT      	= (SQLITE_IOERR + (23*256))
Constant Long SQLITE_IOERR_MMAP              	= (SQLITE_IOERR + (24*256))
Constant Long SQLITE_IOERR_GETTEMPPATH       	= (SQLITE_IOERR + (25*256))
Constant Long SQLITE_IOERR_CONVPATH          	= (SQLITE_IOERR + (26*256))
Constant Long SQLITE_IOERR_VNODE             	= (SQLITE_IOERR + (27*256))
Constant Long SQLITE_IOERR_AUTH              	= (SQLITE_IOERR + (28*256))
Constant Long SQLITE_IOERR_BEGIN_ATOMIC      	= (SQLITE_IOERR + (29*256))
Constant Long SQLITE_IOERR_COMMIT_ATOMIC     	= (SQLITE_IOERR + (30*256))
Constant Long SQLITE_IOERR_ROLLBACK_ATOMIC   	= (SQLITE_IOERR + (31*256))
Constant Long SQLITE_LOCKED_SHAREDCACHE      	= (SQLITE_LOCKED +  (1*256))
Constant Long SQLITE_LOCKED_VTAB             	= (SQLITE_LOCKED +  (2*256))
Constant Long SQLITE_BUSY_RECOVERY           	= (SQLITE_BUSY   +  (1*256))
Constant Long SQLITE_BUSY_SNAPSHOT           	= (SQLITE_BUSY   +  (2*256))
Constant Long SQLITE_CANTOPEN_NOTEMPDIR      	= (SQLITE_CANTOPEN + (1*256))
Constant Long SQLITE_CANTOPEN_ISDIR          	= (SQLITE_CANTOPEN + (2*256))
Constant Long SQLITE_CANTOPEN_FULLPATH       	= (SQLITE_CANTOPEN + (3*256))
Constant Long SQLITE_CANTOPEN_CONVPATH       	= (SQLITE_CANTOPEN + (4*256))
Constant Long SQLITE_CANTOPEN_DIRTYWAL       	= (SQLITE_CANTOPEN + (5*256)) /* Not Used */
Constant Long SQLITE_CORRUPT_VTAB            	= (SQLITE_CORRUPT + (1*256))
Constant Long SQLITE_CORRUPT_SEQUENCE        	= (SQLITE_CORRUPT + (2*256))
Constant Long SQLITE_READONLY_RECOVERY       	= (SQLITE_READONLY + (1*256))
Constant Long SQLITE_READONLY_CANTLOCK       	= (SQLITE_READONLY + (2*256))
Constant Long SQLITE_READONLY_ROLLBACK       	= (SQLITE_READONLY + (3*256))
Constant Long SQLITE_READONLY_DBMOVED        	= (SQLITE_READONLY + (4*256))
Constant Long SQLITE_READONLY_CANTINIT       	= (SQLITE_READONLY + (5*256))
Constant Long SQLITE_READONLY_DIRECTORY      	= (SQLITE_READONLY + (6*256))
Constant Long SQLITE_ABORT_ROLLBACK          	= (SQLITE_ABORT + (2*256))
Constant Long SQLITE_CONSTRAINT_CHECK        	= (SQLITE_CONSTRAINT + (1*256))
Constant Long SQLITE_CONSTRAINT_COMMITHOOK   	= (SQLITE_CONSTRAINT + (2*256))
Constant Long SQLITE_CONSTRAINT_FOREIGNKEY   	= (SQLITE_CONSTRAINT + (3*256))
Constant Long SQLITE_CONSTRAINT_FUNCTION     	= (SQLITE_CONSTRAINT + (4*256))
Constant Long SQLITE_CONSTRAINT_NOTNULL      	= (SQLITE_CONSTRAINT + (5*256))
Constant Long SQLITE_CONSTRAINT_PRIMARYKEY   	= (SQLITE_CONSTRAINT + (6*256))
Constant Long SQLITE_CONSTRAINT_TRIGGER      	= (SQLITE_CONSTRAINT + (7*256))
Constant Long SQLITE_CONSTRAINT_UNIQUE       	= (SQLITE_CONSTRAINT + (8*256))
Constant Long SQLITE_CONSTRAINT_VTAB         	= (SQLITE_CONSTRAINT + (9*256))
Constant Long SQLITE_CONSTRAINT_ROWID        	= (SQLITE_CONSTRAINT +(10*256))
Constant Long SQLITE_NOTICE_RECOVER_WAL      	= (SQLITE_NOTICE + (1*256))
Constant Long SQLITE_NOTICE_RECOVER_ROLLBACK 	= (SQLITE_NOTICE + (2*256))
Constant Long SQLITE_WARNING_AUTOINDEX       	= (SQLITE_WARNING + (1*256))
Constant Long SQLITE_AUTH_USER               	= (SQLITE_AUTH + (1*256))
Constant Long SQLITE_OK_LOAD_PERMANENTLY     	= (SQLITE_OK + (1*256))

/*--- End SQLite ---*/

end variables

on retcode.create
call super::create
TriggerEvent( this, "constructor" )
end on

on retcode.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

