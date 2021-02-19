Class IHE.Msg.H07.ChineseReasonInfo Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 中医诊断代码
Property ChineseDiagCode As %String;

/// 中医诊断名称
Property ChineseDiagValue As %String;

/// 中医诊断人工号
Property ChineseDiagPersonCode As %String(MAXLEN = 50);

}
