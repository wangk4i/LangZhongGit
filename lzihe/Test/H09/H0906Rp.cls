Class IHE.Test.H09.H0906Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H09.H0906Rp).%New()
    
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ReceiverID = "接收者ID"
    s msg.SenderID = "发送者ID"
    s msg.RequestMsgID = "请求消息ID"
    s msg.ResultDesc = "处理结果说明"
    
    s item = ##class(IHE.Msg.H09.CheckAppInfoItem).%New()
    s item.AppInfoID = "电子申请单编号"
    s item.EffectiveTimeHigh = "申请单有效日期上限"
    s item.EffectiveTimeLow = "申请单有效日期下限"
    s item.PriorityCode = "优先级别代码"
    s item.PriorityName = "优先级别名称"
    s item.AuthorTime = "开单日期时间"
    s item.AuthorID = "开单医师工号"
    s item.AuthorName = "开单医师姓名"
    s item.AuthorDeptCode = "申请科室编码"
    s item.AuthorDeptName = "申请科室名称"
    s item.AuditTime = "审核日期时间"
    s item.AuditUserWorkNo = "审核者工号"
    s item.AuditUserName = "审核人姓名"
    
    s item1 = ##class(IHE.Msg.H09.Item).%New()
    s item1.OrderID = "医嘱ID"
    s item1.ItemCode = "检查类项目编码"
    s item1.ItemName = "检查项目名称"
    s item1.ItemFunctionCode = "检查方式编码"
    s item1.ItemFunctionName = "检查方式名称"
    s item1.ItemTypeCode = "检查类型编码"
    s item1.ItemTypeName = "检查类型名称"
    s item1.ItemPartCode = "检查部位编码"
    s item1.ItemPartName = "检查部位名称"
    s item1.ServiceTime = "执行时间"
    s item1.ServiceDeptCode = "执行科室编码"
    s item1.ServiceDeptName = "执行科室名称"
    
    d item.Component2.Insert(item1)
    d item.Component2.Insert(item1)
    d item.Component2.Insert(item1)
    
    s item.Notices = "注意事项"
    s item.VisitNum = "就诊次数"
    s item.AdmID = "就诊流水号"
    s item.AdmTypeCode = "就诊类别编码"
    s item.AdmTypeName = "就诊类别名称"
    s item.DomainId = "域ID"
    s item.PatientID = "患者ID"
    s item.OutpatientId = "门（急）诊号"
    s item.HospitalizationId = "住院号标识"
    s item.IDCardNo = "患者身份证号"
    s item.MedicalInsuranceCard = "医保卡号"
    s item.PatientName = "患者姓名"
    s item.PatientTelecom = "患者电话"
    s item.PatientGenderCode = "性别代码"
    s item.BirthTime = "出生日期"
    s item.PatientAge = "年龄"
    s item.PatientAddr = "地址"
    s item.BedCode = "病床编码"
    s item.BedNumber = "病床号"
    s item.RoomCode = "病房编号"
    s item.RoomNumber = "病房号"
    s item.DeptCode = "科室编码"
    s item.DeptName = "科室名称"
    s item.InpatientAreaId = "病区编码"
    s item.InpatientAreaName = "病区名称"
    s item.PertinentInformation1 = "诊断根节点"
    s item.DiagnosisTypeCode = "诊断类别编码"
    s item.DiagnosisTypeName = "诊断类别名称"
    s item.DiseaseCode = "疾病编码"
    s item.DiseaseName = "疾病名称"
    
    d msg.Subject.Insert(item)
    d msg.Subject.Insert(item)
    d msg.Subject.Insert(item)
    
    s msg.ResponseCode = "查询结果代码"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
