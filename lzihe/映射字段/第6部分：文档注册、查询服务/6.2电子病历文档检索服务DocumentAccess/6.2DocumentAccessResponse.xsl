<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0602Rp">
        <RCMR_IN000030UV01 ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/RCMR_IN000030UV01.xsd">
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
            <interactionId root="2.16.156.10011.2.5.1.2" extension="RCMR_IN000030UV01"/>
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
            <acknowledgement typeCode="AA">
                <xsl:attribute name="typeCode">
                    <xsl:value-of select="ResultCode"/>
                </xsl:attribute>
                <targetMessage>
                    <id root="2.16.156.10011.2.5.1.1" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="RequestMsgID"/>
                        </xsl:attribute>
                    </id>
                </targetMessage>
                <acknowledgementDetail>
                    <text value="">
                        <xsl:attribute name="typeCode">
                            <xsl:value-of select="ResultDesc"/>
                        </xsl:attribute>
                    </text>
                </acknowledgementDetail>
            </acknowledgement>
            <xsl:choose>
                <xsl:when test="ResultCode = 'AA'">
                    <controlActProcess classCode="INFO" moodCode="EVN">
                        <!--可重复-->
                        <xsl:for-each select="Subject/DocumentAccessItem">
                            <subject typeCode="SUBJ">
                                <clinicalDocument classCode="DOCCLIN" moodCode="EVN">
                                    <!--文档流水号-->
                                    <id>
                                        <item root="2.16.156.10011.2.5.1.24" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="DocumentId"/>
                                            </xsl:attribute>
                                        </item>
                                    </id>
                                    <!--文档类型代码-->
                                    <code code="" codeSystem="2.16.156.10011.2.5.1.23" codeSystemName="文档类型代码">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DocumentCode"/>
                                        </xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="DocumentCodeName"/>
                                            </xsl:attribute>
                                        </displayName>
                                    </code>
                                    <statusCode/>
                                    <!--文档生成日期时间-->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="EffectiveTime"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <!--文档保密级别-->
                                    <confidentialityCode code="N" codeSystem="2.16.156.10011.2.5.1.25" codeSystemName="文档保密级别代码">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="ConfidentialityCode"/>
                                        </xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="ConfidentialityCodeName"/>
                                            </xsl:attribute>
                                        </displayName>
                                    </confidentialityCode>
                                    <!--文档版本号-->
                                    <versionNumber value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="VersionNumber"/>
                                        </xsl:attribute>
                                    </versionNumber>
                                    <recordTarget typeCode="RCT">
                                        <patient classCode="PAT">
                                            <!--本地系统的患者ID -->
                                            <id>
                                                <!--PatientID-->
                                                <item root="2.16.156.10011.2.5.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="PatientID"/>
                                                    </xsl:attribute>
                                                </item>
                                                <!--住院号标识 -->
                                                <item root="2.16.156.10011.1.12" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="InID"/>
                                                    </xsl:attribute>
                                                </item>
                                                <!--门诊号标识 -->
                                                <item root="2.16.156.10011.1.11" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="OutID"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <statusCode/>
                                            <!--患者就诊日期时间-->
                                            <effectiveTime>
                                                <low value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="PatientEffectiveTime"/>
                                                    </xsl:attribute>
                                                </low>
                                                <high/>
                                            </effectiveTime>
                                            <patientPerson classCode="PSN" determinerCode="INSTANCE">
                                                <!--患者身份证号-->
                                                <id>
                                                    <item root="2.16.156.10011.1.3" extension="">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="PatientIDCard"/>
                                                        </xsl:attribute>
                                                    </item>
                                                </id>
                                                <!--姓名-->
                                                <name xsi:type="DSET_EN">
                                                    <item>
                                                        <part value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="PatientName"/>
                                                            </xsl:attribute>
                                                        </part>
                                                    </item>
                                                </name>
                                            </patientPerson>
                                            <providerOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id>
                                                    <item root="2.16.156.10011.1.5" extension="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="ProviderOrganizationId"/>
                                                        </xsl:attribute>
                                                    </item>
                                                </id>
                                                <name xsi:type="DSET_EN">
                                                    <item>
                                                        <part value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="ProviderOrganizationName"/>
                                                            </xsl:attribute>
                                                        </part>
                                                    </item>
                                                </name>
                                                <!--科室标识-->
                                                <organizationContains classCode="PART">
                                                    <id>
                                                        <item root="2.16.156.10011.1.26" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="ProviderOrganizationDeptCode"/>
                                                            </xsl:attribute>
                                                        </item>
                                                    </id>
                                                </organizationContains>
                                            </providerOrganization>
                                        </patient>
                                    </recordTarget>
                                    <!--文档创建者-->
                                    <author typeCode="AUT">
                                        <time/>
                                        <assignedAuthor classCode="ASSIGNED">
                                            <id>
                                                <item root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="AssignedAuthorName"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                                <name xsi:type="DSET_EN">
                                                    <item>
                                                        <part value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="RepresentedOrganizationCode"/>
                                                            </xsl:attribute>
                                                        </part>
                                                    </item>
                                                </name>
                                            </assignedPerson>
                                        </assignedAuthor>
                                    </author>
                                    <!--文档保管单位-->
                                    <custodian typeCode="CST">
                                        <assignedCustodian classCode="ASSIGNED">
                                            <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id>
                                                    <item root="2.16.156.10011.1.5" extension="">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="RepresentedOrganizationCode"/>
                                                        </xsl:attribute>
                                                    </item>
                                                </id>
                                                <name xsi:type="DSET_EN">
                                                    <item>
                                                        <part value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="RepresentedOrganizationName"/>
                                                            </xsl:attribute>
                                                        </part>
                                                    </item>
                                                </name>
                                            </representedOrganization>
                                        </assignedCustodian>
                                    </custodian>
                                </clinicalDocument>
                            </subject>
                        </xsl:for-each>
                        <queryAck>
                            <queryId extension="">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="QueryID"/>
                                </xsl:attribute>
                            </queryId>
                            <queryResponseCode code="">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="QueryResponseCode"/>
                                </xsl:attribute>
                            </queryResponseCode>
                            <resultTotalQuantity value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="ResultTotalQuantity"/>
                                </xsl:attribute>
                            </resultTotalQuantity>
                        </queryAck>
                    </controlActProcess>
                </xsl:when>
                <xsl:otherwise>
                    <controlActProcess classCode="CACT" moodCode="EVN">
                        <queryAck>
                            <queryId extension="">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="QueryID"/>
                                </xsl:attribute>
                            </queryId>
                            <queryResponseCode/>
                        </queryAck>
                    </controlActProcess>
                </xsl:otherwise>
            </xsl:choose>
        </RCMR_IN000030UV01>
    </xsl:template>
</xsl:stylesheet>
