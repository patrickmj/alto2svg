<?php
class Alto2Svg
{
    public $xsltProcessor;
    public $xsl;
    public $alto;
    public $svgPath = '';
    
    public function __construct($alto)
    {
        $this->xsltProcessor = new XSLTProcessor();
        $this->xsl = new DOMDocument();
        $this->xsl->load('alto2svg.xsl');
        $this->xsltProcessor->importStylesheet($this->xsl);
        $this->setAlto($alto);
        $this->process();
    }
    
    public function process()
    {
        $svg = $this->xsltProcessor->transformToXml($this->alto);
        echo $svg;
    }
    
    protected function setAlto($alto)
    {
        if (is_string($alto)) {
            $altoDoc = new DOMDocument;
            $altoDoc->load($alto);
        } else if (get_class($alto) == 'DOMDocument') {
            $altoDoc = $alto;
        } else {
            throw new Exception('OCR document is neither a valid path to a document nor a DOMDocument');
        }
        $this->alto = $altoDoc;
    }
    
}

$toSvg = new Alto2Svg('ocr.xml');
