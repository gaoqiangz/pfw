$PBExportHeader$n_crypto.sru
$PBExportComments$PowerBuilder Extension~r~nBy gaoqiangz@msn.com
forward
global type n_crypto from nonvisualobject
end type
end forward

global type n_crypto from nonvisualobject native "pfw.dll"
public function string Copyright()
public function string GetVersion()
public function blob StringToBlob(readonly string data,readonly long encoding)
public function string BlobToString(readonly blob data,readonly long encoding)
public function boolean BlobReverse(ref blob data)
public function blob GenRandomBlob(readonly ulong size)
public function string GenRandomString(readonly ulong size)
public function string GenRandomString(readonly ulong size,readonly ulong flags)
public function string GenGUID()
public function string GenGUID(readonly ulong flags)
public function boolean GenRSAKey(readonly uint bits,ref string prikey,ref string pubkey)
public function boolean GenRSAKey(readonly uint bits,ref string prikey,ref string pubkey,readonly boolean pemformat)
public function string Hash(readonly string data,readonly long ntype)
public function string Hash(readonly blob data,readonly long ntype)
public function string Hash(readonly string data,readonly string key,readonly long ntype)
public function string Hash(readonly string data,readonly blob key,readonly long ntype)
public function string Hash(readonly blob data,readonly string key,readonly long ntype)
public function string Hash(readonly blob data,readonly blob key,readonly long ntype)
public function string HashFile(readonly string filename,readonly long ntype)
public function string HashFile(readonly string filename,readonly string key,readonly long ntype)
public function string HashFile(readonly string filename,readonly blob key,readonly long ntype)
public function string SymEncrypt(readonly string plain,readonly string key,readonly uint ntype)
public function string SymEncrypt(readonly string plain,readonly string key,readonly uint ntype,readonly long mode)
public function string SymEncrypt(readonly string plain,readonly string key,readonly string iv,readonly uint ntype)
public function string SymEncrypt(readonly string plain,readonly string key,readonly string iv,readonly uint ntype,readonly long mode)
public function string SymEncrypt(readonly string plain,readonly blob key,readonly uint ntype)
public function string SymEncrypt(readonly string plain,readonly blob key,readonly uint ntype,readonly long mode)
public function string SymEncrypt(readonly string plain,readonly blob key,readonly blob iv,readonly uint ntype)
public function string SymEncrypt(readonly string plain,readonly blob key,readonly blob iv,readonly uint ntype,readonly long mode)
public function blob SymEncrypt(readonly blob plain,readonly string key,readonly uint ntype)
public function blob SymEncrypt(readonly blob plain,readonly string key,readonly uint ntype,readonly long mode)
public function blob SymEncrypt(readonly blob plain,readonly string key,readonly string iv,readonly uint ntype)
public function blob SymEncrypt(readonly blob plain,readonly string key,readonly string iv,readonly uint ntype,readonly long mode)
public function blob SymEncrypt(readonly blob plain,readonly blob key,readonly uint ntype)
public function blob SymEncrypt(readonly blob plain,readonly blob key,readonly uint ntype,readonly long mode)
public function blob SymEncrypt(readonly blob plain,readonly blob key,readonly blob iv,readonly uint ntype)
public function blob SymEncrypt(readonly blob plain,readonly blob key,readonly blob iv,readonly uint ntype,readonly long mode)
public function string SymDecrypt(readonly string cipher,readonly string key,readonly uint ntype)
public function string SymDecrypt(readonly string cipher,readonly string key,readonly uint ntype,readonly long mode)
public function string SymDecrypt(readonly string cipher,readonly string key,readonly string iv,readonly uint ntype)
public function string SymDecrypt(readonly string cipher,readonly string key,readonly string iv,readonly uint ntype,readonly long mode)
public function string SymDecrypt(readonly string cipher,readonly blob key,readonly uint ntype)
public function string SymDecrypt(readonly string cipher,readonly blob key,readonly uint ntype,readonly long mode)
public function string SymDecrypt(readonly string cipher,readonly blob key,readonly blob iv,readonly uint ntype)
public function string SymDecrypt(readonly string cipher,readonly blob key,readonly blob iv,readonly uint ntype,readonly long mode)
public function blob SymDecrypt(readonly blob cipher,readonly string key,readonly uint ntype)
public function blob SymDecrypt(readonly blob cipher,readonly string key,readonly uint ntype,readonly long mode)
public function blob SymDecrypt(readonly blob cipher,readonly string key,readonly string iv,readonly uint ntype)
public function blob SymDecrypt(readonly blob cipher,readonly string key,readonly string iv,readonly uint ntype,readonly long mode)
public function blob SymDecrypt(readonly blob cipher,readonly blob key,readonly uint ntype)
public function blob SymDecrypt(readonly blob cipher,readonly blob key,readonly uint ntype,readonly long mode)
public function blob SymDecrypt(readonly blob cipher,readonly blob key,readonly blob iv,readonly uint ntype)
public function blob SymDecrypt(readonly blob cipher,readonly blob key,readonly blob iv,readonly uint ntype,readonly long mode)
public function string RSAEncrypt(readonly string plain,readonly string pubkey)
public function string RSAEncrypt(readonly string plain,readonly string pubkey,readonly long padding)
public function blob RSAEncrypt(readonly blob plain,readonly string pubkey)
public function blob RSAEncrypt(readonly blob plain,readonly string pubkey,readonly long padding)
public function string RSADecrypt(readonly string cipher,readonly string prikey)
public function string RSADecrypt(readonly string cipher,readonly string prikey,readonly long padding)
public function blob RSADecrypt(readonly blob cipher,readonly string prikey)
public function blob RSADecrypt(readonly blob cipher,readonly string prikey,readonly long padding)
public function string RSASign(readonly string data,readonly string prikey,readonly long ntype)
public function blob RSASign(readonly blob data,readonly string prikey,readonly long ntype)
public function boolean VerifyRSASign(readonly string data,readonly string sign,readonly string pubkey,readonly long ntype)
public function boolean VerifyRSASign(readonly blob data,readonly blob sign,readonly string pubkey,readonly long ntype)
end type
global n_crypto n_crypto

on n_crypto.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_crypto.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

