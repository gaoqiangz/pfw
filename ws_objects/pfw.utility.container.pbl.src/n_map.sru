$PBExportHeader$n_map.sru
$PBExportComments$PowerBuilder Extension~r~nBy gaoqiangz@msn.com
forward
global type n_map from nonvisualobject
end type
end forward

global type n_map from nonvisualobject native "pfw.dll"
public function  boolean add(string key, any value)
public function  any get(string key)
public function  any get(int index)
public function  string getkey(int index)
public function  boolean getkeys(ref string keys[])
public function  boolean set(string key, any value)
public function  boolean exists(string key)
public function  boolean remove(string key)
public function  ulong count()
public subroutine  purge()
end type
global n_map n_map

on n_map.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_map.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

