Class IHE.Msg.H07.H0714Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 住院号
Property HospitalizationId As %String;

/// 就诊次数
Property VisitNum As %String(MAXLEN = 3);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// 就诊类别代码
Property AdmTypeCode As %String;

/// 就诊类别描述
Property AdmTypeName As %String;

/// 出院日期时间
Property DischargeTime As %String;

/// 住院天数
Property StayLength As %String(MAXLEN = 4);

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

/// 登记人职工号
Property RegisterPersonWokrNo As %String(MAXLEN = 50);

/// 登记人姓名
Property RegisterPersonName As %String;

/// 西医诊断节点
Property WesternReason As list Of IHE.Msg.H07.WesternReasonInfo;

/// 中医诊断节点
Property ChineseReason As list Of IHE.Msg.H07.ChineseReasonInfo;

/// 科室标识
Property AssignedDeptCode As %String;

/// 科室描述
Property AssignedDeptName As %String;

/// 病区标识符
Property InPatientAreaCode As %String(MAXLEN = 50);

/// 病区名称
Property InPatientAreaName As %String;

}
