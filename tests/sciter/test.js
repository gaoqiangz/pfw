function msgbox(title,text)
{
	pb.MsgBox(title,text);
}
function add(a,b)
{
	var rv= a + b;
	console.log(rv);
	return rv;
}
function test(btn)
{
	console.log(`button text:${btn["text"]}`);
}
function setTitle(title)
{
	pb.host.Title = title;
	console.log(`new title:${host.Title}`);
}