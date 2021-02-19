Class IHE.Msg.H07.H0709Rp Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.BaseResponse) [ Language = objectscript ]
{

/// 住院号
Property HospitalizationId As %String;

/// 就诊次数
Property VisitNum As %String(MAXLEN = 50);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// 就诊类别代码
Property AdmTypeCode As %String;

/// 患者就诊类别描述
Property AdmTypeName As %String;

/// 入院日期
Property EncounterTime As %String;

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

/// 西医诊断代码
Property WesternDiagCode As %String;

/// 西医诊断名称
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
Property ResponseCode As %String(MAXLEN = 50);

/// 查询结果数量
Property TotalNum As %String(MAXLEN = 4);

}
