$PBExportHeader$u_cst_tabpage_utility_crypto.sru
$PBExportComments$PowerFramework~r~n(c)飞沃共享(深圳)科技有限公司
forward
global type u_cst_tabpage_utility_crypto from ue_cst_tabpage
end type
type st_2 from statictext within u_cst_tabpage_utility_crypto
end type
type sle_iv from se_cst_singlelineedit within u_cst_tabpage_utility_crypto
end type
type cb_1 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type st_other from statictext within u_cst_tabpage_utility_crypto
end type
type st_asymcript from statictext within u_cst_tabpage_utility_crypto
end type
type st_symcrypt from statictext within u_cst_tabpage_utility_crypto
end type
type st_sign from statictext within u_cst_tabpage_utility_crypto
end type
type st_hash from statictext within u_cst_tabpage_utility_crypto
end type
type st_codec from statictext within u_cst_tabpage_utility_crypto
end type
type cb_7 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_8 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_9 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_10 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_11 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_13 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_14 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type sle_key from se_cst_singlelineedit within u_cst_tabpage_utility_crypto
end type
type st_1 from statictext within u_cst_tabpage_utility_crypto
end type
type cb_15 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_16 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_17 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_18 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_19 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_20 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_21 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_22 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_23 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_24 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_25 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_28 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type cb_29 from se_cst_button within u_cst_tabpage_utility_crypto
end type
type mle_result from se_cst_multilineedit within u_cst_tabpage_utility_crypto
end type
end forward

global type u_cst_tabpage_utility_crypto from ue_cst_tabpage
integer width = 3759
integer height = 2501
st_2 st_2
sle_iv sle_iv
cb_1 cb_1
st_other st_other
st_asymcript st_asymcript
st_symcrypt st_symcrypt
st_sign st_sign
st_hash st_hash
st_codec st_codec
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
cb_11 cb_11
cb_13 cb_13
cb_14 cb_14
sle_key sle_key
st_1 st_1
cb_15 cb_15
cb_16 cb_16
cb_17 cb_17
cb_18 cb_18
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
cb_23 cb_23
cb_24 cb_24
cb_25 cb_25
cb_28 cb_28
cb_29 cb_29
mle_result mle_result
end type
global u_cst_tabpage_utility_crypto u_cst_tabpage_utility_crypto

type variables
n_crypto _crypto
end variables

on u_cst_tabpage_utility_crypto.create
int iCurrent
call super::create
this.st_2=create st_2
this.sle_iv=create sle_iv
this.cb_1=create cb_1
this.st_other=create st_other
this.st_asymcript=create st_asymcript
this.st_symcrypt=create st_symcrypt
this.st_sign=create st_sign
this.st_hash=create st_hash
this.st_codec=create st_codec
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cb_13=create cb_13
this.cb_14=create cb_14
this.sle_key=create sle_key
this.st_1=create st_1
this.cb_15=create cb_15
this.cb_16=create cb_16
this.cb_17=create cb_17
this.cb_18=create cb_18
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.cb_23=create cb_23
this.cb_24=create cb_24
this.cb_25=create cb_25
this.cb_28=create cb_28
this.cb_29=create cb_29
this.mle_result=create mle_result
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.sle_iv
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.st_other
this.Control[iCurrent+5]=this.st_asymcript
this.Control[iCurrent+6]=this.st_symcrypt
this.Control[iCurrent+7]=this.st_sign
this.Control[iCurrent+8]=this.st_hash
this.Control[iCurrent+9]=this.st_codec
this.Control[iCurrent+10]=this.cb_7
this.Control[iCurrent+11]=this.cb_8
this.Control[iCurrent+12]=this.cb_9
this.Control[iCurrent+13]=this.cb_10
this.Control[iCurrent+14]=this.cb_11
this.Control[iCurrent+15]=this.cb_13
this.Control[iCurrent+16]=this.cb_14
this.Control[iCurrent+17]=this.sle_key
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.cb_15
this.Control[iCurrent+20]=this.cb_16
this.Control[iCurrent+21]=this.cb_17
this.Control[iCurrent+22]=this.cb_18
this.Control[iCurrent+23]=this.cb_19
this.Control[iCurrent+24]=this.cb_20
this.Control[iCurrent+25]=this.cb_21
this.Control[iCurrent+26]=this.cb_22
this.Control[iCurrent+27]=this.cb_23
this.Control[iCurrent+28]=this.cb_24
this.Control[iCurrent+29]=this.cb_25
this.Control[iCurrent+30]=this.cb_28
this.Control[iCurrent+31]=this.cb_29
this.Control[iCurrent+32]=this.mle_result
end on

