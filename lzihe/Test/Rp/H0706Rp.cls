Class IHE.Test.Rp.H0706Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H07.H0706Rp).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.ResultCode = "处理结果，AA表示成功，AE表示失败"
	s msg.RequestMsgID = "请求消息ID"
	s msg.ResultDesc = "处理结果说明"
	s msg.OutPatientID = "门急诊号"
	s msg.VisitNum = "就诊次数"
	s msg.AdmID = "就诊流水号"
	s msg.AdmTypeCode = "就诊类别代码"
	s msg.AdmTypeName = "就诊类别描述"
	s msg.EncounterTime = "就诊日期时间"
	s msg.PatientID = "PatientID"
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
	s msg.AssignedPersonCode = "责任医师工号"
	s msg.AssignedPersonName = "责任医师姓名"
	s msg.DeptCode = "科室标识"
	s msg.DeptName = "科室名称"
	s msg.ServiceOrganCode = "服务机构的标识"
	s msg.QueryID = "查询标识"
	s msg.ResponseCode = "查询响应代码"
	s msg.TotalNum = "查询结果数量"

	d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
