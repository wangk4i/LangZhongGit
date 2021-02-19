Class IHE.Test.H08.H0802Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H08.H0802Rp).%New()
    
	s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ResultCode = "AA"
    s msg.RequestMsgID = "请求消息ID"
    s msg.ResultDesc = "处理结果说明"

	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
