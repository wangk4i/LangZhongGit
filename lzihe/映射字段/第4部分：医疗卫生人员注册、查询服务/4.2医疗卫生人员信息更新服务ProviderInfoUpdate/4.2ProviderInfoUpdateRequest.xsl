<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0402Rt">
        <PRPM_IN303010UV01 xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPM_IN303010UV01.xsd">
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreTime"/>
                </xsl:attribute>
            </creationTime>
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPM_IN303010UV01"/>
            <processingCode code="P"/>
            <processingModeCode/>
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension=""/>
                    </id>
                </device>
            </receiver>
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension=""/>
                    </id>
                </device>
            </sender>
            <controlActProcess classCode="CACT" moodCode="EVN">
                <subject typeCode="SUBJ">
                    <registrationRequest classCode="REG" moodCode="RQO">
                        <statusCode code="active"/>
                        <subject1 typeCode="SBJ">
                            <healthCareProvider classCode="">
                                <!--医务人员ID-->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="ProviderWorkNo"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <!--专业技术职务代码-->
                                <code code="231" codeSystem="2.16.156.10011.2.3.3.10" codeSystemName="专业技术职务代码（ GB/T 8561-1988）">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="Subject1Code"/>
                                    </xsl:attribute>
                                    <displayName value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="Subject1CodeName"/>
                                        </xsl:attribute>
                                    </displayName>
                                </code>
                                <!--工作地址-->
                                <addr xsi:type="DSET_AD"/>
                                <!--工作联系方式：电话、邮箱地址等-->
                                <telecom xsi:type="DSET_TEL"/>
                                <!--角色状态RoleStatus-->
                                <statusCode code="active"/>
                                <!--角色有效期间-->
                                <effectiveTime>
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
                                </effectiveTime>
                                <healthCarePrincipalPerson classCode="PSN" determinerCode="INSTANCE">
                                    <!--身份证号-->
                                    <id>
                                        <item root="2.16.156.10011.1.3" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="IDCardNo"/>
                                            </xsl:attribute>
                                        </item>
                                    </id>
                                    <idCategory code="" codeSystem="2.16.156.10011.2.3.1.1" codeSystemName="身份证件类别代码表">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="IdCategoryCode"/>
                                        </xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="IdCategoryCodeName"/>
                                            </xsl:attribute>
                                        </displayName>
                                    </idCategory>
                                    <!--姓名-->
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ProviderName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                    <!--性别-->
                                    <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表（GB/T 2261.1）">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="GenderCode"/>
                                        </xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="GenderCodeName"/>
                                            </xsl:attribute>
                                        </displayName>
                                    </administrativeGenderCode>
                                    <!--出生日期-->
                                    <birthTime value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="BirthTime"/>
                                        </xsl:attribute>
                                    </birthTime>
                                    <!--隶属-->
                                    <asAffiliate classCode="AFFL">
                                        <code/>
                                        <effectiveTime/>
                                        <affiliatedPrincipalOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <!--科室号标识-->
                                            <id>
                                                <item root="2.16.156.10011.1.26" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="DeptCode"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="LIST_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="DeptCodeName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                        </affiliatedPrincipalOrganization>
                                    </asAffiliate>
                                    <!--出生地-->
                                    <birthplace classCode="">
                                        <xsl:attribute name="classCode">
                                            <xsl:value-of select="Birthplace"/>
                                        </xsl:attribute>
                                        <addr/>
                                    </birthplace>
                                </healthCarePrincipalPerson>
                            </healthCareProvider>
                        </subject1>
                        <!--申请者-->
                        <author typeCode="AUT">
                            <assignedEntity classCode="ASSIGNED">
                                <!--医务人员ID-->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AssignedEntityWorkNo"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AssignedEntityName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                                <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                    <!--科室号标识-->
                                    <id>
                                        <item root="2.16.156.10011.1.26" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="AssignedEntityDeptId"/>
                                            </xsl:attribute>
                                        </item>
                                    </id>
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AssignedEntityDeptName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                    <contactParty classCode="CON">
                                        <contactPerson classCode="PSN" determinerCode="INSTANCE">
                                            <name xsi:type="LIST_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="AssignedEntityDeptContact"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                        </contactPerson>
                                    </contactParty>
                                </representedOrganization>
                            </assignedEntity>
                        </author>
                    </registrationRequest>
                </subject>
            </controlActProcess>
        </PRPM_IN303010UV01>
    </xsl:template>
</xsl:stylesheet>
