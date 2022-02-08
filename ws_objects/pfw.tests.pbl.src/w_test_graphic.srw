$PBExportHeader$w_test_graphic.srw
forward
global type w_test_graphic from s_cst_window
end type
type r_6 from rectangle within w_test_graphic
end type
type ln_1 from line within w_test_graphic
end type
type ov_1 from oval within w_test_graphic
end type
type r_1 from rectangle within w_test_graphic
end type
type rr_1 from roundrectangle within w_test_graphic
end type
type ln_2 from line within w_test_graphic
end type
type ln_3 from line within w_test_graphic
end type
type ln_4 from line within w_test_graphic
end type
type ln_5 from line within w_test_graphic
end type
type ln_6 from line within w_test_graphic
end type
type ln_7 from line within w_test_graphic
end type
type ln_8 from line within w_test_graphic
end type
type ln_9 from line within w_test_graphic
end type
type ln_10 from line within w_test_graphic
end type
type r_2 from rectangle within w_test_graphic
end type
type r_3 from rectangle within w_test_graphic
end type
type r_4 from rectangle within w_test_graphic
end type
type r_5 from rectangle within w_test_graphic
end type
type rr_2 from roundrectangle within w_test_graphic
end type
type rr_3 from roundrectangle within w_test_graphic
end type
type rr_4 from roundrectangle within w_test_graphic
end type
type rr_5 from roundrectangle within w_test_graphic
end type
type ov_2 from oval within w_test_graphic
end type
type ov_3 from oval within w_test_graphic
end type
type ov_4 from oval within w_test_graphic
end type
type ov_5 from oval within w_test_graphic
end type
type ov_6 from oval within w_test_graphic
end type
type ov_7 from oval within w_test_graphic
end type
type ov_8 from oval within w_test_graphic
end type
type ov_9 from oval within w_test_graphic
end type
type ov_10 from oval within w_test_graphic
end type
end forward

global type w_test_graphic from s_cst_window
integer width = 2583
integer height = 1480
string title = "Untitled"
r_6 r_6
ln_1 ln_1
ov_1 ov_1
r_1 r_1
rr_1 rr_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
ln_8 ln_8
ln_9 ln_9
ln_10 ln_10
r_2 r_2
r_3 r_3
r_4 r_4
r_5 r_5
rr_2 rr_2
rr_3 rr_3
rr_4 rr_4
rr_5 rr_5
ov_2 ov_2
ov_3 ov_3
ov_4 ov_4
ov_5 ov_5
ov_6 ov_6
ov_7 ov_7
ov_8 ov_8
ov_9 ov_9
ov_10 ov_10
end type
global w_test_graphic w_test_graphic

on w_test_graphic.create
int iCurrent
call super::create
this.r_6=create r_6
this.ln_1=create ln_1
this.ov_1=create ov_1
this.r_1=create r_1
this.rr_1=create rr_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.ln_7=create ln_7
this.ln_8=create ln_8
this.ln_9=create ln_9
this.ln_10=create ln_10
this.r_2=create r_2
this.r_3=create r_3
this.r_4=create r_4
this.r_5=create r_5
this.rr_2=create rr_2
this.rr_3=create rr_3
this.rr_4=create rr_4
this.rr_5=create rr_5
this.ov_2=create ov_2
this.ov_3=create ov_3
this.ov_4=create ov_4
this.ov_5=create ov_5
this.ov_6=create ov_6
this.ov_7=create ov_7
this.ov_8=create ov_8
this.ov_9=create ov_9
this.ov_10=create ov_10
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.r_6
this.Control[iCurrent+2]=this.ln_1
this.Control[iCurrent+3]=this.ov_1
this.Control[iCurrent+4]=this.r_1
this.Control[iCurrent+5]=this.rr_1
this.Control[iCurrent+6]=this.ln_2
this.Control[iCurrent+7]=this.ln_3
this.Control[iCurrent+8]=this.ln_4
this.Control[iCurrent+9]=this.ln_5
this.Control[iCurrent+10]=this.ln_6
this.Control[iCurrent+11]=this.ln_7
this.Control[iCurrent+12]=this.ln_8
this.Control[iCurrent+13]=this.ln_9
this.Control[iCurrent+14]=this.ln_10
this.Control[iCurrent+15]=this.r_2
this.Control[iCurrent+16]=this.r_3
this.Control[iCurrent+17]=this.r_4
this.Control[iCurrent+18]=this.r_5
this.Control[iCurrent+19]=this.rr_2
this.Control[iCurrent+20]=this.rr_3
this.Control[iCurrent+21]=this.rr_4
this.Control[iCurrent+22]=this.rr_5
this.Control[iCurrent+23]=this.ov_2
this.Control[iCurrent+24]=this.ov_3
this.Control[iCurrent+25]=this.ov_4
this.Control[iCurrent+26]=this.ov_5
this.Control[iCurrent+27]=this.ov_6
this.Control[iCurrent+28]=this.ov_7
this.Control[iCurrent+29]=this.ov_8
this.Control[iCurrent+30]=this.ov_9
this.Control[iCurrent+31]=this.ov_10
end on

