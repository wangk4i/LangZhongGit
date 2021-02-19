Class IHE.Msg.H07.H0703Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 查询标识符
Property QueryID As %String(MAXLEN = 50);

/// 就诊卡号
Property EncounterCardID As %String(MAXLEN = 50);

/// 患者性别代码
Property GenderCode As %String;

/// 患者性别描述
Property GenderName As %String;

/// 身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

}
