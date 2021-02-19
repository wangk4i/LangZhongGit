<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0711Rt">
        <PRPA_IN302012UV ITSVersion="XML_1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:v3="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPA_IN302012UV.xsd">
            <!--id-消息流水号-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <!--creationTime-消息创建时间-->
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <!--interactionId-消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN302012UV"/>
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
            <controlActProcess classCode="STC" moodCode="APT">
                <subject typeCode="SUBJ">
                    <encounterEvent classCode="ENC" moodCode="EVN">
                        <id>
                            <!--住院号-->
                            <item root="2.16.156.10011.1.12" extension="">
                                <xsl:attribute name="extension"><xsl:value-of select="HospitalizationId"/></xsl:attribute>
                            </item>
                            <!-- 就诊次数 -->
                            <item extension="" root="2.16.156.10011.2.5.1.8">
                                <xsl:attribute name="extension"><xsl:value-of select="VisitNum"/></xsl:attribute>
                            </item>
                            <!-- 就诊流水号 -->
                            <item extension="" root="2.16.156.10011.2.5.1.9">
                                <xsl:attribute name="extension"><xsl:value-of select="AdmID"/></xsl:attribute>
                            </item>
                        </id>
                        <subject typeCode="SBJ">
                            <patient classCode="PAT">
                                <id>
                                    <!--PatientID-->
                                    <item root="2.16.156.10011.2.5.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="PatientID"/></xsl:attribute>
                                    </item>
                                </id>
                            </patient>
                        </subject>
                        <!--转入科室信息-->
                        <location1 typeCode="DST">
                            <!--转入日期时间-->
                            <time xsi:type="IVL_TS" >
                                <low value="">
                                    <xsl:attribute name="extension"><xsl:value-of select="TransInTime"/></xsl:attribute>
                                </low>
                            </time>
                            <statusCode/>
                            <serviceDeliveryLocation classCode="SDLOC">
                                <location classCode="PLC" determinerCode="INSTANCE">
                                    <id>
                                        <item root="2.16.156.10011.1.26" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="TransInDeptCode"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="TransInDeptName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                    <locatedEntityHasParts classCode="LOCE">
                                        <locatedPlace classCode="PLC" determinerCode="INSTANCE">
                                            <id>
                                                <item root="2.16.156.10011.1.27" extension="">
                                                    <xsl:attribute name="extension"><xsl:value-of select="TransInAreaCode"/></xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="DSET_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="TransInAreaName"/></xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <locatedEntityHasParts classCode="LOCE">
                                                <locatedPlace classCode="PLC" determinerCode="INSTANCE">
                                                    <id>
                                                        <item root="2.16.156.10011.1.21" extension="">
                                                            <xsl:attribute name="extension"><xsl:value-of select="TransInRoomCode"/></xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <name xsi:type="DSET_EN">
                                                        <item>
                                                            <part value="">
                                                                <xsl:attribute name="value"><xsl:value-of select="TransInRoomName"/></xsl:attribute>
                                                            </part>
                                                        </item>
                                                    </name>
                                                    <locatedEntityHasParts classCode="LOCE">
                                                        <locatedPlace classCode="PLC" determinerCode="INSTANCE">
                                                            <id>
                                                                <item root="2.16.156.10011.1.22" extension="">
                                                                    <xsl:attribute name="extension"><xsl:value-of select="TransInBedCode"/></xsl:attribute>
                                                                </item>
                                                            </id>
                                                            <name xsi:type="DSET_EN">
                                                                <item>
                                                                    <part value="">
                                                                        <xsl:attribute name="value"><xsl:value-of select="TransInBedName"/></xsl:attribute>
                                                                    </part>
                                                                </item>
                                                            </name>
                                                        </locatedPlace>
                                                    </locatedEntityHasParts>
                                                </locatedPlace>
                                            </locatedEntityHasParts>
                                        </locatedPlace>
                                    </locatedEntityHasParts>
                                </location>
                            </serviceDeliveryLocation>
                        </location1>
                        <!--转出科室信息-->
                        <location2 typeCode="LOC">
                            <!--转出日期时间-->
                            <time xsi:type="IVL_TS" >
                                <low value="">
                                    <xsl:attribute name="value"><xsl:value-of select="TransOutTime"/></xsl:attribute>
                                </low>
                            </time>
                            <statusCode/>
                            <serviceDeliveryLocation classCode="SDLOC">
                                <location classCode="PLC" determinerCode="INSTANCE">
                                    <id>
                                        <item root="2.16.156.10011.1.26" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="TransOutDeptCode"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="TransOutDeptName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                    <locatedEntityHasParts classCode="LOCE">
                                        <locatedPlace classCode="PLC" determinerCode="INSTANCE">
                                            <id>
                                                <item root="2.16.156.10011.1.27" extension="">
                                                    <xsl:attribute name="extension"><xsl:value-of select="TransOutAreaCode"/></xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="DSET_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="TransOutAreaName"/></xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <locatedEntityHasParts classCode="LOCE">
                                                <locatedPlace classCode="PLC" determinerCode="INSTANCE">
                                                    <id>
                                                        <item root="2.16.156.10011.1.21" extension="">
                                                            <xsl:attribute name="extension"><xsl:value-of select="TransOutRoomCode"/></xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <name xsi:type="DSET_EN">
                                                        <item>
                                                            <part value="">
                                                                <xsl:attribute name="value"><xsl:value-of select="TransOutRoomName"/></xsl:attribute>
                                                            </part>
                                                        </item>
                                                    </name>
                                                    <locatedEntityHasParts classCode="LOCE">
                                                        <locatedPlace classCode="PLC" determinerCode="INSTANCE">
                                                            <id>
                                                                <item root="2.16.156.10011.1.22" extension="">
                                                                    <xsl:attribute name="extension"><xsl:value-of select="TransOutBedCode"/></xsl:attribute>
                                                                </item>
                                                            </id>
                                                            <name xsi:type="DSET_EN">
                                                                <item>
                                                                    <part value="">
                                                                        <xsl:attribute name="value"><xsl:value-of select="TransOutBedName"/></xsl:attribute>
                                                                    </part>
                                                                </item>
                                                            </name>
                                                        </locatedPlace>
                                                    </locatedEntityHasParts>
                                                </locatedPlace>
                                            </locatedEntityHasParts>
                                        </locatedPlace>
                                    </locatedEntityHasParts>
                                </location>
                            </serviceDeliveryLocation>
                        </location2>
                    </encounterEvent>
                </subject>
            </controlActProcess>
        </PRPA_IN302012UV>
    </xsl:template>
</xsl:stylesheet>