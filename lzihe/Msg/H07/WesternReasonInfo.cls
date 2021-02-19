Class IHE.Msg.H07.WesternReasonInfo Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 西医诊断代码
Property WesternDiagCode As %String;

/// 西医诊断名称
Property WesternDiagValue As %String;

/// 西医诊断人工号
Property WesternDiagPersonCode As %String(MAXLEN = 50);

}
