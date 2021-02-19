Class IHE.Test.H07.H0706Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H07.H0706Rt).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.QueryID = "查询标识符"
	s msg.OutPatientID = "门急诊号"
	s msg.VisitNum = "123"
	s msg.AdmID = "就诊流水号"
	s msg.EncounterStartTime = "就诊时间上限"
	s msg.EncounterEndTime = "就诊时间下限"
	s msg.PatientID = "PatientID"
	s msg.IDCardNo = "患者身份证号"
	s msg.DeptCode = "科室标识符"
	s msg.ServiceOrganCode = "组织机构标识"
	s msg.AdmTypeCode = "就诊类型代码"
	s msg.AdmTypeName = "就诊类型描述"
	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
