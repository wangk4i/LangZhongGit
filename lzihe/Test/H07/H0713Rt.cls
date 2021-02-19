Class IHE.Test.H07.H0713Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H07.H0713Rt).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.HospitalizationId = "住院号"
	s msg.VisitNum = "123"
	s msg.AdmID = "就诊流水号"
	s msg.AdmTypeCode = "就诊类别代码"
	s msg.AdmTypeName = "就诊类别描述"
	s msg.DischargeTime = "出院日期时间"
	s msg.StayLength = "住院天数"
	s msg.PatientID = "PatientID"
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
	s msg.RegisterPersonWokrNo = "登记人职工号"
	s msg.RegisterPersonName = "登记人姓名"
	s msg.WesternDiagCode = "西医诊断代码"
	s msg.WesternDiagValue = "西医诊断描述"
	s msg.WesternDiagPersonCode = "西医诊断人工号"
	s msg.ChineseDiagCode = "中医诊断代码"
	s msg.ChineseDiagValue = "中医诊断名称"
	s msg.ChineseDiagPersonCode = "中医诊断人工号"
	s msg.AssignedDeptCode = "科室标识"
	s msg.AssignedDeptName = "科室描述"
	s msg.InPatientAreaCode = "病区标识符"
	s msg.InPatientAreaName = "病区名称"

	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
