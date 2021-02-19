Class IHE.Msg.H09.H0909Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 申请单编号
Property AppInfoID As %String;

/// 申请单开立者工号
Property AuthorID As %String;

/// 申请单有效期（低值)
Property EffectiveTimeLow As %String(MAXLEN = 14);

/// 申请单有效期（高值)
Property EffectiveTimeHigh As %String(MAXLEN = 14);

/// 患者ID
Property PatientID As %String(MAXLEN = 50);

}
