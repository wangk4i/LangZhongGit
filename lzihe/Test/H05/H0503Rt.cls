Class IHE.Test.H05.H0503Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H05.H0503Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.QueryID = "查询ID"
	s msg.TermSetCode = "值集代码"
	s msg.TermSetVersionCode = "值集版本"
	s msg.TermCode = "值集项目代码"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
