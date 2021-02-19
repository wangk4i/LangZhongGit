<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0703Rt">
        <PRPA_IN201305UV02 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPA_IN201305UV02.xsd">
            <!--id-消息流水号-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <!--creationTime-消息创建时间-->
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <!--interactionId-消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN201305UV02"/>
            <!--processingCode-处理代码。标识此消息是否是产品、训练、调试系统的一部分。D：调试；P：产品；T：训练-->
            <processingCode code="P"/>
            <!--processingModeCode-处理模型代码。定义此消息是一个文档处理还是一个初始装载的一部分。A：存档；I：初始装载；R：从存档中恢复；T：当前处理，间隔传递。-->
            <processingModeCode/>
            <!--acceptAckCode-接收确认类型 AL：总是确认；NE：从不确认；ER：仅在错误/或拒绝时确认；SU：仅在成功完成时确认。-->
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Receiver"/>
                            </xsl:attribute>
                        </item>
                    </id>
                </device>
            </receiver>
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Sender"/>
                            </xsl:attribute>
                        </item>
                    </id>
                </device>
            </sender>
            <controlActProcess classCode="INFO" moodCode="EVN">
                <queryByParameter>
                    <!--查询标识-->
                    <queryId extension="">
                        <xsl:attribute name="extension"><xsl:value-of select="QueryID"/></xsl:attribute>
                    </queryId>
                    <statusCode/>
                    <parameterList>
                        <!--就诊卡号-->
                        <id root="2.16.156.10011.2.5.1.6" extension="">
                            <xsl:attribute name="extension"><xsl:value-of select="EncounterCardID"/></xsl:attribute>
                        </id>
                        <!--患者性别-->
                        <livingSubjectAdministrativeGender>
                            <value code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                                <xsl:attribute name="code"><xsl:value-of select="GenderCode"/></xsl:attribute>
                                <displayName value="">
                                    <xsl:attribute name="value"><xsl:value-of select="GenderName"/></xsl:attribute>
                                </displayName>
                            </value>
                            <semanticsText/>
                        </livingSubjectAdministrativeGender>
                        <!--患者身份证号-->
                        <livingSubjectId>
                            <value xsi:type="DSET_II">
                                <item root="2.16.156.10011.1.3" extension="">
                                    <xsl:attribute name="extension"><xsl:value-of select="IDCardNo"/></xsl:attribute>
                                </item>
                            </value>
                            <semanticsText/>
                        </livingSubjectId>
                        <!--患者姓名-->
                        <livingSubjectName>
                            <value xsi:type="DSET_EN">
                                <item>
                                    <part value="">
                                        <xsl:attribute name="value"><xsl:value-of select="PatientName"/></xsl:attribute>
                                    </part>
                                </item>
                            </value>
                            <semanticsText/>
                        </livingSubjectName>
                    </parameterList>
                </queryByParameter>
            </controlActProcess>
        </PRPA_IN201305UV02>
    </xsl:template>
</xsl:stylesheet>