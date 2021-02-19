Class IHE.Msg.H02.H0204Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 查询ID
Property QueryID As %String;

/// 匹配度
Property MatchDegree As %String(MAXLEN = 50);

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 患者性别代码
Property GenderCode As %String;

/// 患者性别名称
Property GenderName As %String;

/// 患者身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

}
