Class IHE.Test.Rp.H0709Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H07.H0709Rp).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "文档创建时间"
	s msg.ResultCode = "处理结果，AA表示成功，AE表示失败"
	s msg.RequestMsgID = "请求消息ID"
	s msg.ResultDesc = "处理结果说明"
	s msg.HospitalizationId = "住院号"
	
	s msg.VisitNum = "就诊次数"
	s msg.AdmID = "就诊流水号"
	s msg.AdmTypeCode = "就诊类别代码"
	s msg.AdmTypeName = "就诊类别描述"
	s msg.EncounterTime = "入院日期"
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
	s msg.WesternDiagCode = "西医诊断代码"
	s msg.WesternDiagValue = "西医诊断名称"
	s msg.WesternDiagPersonCode = "西医诊断人工号"
	s msg.ChineseDiagCode = "中医诊断代码"
	s msg.ChineseDiagValue = "中医诊断名称"
	s msg.ChineseDiagPersonCode = "中医诊断人工号"
	s msg.QueryID = "查询标识"
	s msg.ResponseCode = "查询响应代码"
	s msg.TotalNum = "查询结果数量"

	d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
