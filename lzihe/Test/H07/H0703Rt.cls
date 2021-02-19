Class IHE.Test.H07.H0703Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H07.H0703Rt).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.QueryID = "查询标识符"
	s msg.EncounterCardID = "123"
	s msg.GenderCode = "患者性别代码"
	s msg.GenderName = "患者性别描述"
	s msg.IDCardNo = "身份证号"
	s msg.PatientName = "患者姓名"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
