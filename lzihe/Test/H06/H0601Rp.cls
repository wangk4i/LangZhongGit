Class IHE.Test.H06.H0601Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H06.H0601Rp).%New()
    
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
