{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{block name='cart_summary_product_line'}
  <div class="media-left">
    <a href="{$product.url|escape:'htmlall':'UTF-8'}" title="{$product.name|escape:'quotes':'UTF-8'}">
      <img class="media-object" src="{$product.cover.small.url|escape:'htmlall':'UTF-8'}"
        alt="{$product.name|escape:'quotes':'UTF-8'}">
    </a>
  </div>
  <div class="media-body">
    <span class="product-name">{$product.name|escape:'quotes':'UTF-8'}</span>
    {* <span class="product-quantity">x{$product.quantity|intval|escape:'htmlall':'UTF-8'}</span> *}
    {* MEG Venture *}
    {if isset($dimension_data)}
      {foreach from=$dimension_data item="ddata"}
        {foreach from=$customization_added_to_cart item="cdata"}
          {if $cdata.0.id_customization == $product.id_customization}
            {* {if $ddata.0.displayquantity == 'decimalok'} *}
              {$dimension_calc_type = $ddata.0.displayquantity}
              {$dimension_text = $cdata.0.value}
              {$dimension_quantity = $cdata.0.total_dimension}
              {if ($dimension_quantity == 0)}{$dimension_quantity = 1}{/if}
              {$dimension_unit = $cdata.0.unittype_module}
            {* {/if} *}
          {/if}
        {/foreach}
      {/foreach}
    {/if}
    <span class="product-quantity">x{if isset($dimension_text)}{$dimension_quantity|string_format:"%.2f"}
      {$dimension_unit|escape:'htmlall':'UTF-8'}{else}{$product.quantity|intval|escape:'htmlall':'UTF-8'}
      {/if}</span>
    {* MEG Venture *}
    <span class="product-price float-xs-right">{$product.price|escape:'htmlall':'UTF-8'}</span>
    {hook h='displayProductPriceBlock' product=$product type="unit_price"}
    {foreach from=$product.attributes key="attribute" item="value"}
      <div class="product-line-info product-line-info-secondary text-muted">
        <span class="label">{$attribute|escape:'htmlall':'UTF-8'}:</span>
        <span class="value">{$value|escape:'htmlall':'UTF-8'}</span>
      </div>
    {/foreach}
    <br />
  </div>
{/block}