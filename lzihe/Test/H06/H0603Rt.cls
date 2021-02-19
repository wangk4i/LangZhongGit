Class IHE.Test.H06.H0603Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H06.H0603Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.QueryId = "查询ID"
	s msg.DocumentTypeCode = "文档类型代码"
	s msg.DocumentTypeCodeName = "文档类型描述"
	s msg.DocumentId = "文档流水号"
	s msg.HospitalizationId = "住院号"
	s msg.OutpatientId = "门诊号"
	s msg.PatientID = "PatientID"
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
    
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
