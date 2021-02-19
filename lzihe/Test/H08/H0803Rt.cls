Class IHE.Test.H08.H0803Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H08.H0803Rt).%New()
    
    s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.OrderId = "医嘱ID"
	s msg.AuthorWorkNo = "医嘱开立者ID(医务人员工号)"
	s msg.OrderTimeLow = "医嘱有效期间（低值）"
	s msg.OrderTimeHigh = "医嘱有效期间（高值）"
	s msg.PatientID = "患者ID"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
