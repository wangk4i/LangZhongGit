Class IHE.Msg.H09.H0909Rp Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 消息ID
Property MsgID As %String(MAXLEN = 50);

/// 消息创建时间
Property CreateTime As %String(MAXLEN = 14);

/// 处理结果标识
Property ResultCode As %String(MAXLEN = 10);

/// 请求消息ID
Property RequestMsgID As %String(MAXLEN = 50);

/// 处理结果说明
Property ResultDesc As %String(MAXLEN = 200);

/// 病理申请信息根节点
Property Subject As list Of IHE.Msg.H09.PathologyAppInfoItem;

/// 查询结果代码
Property ResponseCode As %String;

}
