Class IHE.Msg.H07.H0715Rp Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.BaseResponse) [ Language = objectscript ]
{

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

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

/// 医院编码
Property ServiceOrganCode As %String;

/// 责任医师工号
Property AssignedPersonCode As %String(MAXLEN = 50);

/// 责任医师姓名
Property AssignedPersonName As %String;

/// 登记人职工号
Property RegisterPersonWokrNo As %String(MAXLEN = 50);

/// 登记人姓名
Property RegisterPersonName As %String;

/// 科室标识
Property AssignedDeptCode As %String;

/// 科室描述
Property AssignedDeptName As %String;

/// 病区标识符
Property InPatientAreaCode As %String(MAXLEN = 50);

/// 病区名称
Property InPatientAreaName As %String;

/// 西医诊断代码
Property WesternDiagCode As %String;

/// 西医诊断描述
Property WesternDiagValue As %String;

/// 西医诊断人工号
Property WesternDiagPersonCode As %String(MAXLEN = 50);

/// 中医诊断代码
Property ChineseDiagCode As %String;

/// 中医诊断名称
Property ChineseDiagValue As %String;

/// 中医诊断人工号
Property ChineseDiagPersonCode As %String(MAXLEN = 50);

/// 查询标识
Property QueryID As %String(MAXLEN = 50);

/// 查询响应代码
Property QueryResponseCode As %String(MAXLEN = 50);

/// 查询结果数量
Property TotalNum As %String(MAXLEN = 4);

}
