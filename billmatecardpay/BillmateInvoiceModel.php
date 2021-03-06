<?php


class BillmateInvoiceLanguageModel extends ObjectModel
{

    /**
     * Language constant for Danish (DA).<br>
     * ISO639_DA
     *
     * @var int
     */
    const DA = 27;

    /**
     * Language constant for German (DE).<br>
     * ISO639_DE
     *
     * @var int
     */
    const DE = 28;

    /**
     * Language constant for English (EN).<br>
     * ISO639_EN
     *
     * @var int
     */
    const EN = 31;

    /**
     * Language constant for Finnish (FI).<br>
     * ISO639_FI
     *
     * @var int
     */
    const FI = 37;

    /**
     * Language constant for Norwegian (NB).<br>
     * ISO639_NB
     *
     * @var int
     */
    const NB = 97;

    /**
     * Language constant for Dutch (NL).<br>
     * ISO639_NL
     *
     * @var int
     */
    const NL = 101;

    /**
     * Language constant for Swedish (SV).<br>
     * ISO639_SV
     *
     * @var int
     */
    const SV = 138;

    /**
     * Class constructor.
     * Disable instantiation.
     */

    public $countries = array('SE' => 'Sweden', 'Norway', 'Finland', 'DE' => 'Denmark');
    public $languages = array();
 
    /**
     * Converts a language code, e.g. 'de' to the BillmateLanguage constant.
     *
     * @param  string  $val
     * @return int|null
     */
    public static function fromCode($val) {
        switch(strtolower($val)) {
            case 'en':
                return self::EN;
            case 'da':
                return self::DA;
            case 'de':
                return self::DE;
            case 'fi':
                return self::FI;
            case 'nb':
                return self::NB;
            case 'nl':
                return self::NL;
            case 'sv':
                return self::SV;
            default:
                return null;
        }
    }
    /**
     * Converts a BillmateLanguage constant to the respective language code.
     *
     * @param  int  $val
     * @return string|null
     */
    public static function getCode($val) {
        switch($val) {
            case self::EN:
                return 'en';
            case self::DA:
                return 'da';
            case self::DE:
                return 'de';
            case self::FI:
                return 'fi';
            case self::NB:
                return 'nb';
            case self::NL:
                return 'nl';
            case self::SV:
                return 'sv';
            default:
                return null;
        }
    }
}
