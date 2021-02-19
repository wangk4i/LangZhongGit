Class IHE.Msg.H09.DerivedSpecimen Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 标本条码号
Property SpecimenID As %String;

/// 取材部位
Property DerivedSpecimenPart As %String(MAXLEN = 50);

/// 取材数量
Property DerivedSpecimenNumber As %String(MAXLEN = 5);

/// 取材数量单位
Property DerivedSpecimenUnit As %String(MAXLEN = 5);

}
