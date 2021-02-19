Class IHE.Msg.H05.H0501Rt Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 值集标识符
Property TermSetCode As %String(MAXLEN = 50);

/// 值集描述
Property TermSetValue As %String(MAXLEN = 100);

/// 值集状态代码
Property TermSetStatus As %String(MAXLEN = 50);

/// 值集版本代码
Property TermSetVersionCode As %String(MAXLEN = 50);

/// 值集版本描述
Property TermSetVersionValue As %String(MAXLEN = 100);

/// 值集项目代码
Property TermCode As %String(MAXLEN = 50);

/// 值集项目描述
Property TermValue As %String(MAXLEN = 100);

/// 值集项目状态代码
Property TermStatus As %String(MAXLEN = 50);

/// 注册者工号
Property AssignedPersonCode As %String(MAXLEN = 50);

/// 注册者姓名
Property AssignedPersonName As %String;

}
