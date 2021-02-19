<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0602Rt">
        <RCMR_IN000029UV01 ITSVersion="XML_1.0"
            xmlns="urn:hl7-org:v3"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/RCMR_IN000029UV01.xsd">
            <!--id-消息流水号-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <!--creationTime-消息创建时间-->
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreTime"/>
                </xsl:attribute>
            </creationTime>
            <!--interactionId-消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="RCMR_IN000029UV01"/>
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
            <controlActProcess classCode="CACT" moodCode="EVN">
                <queryByParameter>
                    <!--查询ID-->
                    <queryId extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="QueryId"/>
                        </xsl:attribute>
                    </queryId>
                    <!--文档注册日期时间-->
                    <executionAndDeliveryTime validTimeLow="" validTimeHigh="">
                        <xsl:attribute name="validTimeLow">
                            <xsl:value-of select="ExecutionAndDeliveryTimeLow"/>
                        </xsl:attribute>
                        <xsl:attribute name="validTimeHigh">
                            <xsl:value-of select="ExecutionAndDeliveryTimeHigh"/>
                        </xsl:attribute>
                    </executionAndDeliveryTime>
                    <!--文档创建者-->
                    <assignedAuthor.id>
                        <value root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="AssignedAuthorWorkNo"/>
                            </xsl:attribute>
                        </value>
                        <semanticsText value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="AssignedAuthorName"/>
                            </xsl:attribute>
                        </semanticsText>
                    </assignedAuthor.id>
                    <!--文档类型-->
                    <clinicalDocument.code>
                        <value code="" codeSystem="2.16.156.10011.2.5.1.23" codeSystemName="文档类型代码">
                            <xsl:attribute name="code">
                                <xsl:value-of select="DocumentTypeCode"/>
                            </xsl:attribute>
                            <displayName value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="DocumentTypeCodeName"/>
                                </xsl:attribute>
                            </displayName>
                        </value>
                    </clinicalDocument.code>
                    <!--文档生成日期时间-->
                    <clinicalDocument.effectiveTime>
                        <value>
                            <low value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="DEffectiveTimeLow"/>
                                </xsl:attribute>
                            </low>
                            <high value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="DEffectiveTimeHigh"/>
                                </xsl:attribute>
                            </high>
                        </value>
                    </clinicalDocument.effectiveTime>
                    <!--患者就诊日期时间-->
                    <encompassingEncounter.effectiveTime>
                        <value>
                            <low value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="PEffectiveTimeLow"/>
                                </xsl:attribute>
                            </low>
                            <high value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="PEffectiveTimeHigh"/>
                                </xsl:attribute>
                            </high>
                        </value>
                    </encompassingEncounter.effectiveTime>
                    <!--患者就诊号-->
                    <encompassingEncounter.id>
                        <value>
                            <item root="2.16.156.10011.1.12" extension="">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="InID"/>
                                </xsl:attribute>
                            </item>
                            <item root="2.16.156.10011.1.11" extension="">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="OutID"/>
                                </xsl:attribute>
                            </item>
                        </value>
                    </encompassingEncounter.id>
                    <!--患者id-->
                    <patient.id>
                        <value>
                            <item root="2.16.156.10011.2.5.1.4" extension="">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="PatientID"/>
                                </xsl:attribute>
                            </item>
                            <item root="2.16.156.10011.1.3" extension="">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="PatientIDCard"/>
                                </xsl:attribute>
                            </item>
                        </value>
                        <semanticsText value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientName"/>
                            </xsl:attribute>
                        </semanticsText>
                    </patient.id>
                </queryByParameter>
            </controlActProcess>
        </RCMR_IN000029UV01>
    </xsl:template>
</xsl:stylesheet>