Class IHE.Msg.H07.H0704Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 门急诊号
Property OutPatientID As %String;

/// 就诊次数
Property VisitNum As %String(MAXLEN = 3);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// 就诊类别代码
Property AdmTypeCode As %String;

/// 就诊类别描述
Property AdmTypeName As %String;

/// 就诊日期时间
Property EncounterTime As %String;

/// 就诊原因描述
Property EncounterReasonDesc As %String;

/// 医疗保险类别代码
Property BeneficiaryCode As %String;

/// 医疗保险类别描述
Property BeneficiaryValue As %String;

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

/// 责任医师工号
Property AssignedPersonCode As %String(MAXLEN = 50);

/// 责任医师姓名
Property AssignedPersonName As %String;

/// 科室标识
Property DeptCode As %String;

/// 科室名称
Property DeptName As %String;

/// 服务机构的标识
Property ServiceOrganCode As %String;

}
