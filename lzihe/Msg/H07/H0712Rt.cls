Class IHE.Msg.H07.H0712Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 查询标识符
Property QueryID As %String;

/// 住院号
Property HospitalizationId As %String;

/// 就诊次数
Property VisitNum As %String(MAXLEN = 3);

/// 就诊流水号
Property AdmID As %String(MAXLEN = 50);

/// 转科日期时间（上限）
Property InPatientStartTime As %String(MAXLEN = 14);

/// 转科日期时间（下限）
Property InPatientEndTime As %String(MAXLEN = 14);

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者身份证号
Property IDCardNo As %String;

/// 组织机构标识符
Property ServiceOrganCode As %String;

/// 就诊类型代码
Property AdmTypeCode As %String;

/// 就诊类型描述
Property AdmTypeName As %String;

}
