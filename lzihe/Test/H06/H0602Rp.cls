Class IHE.Test.H06.H0602Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H06.H0602Rp).%New()
    
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ResultCode = "AA"
    s msg.RequestMsgID = "请求消息标ID"
    s msg.ResultDesc = "处理结果说明"
    
    s item = ##class(IHE.Msg.H06.DocumentAccessItem).%New()
    
    s item.DocumentId = "文档流水号"
    s item.DocumentTypeCode = "文档类型代码"
    s item.DocumentTypeCodeName = "文档类型描述"
    s item.EffectiveTime = "文档生成的日期时间"
    s item.ConfidentialityCode = "文档保密级别代码"
    s item.ConfidentialityCodeName = "文档保密级别描述"
    s item.VersionNumber = "文档版本号"
    s item.PatientID = "PatientID"
    s item.InID = "住院号标识"
    s item.OutpatientId = "门诊号标识"
    s item.PatientEffectiveTime = "患者就诊日期时间"
    s item.IDCardNo = "患者身份证号"
    s item.PatientName = "患者姓名"
    s item.ProviderOrganizationId = "医院代码"
    s item.ProviderOrganizationName = "医院名称"
    s item.DeptCode = "科室代码"
    s item.AssignedAuthorWorkNo = "文档创建者工号"
    s item.AssignedAuthorName = "文档创建者姓名"
    s item.RepresentedOrganizationCode = "文档保管单位代码"
    s item.RepresentedOrganizationName = "文档保管单位名称"
    
    d msg.Subject.Insert(item)
    d msg.Subject.Insert(item)
    d msg.Subject.Insert(item)
    
    s msg.QueryID = "查询标识"
    s msg.ResponseCode = "查询响应代码"
    s msg.TotalNum = "查询结果数量"

	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
