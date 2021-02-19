<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0403Rt">
        <PRPM_IN306010UV01 xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPM_IN306010UV01.xsd">
            <id root=" 2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </creationTime>
            <processingCode code="P"/>
            <processingModeCode/>
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <telecom/>
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
                <telecom/>
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
                <queryByParameterPayload>
                    <statusCode code="new"/>
                    <administrativeGender>
                        <value code="" codeSystem="2.16.156.10011.2.3.3.4">
                            <xsl:attribute name="code">
                                <xsl:value-of select="GenderCode"/>
                            </xsl:attribute>
                            <displayName value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="GenderName"/>
                                </xsl:attribute>
                            </displayName>
                        </value>
                    </administrativeGender>
                    <dOB>
                        <value>
                            <low value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="BirthTimeLow"/>
                                </xsl:attribute>
                            </low>
                            <high value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="BirthTimeHigh"/>
                                </xsl:attribute>
                            </high>
                        </value>
                    </dOB>
                    <providerID>
                        <!--医护人员标识-->
                        <value root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="ProviderWorkNo"/>
                            </xsl:attribute>
                        </value>
                        <!--医护人员身份证件号码-->
                        <value root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="IDCardNo"/>
                            </xsl:attribute>
                        </value>
                    </providerID>
                    <providerName>
                        <value>
                            <part value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="ProviderName"/>
                                </xsl:attribute>
                            </part>
                        </value>
                    </providerName>
                </queryByParameterPayload>
            </controlActProcess>
        </PRPM_IN306010UV01>
    </xsl:template>
</xsl:stylesheet>
