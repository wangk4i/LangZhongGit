Class IHE.Test.H06.H0601Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H06.H0601Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.DocumentId = "文档流水号"
	s msg.DocumentTypeCode = "文档类型代码"
	s msg.DocumentTypeCodeName = "文档类型描述"
	s msg.EffectiveTime = "文档生成的日期时间"
	s msg.ConfidentialityCode = "文档保密级别代码"
	s msg.ConfidentialityCodeName = "文档保密级别描述"
	s msg.VersionNumber = "文档版本号"
	s msg.OriginalText = "经base64编码的文档原始内容"
	s msg.PatientID = "PatientID"
	s msg.HospitalizationId = "住院号标识"
	s msg.OutpatientId = "门诊号标识"
	s msg.PatientEffectiveTime = "患者就诊日期时间"
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
	s msg.ProviderOrganizationId = "医院代码"
	s msg.ProviderOrganizationName = "医院名称"
	s msg.DeptCode = "科室代码"
	s msg.AssignedAuthorWorkNo = "文档创建者工号"
	s msg.AssignedAuthorName = "文档创建者姓名"
	s msg.RepresentedOrganizationCode = "文档保管单位代码"
	s msg.RepresentedOrganizationName = "文档保管单位名称"
    
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