on u_cst_tabpage_utility_crypto.destroy
call super::destroy
destroy(this.st_2)
destroy(this.sle_iv)
destroy(this.cb_1)
destroy(this.st_other)
destroy(this.st_asymcript)
destroy(this.st_symcrypt)
destroy(this.st_sign)
destroy(this.st_hash)
destroy(this.st_codec)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cb_13)
destroy(this.cb_14)
destroy(this.sle_key)
destroy(this.st_1)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.cb_17)
destroy(this.cb_18)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.cb_23)
destroy(this.cb_24)
destroy(this.cb_25)
destroy(this.cb_28)
destroy(this.cb_29)
destroy(this.mle_result)
end on

event onopen;call super::onopen;_crypto = Create n_crypto
end event

event onclose;call super::onclose;Destroy _crypto
end event

event resize;call super::resize;long nHeight

st_codec.Resize(newWidth - st_codec.x * 2,st_codec.height)
st_hash.Resize(newWidth - st_hash.x * 2,st_hash.height)
st_sign.Resize(newWidth - st_sign.x * 2,st_sign.height)
st_symcrypt.Resize(newWidth - st_symcrypt.x * 2,st_symcrypt.height)
st_asymcript.Resize(newWidth - st_asymcript.x * 2,st_asymcript.height)
st_other.Resize(newWidth - st_other.x * 2,st_other.height)

nHeight = newHeight - mle_result.y - 4
if U2PY(nHeight) < 400 then nHeight= P2UY(400)

mle_result.Resize(newWidth - mle_result.x * 2,nHeight)
end event

type st_2 from statictext within u_cst_tabpage_utility_crypto
integer x = 1737
integer y = 981
integer width = 146
integer height = 75
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "IV"
boolean focusrectangle = false
end type

type sle_iv from se_cst_singlelineedit within u_cst_tabpage_utility_crypto
integer x = 1889
integer y = 960
integer width = 1463
integer height = 121
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "abcdefghijklmnopqrstuvwxyz"
end type

type cb_1 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 1554
integer y = 395
integer width = 457
integer height = 133
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "CRC32 File"
end type

event clicked;mle_result.Text = _crypto.HashFile("pfw.dll",Enums.CRYPTO_HASH_CRC32)
end event

type st_other from statictext within u_cst_tabpage_utility_crypto
integer x = 24
integer y = 1536
integer width = 3717
integer height = 75
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 其它"
boolean focusrectangle = false
end type

type st_asymcript from statictext within u_cst_tabpage_utility_crypto
integer x = 24
integer y = 1269
integer width = 3717
integer height = 75
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 非对称加密"
boolean focusrectangle = false
end type

type st_symcrypt from statictext within u_cst_tabpage_utility_crypto
integer x = 24
integer y = 853
integer width = 3717
integer height = 75
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 对称加密"
boolean focusrectangle = false
end type

type st_sign from statictext within u_cst_tabpage_utility_crypto
integer x = 24
integer y = 576
integer width = 3717
integer height = 75
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 签名"
boolean focusrectangle = false
end type

type st_hash from statictext within u_cst_tabpage_utility_crypto
integer x = 24
integer y = 281
integer width = 3717
integer height = 75
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 摘要算法"
boolean focusrectangle = false
end type

type st_codec from statictext within u_cst_tabpage_utility_crypto
integer x = 24
integer y = 16
integer width = 3717
integer height = 75
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = " 编码"
boolean focusrectangle = false
end type

type cb_7 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 60
integer y = 395
integer width = 457
integer height = 133
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Hash"
end type

event clicked;mle_result.Text = _crypto.Hash(mle_result.Text,Enums.CRYPTO_HASH_SHA256)
end event

