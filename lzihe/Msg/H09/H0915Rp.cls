Class IHE.Msg.H09.H0915Rp Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 处理结果，固定值AA表示成功
Property ResultCode As %String;

/// 请求消息ID
Property RequestMsgID As %String(MAXLEN = 50);

/// 处理结果说明
Property ResultDesc As %String(MAXLEN = 200);

/// 申请单内容跟节点
Property Subject As list Of IHE.Msg.H09.OperationAppInfoItem;

/// 查询结果代码
Property ResponseCode As %String(MAXLEN = 50);

}
