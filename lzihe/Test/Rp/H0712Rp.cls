Class IHE.Test.Rp.H0712Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H07.H0712Rp).%New()
	
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
	s msg.EncounterTime = "就诊日期时间"
	s msg.PatientID = "PatientID"
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
	s msg.AssignedPersonCode = "责任医师工号"
	s msg.AssignedPersonName = "责任医师姓名"
	s msg.TransOutTime = "转出日期时间"
	s msg.TransOutDeptCode = "转出科室标识"
	s msg.TransOutDeptName = "转出科室名称"
	s msg.TransOutAreaCode = "转出病区标识"
	s msg.TransOutAreaName = "转出病区描述"
	s msg.TransOutRoomCode = "转出病房标识"
	s msg.TransOutRoomName = "转出病房描述"
	s msg.TransOutBedCode = "转出病床标识"
	s msg.TransOutBedName = "转出病床描述"
	s msg.TransInTime = "转入日期时间"
	s msg.TransInDeptCode = "转入科室标识"
	s msg.TransInDeptName = "转入科室名称"
	s msg.TransInAreaCode = "转入病区标识"
	s msg.TransInAreaName = "转入病区描述"
	s msg.TransInRoomCode = "转入病房标识"
	s msg.TransInRoomName = "转入病房描述"
	s msg.TransInBedCode = "转入病床标识"
	s msg.TransInBedName = "转入病床描述"
	s msg.QueryID = "查询标识"
	s msg.ResponseCode = "查询响应代码"
	s msg.TotalNum = "查询结果数量"

	d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
