<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0702Rt">
        <PRPA_IN201314UV02 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPA_IN201314UV02.xsd">
            <!--id-消息流水号-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <!--creationTime-消息创建时间-->
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <!--interactionId-消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN201314UV02"/>
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
                <subject typeCode="SUBJ">
                    <registrationRequest classCode="REG" moodCode="RQO">
                        <statusCode/>
                        <subject1 typeCode="SBJ">
                            <patient classCode="PAT">
                                <id>
                                    <!--就诊卡标识-->
                                    <item root="2.16.156.10011.2.5.1.6" extension="就诊卡ID">
                                        <xsl:attribute name="extension"><xsl:value-of select="EncounterCardID"/></xsl:attribute>
                                    </item>
                                </id>
                                <!--就诊卡状态：active-激活；作废-diable；退卡-retired-->
                                <statusCode code="active"/>
                                <!--建卡日期时间-->
                                <effectiveTime>
                                    <low value="20111212141414">
                                        <xsl:attribute name="value"><xsl:value-of select="EffectiveTime"/></xsl:attribute>
                                    </low>
                                </effectiveTime>
                                <patientPerson>
                                    <!--身份证号-->
                                    <id>
                                        <item root="2.16.156.10011.1.3" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="IDCardNo"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <!--姓名-->
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="PatientName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                    <!--联系电话-->
                                    <telecom xsi:type="DSET_TEL">
                                        <item value="">
                                            <xsl:attribute name="value"><xsl:value-of select="TelPhone"/></xsl:attribute>
                                        </item>
                                    </telecom>
                                    <!--性别-->
                                    <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                                        <xsl:attribute name="code"><xsl:value-of select="GenderCode"/></xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value"><xsl:value-of select="GenderName"/></xsl:attribute>
                                        </displayName>
                                    </administrativeGenderCode>
                                    <!--出生时间-->
                                    <birthTime value="">
                                        <xsl:attribute name="value"><xsl:value-of select="BirthTime"/></xsl:attribute>
                                    </birthTime>
                                    <!--联系地址-->
                                    <addr xsi:type="LIST_AD">
                                        <item>
                                            <!--非结构化地址（完整地址描述） -->
                                            <part type="SAL" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="SAL"/></xsl:attribute>
                                            </part>
                                            <!--地址-省（自治区、直辖市）   -->
                                            <part type="STA" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="STA"/></xsl:attribute>
                                            </part>
                                            <!--地址-市（地区）   -->
                                            <part type="CTY" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="CTY"/></xsl:attribute>
                                            </part>
                                            <!--地址-县（区）   -->
                                            <part type="CNT" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="CNT"/></xsl:attribute>
                                            </part>
                                            <!-- 地址-乡（镇、街道办事处）   -->
                                            <part type="STB" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="STB"/></xsl:attribute>
                                            </part>
                                            <!-- 地址-村（街、路、弄等）   -->
                                            <part type="STR" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="STR"/></xsl:attribute>
                                            </part>
                                            <!-- 地址-门牌号码 -->
                                            <part type="BNR" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="BNR"/></xsl:attribute>
                                            </part>
                                            <!-- 邮政编码-->
                                            <part type="ZIP" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="ZIP"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </addr>
                                    <!--婚姻状况-->
                                    <maritalStatusCode code="" codeSystem="2.16.156.10011.2.3.3.5" codeSystemName="婚姻状况代码表(GB/T 2261.2)">
                                        <xsl:attribute name="code"><xsl:value-of select="MarriageCode"/></xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value"><xsl:value-of select="MarriageValue"/></xsl:attribute>
                                        </displayName>
                                    </maritalStatusCode>
                                    <!--民族-->
                                    <ethnicGroupCode>
                                        <item code="" codeSystem="2.16.156.10011.2.3.3.3" codeSystemName="民族类别代码表(GB 3304)">
                                            <xsl:attribute name="code"><xsl:value-of select="NationCode"/></xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value"><xsl:value-of select="NationValue"/></xsl:attribute>
                                            </displayName>
                                        </item>
                                    </ethnicGroupCode>
                                    <!--职业类别代码-->
                                    <asEmployee classCode="EMP">
                                        <occupationCode code="" codeSystem="2.16.156.10011.2.3.3.7" codeSystemName="职业类别代码表(GB/T 6565)">
                                            <xsl:attribute name="code"><xsl:value-of select="OccupationCode"/></xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value"><xsl:value-of select="OccupationValue"/></xsl:attribute>
                                            </displayName>
                                        </occupationCode>
                                        <employerOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <!--工作单位名称-->
                                            <name xsi:type="DSET_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="EmployerOrg"/></xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <contactParty classCode="CON">
                                                <!--工作联系电话-->
                                                <telecom xsi:type="BAG_TEL">
                                                    <item use="WP" value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="EmployContactTel"/></xsl:attribute>
                                                    </item>
                                                </telecom>
                                            </contactParty>
                                        </employerOrganization>
                                    </asEmployee>
                                    <!--联系人-->
                                    <personalRelationship>
                                        <code code="" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表(GB/T 4761)">
                                            <xsl:attribute name="code"><xsl:value-of select="PersonalRelCode"/></xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value"><xsl:value-of select="PersonRelValue"/></xsl:attribute>
                                            </displayName>
                                        </code>
                                        <!--联系人电话-->
                                        <telecom xsi:type="BAG_TEL">
                                            <item use="H" value="">
                                                <xsl:attribute name="value"><xsl:value-of select="ContactPersonTel"/></xsl:attribute>
                                            </item>
                                        </telecom>
                                        <relationshipHolder1 classCode="PSN" determinerCode="INSTANCE">
                                            <!--联系人姓名-->
                                            <name xsi:type="DSET_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="ContactPersonName"/></xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                        </relationshipHolder1>
                                    </personalRelationship>
                                </patientPerson>
                                <providerOrganization classCode="ORG" determinerCode="INSTANCE">
                                    <id>
                                        <item root="2.16.156.10011.1.5" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="ProviderOrgCode"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="ProviderOrgNam"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                    <contactParty classCode="CON"/>
                                </providerOrganization>
                                <!--医疗保险信息-->
                                <coveredPartyOf typeCode="COV">
                                    <coverageRecord classCode="COV" moodCode="EVN">
                                        <beneficiary typeCode="BEN">
                                            <beneficiary classCode="MBR">
                                                <code code="" codeSystem="2.16.156.10011.2.3.1.248" codeSystemName="医疗保险类别代码">
                                                    <xsl:attribute name="code"><xsl:value-of select="BeneficiaryCode"/></xsl:attribute>
                                                    <displayName value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="BeneficiaryValue"/></xsl:attribute>
                                                    </displayName>
                                                </code>
                                            </beneficiary>
                                        </beneficiary>
                                    </coverageRecord>
                                </coveredPartyOf>
                            </patient>
                        </subject1>
                        <author typeCode="AUT">
                            <assignedEntity classCode="ASSIGNED">
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="AssignedPersonCode"/></xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="AssignedPersonName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                            </assignedEntity>
                        </author>
                    </registrationRequest>
                </subject>
            </controlActProcess>
        </PRPA_IN201314UV02>
    </xsl:template>
</xsl:stylesheet>