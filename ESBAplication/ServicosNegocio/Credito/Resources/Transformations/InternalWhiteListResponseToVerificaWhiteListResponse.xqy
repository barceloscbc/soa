xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
declare namespace ns1="http://whitelist.com.br/SN/WhiteList";
(:: import schema at "../Interfaces/Schemas/InternalWhiteList.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $parametro as element() (:: schema-element(ns1:ResultadoWhiteList) ::) external;

declare function local:func($parametro as element() (:: schema-element(ns1:ResultadoWhiteList) ::)) as element() (:: schema-element(ns2:resultadoVerificaWhiteList) ::) {
    <ns2:resultadoVerificaWhiteList>
        <ns2:mensagemRetorno>
            <cle:Codigo>{fn:data($parametro/ns1:num_documento)}</cle:Codigo>
            <cle:descricao></cle:descricao>
            <cle:isAtivo>{fn:data($parametro/ns1:indica_white_list)}</cle:isAtivo>
        </ns2:mensagemRetorno>
    </ns2:resultadoVerificaWhiteList>
};

local:func($parametro)
