Class IHE.Msg.CDA.C0003 Extends (IHE.Msg.CDA.Common.DocHead, %RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 门（急）诊号
Property OutPatientID As %String;

/// 电子申请单编号
Property ApplyID As %String;

/// 患者身份信息
Property PatientInfo As IHE.Msg.CDA.Common.Patient;

/// 科室标识
Property DeptCode As %String;

/// 科室名称
Property DeptName As %String;

/// 医疗机构标识
Property OrganCode As %String;

/// 医疗机构名称
Property OrganName As %String;

/// 医务人员标识
Property ChargeDoctorCode As %String;

/// 责任医师姓名
Property ChargeDoctorName As %String;

/// 父文档标识符
Property ParentDocID As %String;

/// 父文档集序列号
Property ParentSetID As %String;

/// 父文档版本号
Property ParentVersionNum As %String;

/// 过敏史
Property Allergies As list Of IHE.Msg.CDA.C0003Allergies;

/// 主诉描述
Property ChiefComplaintsDesc As %String;

/// 现病史描述
Property PresentIllnessDesc As list Of %String;

/// 既往史描述
Property PastIllnessDesc As list Of %String;

/// 体格检查结果
Property PhysicalExamResult As %String;

/// 辅助检查结果
Property AidedExamResult As %String;

/// 初诊标志代码
Property FirstVisitCode As %String;

/// 初诊标志名称
Property FirstVisitName As %String;

/// 中医四诊观察结果
Property ChineseDiagResult As %String;

/// 西医诊断名称值
Property WesternDiagValue As %String;

/// 西医诊断病名代码
Property WesternDiagCode As %String;

/// 西医诊断病名名称
Property WesternDiagName As %String;

/// 中医病名名称值
Property ChineseDiagValue As %String;

/// 中医病名代码
Property ChineseDiagCode As %String;

/// 中医病名名称
Property ChineseDiagName As %String;

/// 中医症候名称值
Property ChineseSymptomValue As %String;

/// 中医证候代码
Property ChineseSymptomCode As %String;

/// 中医证候代码名称
Property ChineseSymptomName As %String;

/// 辩证依据描述
Property DialecticalBasisDesc As %String;

/// 治则治法代码
Property TreatmentPrincipleCode As %String;

/// 医嘱项目类型代码
Property OrderItemTypeCode As %String;

/// 医嘱项目类型名称
Property OrderItemTypeName As %String;

/// 医嘱计划开始日期时间
Property OrderTimeLow As %String;

/// 医嘱计划结束日期时间
Property OrderTimeHigh As %String;

/// 医嘱项目内容取值
Property OrderItemContent As %String;

/// 医嘱执行日期时间
Property OrderExcuteTime As %String;

/// 医嘱执行者编号
Property OrderExcutePersonCode As %String;

/// 医嘱执行者签名
Property OrderExcutePersonName As %String;

/// 医嘱执行科室
Property OrderExcuteDept As %String;

/// 医嘱开立日期时间
Property OrderCreateTime As %String;

/// 医嘱开立者编号
Property OrderAuthorPersonCode As %String;

/// 医嘱开立者签名
Property OrderAuthorPersonName As %String;

/// 医嘱开立科室
Property OrderAuthorDept As %String;

/// 医嘱审核日期时间
Property OrderAuditTime As %String;

/// 医嘱审核人编号
Property OrderAuditPersonCode As %String;

/// 医嘱审核人签名
Property OrderAuditPersonName As %String;

/// 医嘱取消日期时间
Property OrderCancelTime As %String;

/// 医嘱取消者编号
Property OrderCancelPersonCode As %String;

/// 医嘱取消者签名
Property OrderCancelPersonName As %String;

/// 医嘱备注信息
Property OrderNote As %String;

/// 医嘱执行状态
Property OrderExcuteStatus As %String;

/// 手术及操作
Property Operation As list Of IHE.Msg.CDA.C0003Operation;

/// 抢救开始时间
Property RescueTimeLow As %String;

/// 抢救结束时间
Property RescueTimeHigh As %String;

/// 急救抢救记录描述
Property RescueDesc As %String;

/// 参加抢救人员名单
Property RescueDocList As %String;

/// 专业技术职务类别代码
Property Subject1Code As %String;

/// 收入观察日期时间
Property TakeInTime As %String;

/// 急诊留观病程记录描述
Property EmergencyObservationRecord As %String;

/// 注意事项
Property Notices As %String;

/// 患者去向代码
Property PatientGoCode As %String;

}