type cb_8 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 60
integer y = 107
integer width = 538
integer height = 133
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Base64Encode"
end type

event clicked;mle_result.Text = _crypto.BlobToString(Blob(mle_result.Text,EncodingANSI!),Enums.CRYPTO_ENCODING_BASE64)
end event

type cb_9 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 648
integer y = 107
integer width = 543
integer height = 133
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "Base64Decode"
end type

event clicked;mle_result.Text = String(_crypto.StringToBlob(mle_result.Text,Enums.CRYPTO_ENCODING_BASE64),EncodingANSI!)
end event

type cb_10 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 554
integer y = 395
integer width = 457
integer height = 133
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "HMAC"
end type

event clicked;mle_result.Text = _crypto.Hash(mle_result.Text,"abcdefg",Enums.CRYPTO_HASH_SHA256)
end event

type cb_11 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 60
integer y = 697
integer width = 457
integer height = 133
integer taborder = 40
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "RSASign"
end type

event clicked;string ls_data,ls_sign,ls_priKey,ls_pubKey

ls_priKey = "MIICXAIBAAKBgQCmttAKErg3Hsq13pAqbacPnmG8YPh8PhPuaf3KAcPrPTLVB+V9MuN7+6pBgBWmO4q+zt8eIuvHBloqcm5NaVuF2lk+Y5NP6/TO2HOz6agDwxPoH9A4IvR+Ny/Rivs7a+8cP68yFFJqcQWbQZgvNnK6MLU1i2q5pdK4w8UXaYrFUQIDAQABAoGAM3oHStT05LAxT27lfPRWvU/eRdh7YYGZjehUYOeioyRGadkCV2I7M7FFpOvzw1xnPvuJkTifLNkdRjYHMQfzJiXeDgWypcvPZXvEbkIFqsrbm1ngsaXO5f1P97qJRT2xf0ouQa14G2vgWV42XMYX5e8gEHwhgeDiXI47+Jk1qLECQQDU/hLEHPLyzSwb6858GKr66sjtyGmLDcuAESX9MxF3mk0sgycw/BCWlWhXsCv0fp9dbaXZsWktCfBTHnWupSzXAkEAyGCJI+Gyw8DyMY0VKoMXMaMl6CZTmMEnQEeLScJL+QCxx6cpQNQwaONn6cIF1SYZn4nBO2OeRM/mVrxN96RyFwJBALcR8vtRjpiXNVSCaCZN5Zhp+W44Fk+I+eMH2kk5fcf5fl/GEweNgIyNuvOz3vP1afEZ77WfQbGOm1w2EByeqF0CQDJu0bWdRfAtLQg5uT0U945/wLe4hcvpuaZdG3q6E4MdoKFeumxdu716lxnnwq4OQ966vk7jWN968D+eb4VH94sCQA668l3Rr08eTdifgKUIcfyTiu8vcUjkd0cUwFA59NVBHiQyC0k0z5bMC73cjHkxp4NZneW30Uki2bfDpCViqwc="
ls_pubKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCmttAKErg3Hsq13pAqbacPnmG8YPh8PhPuaf3KAcPrPTLVB+V9MuN7+6pBgBWmO4q+zt8eIuvHBloqcm5NaVuF2lk+Y5NP6/TO2HOz6agDwxPoH9A4IvR+Ny/Rivs7a+8cP68yFFJqcQWbQZgvNnK6MLU1i2q5pdK4w8UXaYrFUQIDAQAB"

ls_data = mle_result.Text
ls_sign = _crypto.RSASign(ls_data,ls_priKey,Enums.CRYPTO_HASH_SHA256)

mle_result.Text = ls_sign

MessageBox("VerifyRSASign",_crypto.VerifyRSASign(ls_data,ls_sign,ls_pubKey,Enums.CRYPTO_HASH_SHA256))
end event

type cb_13 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 1048
integer y = 395
integer width = 457
integer height = 133
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "HashFile"
end type

event clicked;mle_result.Text = _crypto.HashFile("pfw.dll",Enums.CRYPTO_HASH_SHA1)
end event

type cb_14 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 60
integer y = 1104
integer width = 457
integer height = 133
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "DESEncrypt"
end type

