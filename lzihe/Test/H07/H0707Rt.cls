Class IHE.Test.H07.H0707Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H07.H0707Rt).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.HospitalizationId = "住院号"
	s msg.VisitNum = "123"
	s msg.AdmID = "就诊流水号"
	s msg.AdmTypeCode = "就诊类别代码"
	s msg.AdmTypeName = "患者就诊类别描述"
	s msg.EncounterTime = "入院日期"
	s msg.EncounterReasonDesc = "就诊原因描述"
	s msg.BeneficiaryCode = "医疗保险类别代码"
	s msg.BeneficiaryValue = "医疗保险类别描述"
	s msg.InPatientNum = "住院次数"
	s msg.PatientID = "PatientID"
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
	s msg.AssignedPersonCode = "医生的职工号"
	s msg.AssignedPersonName = "责任医生姓名"
	s msg.DeptCode = "科室标识"
	s msg.DeptName = "科室名称"
	s msg.InPatientAreaCode = "病区号标识"
	s msg.InPatientAreaName = "病区名称"
	s msg.InPatientRoomCode = "病房号标识"
	s msg.InPatientRoomName = "病房名称"
	s msg.InPatientBedCode = "病床号标识"
	s msg.InPatientBedName = "病床名称"
	s msg.ServiceOrganCode = "服务机构代码"
	
	s item1 = ##class(IHE.Msg.H07.WesternReasonInfo).%New()
	s item1.WesternDiagCode = "西医诊断代码"
	s item1.WesternDiagValue = "西医诊断名称"
	s item1.WesternDiagPersonCode = "西医诊断人工号"
	d msg.WesternReason.Insert(item1)
	d msg.WesternReason.Insert(item1)
	d msg.WesternReason.Insert(item1)
	
	s item2 = ##class(IHE.Msg.H07.ChineseReasonInfo).%New()
	s item2.ChineseDiagCode = "中医诊断代码"
	s item2.ChineseDiagValue = "中医诊断名称"
	s item2.ChineseDiagPersonCode = "中医诊断人工号"
	d msg.ChineseReason.Insert(item2)
	d msg.ChineseReason.Insert(item2)
	d msg.ChineseReason.Insert(item2)

	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
