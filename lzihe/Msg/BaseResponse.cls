Class IHE.Msg.BaseResponse Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 处理结果，"AA"表示成功，"AE"表示失败
Property ResultCode As %String;

/// 请求消息ID
Property RequestMsgID As %String(MAXLEN = 50);

/// 处理结果说明
Property ResultDesc As %String(MAXLEN = 200);

}
