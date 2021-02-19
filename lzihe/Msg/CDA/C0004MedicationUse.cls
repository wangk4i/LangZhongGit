Class IHE.Msg.CDA.C0004MedicationUse Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.CDA.Common.DocHead) [ Language = objectscript ]
{

/// 药物使用途径代码
Property MedicationUseCode As %String;

/// 单次用药剂量
Property MedicationDosage As %String;

/// 药物使用频率
Property MedicationFrequency As %String;

/// 药物剂型代码
Property MedicationDosageFormCode As %String;

/// 药品名称
Property DrugName As %String;

/// 药物规格描述
Property DrugSpecification As %String;

/// 药物使用总剂量描述
Property DrugTotalDose As %String;

/// 处方有效天数
Property EffectiveDays As %String;

/// 处方药品组号描述
Property DrugGroupNum As %String;

/// 处方备注信息描述
Property NoteDesc As %String;

}
