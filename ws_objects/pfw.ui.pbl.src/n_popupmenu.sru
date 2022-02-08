$PBExportHeader$n_popupmenu.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type n_popupmenu from nonvisualobject
end type
end forward

global type n_popupmenu from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function boolean SetImageList(readonly n_imagelist imglist)
public function boolean SetBorderShadow(readonly boolean show)
public function boolean SetFont(readonly ulong hfont)
public function boolean SetBkgndStyle(readonly uint style)
public function boolean SetBorderStyle(readonly uint style)
public function boolean SetItemBkgndStyle(readonly uint style)
public function boolean SetItemBorderStyle(readonly uint style)
public function boolean SetBkgndColor(readonly ulong color)
public function boolean SetBorderColor(readonly ulong color)
public function boolean SetItemBkgndColor(readonly ulong color)
public function boolean SetItemBorderColor(readonly ulong color)
public function boolean SetTextColor(readonly ulong color)
public function boolean SetDisabledTextColor(readonly ulong color)
public function boolean SetSeparatorColor(readonly ulong color)
public function boolean SetArrowColor(readonly ulong color)
public function boolean SetDisabledArrowColor(readonly ulong color)
public function boolean SetSelectBold(readonly boolean bold)
public function boolean SetToolTip(readonly boolean enabled)
public function boolean SetTitleBar(readonly boolean show)
public function boolean SetTitleText(readonly string text)
public function boolean SetTitleTextAlign(readonly alignment align)
public function boolean SetTitleImage(readonly int imageindex)
public function boolean SetTitleImageAlign(readonly alignment align)
public function integer InsertMenu(readonly ulong idInsert,readonly boolean byposition,readonly string text,readonly int imageindex,readonly string tiptext,readonly boolean enabled,readonly ulong id)
public function integer InsertSubMenu(readonly ulong idInsert,readonly boolean byposition,readonly n_popupmenu lpPopupMenu,readonly string text,readonly int imageindex,readonly string tiptext,readonly boolean split,readonly boolean enabled,readonly ulong id)
public function integer InsertLabel(readonly ulong idInsert,readonly boolean byposition,readonly string text,readonly int imageindex)
public function integer InsertSeparator(readonly ulong idInsert,readonly boolean byposition)
public function boolean InsertMenu(readonly ulong idInsert,readonly ulong idStart,readonly ulong idEnd,readonly boolean byposition,readonly n_popupmenu popupmenu)
public function boolean Enable(readonly ulong id,readonly boolean byposition,boolean enable)
public function boolean Check(readonly ulong id,readonly boolean byposition,boolean checked)
public function boolean CheckRadios(readonly ulong idfirst,readonly ulong idlast,readonly ulong idcheck,readonly boolean byposition,boolean checked)
public function boolean SetText(readonly ulong id,readonly boolean byposition,readonly string text)
public function boolean SetImage(readonly ulong id,readonly boolean byposition,readonly int imageindex)
public function boolean SetTipText(readonly ulong id,readonly boolean byposition,readonly string tiptext)
public function boolean SetTag(readonly ulong id,readonly boolean byposition,readonly string tag)
public function boolean IsEnabled(readonly ulong id,readonly boolean byposition)
public function boolean IsChecked(readonly ulong id,readonly boolean byposition)
public function boolean IsSubMenu(readonly ulong id,readonly boolean byposition)
public function string GetText(readonly ulong id,readonly boolean byposition)
public function int GetImage(readonly ulong id,readonly boolean byposition)
public function string GetTipText(readonly ulong id,readonly boolean byposition)
public function string GetTag(readonly ulong id,readonly boolean byposition)
public function ulong GetID(readonly int pos)
public function int GetPos(readonly ulong id)
public function n_popupmenu GetSubMenu(readonly int pos,readonly boolean byposition)
public function int GetCount()
public function boolean Remove(readonly ulong id,readonly boolean byposition)
public function boolean RemoveAll()
public function ulong Popup(readonly ulong hwnd,readonly real x,readonly real y)
public function ulong PopupEx(readonly ulong hwnd,readonly ulong hwndcallback,readonly real x,readonly real y,readonly ulong flags)
event type long OnMenuSelect(ulong id)
event type long OnSubMenuSelect(n_popupmenu submenu,ulong id)
end type
global n_popupmenu n_popupmenu

on n_popupmenu.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_popupmenu.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

