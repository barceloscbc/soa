xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $param as element() (:: schema-element(ns1:parametrosVerificaCreditoGeral) ::) external;

declare function local:func($param as element() (:: schema-element(ns1:parametrosVerificaCreditoGeral) ::)) as element() (:: schema-element(ns1:resultadoVerificaCreditoGeral) ::) {
    <ns1:resultadoVerificaCreditoGeral>
        <ns1:credito>
            <cle:pessoa>
                <cle:id>{fn:data($param/ns1:pessoa/cle:id)}</cle:id>
                <cle:nome>{fn:data($param/ns1:pessoa/cle:nome)}</cle:nome>
                <cle:dataNascimento>{fn:data($param/ns1:pessoa/cle:dataNascimento)}</cle:dataNascimento>
                <cle:cpf>{fn:data($param/ns1:pessoa/cle:cpf)}</cle:cpf>
                <cle:telefone>{fn:data($param/ns1:pessoa/cle:telefone)}</cle:telefone>
            </cle:pessoa>
            <cle:indicaCreditoExterno></cle:indicaCreditoExterno>
            <cle:indicaCreditoInterno></cle:indicaCreditoInterno>
            <cle:indicaWhiteList></cle:indicaWhiteList>
            <cle:situacao></cle:situacao>
            <cle:score></cle:score>
        </ns1:credito>
    </ns1:resultadoVerificaCreditoGeral>
};

local:func($param)
