Class IHE.Msg.H09.H0906Rp Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 接收者ID
Property ReceiverID As %String(MAXLEN = 50);

/// 发送者ID
Property SenderID As %String(MAXLEN = 50);

/// 请求消息ID
Property RequestMsgID As %String(MAXLEN = 50);

/// 处理结果说明
Property ResultDesc As %String(MAXLEN = 200);

/// 检查申请单
Property Subject As list Of IHE.Msg.H09.CheckAppInfoItem;

/// 查询结果代码
Property ResponseCode As %String(MAXLEN = 50);

}
