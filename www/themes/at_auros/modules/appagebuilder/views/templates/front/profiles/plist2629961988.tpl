{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
  <div class="thumbnail-container">
    <div class="product-image">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_thumbnail'}

{if $product.cover}
    {if isset($formAtts) && isset($formAtts.lazyload) && $formAtts.lazyload}
        
	<a href="{$product.url}" class="thumbnail product-thumbnail">
	  <img
		class="img-fluid lazyOwl"
		src = ""
		data-src = "{$product.cover.bySize.medium_default.url}"
		alt = "{$product.cover.legend}"
		data-full-size-image-url = "{$product.cover.large.url}"
	  >
	  {if isset($cfg_product_one_img) && $cfg_product_one_img}
		<span class="product-additional" data-idproduct="{$product.id_product}" data-image-type="medium_default"></span>
	  {/if}
	</a> 
    {else}
	<a href="{$product.url}" class="thumbnail product-thumbnail">
	  <img
		class="img-fluid"
		src = "{$product.cover.bySize.medium_default.url}"
		alt = "{$product.cover.legend}"
		data-full-size-image-url = "{$product.cover.large.url}"
	  >
	  {if isset($cfg_product_one_img) && $cfg_product_one_img}
		<span class="product-additional" data-idproduct="{$product.id_product}" data-image-type="medium_default"></span>
	  {/if}
	</a>
    {/if}
{else}
  <a href="{$product.url}" class="thumbnail product-thumbnail leo-noimage">
 <img
   src = "{$urls.no_picture_image.bySize.medium_default.url}"
 >
  </a>
{/if}
{/block}


<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_flags'}
<ul class="product-flags">
  {foreach from=$product.flags item=flag}
	<li class="product-flag {$flag.type}">{$flag.label}</li>
  {/foreach}
</ul>
{/block}
<div class="pro3-btn">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
<div class="quickview{if !$product.main_variants} no-variants{/if} hidden-md-down">
<a
  href="#"
  class="quick-view"
  data-link-action="quickview"
>
	<span class="leo-quickview-bt-loading cssload-speeding-wheel"></span>
	<span class="leo-quickview-bt-content">
		<i class="ti-search search"></i>
		<span>{l s='Quick view'}</span>
	</span>
</a>
</div>

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoCartButton' product=$product}

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoWishlistButton' product=$product}

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoCompareButton' product=$product}
</div></div>
    <div class="product-meta">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_name'}
  <h4 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></h4>
{/block}

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->

{block name='product_price_and_shipping'}
  {if $product.show_price}
    <div class="product-price-and-shipping">
      {if $product.has_discount}
        {hook h='displayProductPriceBlock' product=$product type="old_price"}
        {if $product.unity == '/ mètre'}
          <span class="regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{($product.price_without_reduction * 10)|number_format:2}€</span>
          {if $product.discount_type === 'percentage'}
            <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
          {elseif $product.discount_type === 'amount'}
           
          {/if}
        {else}
          <span class="regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
          {if $product.discount_type === 'percentage'}
            <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
          {elseif $product.discount_type === 'amount'}
            
          {/if}
        {/if}
      {/if}

      {hook h='displayProductPriceBlock' product=$product type="before_price"}

      
      <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
      {if $product.unity == '/ mètre'} 
        <span itemprop="priceCurrency" content="{$currency.iso_code}"></span> 
        <span class="price{if $product.has_discount} highlight-discount{/if}" itemprop="price" content="{$product.unit_price_tax_included|number_format:2}">{$product.unit_price_tax_included|number_format:2}€ {$product.unity}</span> 
      {else} 
      <span class="price{if $product.has_discount} highlight-discount{/if}" itemprop="offers" itemscope itemtype="http://schema.org/Offer"> 
        <span itemprop="priceCurrency" content="{$currency.iso_code}"></span><span itemprop="price" content="{$product.price_amount}">{$product.price}</span> 
      </span> 
      {/if}

      {hook h='displayProductPriceBlock' product=$product type='unit_price'}

      {hook h='displayProductPriceBlock' product=$product type='weight'}
    </div>
  {/if}
{/block}
{block name='product_description_short'}
  <div class="product-description-short">{$product.description_short|strip_tags|truncate:150:'...' nofilter}</div>
{/block}</div>
  </div>
</article>
