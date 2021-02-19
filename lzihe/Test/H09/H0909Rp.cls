Class IHE.Test.H09.H0909Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H09.H0909Rp).%New()
    
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ResultCode = "处理结果标识"
    s msg.RequestMsgID = "请求消息ID"
    s msg.ResultDesc = "处理结果说明"
    
    s item = ##class(IHE.Msg.H09.PathologyAppInfoItem).%New()
    s item.AppInfoID = "电子申请单编号"
    s item.AppInfoDetail = "申请单详细内容"
    s item.ItemAppTime = "检查申请日期"
    s item.ItemTypeCode = "检查类型编码"
    s item.ItemTypeName = "检查类型名称"
    s item.SpecimenNatural = "送检组织"
    s item.SpecimenNaturalNumber = "送检组织数量"
    s item.SpecimenNaturalUnit = "送检组织数量单位"
    
    s item1 = ##class(IHE.Msg.H09.DerivedSpecimen).%New()
    s item1.SpecimenID = "标本条码号"
    s item1.DerivedSpecimenPart = "取材部位"
    s item1.DerivedSpecimenNumber = "取材数量"
    s item1.DerivedSpecimenUnit = "取材数量单位"
    d item.DerivedSpecimen.Insert(item1)
    d item.DerivedSpecimen.Insert(item1)
    d item.DerivedSpecimen.Insert(item1)
    
    s item.Fixative = "固定液"
    s item.CaptureTime = "采集日期"
    s item.SubmitUserID = "送检医师ID"
    s item.SubmitUserName = "送检医师姓名"
    s item.AuthorTime = "开单时间"
    s item.AuthorID = "开单医生工号"
    s item.AuthorName = "开单医生姓名"
    s item.AuthorDeptCode = "申请科室编码"
    s item.AuthorDeptName = "申请科室名称"
    s item.ConfirmTime = "确认时间"
    s item.ConfirmUserID = "确认医生工号"
    s item.ConfirmUserName = "确认人姓名"
    s item.CaseSummary = "病历摘要及手术所见"
    
    s item2 = ##Class(IHE.Msg.H09.Item).%New()
    
    s item2.ItemCode = "检查项目编码"
    s item2.ItemName = "检查项目名称"
    s item2.ItemFunctionCode = "检查方法编码"
    s item2.ItemFunctionName = "检查方法名称"
    s item2.ItemPartCode = "检查部位编码"
    s item2.ItemPartName = "检查部位名称"
    s item2.ServiceTime = "执行时间"
    s item2.ServiceDeptCode = "执行科室编码"
    s item2.ServiceDeptName = "执行科室名称"
    d item.Component2.Insert(item2)
    d item.Component2.Insert(item2)
    d item.Component2.Insert(item2)
    
    s item.Notices = "注意事项"
    s item.VisitNum = "就诊次数"
    s item.AdmID = "就诊流水号"
    s item.AdmTypeCode = "就诊类别编码"
    s item.AdmTypeName = "就诊类别名称"
    s item.DomainId = "域ID"
    s item.PatientID = "患者ID"
    s item.OutpatientId = "门（急）诊号标识"
    s item.HospitalizationId = "住院号标识"
    s item.IDCardNo = "身份证号"
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
    s item.PertinentInformation1 = "诊断（检查申请原因）根节点"
    s item.DiagnosisTypeCode = "诊断类别编码"
    s item.DiagnosisTypeName = "诊断类别名称"
    s item.DiagnosisTime = "诊断日期"
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
