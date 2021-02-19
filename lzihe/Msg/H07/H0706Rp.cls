Class IHE.Msg.H07.H0706Rp Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.BaseResponse) [ Language = objectscript ]
{

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

/// 查询标识
Property QueryID As %String(MAXLEN = 50);

/// 查询响应代码
Property ResponseCode As %String(MAXLEN = 50);

/// 查询结果数量
Property TotalNum As %String(MAXLEN = 50);

}
