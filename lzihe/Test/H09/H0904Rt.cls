Class IHE.Test.H09.H0904Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H09.H0904Rt).%New()
	
	s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ReceiverID = "接收者ID"
    s msg.SenderID = "发送者ID"
    s msg.AppInfoID = "申请单编号"
    s msg.EffectiveTimeLow = "申请单有效日期上限"
    s msg.EffectiveTimeHigh = "申请单有效日期下限"
    s msg.PriorityCode = "优先级别代码"
    s msg.PriorityName = "优先级别名称"
    s msg.AuthorTime = "开单日期时间"
    s msg.AuthorID = "开单医师工号"
    s msg.AuthorName = "开单医师姓名"
    s msg.AuthorDeptCode = "申请科室编码"
    s msg.AuthorDeptName = "申请科室名称"
    s msg.AuditTime = "审核日期时间"
    s msg.AuditUserWorkNo = "审核者工号"
    s msg.AuditUserName = "审核者姓名"
    
    s item = ##class(IHE.Msg.H09.Item).%New()
    s item.OrderID = "医嘱ID"
    s item.ItemCode = "检查类项目编码"
    s item.ItemName = "检查项目名称"
    s item.ItemFunctionCode = "检查方式编码"
    s item.ItemFunctionName = "检查方式名称"
    s item.ItemTypeCode = "检查类型编码"
    s item.ItemTypeName = "检查类型名称"
    s item.ItemPartCode = "检查部位编码"
    s item.ItemPartName = "检查部位名称"
    s item.ServiceTime = "执行时间"
    s item.ServiceDeptCode = "执行科室编码"
    s item.ServiceDeptName = "执行科室名称"
    d msg.Component2.Insert(item)
    d msg.Component2.Insert(item)
    d msg.Component2.Insert(item)
    
    s msg.Notices = "注意事项"
    s msg.VisitNum = "999"
    s msg.AdmID = "就诊流水号"
    s msg.AdmTypeCode = "就诊类别编码"
    s msg.AdmTypeName = "就诊类别名称"
    s msg.DomainId = "域ID"
    s msg.PatientID = "患者ID"
    s msg.OutpatientId = "门（急）诊号标识"
    s msg.HospitalizationId = "住院号标识"
    s msg.IDCardNo = "患者身份证号"
    s msg.MedicalInsuranceCard = "医保卡号"
    s msg.PatientName = "患者姓名"
    s msg.PatientTelecom = "患者电话"
    s msg.PatientGenderCode = "性别代码"
    s msg.BirthTime = "出生日期"
    s msg.PatientAge = "年龄"
    s msg.PatientAddr = "地址"
    s msg.BedCode = "病床编码"
    s msg.BedNumber = "病床号"
    s msg.RoomCode = "病房编号"
    s msg.RoomNumber = "病房号"
    s msg.DeptCode = "科室编码"
    s msg.DeptName = "科室名称"
    s msg.InpatientAreaId = "病区编码"
    s msg.InpatientAreaName = "病区名称"
    s msg.PertinentInformation1 = "诊断根节点"
    s msg.DiagnosisTypeCode = "诊断类别编码"
    s msg.DiagnosisTypeName = "诊断类别名称"
    s msg.DiseaseCode = "疾病编码"
    s msg.DiseaseName = "疾病名称"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
