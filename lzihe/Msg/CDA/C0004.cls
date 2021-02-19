Class IHE.Msg.CDA.C0004 Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.CDA.Common.DocHead, IHE.Msg.CDA.Common.Patient) [ Language = objectscript ]
{

/// 门急诊号标识
Property OutPatientID As %String;

/// 处方编号
Property PrescriptionID As %String;

/// 处方开立科室
Property PrescribeDept As %String;

/// 医疗机构代码
Property PrescribeOrgCode As %String;

/// 医疗机构名称
Property PrescribeOrgName As %String;

/// 处方审核药剂师
Property AuditDoctor As list Of IHE.Msg.CDA.Common.RelatedPerson;

/// 处方调配药剂师
Property MixDoctor As list Of IHE.Msg.CDA.Common.RelatedPerson;

/// 处方核对药剂师
Property CheckDoctor As list Of IHE.Msg.CDA.Common.RelatedPerson;

/// 处方发药药剂师
Property DispenseDoctor As list Of IHE.Msg.CDA.Common.RelatedPerson;

/// 诊断病名代码
Property DiagCode As %String;

/// 用药明细
Property MedDetails As list Of IHE.Msg.CDA.C0004MedicationUse;

/// 处方费用金额
Property PrescriptionExpense As %String;

}
