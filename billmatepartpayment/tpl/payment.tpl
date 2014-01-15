{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @version  Release: $Revision: 14011 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{if $accountActive && $monthly_amount != 0}
<p class="payment_module">
	<a href="{$var.this_path_ssl}payment.php?type=account">
		<img src="{$smarty.const._MODULE_DIR_}billmatepartpayment/bm_delbetalning_l.png" alt="Billmate"/>
		{l s='Part pay from ' mod='billmatepartpayment'} {displayPrice price=$monthly_amount} {l s='per month' mod='billmatepartpayment'}.
	</a>
</p>
{/if}
