<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0032">
        <ClinicalDocument xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns ="urn:hl7-org:v3">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.52"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0032" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>住院病案首页</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality" displayName="正常访问保密级别"/>
            <languageCode code="zh-CN"/>
            <setId>
                <xsl:value-of select="DocSetID"/>
            </setId>
            <versionNumber>
                <xsl:value-of select="Version"/>
            </versionNumber>
            <!--文档记录对象（患者）-->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!-- 健康卡号 -->
                    <id root="2.16.156.10011.1.19" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HealthCardCode"/>
                        </xsl:attribute>
                    </id>
                    <!-- 住院号标识 -->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <!-- 病案号标识 -->
                    <id root="2.16.156.10011.1.13" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="RecordID"/>
                        </xsl:attribute>
                    </id>
                    <!-- 现住址 -->
                    <addr use="H">
                        <houseNumber>
                            <xsl:value-of select="LivingAddrInfo/LivingHouseNumber"/>
                        </houseNumber>
                        <streetName>
                            <xsl:value-of select="LivingAddrInfo/LivingstreetName"/>
                        </streetName>
                        <township>
                            <xsl:value-of select="LivingAddrInfo/LivingTownship"/>
                        </township>
                        <county>
                            <xsl:value-of select="LivingAddrInfo/LivingCounty"/>
                        </county>
                        <city>
                            <xsl:value-of select="LivingAddrInfo/LivingCity"/>
                        </city>
                        <state>
                            <xsl:value-of select="LivingAddrInfo/LivingState"/>
                        </state>
                        <postalCode>
                            <xsl:value-of select="LivingAddrInfo/LivingPostalCode"/>
                        </postalCode>
                    </addr>
                    <telecom value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Telecom"/>
                        </xsl:attribute>
                    </telecom>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <birthTime value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/BirthTime"/>
                            </xsl:attribute>
                        </birthTime>
                        <maritalStatusCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.5" codeSystemName="婚姻状况代码表(GB/T 2261.2)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="MarriageCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="MarriageName"/>
                            </xsl:attribute>
                        </maritalStatusCode>
                        <ethnicGroupCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.3" codeSystemName="民族类别代码表(GB 3304)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="NationCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="NationName"/>
                            </xsl:attribute>
                        </ethnicGroupCode>
                        <!-- 出生地 -->
                        <birthplace>
                            <place classCode="PLC" determinerCode="INSTANCE">
                                <addr>
                                    <county>
                                        <xsl:value-of select="BirthAddrInfo/BirthCounty"/>
                                    </county>
                                    <city>
                                        <xsl:value-of select="BirthAddrInfo/BirthCity"/>
                                    </city>
                                    <state>
                                        <xsl:value-of select="BirthAddrInfo/BirthState"/>
                                    </state>
                                    <postalCode>
                                        <xsl:value-of select="BirthAddrInfo/BirthPostalCode"/>
                                    </postalCode>
                                </addr>
                            </place>
                        </birthplace>
                        <!-- 国籍 -->
                        <nationality code="" codeSystem="2.16.156.10011.2.3.3.1" codeSystemName="世界各国和地区名称代码(GB/T 2659)" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="NationalityCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="NationalityName"/>
                            </xsl:attribute>
                        </nationality>
                        <!-- 年龄 -->
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                        <!-- 工作单位 -->
                        <employerOrganization>
                            <name>
                                <xsl:value-of select="WorkPlaceInfo/WorkPlaceName"/>
                            </name>
                            <telecom value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="WorkPlaceInfo/WorkTelPhone"/>
                                </xsl:attribute>
                            </telecom>
                            <!-- 工作地址 -->
                            <addr use="WP">
                                <houseNumber>
                                    <xsl:value-of select="WorkPlaceInfo/WorkPlaceAddrInfo/WorkHouseNumber"/>
                                </houseNumber>
                                <streetName>
                                    <xsl:value-of select="WorkPlaceInfo/WorkPlaceAddrInfo/WorkStreetName"/>
                                </streetName>
                                <township>
                                    <xsl:value-of select="WorkPlaceInfo/WorkPlaceAddrInfo/WorkTownship"/>
                                </township>
                                <county>
                                    <xsl:value-of select="WorkPlaceInfo/WorkPlaceAddrInfo/WorkCounty"/>
                                </county>
                                <city>
                                    <xsl:value-of select="WorkPlaceInfo/WorkPlaceAddrInfo/WorkCity"/>
                                </city>
                                <state>
                                    <xsl:value-of select="WorkPlaceInfo/WorkPlaceAddrInfo/WorkState"/>
                                </state>
                                <postalCode>
                                    <xsl:value-of select="WorkPlaceInfo/WorkPlaceAddrInfo/WorkPostalCode"/>
                                </postalCode>
                            </addr>
                        </employerOrganization>
                        <!-- 户口信息 -->
                        <household>
                            <place classCode="PLC" determinerCode="INSTANCE">
                                <addr>
                                    <houseNumber>
                                        <xsl:value-of select="PermanentAddrInfo/PermanentHouseNumber"/>
                                    </houseNumber>
                                    <streetName>
                                        <xsl:value-of select="PermanentAddrInfo/PermanentStreetName"/>
                                    </streetName>
                                    <township>
                                        <xsl:value-of select="PermanentAddrInfo/PermanentTownship"/>
                                    </township>
                                    <county>
                                        <xsl:value-of select="PermanentAddrInfo/PermanentCounty"/>
                                    </county>
                                    <city>
                                        <xsl:value-of select="PermanentAddrInfo/PermanentCity"/>
                                    </city>
                                    <state>
                                        <xsl:value-of select="PermanentAddrInfo/PermanentState"/>
                                    </state>
                                    <postalCode>
                                        <xsl:value-of select="PermanentAddrInfo/PermanentPostalCode"/>
                                    </postalCode>
                                </addr>
                            </place>
                        </household>
                        <!-- 籍贯信息 -->
                        <nativePlace>
                            <place classCode="PLC" determinerCode="INSTANCE">
                                <addr>
                                    <city>
                                        <xsl:value-of select="OriginCity"/>
                                    </city>
                                    <state>
                                        <xsl:value-of select="OriginState"/>
                                    </state>
                                </addr>
                            </place>
                        </nativePlace>
                        <!--职业状况-->
                        <occupation>
                            <occupationCode code="" codeSystem="2.16.156.10011.2.3.3.13" codeSystemName="从业状况(个人身体)代码表(GB/T 2261.4)" displayName="">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="OccupationCode"/>
                                </xsl:attribute>
                                <xsl:attribute name="displayName">
                                    <xsl:value-of select="OccupationName"/>
                                </xsl:attribute>
                            </occupationCode>
                        </occupation>
                    </patient>
                    <!--提供患者服务机构-->
                    <providerOrganization classCode="ORG" determinerCode="INSTANCE">
                        <!--机构标识号-->
                        <id root="2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="ProviderOrgCode"/>
                            </xsl:attribute>
                        </id>
                        <!--住院机构名称-->
                        <name>
                            <xsl:value-of select="ProviderOrgName"/>
                        </name>
                    </providerOrganization>
                </patientRole>
            </recordTarget>
            <!-- 文档创作者 -->
            <author typeCode="AUT" contextControlCode="OP">
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="RecordTime"/>
                    </xsl:attribute>
                </time>
                <assignedAuthor classCode="ASSIGNED">
                    <id root="2.16.156.10011.1.7" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AuthorCode"/>
                        </xsl:attribute>
                    </id>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!-- 保管机构 -->
            <custodian typeCode="CST">
                <assignedCustodian classCode="ASSIGNED">
                    <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                        <id root="2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="CustodianOrgCode"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="CustodianOrgName"/>
                        </name>
                    </representedCustodianOrganization>
                </assignedCustodian>
            </custodian>
            <!-- 科主任签名 -->
            <xsl:for-each select="DeptDirectorInfo/row">
                <legalAuthenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="科主任"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </legalAuthenticator>
            </xsl:for-each>
            <!-- 主(副主)任医师签名 -->
            <xsl:for-each select="ChiefDoctorInfo/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="主任(副主任)医师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 主治医师签名 -->
            <xsl:for-each select="AttendingDoctorInfo/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="主治医师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 住院医师签名 -->
            <xsl:for-each select="ResidentDoctorInfo/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="住院医师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 责任护士签名 -->
            <xsl:for-each select="ChargeNurseInfo/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="责任护士"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 进修医师签名 -->
            <xsl:for-each select="RefresherDoctorInfo/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="进修医师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 实习医师签名 -->
            <xsl:for-each select="InternInfo/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="实习医师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 编码员签名 -->
            <xsl:for-each select="CoderInfo/row">
                <authenticator>
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="编码员"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!--其他参与者（联系人）@typeCode: NOT(ugent notification contact)，固定值，表示不同的参与者-->
            <participant typeCode="NOT">
                <!--联系人@classCode：CON，固定值，表示角色是联系人 -->
                <xsl:for-each select="ContactInfo/row">
                    <associatedEntity classCode="ECON">
                        <!--联系人类别，表示与患者之间的关系-->
                        <code code="" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表">
                            <xsl:attribute name="code">
                                <xsl:value-of select="ContactPersonRelCode"/>
                            </xsl:attribute>
                        </code>
                        <!--联系人地址-->
                        <addr use="H">
                            <houseNumber>
                                <xsl:value-of select="ContactAddrInfo/ContactPersonHouseNumber"/>
                            </houseNumber>
                            <streetName>
                                <xsl:value-of select="ContactAddrInfo/ContactPersonStreetName"/>
                            </streetName>
                            <township>
                                <xsl:value-of select="ContactAddrInfo/ContactPersonTownship"/>
                            </township>
                            <county>
                                <xsl:value-of select="ContactAddrInfo/ContactPersonCounty"/>
                            </county>
                            <city>
                                <xsl:value-of select="ContactAddrInfo/ContactPersonCity"/>
                            </city>
                            <state>
                                <xsl:value-of select="ContactAddrInfo/ContactPersonState"/>
                            </state>
                            <postalCode>
                                <xsl:value-of select="ContactAddrInfo/ContactPersonPostalCode"/>
                            </postalCode>
                        </addr>
                        <!--电话号码-->
                        <telecom value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="ContactPersonTel"/>
                            </xsl:attribute>
                        </telecom>
                        <!--联系人-->
                        <associatedPerson classCode="PSN" determinerCode="INSTANCE">
                            <!--姓名-->
                            <name>
                                <xsl:value-of select="ContactPersonName"/>
                            </name>
                        </associatedPerson>
                    </associatedEntity>
                </xsl:for-each>
            </participant>
            <!--相关文档-->
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
            <componentOf typeCode="COMP">
                <!--就诊-->
                <encompassingEncounter classCode="ENC" moodCode="EVN">
                    <!--入院途径 -->
                    <code code="" displayName="" codeSystem="2.16.156.10011.2.3.1.270" codeSystemName="入院途径代码表">
                        <xsl:attribute name="code">
                            <xsl:value-of select="AdmissionWayCode"/>
                        </xsl:attribute>
                        <xsl:attribute name="displayName">
                            <xsl:value-of select="AdmissionWayName"/>
                        </xsl:attribute>
                    </code>
                    <!--就诊时间-->
                    <effectiveTime>
                        <!--入院日期-->
                        <low value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="AdmTimeLow"/>
                            </xsl:attribute>
                        </low>
                        <!--出院日期-->
                        <high value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="AdmTimeHigh"/>
                            </xsl:attribute>
                        </high>
                    </effectiveTime>
                    <location typeCode="LOC">
                        <healthCareFacility classCode="SDLOC">
                            <!--机构角色-->
                            <serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
                                <!--入院病房-->
                                <asOrganizationPartOf classCode="PART">
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.21" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="AdmRoomCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="AdmRoomName"/>
                                        </name>
                                        <!--入院科室-->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.26" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="AdmDeptCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="AdmDeptName"/>
                                                </name>
                                            </wholeOrganization>
                                        </asOrganizationPartOf>
                                    </wholeOrganization>
                                </asOrganizationPartOf>
                            </serviceProviderOrganization>
                        </healthCareFacility>
                    </location>
                </encompassingEncounter>
            </componentOf>
            <!--***************************************************
          文档体Body
          *******************************************************
          -->
            <component>
                <structuredBody>
                    <!--
              ********************************************************
              生命体征章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="8716-3" displayName="VITAL SIGNS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.019.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="入院体重">
                                        <qualifier>
                                            <name displayName="新生儿入院体重"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="PQ" value="" unit="g">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="NewbornAdmWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.019.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出生体重">
                                        <qualifier>
                                            <name displayName="新生儿出生体重"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="PQ" value="" unit="g">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="NewbornBirthWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
              ********************************************************
              诊断章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--门（急）诊诊断-->
                            <xsl:for-each select="DiagInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="门（急）诊诊断名称">
                                                    <qualifier>
                                                        <name displayName="门（急）诊诊断"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DiagDiseaseName"/>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="门（急）诊诊断疾病编码">
                                                    <qualifier>
                                                        <name displayName="门（急）诊诊断"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.5" codeSystemName="疾病代码表（ICD-10）">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                            <!--病理诊断-->
                            <xsl:for-each select="PathologicDiagInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!-- 病理号标识 -->
                                                <id root="2.16.156.10011.1.8" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="PathologicIDNumber"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病理诊断-疾病名称">
                                                    <qualifier>
                                                        <name displayName="病理诊断"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="PathologicDiagDiseaseName"/>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病理诊断-疾病编码">
                                                    <qualifier>
                                                        <name displayName="病理诊断"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.5" codeSystemName="疾病代码表（ICD-10）">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="PathologicDiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--
              ********************************************************
              主要健康问题章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="住院者疾病状态代码"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.100" codeSystemName="住院者疾病状态代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="InpatientDiseaseStatusCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--住院患者损伤和中毒外部原因-->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.152.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="损伤中毒的外部原因"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="InjuryPoisoningReasonDesc"/>
                                    </value>
                                    <entryRelationship typeCode="REFR" negationInd="false">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.01.078.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="损伤中毒的外部原因-疾病编码"/>
                                            <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.5" codeSystemName="疾病代码表（ICD-10）">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="InjuryPoisoningReasonCode"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--颅脑损伤患者入院前昏迷时间-->
                            <entry typeCode="COMP">
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <code displayName="颅脑损伤患者入院前昏迷时间"/>
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.138.01" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入院前昏迷时间-d"/>
                                            <value xsi:type="PQ" unit="d" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CraniocerebralInjuryBeforeAdmComaTimeDay"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.138.02" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入院前昏迷时间-h"/>
                                            <value xsi:type="PQ" unit="h" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CraniocerebralInjuryBeforeAdmComaTimeHour"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.138.03" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入院前昏迷时间-min"/>
                                            <value xsi:type="PQ" unit="min" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CraniocerebralInjuryBeforeAdmComaTimeMinute"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!--颅脑损伤患者入院后昏迷时间-->
                            <entry typeCode="COMP">
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <code displayName="颅脑损伤患者入院后昏迷时间"/>
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.138.01" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入院后昏迷时间-d"/>
                                            <value xsi:type="PQ" unit="d" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CraniocerebralInjuryAfterAdmComaTimeDay"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.138.02" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入院后昏迷时间-h"/>
                                            <value xsi:type="PQ" unit="h" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CraniocerebralInjuryAfterAdmComaTimeHour"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE05.10.138.03" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入院后昏迷时间-min"/>
                                            <value xsi:type="PQ" unit="min" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CraniocerebralInjuryAfterAdmComaTimeMinute"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                        </section>
                    </component>
                    <!--
              ********************************************************
              转科记录章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="42349-1" displayName="REASON FOR REFERRAL" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--转科条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code/>
                                    <!--转科原因（数据元）-->
                                    <author>
                                        <time/>
                                        <assignedAuthor>
                                            <id/>
                                            <representedOrganization>
                                                <!--住院患者转科科室名称-->
                                                <name>
                                                    <xsl:value-of select="TransferDeptName"/>
                                                </name>
                                            </representedOrganization>
                                        </assignedAuthor>
                                    </author>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
              ********************************************************
              出院诊断章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="11535-2" displayName="HOSPITAL DISCHARGE DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--出院诊断-主要诊断条目-->
                            <xsl:for-each select="DischargeMainDiagInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断名称">
                                                    <qualifier>
                                                        <name displayName="主要诊断名称"/>
                                                    </qualifier>
                                                </code>
                                                <!--确诊日期-->
                                                <effectiveTime value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="DischargeMainDiagTime"/>
                                                    </xsl:attribute>
                                                </effectiveTime>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DischargeMainDiagDiseaseName"/>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--住院患者疾病诊断类型-代码/住院患者疾病诊断类型-详细描述-->
                                                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断疾病编码">
                                                    <qualifier>
                                                        <name displayName="主要诊断疾病编码"/>
                                                    </qualifier>
                                                </code>
                                                <!--疾病诊断代码/疾病诊断名称-->
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DischargeMainDiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE09.00.104.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断入院病情代码">
                                                    <qualifier>
                                                        <name displayName="主要诊断入院病情代码"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.253" codeSystemName="入院病情代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="AdmMainDiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                            <!--出院诊断-其他诊断条目-->
                            <xsl:for-each select="DischargeOtherDiagInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断名称">
                                                    <qualifier>
                                                        <name displayName="其他诊断名称"/>

                                                    </qualifier>
                                                </code>
                                                <!--确诊日期-->
                                                <effectiveTime value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="DischargeOtherDiagTime"/>
                                                    </xsl:attribute>
                                                </effectiveTime>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DischargeOtherDiagName"/>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <!--住院患者疾病诊断类型-代码/住院患者疾病诊断类型-详细描述-->
                                                <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断疾病编码">
                                                    <qualifier>
                                                        <name displayName="其他诊断疾病编码"/>
                                                    </qualifier>
                                                </code>
                                                <!--疾病诊断代码/疾病诊断名称-->
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表(ICD-10)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="DischargeOtherDiagDiseaseCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE09.00.104.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断入院病情代码">
                                                    <qualifier>
                                                        <name displayName="其他诊断入院病情代码"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.253" codeSystemName="入院病情代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="AdmOtherDiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                            <!--离院方式-->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.223.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="离院方式"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.265" codeSystemName="离院方式代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DischargeMethodCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="DischargeMethodName"/>
                                        </xsl:attribute>
                                    </value>
                                    <entryRelationship typeCode="COMP" negationInd="false">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE08.10.013.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟接受医疗机构名称"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="AcceptOrganName"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
              ********************************************************
              过敏史章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="AllergiesInfo/row">
                                <entry typeCode="DRIV">
                                    <act classCode="ACT" moodCode="EVN">
                                        <code nullFlavor="NA"/>
                                        <entryRelationship typeCode="SUBJ">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE02.10.023.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="BL" value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="AllergiesSign"/>
                                                    </xsl:attribute>
                                                </value>
                                                <participant typeCode="CSM">
                                                    <participantRole classCode="MANU">
                                                        <playingEntity classCode="MMAT">
                                                            <!--住院患者过敏源-->
                                                            <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏药物"/>
                                                            <desc xsi:type="ST">
                                                                <xsl:value-of select="AllergiesDesc"/>
                                                            </desc>
                                                        </playingEntity>
                                                    </participantRole>
                                                </participant>
                                            </observation>
                                        </entryRelationship>
                                    </act>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--
              ********************************************************
              实验室检查章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry typeCode="COMP">
                                <!-- 血型-->
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <component typeCode="COMP">
                                        <!-- ABO血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表" displayName="">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="ABOBloodTypeCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="ABOBloodTypeName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component typeCode="COMP">
                                        <!-- Rh血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表" displayName="">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="RHBloodTypeCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="RHBloodTypeName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                        </section>
                    </component>
                    <!--
              ********************************************************
              手术操作章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="OperationInfo/row">
                                <entry>
                                    <!-- 1..1 手术记录 -->
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <code code="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="OperationCode"/>
                                            </xsl:attribute>
                                        </code>
                                        <statusCode/>
                                        <!--操作日期/时间-->
                                        <effectiveTime value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="OperationTime"/>
                                            </xsl:attribute>
                                        </effectiveTime>
                                        <!--手术者-->
                                        <performer>
                                            <assignedEntity>
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="OperateDoctorCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <assignedPerson>
                                                    <name>
                                                        <xsl:value-of select="OperateDoctorName"/>
                                                    </name>
                                                </assignedPerson>
                                            </assignedEntity>
                                        </performer>
                                        <!--第一助手-->
                                        <participant typeCode="ATND">
                                            <participantRole classCode="ASSIGNED">
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="FirstAssistantCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code displayName="第一助手"/>
                                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                    <name>
                                                        <xsl:value-of select="FirstAssistantName"/>
                                                    </name>
                                                </playingEntity>
                                            </participantRole>
                                        </participant>
                                        <!--第二助手-->
                                        <participant typeCode="ATND">
                                            <participantRole classCode="ASSIGNED">
                                                <id root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="SecondAssistantCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <code displayName="第二助手"/>
                                                <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                    <name>
                                                        <xsl:value-of select="SecondAssistantName"/>
                                                    </name>
                                                </playingEntity>
                                            </participantRole>
                                        </participant>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术（操作）名称"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationOPSName"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--手术级别 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.255.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术级别"/>
                                                <!--手术级别 -->
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.258" codeSystemName="手术级别代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="SurgeryLevelCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="SurgeryLevelName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--手术切口类别 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.257.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术切口类别代码"/>
                                                <!--手术级别 -->
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.256" codeSystemName="手术切口类别代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="SurgeryIncisionTypeCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--手术切口愈合等级-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.147.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术切口愈合等级"/>
                                                <!--手术切口愈合等级-->
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.257" codeSystemName="手术切口愈合等级代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="SurgeryIncisionHealCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="SurgeryIncisionHealName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!-- 0..1 麻醉信息 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉方式代码"/>
                                                <value code="" displayName="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表" xsi:type="CD">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="AnesthesiaMethodCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="AnesthesiaMethodName"/>
                                                    </xsl:attribute>
                                                </value>
                                                <performer>
                                                    <assignedEntity>
                                                        <id root="2.16.156.10011.1.4" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="AnesthetistCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <assignedPerson>
                                                            <name>
                                                                <xsl:value-of select="AnesthetistName"/>
                                                            </name>
                                                        </assignedPerson>
                                                    </assignedEntity>
                                                </performer>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--
              *******************************************************
              住院史章节
              *******************************************************
              -->
                    <component>
                        <section>
                            <code code="11336-5" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF HOSPITALIZATIONS" codeSystemName="LOINC"/>
                            <text/>
                            <!--住院次数 -->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.090.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="住院次数"/>
                                    <value xsi:type="INT" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="HospitalizationNum"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
              *******************************************************
              住院过程章节
              *******************************************************
              -->
                    <component>
                        <section>
                            <code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
                            <text/>
                            <!--实际住院天数 -->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.310.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="实际住院天数"/>
                                    <value xsi:type="PQ" value="" unit="天">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="HospitalizationDays"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <!--出院科室及病房 -->
                                <act classCode="ACT" moodCode="EVN">
                                    <code/>
                                    <author>
                                        <time/>
                                        <assignedAuthor>
                                            <id/>
                                            <representedOrganization>
                                                <!--住院患者出院病房、科室名称-->
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="DischargeRoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="DischargeRoomName"/>
                                                </name>
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="DischargeDeptCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="DischargeDeptName"/>
                                                        </name>
                                                    </wholeOrganization>
                                                </asOrganizationPartOf>
                                            </representedOrganization>
                                        </assignedAuthor>
                                    </author>
                                </act>
                            </entry>
                        </section>
                    </component>
                    <!--
              ********************************************************
              行政管理章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code displayName="行政管理"/>
                            <text/>
                            <!--亡患者尸检标志-->
                            <entry typeCode="COMP">
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE09.00.108.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡患者尸检标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="AutopsySign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--病案质量-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE09.00.103.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病案质量"/>
                                    <!-- 质控日期 -->
                                    <effectiveTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="QCTime"/>
                                        </xsl:attribute>
                                    </effectiveTime>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.2.29" codeSystemName="病案质量等级表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="RecordGradeCode"/>
                                        </xsl:attribute>
                                    </value>
                                    <author>
                                        <time/>
                                        <assignedAuthor>
                                            <id root="2.16.156.10011.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="QCDoctorCode"/>
                                                </xsl:attribute>
                                            </id>
                                            <code displayName="质控医生"/>
                                            <assignedPerson>
                                                <name>
                                                    <xsl:value-of select="QCDoctorName"/>
                                                </name>
                                            </assignedPerson>
                                        </assignedAuthor>
                                    </author>
                                    <author>
                                        <time/>
                                        <assignedAuthor>
                                            <id root="2.16.156.10011.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="QCNurseCode"/>
                                                </xsl:attribute>
                                            </id>
                                            <code displayName="质控护士"/>
                                            <assignedPerson>
                                                <name>
                                                    <xsl:value-of select="QCNurseName"/>
                                                </name>
                                            </assignedPerson>
                                        </assignedAuthor>
                                    </author>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
              ***********************************************
              治疗计划章节
              ***********************************************
              -->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!-- 有否出院31天内再住院计划 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.194.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院31d内再住院标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="ReadmissionSign"/>
                                        </xsl:attribute>
                                    </value>
                                    <entryRelationship typeCode="GEVL" negationInd="false">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.195.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院31天d再住院目的"/>
                                            <value xsi:type="ST">
                                                <xsl:value-of select="ReadmissionPurposeDesc"/>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
              ********************************************************
              费用章节
              ********************************************************
              -->
                    <component>
                        <section>
                            <code code="48768-6" displayName="PAYMENT SOURCES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--医疗付费方式 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE07.00.007.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗付费方式代码"/>
                                    <value xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.269" displayName="" codeSystemName="医疗付费方式代码表">
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PayMethodName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--住院总费用 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="HDSD00.11.142" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="住院总费用"/>
                                    <value xsi:type="MO" value="" currency="元">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="TotalHospitalExpense"/>
                                        </xsl:attribute>
                                    </value>
                                    <entryRelationship typeCode="COMP" negationInd="false">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.143" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="住院总费用-自付金额（元）"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="HospitalizationDeductibles"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--综合医疗服务费 -->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.147" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="综合医疗服务费-一般医疗服务费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="MedicalServiceFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.148" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="综合医疗服务费-一般治疗操作费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="TreatmentOperationFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.145" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="综合医疗服务费-护理费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="NursingExpense"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.146" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="综合医疗服务费-其他费用"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ComprehensiveOtherExpense"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!--诊断类服务费 -->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.121" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="诊断-病理诊断费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PathologicDiagFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.123" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="诊断-实验室诊断费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="LabDiagFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.124" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="诊断-影像学诊断费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ImagingDiagFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.122" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="诊断-临床诊断项目费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ClinicalDiagItemFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!--治疗类服务费 -->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.129" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-非手术治疗项目费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="NonSurgicalTreatmentFee"/>
                                                </xsl:attribute>
                                            </value>
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="HDSD00.11.130" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-非手术治疗项目费-临床物理治疗费"/>
                                                    <value xsi:type="MO" value="" currency="元">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="ClinicalPhysicalTherapyFee"/>
                                                        </xsl:attribute>
                                                    </value>
                                                </observation>
                                            </entryRelationship>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.131" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治疗费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="OperationTreatmentFee"/>
                                                </xsl:attribute>
                                            </value>
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="HDSD00.11.132" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治疗费-麻醉费"/>
                                                    <value xsi:type="MO" value="" currency="元">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="AnesthesiaExpense"/>
                                                        </xsl:attribute>
                                                    </value>
                                                </observation>
                                            </entryRelationship>
                                            <entryRelationship typeCode="COMP">
                                                <observation classCode="OBS" moodCode="EVN">
                                                    <code code="HDSD00.11.133" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治疗费-手术费"/>
                                                    <value xsi:type="MO" value="" currency="元">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OperationExpense"/>
                                                        </xsl:attribute>
                                                    </value>
                                                </observation>
                                            </entryRelationship>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!--康复费类服务费 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="HDSD00.11.055" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="康复费"/>
                                    <value xsi:type="MO" value="" currency="元">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="RecovereExpense"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--中医治疗费 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="HDSD00.11.136" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="中医治疗费"/>
                                    <value xsi:type="MO" value="" currency="元">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="TCMTreatmentFee"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--西药费 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="HDSD00.11.098" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="西药费"/>
                                    <value xsi:type="MO" value="" currency="元">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="WesternMedicineFee"/>
                                        </xsl:attribute>
                                    </value>
                                    <entryRelationship typeCode="COMP">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.099" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="西药费-抗菌药物费用"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="antibioticsExpense"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </entryRelationship>
                                </observation>
                            </entry>
                            <!--中药费 -->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.135" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="中药费-中成药费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ChinesePatentMedicineFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.134" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="中药费-中草药费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ChineseHerbalMedicineFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!-- 血液和血液制品类服务费 -->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.115" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="血费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="BloodExpense"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.111" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="白蛋白类制品费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AlbuminProductsExpense"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.113" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="球蛋白类制品费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="GlobulinProductsExpense"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <!-- 凝血因子类制品费 -->
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.112" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="凝血因子类制品费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CoagulationFactorProductsExpense"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <!--细胞因子类制品费 -->
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.114" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="细胞因子类制品费"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CytokineProductsExpense"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!-- 耗材类费用 -->
                            <entry>
                                <organizer classCode="CLUSTER" moodCode="EVN">
                                    <statusCode/>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.038" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="一次性医用材料费-检查用"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ExamConsumablesFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.040" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="一次性医用材料费-治疗用"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="TreatmentConsumablesFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component>
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="HDSD00.11.039" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="一次性医用材料费-手术用"/>
                                            <value xsi:type="MO" value="" currency="元">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="OperationConsumablesFee"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!--其他费 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="HSDB05.10.130" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="其他费"/>
                                    <value xsi:type="MO" value="" currency="元">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DisposableOtherExpense"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>