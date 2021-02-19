Class IHE.Test.H05.H0502Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H05.H0502Rt).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.TermSetCode = "值集标识符"
	s msg.TermSetValue = "值集描述"
	s msg.TermSetStatus = "值集状态代码"
	s msg.TermSetVersionCode = "值集版本代码"
	s msg.TermSetVersionValue = "值集版本描述"
	s msg.TermCode = "值集项目代码"
	s msg.TermValue = "值集项目描述"
	s msg.TermStatus = "值集项目状态代码"
	s msg.AssignedPersonCode = "注册者工号"
	s msg.AssignedPersonName = "注册者姓名"

	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
