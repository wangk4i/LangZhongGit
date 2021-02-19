<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0503Rp">
        <PRVS_IN000004UV01 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRVS_IN000004UV01.xsd">
            <!--id-消息流水号-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <!--creationTime-消息创建时间-->
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <!--interactionId-消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRVS_IN000004UV01"/>
            <!--processingCode-处理代码。标识此消息是否是产品、训练、调试系统的一部分。D：调试；P：产品；T：训练-->
            <processingCode code="P"/>
            <!--processingModeCode-处理模型代码。定义此消息是一个文档处理还是一个初始装载的一部分。A：存档；I：初始装载；R：从存档中恢复；T：当前处理，间隔传递。-->
            <processingModeCode/>
            <!--acceptAckCode-接收确认类型 AL：总是确认；NE：从不确认；ER：仅在错误/或拒绝时确认；SU：仅在成功完成时确认。-->
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="1111"/>
                    </id>
                </device>
            </receiver>
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="222"/>
                    </id>
                </device>
            </sender>
            <!--typeCode为处理结果，AA表示成功 AE表示失败-->
            <acknowledgement typeCode="">
                <xsl:attribute name="typeCode"><xsl:value-of select="ResultCode"/></xsl:attribute>
                <targetMessage>
                    <id root="2.16.156.10011.2.5.1.1" extension="">
                        <xsl:attribute name="extension"><xsl:value-of select="RequestMsgID"/></xsl:attribute>
                    </id>
                </targetMessage>
                <acknowledgementDetail>
                    <!--处理结果说明-->
                    <text value="">
                        <xsl:attribute name="value"><xsl:value-of select="ResultDesc"/></xsl:attribute>
                    </text>
                </acknowledgementDetail>
            </acknowledgement>
            <xsl:choose>
            <xsl:when test="ResultCode = 'AA'">
            <controlActProcess classCode="CACT" moodCode="EVN">
                <subject typeCode="SUBJ">
                    <registrationRequest classCode="REG" moodCode="RQO">
                        <statusCode/>
                        <!--值集，subject1为0..*-->
                        <subject1 typeCode="SBJ">
                            <valueSet>
                                <!--值集标识符-->
                                <id extension="">
                                    <xsl:attribute name="extension"><xsl:value-of select="TermSetCode"/></xsl:attribute>
                                </id>
                                <!--值集描述-->
                                <desc value="">
                                    <xsl:attribute name="extension"><xsl:value-of select="TermSetValue"/></xsl:attribute>
                                </desc>
                                <!--值集状态代码-->
                                <statusCode code="">
                                    <xsl:attribute name="extension"><xsl:value-of select="TermSetStatus"/></xsl:attribute>
                                </statusCode>
                                <!--值集版本信息-->
                                <version code="">
                                    <xsl:attribute name="extension"><xsl:value-of select="TermSetVersionCode"/></xsl:attribute>
                                    <displayName value="">
                                        <xsl:attribute name="extension"><xsl:value-of select="TermSetVersionValue"/></xsl:attribute>
                                    </displayName>
                                </version>
                                <!--值集项目内容，valueSetItems为0..*-->
                                <valueSetItems>
                                    <!--项目代码-->
                                    <code code="">
                                        <xsl:attribute name="extension"><xsl:value-of select="TermCode"/></xsl:attribute>
                                        <!--项目描述-->
                                        <displayName value="">
                                            <xsl:attribute name="extension"><xsl:value-of select="TermValue"/></xsl:attribute>
                                        </displayName>
                                    </code>
                                    <!--项目状态-->
                                    <statusCode code="">
                                        <xsl:attribute name="extension"><xsl:value-of select="TermStatus"/></xsl:attribute>
                                    </statusCode>
                                </valueSetItems>
                            </valueSet>
                        </subject1>
                    </registrationRequest>
                </subject>
                <queryAck>
                    <queryId extension="">
                        <xsl:attribute name="value"><xsl:value-of select="QueryID"/></xsl:attribute>
                    </queryId>
                    <queryResponseCode code="">
                        <xsl:attribute name="value"><xsl:value-of select="QueryResponseCode"/></xsl:attribute>
                    </queryResponseCode>
                    <resultTotalQuantity value="">
                        <xsl:attribute name="value"><xsl:value-of select="TotalNum"/></xsl:attribute>
                    </resultTotalQuantity>
                </queryAck>
            </controlActProcess>
            </xsl:when>
            <xsl:otherwise>
            <controlActProcess classCode="CACT" moodCode="EVN">
                <queryAck>
                    <queryId extension="">
                        <xsl:attribute name="value"><xsl:value-of select="QueryID"/></xsl:attribute>
                    </queryId>
                    <queryResponseCode/>
                </queryAck>
            </controlActProcess>
            </xsl:otherwise>
            </xsl:choose>
        </PRVS_IN000004UV01>
    </xsl:template>
</xsl:stylesheet>