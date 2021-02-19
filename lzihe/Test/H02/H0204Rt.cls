Class IHE.Test.H02.H0204Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H02.H0204Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.QueryID = "查询ID"
	s msg.MatchDegree = "匹配度"
	s msg.PatientID = "PatientID"
	s msg.GenderCode = "患者性别代码"
	s msg.GenderName = "患者性别名称"
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
