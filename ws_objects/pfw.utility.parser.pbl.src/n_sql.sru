$PBExportHeader$n_sql.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_sql from nonvisualobject
end type
end forward

global type n_sql from nonvisualobject native "pfw.dll"
public function string copyright()
public function string getversion()
public function boolean parse(readonly string sql)
public function string getsql()
public function int getselectcount()
public function boolean hascolumn()
public function boolean hascolumn(readonly int nselectindex)
public function boolean hastable()
public function boolean hastable(readonly int nselectindex)
public function boolean haswhere()
public function boolean haswhere(readonly int nselectindex)
public function boolean hasgroup()
public function boolean hasgroup(readonly int nselectindex)
public function boolean hashaving()
public function boolean hashaving(readonly int nselectindex)
public function boolean hasorder()
public function boolean hasorder(readonly int nselectindex)
public function string getcolumn()
public function string getcolumn(readonly int nselectindex)
public function string gettable()
public function string gettable(readonly int nselectindex)
public function string getwhere()
public function string getwhere(readonly int nselectindex)
public function string getgroup()
public function string getgroup(readonly int nselectindex)
public function string gethaving()
public function string gethaving(readonly int nselectindex)
public function string getorder()
public function string getorder(readonly int nselectindex)
public function boolean modifycolumn(readonly long ms,readonly string newcolumn)
public function boolean modifycolumn(readonly int nselectindex,readonly long ms,readonly string newcolumn)
public function boolean modifytable(readonly long ms,readonly string newtable)
public function boolean modifytable(readonly int nselectindex,readonly long ms,readonly string newtable)
public function boolean modifywhere(readonly long ms,readonly string newwhere)
public function boolean modifywhere(readonly int nselectindex,readonly long ms,readonly string newwhere)
public function boolean modifygroup(readonly long ms,readonly string newgroup)
public function boolean modifygroup(readonly int nselectindex,readonly long ms,readonly string newgroup)
public function boolean modifyhaving(readonly long ms,readonly string newhaving)
public function boolean modifyhaving(readonly int nselectindex,readonly long ms,readonly string newhaving)
public function boolean modifyorder(readonly long ms,readonly string neworder)
public function boolean modifyorder(readonly int nselectindex,readonly long ms,readonly string neworder)
end type
global n_sql n_sql

on n_sql.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sql.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

