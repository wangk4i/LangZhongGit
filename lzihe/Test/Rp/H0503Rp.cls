Class IHE.Test.Rp.H0503Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H05.H0503Rp).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.ResultCode = "处理结果，AA表示成功，AE表示失败"
	s msg.RequestMsgID = "请求消息ID"
	s msg.ResultDesc = "处理结果说明"
	s msg.TermSetCode = "值集标识符"
	s msg.TermSetValue = "值集描述"
	s msg.TermSetStatus = "值集状态代码"
	s msg.TermSetVersionCode = "值集版本代码"
	s msg.TermSetVersionValue = "值集版本描述"
	s msg.TermCode = "值集项目代码"
	s msg.TermValue = "值集项目描述"
	s msg.TermStatus = "值集项目状态代码"
	s msg.QueryID = "查询ID"
	s msg.QueryResponseCode = "查询响应代码"
	s msg.TotalNum = "查询结果数量"

	d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
