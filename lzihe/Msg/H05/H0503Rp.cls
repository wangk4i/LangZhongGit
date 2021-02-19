Class IHE.Msg.H05.H0503Rp Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.BaseResponse) [ Language = objectscript ]
{

/// 值集标识符
Property TermSetCode As %String(MAXLEN = 50);

/// 值集描述
Property TermSetValue As %String(MAXLEN = 50);

/// 值集状态代码
Property TermSetStatus As %String(MAXLEN = 50);

/// 值集版本代码
Property TermSetVersionCode As %String(MAXLEN = 50);

/// 值集版本描述
Property TermSetVersionValue As %String(MAXLEN = 50);

/// 值集项目代码
Property TermCode As %String(MAXLEN = 50);

/// 值集项目描述
Property TermValue As %String(MAXLEN = 100);

/// 值集项目状态代码
Property TermStatus As %String(MAXLEN = 50);

/// 查询ID
Property QueryID As %String(MAXLEN = 50);

/// 查询响应代码
Property QueryResponseCode As %String(MAXLEN = 50);

/// 查询结果数量
Property TotalNum As %String(MAXLEN = 4);

}
