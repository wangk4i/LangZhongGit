Class IHE.Test.H09.H0901Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H09.H0901Rt).%New()
	b
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ExamAppInfoID = "电子申请单ID"
    s msg.ExamAppInfoContent = "申请单描述内容"
    s msg.ExamAppInfoStatus = "申请单状态"
    s msg.EffectiveTimeLow = "申请单有效日期上限"
    s msg.EffectiveTimeHigh = "申请单有效日期下限"
    s msg.PriorityCode = "优先级别代码"
    s msg.PriorityName = "优先级别名称"
    s msg.SpecimenID = "标本ID"
    s msg.SpecimenTypeCode = "标本类别代码"
    s msg.SpecimenTypeName = "标本类别名称"
    s msg.AuthorTime = "开单日期时间"
    s msg.AuthorSignatureText = "开立者签名"
    s msg.AuthorID = "开立者ID "
    s msg.AuthorName = "开立者姓名"
    s msg.AuthorDeptCode = "开立科室代码"
    s msg.AuthorDeptName = "开立科室名称"
    s msg.AuditTime = "审核日期时间"
    s msg.AuditUserWorkNo = "审核者工号"
    s msg.AuditUserName = "审核者姓名"
    
    s item1 = ##class(IHE.Msg.H09.ExamItem).%New()
    s item1.OrderID = "医嘱ID"
    s item1.ExamItemCode = "检验项目编码"
    s item1.ExamItemName = "检验项目名称"
    s item1.ExamFunctionCode = "检验方法代码"
    s item1.ExamFunctionName = "检验方法名称"
    s item1.ServiceTime = "执行日期时间"
    s item1.ServiceDeptCode = "执行科室代码"
    s item1.ServiceDeptName = "执行科室名称"
    d msg.Component2.Insert(item1)
    d msg.Component2.Insert(item1)
    d msg.Component2.Insert(item1)
    
    s msg.Notices = "注意事项"
    s msg.OutpatientId = "门急诊号"
    s msg.HospitalizationId = "住院号"
    s msg.AdmTypeCode = "就诊类别代码"
    s msg.AdmTypeName = "就诊类别名称"
    s msg.PatientID = "患者ID"
    s msg.IDCardNo = "患者身份证号"
    s msg.MedicalInsuranceCard = "患者医保卡号"
    s msg.PatientName = "患者姓名"
    s msg.PatientTelecom = "患者电话"
    s msg.PatientGenderCode = "性别代码"
    s msg.GenderName = "性别名称"
    s msg.PatientBirthTime = "出生日期"
    s msg.PatientAge = "年龄"
    s msg.PatientAddr = "地址"
    s msg.BedCode = "病床编码"
    s msg.BedNumber = "病床号"
    s msg.RoomCode = "病房编号"
    s msg.RoomNumber = "病房号"
    s msg.DeptCode = "科室代码"
    s msg.DeptName = "科室名称"
    s msg.InpatientAreaId = "病区代码"
    s msg.InpatientAreaName = "病区名称"
    s msg.PertinentInformation1 = "诊断节点"
    s msg.DiagnosisTypeCode = "诊断类别编码"
    s msg.DiagnosisTypeName = "诊断类别名称"
    s msg.DiagnosisTime = "诊断时间"
    s msg.DiseaseCode = "疾病编码"
    s msg.DiseaseName = "疾病名称"
	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
