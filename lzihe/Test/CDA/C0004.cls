Class IHE.Test.CDA.C0004 Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.CDA.C0004).%New()
	b
	s msg.DocID = "文档流水号标识"
	s msg.CreateTime = "文档机器生成时间"
	s msg.DocSetID = "文档集合编号"
	s msg.Version = "文档版本号"
	s msg.OutPatientID = "门急诊号标识"
	s msg.PrescriptionID = "处方编号"
	s msg.IDCardNo = "患者身份证号"
	s msg.PatientName = "患者姓名"
	s msg.GenderCode = "患者性别代码"
	s msg.GenderName = "患者性别名称"
	s msg.Age = "患者年龄"
	s msg.PrescribeDept = "处方开立科室"
	s msg.PrescribeOrgCode = "医疗机构代码"
	s msg.PrescribeOrgName = "医疗机构名称"
	s msg.RecordTime = "文档记录时间"
	s msg.AuthorCode = "文档作者标识"
	s msg.AuthorName = "文档作者姓名"
	s msg.CustodianOrgCode = "文档保管的医疗机构标识"
	s msg.CustodianOrgName = "文档保管机构名称"
	
	s AuditDoctorItem = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
	s AuditDoctorItem.Code = "处方审核药剂师标识"
	s AuditDoctorItem.Name = "处方审核药剂师姓名"
	d msg.AuditDoctor.Insert(AuditDoctorItem)
	d msg.AuditDoctor.Insert(AuditDoctorItem)

	s MixDoctorItem = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
	s MixDoctorItem.Code = "处方调配药剂师标识"
	s MixDoctorItem.Name = "处方调配药剂师姓名"
	d msg.MixDoctor.Insert(MixDoctorItem)
	d msg.MixDoctor.Insert(MixDoctorItem)
	
	s CheckDoctorItem = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
	s CheckDoctorItem.Code = "处方核对药剂师标识"
	s CheckDoctorItem.Name = "处方核对药剂师姓名"
	d msg.CheckDoctor.Insert(CheckDoctorItem)
	d msg.CheckDoctor.Insert(CheckDoctorItem)
	
	s DispenseDoctorItem = ##class(IHE.Msg.CDA.Common.RelatedPerson).%New()
	s DispenseDoctorItem.Code = "处方发药药剂师标识"
	s DispenseDoctorItem.Name = "处方发药药剂师姓名"
	d msg.DispenseDoctor.Insert(DispenseDoctorItem)
	d msg.DispenseDoctor.Insert(DispenseDoctorItem)
	
	s msg.DiagCode = "西医诊断病名代码"
	
	s MedicationUseItem = ##class(IHE.Msg.CDA.C0004MedicationUse).%New()
	s MedicationUseItem.MedicationUseCode = "药物使用途径代码"
	s MedicationUseItem.MedicationDosage = "单次用药剂量"
	s MedicationUseItem.MedicationFrequency = "药物使用频率"
	s MedicationUseItem.MedicationDosageFormCode = "药物剂型代码"
	s MedicationUseItem.DrugName = "药品名称"
	s MedicationUseItem.DrugSpecification = "药物规格描述"
	s MedicationUseItem.DrugTotalDose = "药物使用总剂量描述"
	s MedicationUseItem.EffectiveDays = "处方有效天数"
	s MedicationUseItem.DrugGroupNum = "处方药品组号描述"
	s MedicationUseItem.NoteDesc = "处方备注信息描述"
	d msg.MedDetails.Insert(MedicationUseItem)
	d msg.MedDetails.Insert(MedicationUseItem)
	d msg.MedDetails.Insert(MedicationUseItem)
	
	s msg.PrescriptionExpense = "处方费用金额"
	
	d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
