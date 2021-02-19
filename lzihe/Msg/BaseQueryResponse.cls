Class IHE.Msg.BaseQueryResponse Extends IHE.Msg.BaseResponse [ Language = objectscript ]
{

/// 查询标识
Property QueryID As %String(MAXLEN = 50);

/// 查询响应代码
Property ResponseCode As %String(MAXLEN = 50);

/// 查询结果数量
Property TotalNum As %String(MAXLEN = 4);

}
