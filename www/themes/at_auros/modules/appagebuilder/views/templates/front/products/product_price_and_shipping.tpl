{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->

{block name='product_price_and_shipping'}
  {if $product.show_price}
    <div class="product-price-and-shipping">
      {if $product.has_discount}
        {hook h='displayProductPriceBlock' product=$product type="old_price"}

        <span class="regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
        {if $product.discount_type === 'percentage'}
          <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
        {elseif $product.discount_type === 'amount'}
          <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
        {/if}
      {/if}

      {hook h='displayProductPriceBlock' product=$product type="before_price"}

<!--
      <span class="price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
        {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
        {if '' !== $smarty.capture.custom_price}
          {$smarty.capture.custom_price nofilter}
        {else}
          {$product.price}
        {/if}
      </span>
-->
      <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
      {if $product.unity == '/ mètre'} 
      <div class="price"> 
        <span itemprop="priceCurrency" content="{$currency.iso_code}"></span> 
        <span class="price" itemprop="price" content="{$product.unit_price_tax_included|number_format:2}">{$product.unit_price_tax_included|number_format:2}€ {$product.unity}</span> 
      </div> 
      {else} 
      <span class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer"> 
        <span itemprop="priceCurrency" content="{$currency.iso_code}"></span><span itemprop="price" content="{$product.price_amount}">{$product.price}</span> 
      </span> 
      {/if}

      {hook h='displayProductPriceBlock' product=$product type='unit_price'}

      {hook h='displayProductPriceBlock' product=$product type='weight'}
    </div>
  {/if}
{/block}