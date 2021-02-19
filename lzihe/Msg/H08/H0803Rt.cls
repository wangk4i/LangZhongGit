Class IHE.Msg.H08.H0803Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 医嘱ID
Property OrderId As %String(MAXLEN = 50);

/// 医嘱开立者ID(医务人员工号)
Property AuthorWorkNo As %String;

/// 医嘱有效期间（低值）
Property OrderTimeLow As %String(MAXLEN = 15);

/// 医嘱有效期间（高值）
Property OrderTimeHigh As %String(MAXLEN = 15);

/// 患者ID
Property PatientID As %String(MAXLEN = 50);

}