on w_test_graphic.destroy
call super::destroy
destroy(this.r_6)
destroy(this.ln_1)
destroy(this.ov_1)
destroy(this.r_1)
destroy(this.rr_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.ln_7)
destroy(this.ln_8)
destroy(this.ln_9)
destroy(this.ln_10)
destroy(this.r_2)
destroy(this.r_3)
destroy(this.r_4)
destroy(this.r_5)
destroy(this.rr_2)
destroy(this.rr_3)
destroy(this.rr_4)
destroy(this.rr_5)
destroy(this.ov_2)
destroy(this.ov_3)
destroy(this.ov_4)
destroy(this.ov_5)
destroy(this.ov_6)
destroy(this.ov_7)
destroy(this.ov_8)
destroy(this.ov_9)
destroy(this.ov_10)
end on

type r_6 from rectangle within w_test_graphic
long linecolor = 134217730
linestyle linestyle = dash!
integer linethickness = 4
long fillcolor = 134217728
integer x = 425
integer y = 48
integer width = 320
integer height = 168
end type

type ln_1 from line within w_test_graphic
long linecolor = 33554432
integer linethickness = 4
integer beginx = 23
integer beginy = 32
integer endx = 23
integer endy = 488
end type

type ov_1 from oval within w_test_graphic
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1326
integer y = 24
integer width = 334
integer height = 224
end type

type r_1 from rectangle within w_test_graphic
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer x = 535
integer y = 16
integer width = 320
integer height = 168
end type

type rr_1 from roundrectangle within w_test_graphic
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer x = 946
integer y = 20
integer width = 320
integer height = 168
integer cornerheight = 40
integer cornerwidth = 46
end type

type ln_2 from line within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dash!
integer linethickness = 4
integer beginx = 91
integer beginy = 32
integer endx = 91
integer endy = 488
end type

type ln_3 from line within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdot!
integer linethickness = 4
integer beginx = 256
integer beginy = 32
integer endx = 256
integer endy = 488
end type

type ln_4 from line within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdotdot!
integer linethickness = 4
integer beginx = 178
integer beginy = 32
integer endx = 178
integer endy = 488
end type

type ln_5 from line within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dot!
integer linethickness = 4
integer beginx = 320
integer beginy = 32
integer endx = 320
integer endy = 488
end type

type ln_6 from line within w_test_graphic
long linecolor = 33554432
integer linethickness = 4
integer beginx = 23
integer beginy = 480
integer endx = 105
integer endy = 936
end type

type ln_7 from line within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dash!
integer linethickness = 4
integer beginx = 91
integer beginy = 496
integer endx = 178
integer endy = 952
end type

type ln_8 from line within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdotdot!
integer linethickness = 4
integer beginx = 174
integer beginy = 500
integer endx = 274
integer endy = 956
end type

type ln_9 from line within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdot!
integer linethickness = 4
integer beginx = 261
integer beginy = 492
integer endx = 375
integer endy = 948
end type

type ln_10 from line within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dot!
integer linethickness = 4
integer beginx = 325
integer beginy = 472
integer endx = 475
integer endy = 928
end type

type r_2 from rectangle within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dash!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 535
integer y = 216
integer width = 320
integer height = 168
end type

type r_3 from rectangle within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 535
integer y = 424
integer width = 320
integer height = 168
end type

type r_4 from rectangle within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdotdot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 535
integer y = 620
integer width = 320
integer height = 168
end type

type r_5 from rectangle within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 539
integer y = 812
integer width = 320
integer height = 168
end type

type rr_2 from roundrectangle within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dash!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 942
integer y = 212
integer width = 320
integer height = 168
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 946
integer y = 424
integer width = 320
integer height = 168
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_4 from roundrectangle within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdotdot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 946
integer y = 624
integer width = 320
integer height = 168
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_5 from roundrectangle within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 955
integer y = 808
integer width = 320
integer height = 168
integer cornerheight = 40
integer cornerwidth = 46
end type

type ov_2 from oval within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dash!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1339
integer y = 304
integer width = 334
integer height = 224
end type

type ov_3 from oval within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1349
integer y = 580
integer width = 334
integer height = 224
end type

type ov_4 from oval within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdotdot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1362
integer y = 848
integer width = 334
integer height = 224
end type

type ov_5 from oval within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1362
integer y = 1108
integer width = 334
integer height = 224
end type

type ov_6 from oval within w_test_graphic
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 134217741
integer x = 1787
integer y = 20
integer width = 279
integer height = 224
end type

type ov_7 from oval within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dash!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1801
integer y = 300
integer width = 279
integer height = 224
end type

type ov_8 from oval within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1810
integer y = 576
integer width = 279
integer height = 224
end type

type ov_9 from oval within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dashdotdot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1824
integer y = 844
integer width = 279
integer height = 224
end type

type ov_10 from oval within w_test_graphic
long linecolor = 33554432
linestyle linestyle = dot!
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1824
integer y = 1104
integer width = 279
integer height = 224
end type

