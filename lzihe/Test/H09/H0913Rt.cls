Class IHE.Test.H09.H0913Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H09.H0913Rt).%New()
	
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ReceiverID = "接收者ID"
    s msg.SenderID = "发送者ID"
    s msg.AppInfoID = "申请单编号"
    s msg.AppTime = "申请日期"
    s msg.AnaesthesiaTypeCode = "麻醉方式编码"
    s msg.AnaesthesiaTypeName = "麻醉方式名称"
    s msg.OperationTypeCode = "手术性质编码"
    s msg.OperationTypeName = "手术性质名称"
    s msg.AuthorID = "申请医师工号"
    s msg.AuthorName = "申请医师姓名"
    s msg.AuthorDeptCode = "申请科室编码"
    s msg.AuthorDeptName = "申请科室名称"
    s msg.AuditTime = "审核日期"
    s msg.AuditUserWorkNo = "审核医师工号"
    s msg.AuditUserName = "审核人姓名"
    
    s item = ##class(IHE.Msg.H09.OperationInfoItem).%New()
    s item.OperationCode = "手术编码"
    s item.OperationName = "手术名称"
    s item.OperationLevelCode = "手术等级编码"
    s item.OperationLevelTime = "手术等级名称"
    s item.ReserveOperationTime = "预定手术时间"
    s item.OperationDrID = "手术医师工号"
    s item.OperationDrName = "手术医师名称"
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
    s msg.SeenTime = "就诊（住院）日期"
    s msg.DomainId = "域ID"
    s msg.PatientID = "患者ID"
    s msg.OutpatientId = "门（急）诊号标识"
    s msg.HospitalizationId = "住院号标识"
    s msg.IDCardNo = "患者身份证号"
    s msg.MedicalInsuranceCard = "医保卡号"
    s msg.PatientName = "患者姓名"
    s msg.PatientTelecom = "患者电话"
    s msg.GenderCode = "性别代码"
    s msg.GenderName = "性别名称"
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
    s msg.Diagnosis = "诊断（手术申请原因）"
    s msg.DiagnosisTypeCode = "诊断类别编码"
    s msg.DiagnosisTypeName = "诊断类别名称"
    s msg.DiseaseCode = "疾病编码"
    s msg.DiseaseName = "疾病名称"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