event clicked;mle_result.Text = _crypto.SymEncrypt(mle_result.Text,sle_key.text,sle_iv.text,Enums.CRYPTO_SYMCRYPT_TYPE_DES,Enums.CRYPTO_SYMCRYPT_MODE_CBC)
end event

type sle_key from se_cst_singlelineedit within u_cst_tabpage_utility_crypto
integer x = 232
integer y = 960
integer width = 1463
integer height = 121
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "abcdefghijklmnopqrstuvwxyz"
end type

type st_1 from statictext within u_cst_tabpage_utility_crypto
integer x = 81
integer y = 981
integer width = 146
integer height = 75
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "KEY"
boolean focusrectangle = false
end type

type cb_15 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 549
integer y = 1104
integer width = 457
integer height = 133
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "DESDecrypt"
end type

event clicked;mle_result.Text = _crypto.SymDecrypt(mle_result.Text,sle_key.text,sle_iv.text,Enums.CRYPTO_SYMCRYPT_TYPE_DES,Enums.CRYPTO_SYMCRYPT_MODE_CBC)
end event

type cb_16 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 1834
integer y = 107
integer width = 543
integer height = 133
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "HexDecode"
end type

event clicked;mle_result.Text = String(_crypto.StringToBlob(mle_result.Text,Enums.CRYPTO_ENCODING_HEX),EncodingANSI!)
end event

type cb_17 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 1243
integer y = 107
integer width = 538
integer height = 133
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "HexEncode"
end type

event clicked;mle_result.Text = _crypto.BlobToString(Blob(mle_result.Text,EncodingANSI!),Enums.CRYPTO_ENCODING_HEX)
end event

type cb_18 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 2555
integer y = 1104
integer width = 457
integer height = 133
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "AESDecrypt"
end type

event clicked;mle_result.Text = _crypto.SymDecrypt(mle_result.Text,sle_key.text,sle_iv.text,Enums.CRYPTO_SYMCRYPT_TYPE_AES256,Enums.CRYPTO_SYMCRYPT_MODE_CBC)
end event

type cb_19 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 2066
integer y = 1104
integer width = 457
integer height = 133
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "AESEncrypt"
end type

event clicked;mle_result.Text = _crypto.SymEncrypt(mle_result.Text,sle_key.text,sle_iv.text,Enums.CRYPTO_SYMCRYPT_TYPE_AES256,Enums.CRYPTO_SYMCRYPT_MODE_CBC)
end event

type cb_20 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 1549
integer y = 1104
integer width = 486
integer height = 133
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "3DESDecrypt"
end type

event clicked;mle_result.Text = _crypto.SymDecrypt(mle_result.Text,sle_key.text,sle_iv.text,Enums.CRYPTO_SYMCRYPT_TYPE_3DES,Enums.CRYPTO_SYMCRYPT_MODE_CBC)
end event

type cb_21 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 1037
integer y = 1104
integer width = 481
integer height = 133
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "3DESEncrypt"
end type

event clicked;mle_result.Text = _crypto.SymEncrypt(mle_result.Text,sle_key.text,sle_iv.text,Enums.CRYPTO_SYMCRYPT_TYPE_3DES,Enums.CRYPTO_SYMCRYPT_MODE_CBC)
end event

type cb_22 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 60
integer y = 1657
integer width = 627
integer height = 133
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "GenRandomBlob"
end type

event clicked;mle_result.Text = _crypto.BlobToString(_crypto.GenRandomBlob(10),Enums.CRYPTO_ENCODING_HEX)
end event

type cb_23 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 708
integer y = 1657
integer width = 690
integer height = 133
integer taborder = 30
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "GenRandomString"
end type

event clicked;mle_result.Text = _crypto.GenRandomString(50,Enums.CRYPTO_RNDSTRING_NUMBER + Enums.CRYPTO_RNDSTRING_ALPHABET + Enums.CRYPTO_RNDSTRING_SYMBOL)
end event

type cb_24 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 1421
integer y = 1657
integer width = 627
integer height = 133
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "GenGuid"
end type

