Class IHE.Msg.H07.H0706Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 查询标识符
Property QueryID As %String(MAXLEN = 50);

/// 门急诊号
Property OutPatientID As %String;

/// 就诊次数
Property VisitNum As %String(MAXLEN = 3);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// 就诊时间上限
Property EncounterStartTime As %String(MAXLEN = 14);

/// 就诊时间下限
Property EncounterEndTime As %String(MAXLEN = 14);

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者身份证号
Property IDCardNo As %String;

/// 科室标识符
Property DeptCode As %String;

/// 组织机构标识
Property ServiceOrganCode As %String;

/// 就诊类型代码
Property AdmTypeCode As %String;

/// 就诊类型描述
Property AdmTypeName As %String;

}
