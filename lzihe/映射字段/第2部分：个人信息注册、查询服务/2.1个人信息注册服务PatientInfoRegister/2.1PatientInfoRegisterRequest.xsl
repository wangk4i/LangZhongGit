<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0201Rt">
        <PRPA_IN201311UV02 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPA_IN201314UV02.xsd">
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN201311UV02"/>
            <processingCode code="P"/>
            <processingModeCode/>
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
                        </item>
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
                        <statusCode code="active"/>
                        <subject1 typeCode="SBJ">
                            <patient classCode="PAT">
                                <!--本地系统的患者ID -->
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
                                    <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4">
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
                                    <maritalStatusCode code="" codeSystem="2.16.156.10011.2.3.3.5">
                                        <xsl:attribute name="code"><xsl:value-of select="MarriageCode"/></xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value"><xsl:value-of select="MarriageValue"/></xsl:attribute>
                                        </displayName>
                                    </maritalStatusCode>
                                    <!--民族-->
                                    <ethnicGroupCode>
                                        <item code="" codeSystem="2.16.156.10011.2.3.3.3">
                                            <xsl:attribute name="code"><xsl:value-of select="NationCode"/></xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value"><xsl:value-of select="NationValue"/></xsl:attribute>
                                            </displayName>
                                        </item>
                                    </ethnicGroupCode>
                                    <!--职业类别代码-->
                                    <asEmployee classCode="EMP">
                                        <occupationCode code="" codeSystem="2.16.156.10011.2.3.3.7">
                                            <xsl:attribute name="code"><xsl:value-of select="OccupationCode"/></xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value"><xsl:value-of select="OccupationValue"/></xsl:attribute>
                                            </displayName>
                                        </occupationCode>
                                        <employerOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <!--工作单位名称-->
                                            <name xsi:type="LIST_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="EmployerOrg"/></xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <contactParty classCode="CON">
                                                <!--工作联系电话-->
                                                <telecom xsi:type="DSET_TEL">
                                                    <item value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="EmployContactTel"/></xsl:attribute>
                                                    </item>
                                                </telecom>
                                            </contactParty>
                                        </employerOrganization>
                                    </asEmployee>
                                    <asOtherIDs classCode="PAT">
                                        <!--健康卡号-->
                                        <id>
                                            <item root="2.16.156.10011.1.19" extension="">
                                                <xsl:attribute name="extension"><xsl:value-of select="HealthCardCode"/></xsl:attribute>
                                            </item>
                                        </id>
                                        <scopingOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <!--健康卡发放机构代码-->
                                            <id>
                                                <item root="2.16.156.10011.1.5" extension="">
                                                    <xsl:attribute name="extension"><xsl:value-of select="ScopingOrgCode"/></xsl:attribute>
                                                </item>
                                            </id>
                                        </scopingOrganization>
                                    </asOtherIDs>
                                    <asOtherIDs classCode="PAT">
                                        <!--城乡居民健康档案编号-->
                                        <id>
                                            <item root="2.16.156.10011.1.2" extension="">
                                                <xsl:attribute name="extension"><xsl:value-of select="HealthRecordCode"/></xsl:attribute>
                                            </item>
                                        </id>
                                        <scopingOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <!--建档医疗机构组织机构代码-->
                                            <id>
                                                <item root="2.16.156.10011.1.5" extension="">
                                                    <xsl:attribute name="extension"><xsl:value-of select="ScopingOrgCode"/></xsl:attribute>
                                                </item>
                                            </id>
                                        </scopingOrganization>
                                    </asOtherIDs>
                                    <!--联系人-->
                                    <personalRelationship>
                                        <code code="" codeSystem="2.16.156.10011.2.3.1.34" codeSystemName="家庭关系代码">
                                            <xsl:attribute name="code"><xsl:value-of select="PersonalRelCode"/></xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value"><xsl:value-of select="PersonRelValue"/></xsl:attribute>
                                            </displayName>
                                        </code>
                                        <!--联系人电话-->
                                        <telecom xsi:type="DSET_TEL">
                                            <item value="">
                                                <xsl:attribute name="value"><xsl:value-of select="ContactPersonTel"/></xsl:attribute>
                                            </item>
                                        </telecom>
                                        <relationshipHolder1 classCode="PSN" determinerCode="INSTANCE">
                                            <!--联系人姓名-->
                                            <name xsi:type="LIST_EN">
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
                                    <!--组织机构代码-->
                                    <id>
                                        <item root="2.16.156.10011.1.5" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="ProviderOrgCode"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <!--组织机构名称-->
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="ProviderOrgName"/></xsl:attribute>
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
                                    <name xsi:type="LIST_EN">
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
        </PRPA_IN201311UV02>
    </xsl:template>
</xsl:stylesheet>