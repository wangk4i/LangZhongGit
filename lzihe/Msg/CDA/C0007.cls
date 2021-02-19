Class IHE.Msg.CDA.C0007 Extends (IHE.Msg.CDA.Common.DocHead, %RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 门（急）诊号
Property OutPatientID As %String;

/// 住院号
Property HospitalizationID As %String;

/// 检验报告单编号
Property ReportID As %String;

/// 电子申请单编号
Property ApplyID As %String;

/// 标本编号标识
Property SpecimenID As %String;

/// 患者类型代码
Property PatientTypeCode As %String;

/// 患者类型名称
Property PatientTypeName As %String;

/// 患者联系电话
Property TelPhone As list Of %String;

/// 患者身份信息
Property PatientInfo As IHE.Msg.CDA.Common.Patient;

/// 审核医师
Property AuditPerson As list Of IHE.Msg.CDA.Common.RelatedPerson;

/// 检验技师
Property InspectionTechnician As list Of IHE.Msg.CDA.Common.RelatedPerson;

/// 检验医师
Property InspectionDoctor As list Of IHE.Msg.CDA.Common.RelatedPerson;

/// 检验申请机构信息
Property ApplyInfo As list Of IHE.Msg.CDA.C0007ApplyInfo;

/// 父文档标识符
Property ParentDocID As %String;

/// 父文档集序列号
Property ParentSetID As %String;

/// 父文档版本号
Property ParentVersionNum As %String;

/// 病床位置
Property BedInfo As IHE.Msg.CDA.Common.RelatedOrgan;

/// 诊断
Property Diag As list Of IHE.Msg.CDA.C0007Diag;

/// 检验方法
Property InspectionWay As %String;

/// 检验项目类别
Property InspectionType As %String;

/// 检验项目
Property Inspection As list Of IHE.Msg.CDA.C0007Inspection;

/// 检验查报告结果
Property ReportResult As %String;

/// 检验报告科室
Property ReportDept As %String;

/// 检验报告机构
Property ReportOrgan As %String;

/// 检验报告备注
Property ReportNote As %String;

}
