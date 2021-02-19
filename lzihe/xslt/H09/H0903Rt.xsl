<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0903Rt">
        <QUMT_IN020030UV01 ITSVersion="XML_1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/QUMT_IN020030UV01.xsd">
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </creationTime>
            <interactionId root="2.16.156.10011.2.5.1.2" extension="QUMT_IN020030UV01" displayable="true"/>
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
                <queryByParameter>
                    <statusCode code="new"/>
                    <queryByParameterPayload>
                        <statusCode code="new"/>
                        <actId>
                            <value>
                                <!--申请单ID-->
                                <item root="2.16.156.10011.1.24" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="ExamAppInfoID"/>
                                    </xsl:attribute>
                                </item>
                                <!--住院号-->
                                <item root="2.16.156.10011.1.12" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="HospitalizationId"/>
                                    </xsl:attribute>
                                </item>
                                <!--门诊号-->
                                <item root="2.16.156.10011.1.11" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="OutpatientId"/>
                                    </xsl:attribute>
                                </item>
                                <!--标本ID/或者称条码ID-->
                                <item root="2.16.156.10011.1.14" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="SpecimenID"/>
                                    </xsl:attribute>
                                </item>
                            </value>
                        </actId>
                        <!--申请单开立者ID(医务人员ID)-->
                        <authorId>
                            <value>
                                <item root="2.16.156.10011.1.4" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="AuthorID"/>
                                    </xsl:attribute>
                                </item>
                            </value>
                        </authorId>
                        <!--申请单有效期间-->
                        <effectiveTime>
                            <value xsi:type="IVL_TS">
                                <low value="">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="EffectiveTimeLow"/>
                                    </xsl:attribute>
                                </low>
                                <high value="">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="EffectiveTimeHigh"/>
                                    </xsl:attribute>
                                </high>
                            </value>
                        </effectiveTime>
                        <!--患者标识符-->
                        <patientId>
                            <value>
                                <!-- 身份证号 -->
                                <item extension="" root="2.16.156.10011.1.3">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="IDCardNo"/>
                                    </xsl:attribute>
                                </item>
                                <!-- 医保卡号 -->
                                <item extension="" root="2.16.156.10011.1.15">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="MedicalInsuranceCard"/>
                                    </xsl:attribute>
                                </item>
                                <!-- 患者ID -->
                                <item root="2.16.156.10011.2.5.1.4" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="PatientID"/>
                                    </xsl:attribute>
                                </item>
                            </value>
                        </patientId>
                    </queryByParameterPayload>
                </queryByParameter>
            </controlActProcess>
        </QUMT_IN020030UV01>
    </xsl:template>
</xsl:stylesheet>