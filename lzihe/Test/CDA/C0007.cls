Class IHE.Test.CDA.C0007 Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.CDA.C0007).%New()

	s msg.DocID = "文档流水号标识"
    s msg.CreateTime = "文档机器生成时间"
    s msg.DocSetID = "文档集合编号"
    s msg.Version = "文档版本号"
    s msg.OutPatientID = "门（急）诊号"
    s msg.HospitalizationID = "住院号"
    s msg.ReportID = "检验报告单编号"
    s msg.ApplyID = "电子申请单编号"
    s msg.SpecimenID = "标本编号标识"
    s msg.PatientTypeCode = "患者类型代码"
    s msg.PatientTypeName = "患者类型名称"
    d msg.TelPhone.Insert("患者联系电话")
    d msg.TelPhone.Insert("患者联系电话")
    d msg.TelPhone.Insert("患者联系电话")
    
    s PatientInfo = ##class(IHE.Msg.CDA.Common.Patient).%New()
    s PatientInfo.IDCardNo = "患者身份证号"
    s PatientInfo.PatientName = "患者姓名"
    s PatientInfo.GenderCode = "患者性别代码"
    s PatientInfo.GenderName = "患者性别名称"
    s PatientInfo.Age = "患者年龄"
    s msg.PatientInfo = PatientInfo
    
    s msg.RecordTime = "检查报告日期"
    s msg.AuthorCode = "作者的唯一标识符"
    s msg.AuthorName = "医师姓名"
    s msg.CustodianOrgCode = "文档保管的医疗结构标识"
    s msg.CustodianOrgName = "保管机构名称"
    
    s AuditPerson = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
    s AuditPerson.Code = "审核医师标识"
    s AuditPerson.Name = "审核医师姓名"
    d msg.AuditPerson.Insert(AuditPerson)
    d msg.AuditPerson.Insert(AuditPerson)
    d msg.AuditPerson.Insert(AuditPerson)
    
    s InspectionTechnician = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
    s InspectionTechnician.Code = "检验技师编号"
    s InspectionTechnician.Name = "检验技师姓名"
    d msg.InspectionTechnician.Insert(InspectionTechnician)
    d msg.InspectionTechnician.Insert(InspectionTechnician)
    d msg.InspectionTechnician.Insert(InspectionTechnician)
    
    s InspectionDoctor = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
    s InspectionDoctor.Code = "检验医师编号"
    s InspectionDoctor.Name = "检验医师姓名"
    d msg.InspectionTechnician.Insert(InspectionDoctor)
    d msg.InspectionTechnician.Insert(InspectionDoctor)
    d msg.InspectionTechnician.Insert(InspectionDoctor)
    
    s ApplyInfo = ##class(IHE.Msg.CDA.C0007ApplyInfo).%New()
    s ApplyInfo.ApplyDeptID = "检验申请科室标识"
    s ApplyInfo.ApplyDeptName = "检验申请科室名称"
    s ApplyInfo.ApplyOrgID = "检验申请机构标识"
    s ApplyInfo.ApplyOrgName = "检验申请机构名称"
    d msg.ApplyInfo.Insert(ApplyInfo)
    d msg.ApplyInfo.Insert(ApplyInfo)
    d msg.ApplyInfo.Insert(ApplyInfo)
    
    s msg.ParentDocID = "父文档标识符"
    s msg.ParentSetID = "父文档集序列号"
    s msg.ParentVersionNum = "父文档版本号"
    
    s BedInfo = ##class(IHE.Msg.CDA.Common.RelatedOrgan).%New()
    s BedInfo.BedCode = "病床号"
    s BedInfo.RoomCode = "病房号"
    s BedInfo.DeptCode = "科室编号"
    s BedInfo.DeptName = "科室名称"
    s BedInfo.AreaCode = "病区编号"
    s BedInfo.AreaName = "病区名称"
    s BedInfo.OrganCode = "医疗机构编号"
    s BedInfo.OrganName = "医疗机构名称"
    s msg.BedInfo = BedInfo
    
    s Diag = ##class(IHE.Msg.CDA.C0007Diag).%New()
    s Diag.DiagTime = "诊断日期"
    s Diag.DiagCode = "诊断代码"
    s Diag.DiagOrganName = "诊断机构名称"
    d msg.Diag.Insert(Diag)
    d msg.Diag.Insert(Diag)
    d msg.Diag.Insert(Diag)
    
    s msg.InspectionWay = "检验方法"
    s msg.InspectionType = "检验项目类别"
    
    s Inspection = ##class(IHE.Msg.CDA.C0007Inspection).%New()
    s Inspection.InspectionCode = "检验项目代码"
    s Inspection.InspectionTime = "检验日期"
    s Inspection.SamplingTime = "标本采样日期时间"
    s Inspection.ReceiveTime = "接收标本日期时间"
    s Inspection.SpecimenType = "标本类别"
    s Inspection.SpecimenStatus = "标本状态"
    s Inspection.ResultCode = "检验结果代码"
    s Inspection.ResultName = "检验结果名称"
    s Inspection.ResultUnit = "检验定量结果计量单位"
    d msg.Inspection.Insert(Inspection)
    d msg.Inspection.Insert(Inspection)
    d msg.Inspection.Insert(Inspection)
    
    s msg.ReportResult = "检验查报告结果"
    s msg.ReportDept = "检验报告科室"
    s msg.ReportOrgan = "检验报告机构"
    s msg.ReportNote = "检验报告备注"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
