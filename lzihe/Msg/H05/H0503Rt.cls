Class IHE.Msg.H05.H0503Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 查询ID
Property QueryID As %String(MAXLEN = 50);

/// 值集代码
Property TermSetCode As %String(MAXLEN = 50);

/// 值集版本
Property TermSetVersionCode As %String(MAXLEN = 50);

/// 值集项目代码
Property TermCode As %String(MAXLEN = 50);

}
