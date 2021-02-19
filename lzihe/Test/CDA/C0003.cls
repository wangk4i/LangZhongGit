Class IHE.Test.CDA.C0003 Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.CDA.C0003).%New()

	s msg.DocID = "文档流水号标识"
    s msg.CreateTime = "文档机器生成时间"
    s msg.DocSetID = "文档集合编号"
    s msg.Version = "文档版本号"
    s msg.OutPatientID = "门（急）诊号"
    s msg.ApplyID = "电子申请单编号"
    
    s PatientInfo = ##class(IHE.Msg.CDA.Common.Patient).%New()
    s PatientInfo.IDCardNo = "患者身份证号"
    s PatientInfo.PatientName = "患者姓名"
    s PatientInfo.GenderCode = "患者性别代码"
    s PatientInfo.GenderName = "患者性别名称"
    s PatientInfo.BirthTime = "患者出生日期"
    s PatientInfo.Age = "患者年龄"
    s msg.PatientInfo = PatientInfo
    
    s msg.DeptCode = "科室标识"
    s msg.DeptName = "科室名称"
    s msg.OrganCode = "医疗机构标识"
    s msg.OrganName = "医疗机构名称"
    s msg.RecordTime = "记录日期时间"
    s msg.AuthorCode = "作者的唯一标识符"
    s msg.AuthorName = "就诊医生姓名"
    s msg.CustodianOrgCode = "文档保管的医疗结构标识"
    s msg.CustodianOrgName = "保管机构名称"
    s msg.ChargeDoctorCode = "医务人员标识"
    s msg.ChargeDoctorName = "责任医师姓名"
    s msg.ParentDocID = "父文档标识符"
    s msg.ParentSetID = "父文档集序列号"
    s msg.ParentVersionNum = "父文档版本号"
    
    s Allergies = ##class(IHE.Msg.CDA.C0003Allergies).%New()
    s Allergies.AllergiesValue = "过敏史标志值"
    s Allergies.AllergiesDesc = "过敏史详细描述"
    d msg.Allergies.Insert(Allergies)
    d msg.Allergies.Insert(Allergies)
    d msg.Allergies.Insert(Allergies)
    
    s msg.ChiefComplaintsDesc = "主诉描述"
    
    d msg.PresentIllnessDesc.Insert("现病史描述")
    d msg.PresentIllnessDesc.Insert("现病史描述")
    d msg.PresentIllnessDesc.Insert("现病史描述")
    
    d msg.PastIllnessDesc.Insert("既往史描述")
    d msg.PastIllnessDesc.Insert("既往史描述")
    d msg.PastIllnessDesc.Insert("既往史描述")
    
    s msg.PhysicalExamResult = "体格检查结果"
    s msg.AidedExamResult = "辅助检查结果"
    s msg.FirstVisitCode = "初诊标志代码"
    s msg.FirstVisitName = "初诊标志名称"
    s msg.ChineseDiagResult = "中医四诊观察结果"
    s msg.WesternDiagValue = "西医诊断名称值"
    s msg.WesternDiagCode = "西医诊断病名代码"
    s msg.WesternDiagName = "西医诊断病名名称"
    s msg.ChineseDiagValue = "中医病名名称值"
    s msg.ChineseDiagCode = "中医病名代码"
    s msg.ChineseDiagName = "中医病名名称"
    s msg.ChineseSymptomValue = "中医症候名称值"
    s msg.ChineseSymptomCode = "中医证候代码"
    s msg.ChineseSymptomName = "中医证候代码名称"
    s msg.DialecticalBasisDesc = "辩证依据描述"
    s msg.TreatmentPrincipleCode = "治则治法代码"
    s msg.OrderItemTypeCode = "医嘱项目类型代码"
    s msg.OrderItemTypeName = "医嘱项目类型名称"
    s msg.OrderTimeLow = "医嘱计划开始日期时间"
    s msg.OrderTimeHigh = "医嘱计划结束日期时间"
    s msg.OrderItemContent = "医嘱项目内容取值"
    s msg.OrderExcuteTime = "医嘱执行日期时间"
    s msg.OrderExcutePersonCode = "医嘱执行者编号"
    s msg.OrderExcutePersonName = "医嘱执行者签名"
    s msg.OrderExcuteDept = "医嘱执行科室"
    s msg.OrderCreateTime = "医嘱开立日期时间"
    s msg.OrderAuthorPersonCode = "医嘱开立者编号"
    s msg.OrderAuthorPersonName = "医嘱开立者签名"
    s msg.OrderAuthorDept = "医嘱开立科室"
    s msg.OrderAuditTime = "医嘱审核日期时间"
    s msg.OrderAuditPersonCode = "医嘱审核人编号"
    s msg.OrderAuditPersonName = "医嘱审核人签名"
    s msg.OrderCancelTime = "医嘱取消日期时间"
    s msg.OrderCancelPersonCode = "医嘱取消者编号"
    s msg.OrderCancelPersonName = "医嘱取消者签名"
    s msg.OrderNote = "医嘱备注信息"
    s msg.OrderExcuteStatus = "医嘱执行状态"
    
    s Operation = ##class(IHE.Msg.CDA.C0003Operation).%New()
    s Operation.OperationCode = "手术及操作代码"
    s Operation.OperationDesc = "手术名称"
    s Operation.OperationPartName = "手术及操作部位名称"
    s Operation.InterventionName = "介入物名称"
    s Operation.OperationWayDesc = "操作方法描述"
    s Operation.OperationTimes = "操作次数"
    d msg.Operation.Insert(Operation)
    d msg.Operation.Insert(Operation)
    d msg.Operation.Insert(Operation)
    
    s msg.RescueTimeLow = "抢救开始时间"
    s msg.RescueTimeHigh = "抢救结束时间"
    s msg.RescueDesc = "急救抢救记录描述"
    s msg.RescueDocList = "参加抢救人员名单"
    s msg.Subject1Code = "专业技术职务类别代码"
    s msg.TakeInTime = "收入观察日期时间"
    s msg.EmergencyObservationRecord = "急诊留观病程记录描述"
    s msg.Notices = "注意事项"
    s msg.PatientGoCode = "患者去向代码"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
