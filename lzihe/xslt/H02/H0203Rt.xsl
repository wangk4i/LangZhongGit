<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0203Rt">
        <PRPA_IN201304UV02 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPA_IN201304UV02.xsd">
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN201304UV02 "/>
            <processingCode code="P"/>
            <processingModeCode/>
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
            <controlActProcess classCode="CACT" moodCode="EVN">
                <subject typeCode="SUBJ">
                    <registrationEvent classCode="REG" moodCode="EVN">
                        <statusCode code="active"/>
                        <subject1 typeCode="SBJ">
                            <patient classCode="PAT">
                                <!--要合并到的本地系统患者ID-->
                                <id>
                                    <item root="2.16.156.10011.2.5.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="PatientID"/></xsl:attribute>
                                    </item>
                                </id>
                                <statusCode code="active"/>
                                <effectiveTime>
                                    <any value="">
                                        <xsl:attribute name="value"><xsl:value-of select="EffectiveTime"/></xsl:attribute>
                                    </any>
                                </effectiveTime>
                                <patientPerson>
                                    <!--身份证号-->
                                    <id>
                                        <item root="2.16.156.10011.1.3" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="IDCardNo"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <idCategory code="" codeSystem="2.16.156.10011.2.3.1.1" codeSystemName="身份证件类别代码表">
                                            <xsl:attribute name="code"><xsl:value-of select="IDCategoryCode"/></xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value"><xsl:value-of select="IDCategoryName"/></xsl:attribute>
                                        </displayName>
                                    </idCategory>
                                    <!--姓名-->
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="MergeName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </patientPerson>
                            </patient>
                        </subject1>
                        <custodian typeCode="CST">
                            <assignedEntity classCode="ASSIGNED">
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="OperateCode"/></xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="OperateName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                            </assignedEntity>
                        </custodian>
                        <replacementOf typeCode="RPLC">
                            <priorRegistration classCode="REG" moodCode="EVN">
                                <statusCode code="obsolete"/>
                                <subject1 typeCode="SBJ">
                                    <priorRegisteredRole classCode="PAT">
                                        <!--本地系统被合并的患者ID-->
                                        <id>
                                            <item root="2.16.156.10011.2.5.1.4" extension="">
                                                <xsl:attribute name="extension"><xsl:value-of select="MergeID"/></xsl:attribute>
                                            </item>
                                        </id>
                                    </priorRegisteredRole>
                                </subject1>
                            </priorRegistration>
                        </replacementOf>
                    </registrationEvent>
                </subject>
            </controlActProcess>
        </PRPA_IN201304UV02>
    </xsl:template>
</xsl:stylesheet>