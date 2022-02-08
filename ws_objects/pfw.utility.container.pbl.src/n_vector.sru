$PBExportHeader$n_vector.sru
$PBExportComments$PowerBuilder Extension~r~nBy gaoqiangz@msn.com
forward
global type n_vector from nonvisualobject
end type
end forward

global type n_vector from nonvisualobject native "pfw.dll"
public function  long copyfromlist(n_list obj)
public function  long copyfromvector(n_vector obj)
public function  long copytoarray(ref any values[])
public function  ulong count()
public function  ulong maxsize()
public subroutine  purge()
public subroutine  reverse()
public function  boolean reserve(ulong size)
public function  boolean resize(ulong size)
public function  boolean exists(any value)
public subroutine  move(ulong index)
public subroutine  append(any value)
public function  any get()
public function  any getat(ulong index)
public subroutine  set(any value)
public subroutine  setat(ulong index, any value)
public subroutine  remove()
public subroutine  removeat(ulong index)
public function  any getnext()
public function  any getprevious()
public function  any getandnext()
public subroutine  rewind()
public function  any getfirst()
public function  any getlast()
public subroutine  prepend(any value)
public subroutine  insertbefore(ulong index, any value)
public subroutine  insertafter(ulong index, any value)
public function  boolean hasnext()
public function  ulong position()
public function  ulong position(any value)
public subroutine  sort()
public subroutine  sort(powerobject apo_comparator, string cmpfunc)
public subroutine  unique()
end type
global n_vector n_vector

on n_vector.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_vector.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

