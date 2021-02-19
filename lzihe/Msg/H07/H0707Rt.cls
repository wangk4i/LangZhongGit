Class IHE.Msg.H07.H0707Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 住院号
Property HospitalizationId As %String(MAXLEN = 14);

/// 就诊次数
Property VisitNum As %String(MAXLEN = 3);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// 就诊类别代码
Property AdmTypeCode As %String;

/// 患者就诊类别描述
Property AdmTypeName As %String;

/// 入院日期
Property EncounterTime As %String;

/// 就诊原因描述
Property EncounterReasonDesc As %String;

/// 医疗保险类别代码
Property BeneficiaryCode As %String;

/// 医疗保险类别描述
Property BeneficiaryValue As %String;

/// 住院次数
Property InPatientNum As %String;

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

/// 医生的职工号
Property AssignedPersonCode As %String(MAXLEN = 50);

/// 责任医生姓名
Property AssignedPersonName As %String;

/// 科室标识
Property DeptCode As %String;

/// 科室名称
Property DeptName As %String;

/// 病区号标识
Property InPatientAreaCode As %String(MAXLEN = 50);

/// 病区名称
Property InPatientAreaName As %String;

/// 病房号标识
Property InPatientRoomCode As %String(MAXLEN = 50);

/// 病房名称
Property InPatientRoomName As %String;

/// 病床号标识
Property InPatientBedCode As %String(MAXLEN = 50);

/// 病床名称
Property InPatientBedName As %String;

/// 服务机构代码
Property ServiceOrganCode As %String;

/// 西医诊断节点
Property WesternReason As list Of IHE.Msg.H07.WesternReasonInfo;

/// 中医诊断节点
Property ChineseReason As list Of IHE.Msg.H07.ChineseReasonInfo;

}
