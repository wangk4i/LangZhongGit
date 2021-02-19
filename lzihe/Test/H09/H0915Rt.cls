Class IHE.Test.H09.H0915Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H09.H0915Rt).%New()
	
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.AppInfoID = "申请单编号"
    s msg.AuthorID = "申请单开立者工号"
    s msg.EffectiveTimeLow = "申请单有效期（低值)"
    s msg.EffectiveTimeHigh = "申请单有效期（高值)"
    s msg.PatientID = "患者ID"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
