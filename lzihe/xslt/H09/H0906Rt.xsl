<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0906Rt">
        <QUMT_IN020030UV01 ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/QUMT_IN020030UV01.xsd">
            <!-- 消息ID -->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <!-- 消息创建时间 -->
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </creationTime>
            <!-- 消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="QUMT_IN020030UV01"/>
            <!--处理代码，标识此消息是否是产品、训练、调试系统的一部分。D：调试；P：产品；T：训练 -->
            <processingCode code="P"/>
            <!-- 消息处理模式: A(Archive); I(Initial load); R(Restore from archive); T(Current processing) -->
            <processingModeCode/>
            <!-- 消息应答: AL(Always); ER(Error/reject only); NE(Never) -->
            <acceptAckCode code="AL"/>
            <!-- 接受者 -->
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <!-- 接受者ID -->
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Receiver"/>
                            </xsl:attribute>
                        </item>
                    </id>
                </device>
            </receiver>
            <!-- 发送者 -->
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <!-- 发送者ID -->
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Sender"/>
                            </xsl:attribute>
                        </item>
                    </id>
                </device>
            </sender>
            <!-- 封装的消息内容 -->
            <controlActProcess classCode="CACT" moodCode="EVN">
                <queryByParameter>
                    <statusCode code="new"/>
                    <queryByParameterPayload>
                        <statusCode code="new"/>
                        <actId>
                            <value>
                                <!--申请单编号-->
                                <item root="2.16.156.10011.1.24" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="AppInfoID"/>
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
                            <value>
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
                        <!--患者ID-->
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