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

{capture name=path}{l s='Billmate Partpayment' mod='billmatepartpayment'}{/capture}

<h2>{l s='Order summary' mod='billmatepartpayment'}</h2>
<style type="text/css">
#right_column{
	display:none
}
.billmate *{
color: #7a7a7a!important;
}
.billmate p{ padding-bottom:10px; }
.blarge{
font-size:1.5em;
}
#billmate_submit {
	text-align: center;
}
.bsmall{
	font-size:1.1em;
}
.billmate{
text-align:center;
line-height:1.5em;
border-top:1px solid grey;
}
.bnormal{
font-size:1.3em;
}
.billbutton{
	font-weight:bold;
	color:#56AADB!important;

}
.billfooter {
display: block!important;
border-top: 1px solid grey!important;
padding-top: 13px!important;
}
.billdropdown{
	max-width: 100%;
	padding: 0.3em;
	width: 34em;
	font-size: 1.2em;
}
#billmate_pno{ margin:auto!important;display:block!important;text-align:center!important;	 }

@media only screen and (min-width: 500px){
	#billmate_pno{ width:330px!important; }
}
</style>
{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}
{if isset($error)}<div style="background-color: #FAE2E3;border: 1px solid #EC9B9B;line-height: 20px;margin: 0 0 10px;padding: 10px 15px;">{$error}</div>{/if}
<div id="order_area">
{if isset($nbProducts) && $nbProducts <= 0}
    					 <p class="warning">{l s='Your shopping cart is empty.'}</p>
					 {else}
  <h3>{l s='Billmate Partpayment' mod='billmatepartpayment'}</h3>
  {* $link->getModuleLink('billmatepartpayment', 'getaddress', [], true) *}
  <form action="javascript://" method="post" class="billmate">
    <p class="blarge">
      <img src="{$smarty.const._MODULE_DIR_}billmatepartpayment/bm_delbetalning_m.png" alt="{l s='billmatepartpayment' mod='billmatepartpayment'}" style=" margin: 0px 10px 5px 0px;" />
      <br/>
    </p>
    <p class="blarge">
      {l s='The total amount of your order is' mod='billmatepartpayment'}
      <span id="amount">{displayPrice price=$total_fee}</span>
      {if $use_taxes == 1}
		{l s='(tax incl.)' mod='billmatepartpayment'}
      {/if}
    </p>
    {if isset($accountPrice)}
    <br/>
    <select name="paymentAccount" class="billdropdown">
      {foreach from=$accountPrice item=val key=k}
	  <option value="{$k}">{$val.month}  månaders delbetalning - {displayPrice price=$val.price} per månad</option>
      {/foreach}
    </select>
    <br/>
    {/if}
    <br />
    <p class="blarge">

      <label>{l s='Personal Number:' mod='billmatepartpayment'}</label>
      <input type="text" name="billmate_pno" id="billmate_pno" value="" style="border:1px solid #D3D3D3;padding:0.2em;" required />
      <br /><br/>
	</p>
	<p class="bsmall">
		<input type="checkbox" checked="checked" value="" id="confirm_my_age" name="confirm_my_age" required />
		<label for="phone">{l s='My email %1$s is accurate and can be used for invoicing.' sprintf=[$customer_email] mod='billmatepartpayment'}</label>
	</p>
	<input type="button" name="submit" id="billmate_submit" style="width:26em!important" value="{l s='I confirm my order' mod='billmatepartpayment'}" class="exclusive_large blarge" />
    <p class="cart_navigation billfooter">
      <a href="{$link->getPageLink('order.php', true)}?step=3" class="billbutton blarge" style="float:left;line-height:1em;">{l s='Other payment methods' mod='billmatepartpayment'}</a>
	  <a id="terms-delbetalning" class="billbutton blarge" style="cursor:pointer!important;float:right">{l s='Conditions of payment' mod='billmatepartpayment'}</a>
    </p>
  </form>
<script type="text/javascript">
document.getElementById('center_column').className = 'grid_9';
$('#right_column').remove();
$(document).ready(function()
{
  $('#right_column').remove();
  document.getElementById('center_column').className = 'grid_9';
});
function closeIframe(id)
{
    $('#'+id).hide();
}
</script>
{/if}
<link rel="stylesheet" href="{$smarty.const._MODULE_DIR_}billmateinvoice/style.css" />
<script src="{$smarty.const._MODULE_DIR_}billmateinvoice/js/billmatepopup.js"></script>

<script type="text/javascript">
var success = "{*$ajaxurl.this_path_ssl*}payment.php?type={*$payment_type*}";
var ajaxurl = "{$link->getModuleLink('billmatepartpayment', 'getaddress', ['ajax'=> 0], true)}";

{if $opc|default:FALSE}
var carrierurl = "{$link->getPageLink("order-opc", true)}";
{else}
var carrierurl = "{$link->getPageLink("order", true)}";
{/if} 


var eid = "{$eid}";
var emptypersonerror = "{l s='PNO/SSN missing' mod='billmatepartpayment'}";
var checkbox_required = "{l s='Please check the checkbox for confirm this e-mail address is correct and can be used for invoicing.' mod='billmatepartpayment'}";
var loadingWindowTitle = '{l s='Processing....' mod='billmatepartpayment'}';
var windowtitlebillmate= "{l s='Pay by invoice can be made only to the address listed in the National Register. Would you like to make the purchase with address:' mod='billmatepartpayment'}";

   {literal}
    $.getScript("https://billmate.se/billmate/base.js", function(){
		    $("#terms-delbetalning").Terms("villkor_delbetalning",{eid: eid,effectiverate:34});
    });

    function getData( param ){
		ShowMessage('',loadingWindowTitle);
        $('div.error').remove();
        jQuery.post( ajaxurl+param, jQuery('.billmate').serializeArray(), function(json){
            eval('var response = '+ json );
            if( response.success ){
            	if( typeof response.redirect != 'undefined' ){
            		window.location.href= response.redirect;
            	} else {
					if( typeof response.action != 'undefined' ) {
						$.post(carrierurl,response.action, function(){
							getData( '&geturl=yes' );
						});
					} else {
						getData( '&geturl=yes' );
					}
                }
            } else {
				if( typeof response.popup != 'undefined' && response.popup){
					ShowMessage(response.content,windowtitlebillmate);
					//modalWin.ShowMessage(response.content,310,500,windowtitlebillmate);
				}else{
					modalWin.HideModalPopUp();
					$('<div class="error">'+response.content+'</div>').insertBefore($('#order_area'));
				}
            }
        });
    }
    jQuery(document).ready(function(){
		setTimeout(function(){
			if(typeof $.uniform == 'object')	$.uniform.restore();
		},5000);
		
        jQuery('#billmate_submit').click(function(){
            if( $.trim( $('#billmate_pno').val()) == '' ){
                alert(emptypersonerror);
                return;
            }
			if(document.getElementById('confirm_my_age').checked){
				
				getData( '' );
			}else{
				alert(checkbox_required);
			}
        });
    });
    {/literal}
</script>