event clicked;mle_result.Text = _crypto.GenGuid(Enums.CRYPTO_GUID_INCLUDE_BRACKET + Enums.CRYPTO_GUID_INCLUDE_SEPARATOR)
end event

type cb_25 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 2072
integer y = 1657
integer width = 627
integer height = 133
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "GenRSAKey"
end type

event clicked;string ls_priKey,ls_pubKey

_crypto.GenRSAKey(1024,ref ls_priKey,ref ls_pubKey,true)

mle_result.Text = "PRIVATE:~r~n" + ls_priKey + "~r~nPUBLIC:~r~n" + ls_pubKey
end event

type cb_28 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 593
integer y = 1369
integer width = 530
integer height = 133
integer taborder = 20
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "RSADecrypt"
end type

event clicked;string ls_priKey

ls_priKey = "MIICXAIBAAKBgQCgnOQVGoJSzNvq3o9uBAUtHcorQxXwq/zKUN4uBwiz3riOYJv+ULKgymXzOxWI30D1VNo77IHBx12kTgPq1fOem6TFAIJATu/Ds7LxyvOQR+/Yyk0kJYAK8ZPXgXrwGIDDEEkiF8RhpyuzkqdQ7DJwa5WWOp4KeJip9wxhQ/JilQIDAQABAoGAIGTEU8VO96g9yrcssoG5EYpqliMnr6zghWWeCiZ9CNoo2v59N+PKw0dPHKmUBFES5uhAQ8nFufGd31+kxp50Tf0QBntcOli3TVjLlUViF1LbaTHEKtWmqnMEjqJhqSVVxpVC1S9dcMBEjrtXtMbcJbfuA2BMIXRotAgmDUG9otkCQQDZ/Jte8jU/nR8Oci8a3Ith6RNZW8SDckrI3tGJcvHWxB57yHwhq9jgPvNRcen4spnGcViu92o8ph1aCQmh8kdLAkEAvJ79wZUzXWF6Oo8BCFc6aXqgdxNLOSFPVHVPlgabnjfmQTHaP/OUK7oQ8RiUuZx9vyNS/6wDz8HjtkRGFwBxnwJBAKPXE0h3r8ISbEdFV1ZPMYvzzRE6wicx/jegEcnHVTHg0jCjbXk5WpaheexbPEoqox3eD5Pibj0LdcA4Tr8kBKUCQCN7JPDNSCRAueVaES+oeOxujNDZaEUO5wVUK+xkwdE5Yq7Q2eU9xJmVHqq7nP5tWZoi4vIFQZJLPrKClUyuYLECQB+UVObFNMWcfQ+W5btjqJQllBMvN0b7LbAdTBtkO4G4wVYLPuKo4D5alk5t42LfSFjdUbPDyGX+YKQbRvWfpnc="

mle_result.Text = _crypto.RSADecrypt(mle_result.Text,ls_priKey)
end event

type cb_29 from se_cst_button within u_cst_tabpage_utility_crypto
integer x = 60
integer y = 1369
integer width = 499
integer height = 133
integer taborder = 10
integer weight = 400
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "RSAEncrypt"
end type

event clicked;/*
* 默认填充模式为RSA_PKCS1_PADDING,明文大小至少要比KEY模长小11个字节
* RSA_PKCS1_OAEP_PADDING模式明文大小至少要比KEY模长小41个字节
* 不支持RSA_NO_PADDING!
*/
string ls_pubKey

ls_pubKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCgnOQVGoJSzNvq3o9uBAUtHcorQxXwq/zKUN4uBwiz3riOYJv+ULKgymXzOxWI30D1VNo77IHBx12kTgPq1fOem6TFAIJATu/Ds7LxyvOQR+/Yyk0kJYAK8ZPXgXrwGIDDEEkiF8RhpyuzkqdQ7DJwa5WWOp4KeJip9wxhQ/JilQIDAQAB"

mle_result.Text = _crypto.RSAEncrypt(mle_result.Text,ls_pubKey)
end event

type mle_result from se_cst_multilineedit within u_cst_tabpage_utility_crypto
integer x = 24
integer y = 1861
integer width = 3717
integer height = 608
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
string text = "PowerFramework"
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
end type

