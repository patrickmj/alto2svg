<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2000/svg" xmlns:alto="http://www.loc.gov/standards/alto/ns-v2#"
    version="1.0">

    <xsl:template match="//alto:alto">
        <xsl:apply-templates select="//alto:Page"/>
    </xsl:template>

    <xsl:template match="alto:Page">
        <xsl:variable name="x">0</xsl:variable>
        <xsl:variable name="y">0</xsl:variable>
        <xsl:variable name="width">
            <xsl:value-of select="@WIDTH"/>
        </xsl:variable>
        <xsl:variable name="height">
            <xsl:value-of select="@HEIGHT"/>
        </xsl:variable>
<!-- actually just scaled. plus, should combine scaling/truncating into a single template somehow I've gotten weak with xsl -->        
        <xsl:variable name="scaledWidth">
            <xsl:variable name="length" select="string-length($width)"></xsl:variable>
            <xsl:value-of select="substring($width, 0, $length)"/>
        </xsl:variable>
        
        <xsl:variable name="scaledHeight">
            <xsl:variable name="length" select="string-length($height)"></xsl:variable>
            <xsl:value-of select="substring($height, 0, $length)"/>
        </xsl:variable>

        <svg width="500%" height="500%">
            <rect class="frontpage" x="0" y="0"  fill="white" stroke-width="3" stroke="blue" width="{$scaledWidth}" height="{$scaledHeight}"/>

            <xsl:apply-templates/>

        </svg>
    </xsl:template>

    <xsl:template match="alto:PrintSpace">

        <xsl:apply-templates select="*"/>
    </xsl:template>

    <xsl:template match="alto:TextBlock">
        <xsl:variable name="width">
            <xsl:value-of select="@WIDTH"/>
        </xsl:variable>
        <xsl:variable name="height">
            <xsl:value-of select="@HEIGHT"/>
        </xsl:variable>
        <xsl:variable name="x">
            <xsl:value-of select="@HPOS"/>
        </xsl:variable>
        <xsl:variable name="y">
            <xsl:value-of select="@VPOS"/>
        </xsl:variable>


<!-- 'scaled here really means truncated, but I hope to do something more akin to real scaling eventually -->
        <xsl:variable name="scaledWidth">
            <xsl:variable name="length" select="string-length($width)"></xsl:variable>
            <xsl:value-of select="substring($width, 0, $length)"/>
        </xsl:variable>
        
        <xsl:variable name="scaledHeight">
            <xsl:variable name="length" select="string-length($height)"></xsl:variable>
            <xsl:value-of select="substring($height, 0, $length)"/>
        </xsl:variable>

        <xsl:variable name="scaledX">
            <xsl:variable name="length" select="string-length($x)"></xsl:variable>
            <xsl:value-of select="substring($x, 0, $length)"/>
        </xsl:variable>

        <xsl:variable name="scaledY">
            <xsl:variable name="length" select="string-length($y)"></xsl:variable>
            <xsl:value-of select="substring($y, 0, $length)"/>
        </xsl:variable>
        <xsl:variable name="id" select="@ID"/>
        <rect class="textblock" id="{$id}" stroke="red" fill='gray' stroke-width="1" x="{$scaledX}"
            y="{$scaledY}" width="{$scaledWidth}" height="{$height}"/>
    </xsl:template>

</xsl:stylesheet>
