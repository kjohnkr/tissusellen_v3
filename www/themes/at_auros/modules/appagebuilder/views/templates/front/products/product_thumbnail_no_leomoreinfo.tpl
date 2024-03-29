{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright  Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_thumbnail'}

{if $product.cover}
    {if isset($formAtts) && isset($formAtts.lazyload) && $formAtts.lazyload}
        {* ENABLE LAZY LOAD OWL_CAROUSEL *}
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

