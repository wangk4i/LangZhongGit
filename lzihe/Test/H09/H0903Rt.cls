Class IHE.Test.H09.H0903Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H09.H0903Rt).%New()
	
	s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ExamAppInfoID = "申请单ID"
    s msg.OutpatientId = "门急诊号"
    s msg.HospitalizationId = "住院号"
    s msg.SpecimenID = "标本ID"
    s msg.AuthorID = "申请单开立者工号"
    s msg.EffectiveTimeLow = "申请单有效期（低值)"
    s msg.EffectiveTimeHigh = "申请单有效期（高值)"
    s msg.IDCardNo = "患者身份证号"
    s msg.MedicalInsuranceCard = "患者医保卡号"
    s msg.PatientID = "患者ID"
    s msg.ExamStatus = "检验状态"

	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
