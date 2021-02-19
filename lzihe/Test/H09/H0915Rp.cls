Class IHE.Test.H09.H0915Rp Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H09.H0915Rp).%New()
    
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ResultCode = "AA"
    s msg.RequestMsgID = "请求消息ID"
    s msg.ResultDesc = "处理结果说明"    
    
    s item = ##class(IHE.Msg.H09.OperationAppInfoItem).%New()
    s item.AppInfoID = "电子申请单编号"
    s item.AppTime = "申请日期"
    s item.AnaesthesiaTypeCode = "麻醉方式编码"
    s item.AnaesthesiaTypeName = "麻醉方式名称"
    s item.OperationTypeCode = "手术性质编码"
    s item.OperationTypeName = "手术性质名称"
    s item.AuthorID = "申请医师工号"
    s item.AuthorName = "申请医师姓名"
    s item.AuthorDeptCode = "申请科室编码"
    s item.AuthorDeptName = "申请科室名称"
    s item.AuditTime = "审核日期"
    s item.AuditUserWorkNo = "审核医师工号"
    s item.AuditUserName = "审核人姓名"
    
    s item1 = ##class(IHE.Msg.H09.OperationInfoItem).%New()
    s item1.OperationCode = "手术编码"
    s item1.OperationName = "手术名称"
    s item1.OperationLevelCode = "手术等级编码"
    s item1.OperationLevelTime = "手术等级名称"
    s item1.ReserveOperationTime = "预定手术时间"
    s item1.OperationDrID = "手术医师工号"
    s item1.OperationDrName = "手术医师名称"
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
    s item.SeenTime = "就诊（住院）日期"
    s item.DomainId = "域ID"
    s item.PatientID = "患者ID"
    s item.OutpatientId = "门（急）诊号标识"
    s item.HospitalizationId = "住院号"
    s item.IDCardNo = "患者身份证号"
    s item.MedicalInsuranceCard = "医保卡号"
    s item.PatientName = "患者姓名"
    s item.PatientTelecom = "患者电话"
    s item.PatientGenderCode = "性别代码"
    s item.GenderName = "性别名称"
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
    s item.Diagnosis = "诊断（手术申请原因）"
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
