<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0902Rp">
        <MCCI_IN000002UV01 ITSVersion="XML_1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/MCCI_IN000002UV01.xsd">
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
            <interactionId root="2.16.156.10011.2.5.1.2" extension="MCCI_IN000002UV01"/>
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
            <acknowledgement typeCode="">
                <xsl:attribute name="typeCode">
                    <xsl:value-of select="ResultCode"/>
                </xsl:attribute>
                <!--请求消息ID-->
                <targetMessage>
                    <id root="2.16.156.10011.2.5.1.1" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="RequestMsgID"/>
                        </xsl:attribute>
                    </id>
                </targetMessage>
                <acknowledgementDetail>
                    <text value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="ResultDesc"/>
                        </xsl:attribute>
                    </text>
                </acknowledgementDetail>
            </acknowledgement>
        </MCCI_IN000002UV01>
    </xsl:template>
</xsl:stylesheet>
