{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}

<section id="main" class="product-detail product-image-thumbs-bottom product-image-thumbs product-thumbs-right"><div class="row product-container"><div class="col-form_id-form_9367402777406408 col-md-6 col-lg-6 col-xl-6 col-sm-12 col-xs-12 col-sp-12">

{block name='page_content_container'}
  <section class="page-content" id="content" data-templateview="right" data-numberimage="5" data-numberimage1200="5" data-numberimage992="4" data-numberimage768="3" data-numberimage576="3" data-numberimage480="2" data-numberimage360="2" data-templatemodal="1" data-templatezoomtype="out" data-zoomposition="right" data-zoomwindowwidth="400" data-zoomwindowheight="400">
    {block name='page_content'}
      <div class="images-container">
        {block name='product_cover_thumbnails'}
        {if $isMobile && $dmobile_swipe}
          <div class="list-images-mobile">
            {foreach from=$product.images item=image}
              <div>
                <img
                  class="thumb js-thumb {if $image.id_image == $product.default_image.id_image} selected {/if}"
                  data-image-medium-src="{$image.bySize.medium_default.url}"
                  data-image-large-src="{$image.bySize.large_default.url}"
                  src="{$image.bySize.large_default.url}"
                  {if !empty($product.default_image.legend)}
	            alt="{$product.default_image.legend}"
	            title="{$product.default_image.legend}"
	          {else}
	            alt="{$product.name}"
	          {/if}
                  title="{$image.legend}"
                >
              </div>
            {/foreach}
          </div>
        {else}
          {block name='product_cover'}
            <div class="product-cover">
              {block name='product_flags'}
                <ul class="product-flags">
                  {foreach from=$product.flags item=flag}
                    <li class="product-flag {$flag.type}">{$flag.label}</li>
                  {/foreach}
                </ul>
              {/block}
              {if $product.default_image}
                <img id="zoom_product" data-type-zoom="" class="js-qv-product-cover img-fluid" src="{$product.default_image.bySize.large_default.url}" alt="{$product.default_image.legend}" title="{$product.default_image.legend}">
                <div class="layer hidden-sm-down" data-toggle="modal" data-target="#product-modal">
                  <i class="material-icons zoom-in">&#xE8FF;</i>
                </div>
              {else}
                <img id="zoom_product" data-type-zoom="" class="js-qv-product-cover img-fluid" src="{$urls.no_picture_image.bySize.large_default.url}" alt="{$product.name}" title="{$product.name}">
              {/if}
            </div>
          {/block}

          {block name='product_images'}
            <div id="thumb-gallery" class="product-thumb-images">
              {if $product.default_image}
                {foreach from=$product.images item=image}
                  <div class="thumb-container {if $image.id_image == $product.default_image.id_image} active {/if}">
                    <a href="javascript:void(0)" data-image="{$image.bySize.large_default.url}" data-zoom-image="{$image.bySize.large_default.url}"> 
                      <img
                        class="thumb js-thumb {if $image.id_image == $product.default_image.id_image} selected {/if}"
                        data-image-medium-src="{$image.bySize.medium_default.url}"
                        data-image-large-src="{$image.bySize.large_default.url}"
                        src="{$image.bySize.home_default.url}"
                        {if !empty($product.default_image.legend)}
		            alt="{$product.default_image.legend}"
		            title="{$product.default_image.legend}"
		          {else}
		            alt="{$product.name}"
		          {/if}
                        title="{$image.legend}"
                      >
                    </a>
                  </div>
                {/foreach}
              {else}
                <div class="thumb-container">
                  <a href="javascript:void(0)" data-image="{$urls.no_picture_image.bySize.large_default.url}" data-zoom-image="{$urls.no_picture_image.bySize.large_default.url}"> 
                    <img 
                      class="thumb js-thumb img-fluid" 
                      data-image-medium-src="{$urls.no_picture_image.bySize.medium_default.url}"
                      data-image-large-src="{$urls.no_picture_image.bySize.large_default.url}"
                      src="{$urls.no_picture_image.bySize.home_default.url}"
                      alt="{$product.name}"
                      title="{$product.name}"
                    >
                  </a>
                </div>
              {/if}
            </div>
            
            {if $product.images|@count > 1}
              <div class="arrows-product-fake slick-arrows">
                <button class="slick-prev slick-arrow" aria-label="Previous" type="button" >{l s='Previous' d='Shop.Theme.Catalog'}</button>
                <button class="slick-next slick-arrow" aria-label="Next" type="button">{l s='Next' d='Shop.Theme.Catalog'}</button>
              </div>
            {/if}
          {/block}
        {/if}
        {/block}
        {hook h='displayAfterProductThumbs'}
      </div>
    {/block}
  </section>
{/block}

{block name='product_images_modal'}
  {include file='catalog/_partials/product-images-modal.tpl'}
{/block}
                            </div><div class="col-form_id-form_15874367062488778 col-md-6 col-lg-6 col-xl-6 col-sm-12 col-xs-12 col-sp-12">
{block name='page_header_container'}
	{block name='page_header'}
		<h1 class="h1 product-detail-name">{block name='page_title'}{$product.name}{/block}</h1>
	{/block}
{/block}
{block name='product_additional_info'}
	{include file='catalog/_partials/product-additional-info.tpl'}
{/block}
{hook h='displayLeoProductReviewExtra' product=$product}<div class="leo-more-cdown" data-idproduct="{$product.id_product}"></div>
{block name='product_description_short'}
  <div id="product-description-short-{$product.id}" class="description-short">{$product.description_short nofilter}</div>
{/block}<ul class="data-sheet">
{if isset($product.grouped_features['Matière'])}
<li>
<span class="name">{$product.grouped_features['Matière']['name']} : </span>{$product.grouped_features['Matière']['value']|escape:'htmlall'|nl2br nofilter}
</li>
{/if}
{if isset($product.grouped_features['Laize'])}
<li>
<span class="name">{$product.grouped_features['Laize']['name']} : </span>{$product.grouped_features['Laize']['value']|escape:'htmlall'|nl2br nofilter}
</li>
{/if}
{if isset($product.grouped_features['Poids / Densité'])}
<li>
<span class="name">{$product.grouped_features['Poids / Densité']['name']} : </span>{$product.grouped_features['Poids / Densité']['value']|escape:'htmlall'|nl2br nofilter}
</li>
{/if}

<li id="availability_statut">
<span class="name">{l s='Stock status' d='Shop.Theme.Catalog'}</span> : 
                <span id="availability_value" class="label{if $product->quantity <= 0 && !$allow_oosp} label-danger{elseif $product->quantity <= 0} label-warning{else} label-success{/if}">
                    {if $product->quantity <= 0}
                        {if $PS_STOCK_MANAGEMENT && $allow_oosp}
                            {l s='Availability date:' d='Shop.Theme.Catalog'} : {$product.availability_date}
                        {else}
                            {l s='This product is no longer in stock' d='Shop.Theme.Catalog'}
                        {/if}
                    {elseif $PS_STOCK_MANAGEMENT}
                        {l s='Available for order' d='Shop.Theme.Catalog'} 
                         {if $product->unity} 
                             ({round($product->quantity / 10, 2) } mètres)
                         {/if}
                    {/if}
                </span>
            </li>
</ul>
{block name='product_prices'}
	{include file='catalog/_partials/product-prices.tpl'}
{/block}

{if $product.is_customizable && count($product.customizations.fields)}
	{block name='product_customization'}
	 	{include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
	{/block}
{/if}<div><svg class="align-middle" width="20px" height="20px" viewBox="0 0 20 20" version="1.1">
<g id="surface1">
<path style=" stroke:none;fill-rule:evenodd;fill:rgb(12.54902%,12.54902%,12.54902%);fill-opacity:1;" d="M 4.960938 16.878906 L 5.839844 16.359375 C 6.71875 15.839844 7.078125 14.71875 6.601562 13.878906 C 6.121094 13.039062 4.960938 12.761719 4.039062 13.28125 L 3.160156 13.800781 C 2.238281 14.320312 1.921875 15.441406 2.398438 16.320312 C 2.878906 17.160156 4.039062 17.398438 4.960938 16.878906 Z M 7.480469 11.960938 L 18.800781 5.199219 C 18.121094 4.441406 16.640625 4.839844 13.960938 5.679688 C 12.039062 6.238281 9.078125 7.679688 5.960938 10.761719 L 5.921875 10.839844 L 5.878906 10.839844 L 5.839844 10.878906 C 5.320312 11.761719 4.238281 12.160156 3.359375 12.679688 L 2.558594 13.121094 C 1.28125 13.878906 0.839844 15.519531 1.558594 16.761719 C 2.320312 18.039062 3.960938 18.480469 5.199219 17.761719 L 6.441406 17.039062 C 7.71875 16.320312 8.160156 14.679688 7.398438 13.398438 C 7.199219 13 6.921875 12.761719 6.558594 12.480469 Z M 7.800781 10 C 7.800781 9.679688 8.078125 9.398438 8.398438 9.398438 C 8.71875 9.398438 9 9.679688 9 10 C 9 10.320312 8.71875 10.601562 8.398438 10.601562 C 8.078125 10.601562 7.800781 10.320312 7.800781 10 Z M 4.960938 3.121094 L 5.839844 3.640625 C 6.71875 4.160156 7.078125 5.28125 6.601562 6.121094 C 6.121094 6.960938 4.960938 7.238281 4.039062 6.71875 L 3.160156 6.199219 C 2.238281 5.679688 1.921875 4.558594 2.398438 3.679688 C 2.878906 2.839844 4.039062 2.601562 4.960938 3.121094 Z M 7.28125 7.921875 L 7.519531 8.078125 L 8.160156 8.480469 C 7.640625 8.878906 7.078125 9.320312 6.558594 9.800781 C 6.398438 9.640625 6.238281 9.519531 6.078125 9.359375 L 6.078125 9.320312 C 6 9.28125 5.960938 9.199219 5.878906 9.160156 L 5.839844 9.121094 C 5.320312 8.238281 4.238281 7.839844 3.359375 7.320312 L 2.558594 6.878906 C 1.28125 6.121094 0.839844 4.480469 1.558594 3.238281 C 2.320312 1.960938 3.960938 1.519531 5.199219 2.238281 L 6.441406 2.960938 C 7.71875 3.679688 8.160156 5.320312 7.398438 6.601562 C 7.199219 7 6.921875 7.238281 6.558594 7.519531 Z M 11 10.160156 L 18.800781 14.800781 C 18.121094 15.558594 16.640625 15.160156 13.960938 14.359375 C 12.640625 13.921875 10.71875 13.078125 8.679688 11.558594 Z M 11 10.160156 "/>
</g>
</svg><span class="align-middle"> Comprendre le métrage par quantité :</span></div>
<div>
<b>10cm</b> = 1 quantité | <b>50cm</b> = 5 quantité | <b>1m</b> = 10 quantité | <b>2m</b> = 20 quantité | <b>3,5m</b> = 35 quantité
</div>
<div class="product-actions">
  {block name='product_buy'}
    <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
      <input type="hidden" name="token" value="{$static_token}">
      <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
      <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

      {block name='product_variants'}
        {include file='catalog/_partials/product-variants.tpl'}
      {/block}

      {block name='product_pack'}
        {if $packItems}
          <section class="product-pack">
            <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
            {foreach from=$packItems item="product_pack"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
              {/block}
            {/foreach}
        </section>
        {/if}
      {/block}

      {block name='product_discounts'}
        {include file='catalog/_partials/product-discounts.tpl'}
      {/block}

      {block name='product_add_to_cart'}
        {include file='catalog/_partials/product-add-to-cart.tpl'}
      {/block}

      {block name='product_refresh'}
        <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh' d='Shop.Theme.Actions'}">
      {/block}
    </form>
  {/block}
</div>
                            </div><div class="col-form_id-form_4666379129988496 col-md-12 col-lg-12 col-xl-12 col-sm-12 col-xs-12 col-sp-12">{block name='product_default'}
<div class="more-info-product">
	<div id="description">
		<h4 class="title-info-product">{l s='Product Infos' d='Shop.Theme.Catalog'}</h4>
		<div id="product-details" data-product="{$product.embedded_attributes|json_encode}">
			<h4 class="title-info-product">{l s='Product Details' d='Shop.Theme.Catalog'}</h4>
			{block name='product_reference'}
				
			{/block}
			{block name='product_quantities'}
				{if $product.show_quantities}
					<div class="product-quantities">
						<label class="label">{l s='In stock' d='Shop.Theme.Catalog'}</label>
						<span>{$product.quantity} {$product.quantity_label}</span>
					</div>
				{/if}
			{/block}
			{block name='product_availability_date'}
				{if $product.availability_date}
					<div class="product-availability-date">
						<label>{l s='Availability date:' d='Shop.Theme.Catalog'} </label>
						<span>{$product.availability_date}</span>
					</div>
				{/if}
			{/block}
			{block name='product_out_of_stock'}
				<div class="product-out-of-stock">
					{hook h='actionProductOutOfStock' product=$product}
				</div>
			{/block}
			{block name='product_features'}
				{if $product.features}
					<section class="product-features">
						<h3 class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</h3>
						<ul class="data-sheet">
							{foreach from=$product.grouped_features item=feature}
							<li>
								<span class="name">{$feature.name}:</span>
								<span class="value">{$feature.value|escape:'htmlall'|nl2br nofilter}</span>
							</li>
							{/foreach}
						</ul>
					</section>
				{/if}
			{/block}
			
			{block name='product_specific_references'}
				{if isset($product.specific_references)}
					<section class="product-features">
						<h3 class="h6">{l s='Specific References' d='Shop.Theme.Catalog'}</h3>
						<dl class="data-sheet">
							{foreach from=$product.specific_references item=reference key=key}
								<dt class="name">{$key}</dt>
								<dd class="value">{$reference}</dd>
							{/foreach}
						</dl>
					</section>
				{/if}
			{/block}
			{block name='product_condition'}
				{if $product.condition}
					<div class="product-condition">
						<label class="label">{l s='Condition' d='Shop.Theme.Catalog'} </label>
						<link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
						<span>{$product.condition.label}</span>
					</div>
				{/if}
			{/block}
		</div>
		{if $product.description}
		<h3 class="h6">{l s='Description' d='Shop.Theme.Catalog'}</h3>
		{block name='product_description'}
       		<div class="product-description">{$product.description nofilter}</div>
     	{/block}
		{/if}
	</div>
	
	
	
	{if $product.attachments}
		<div id="attachments">
			<h4 class="title-info-product">{l s='Attachments' d='Shop.Theme.Catalog'}</h4>
			{block name='product_attachments'}
		     	<section class="product-attachments">
		       		<h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
		           	{foreach from=$product.attachments item=attachment}
		             	<div class="attachment">
			               	<h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
			               	<p>{$attachment.description}</p>
			               	<a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
			                 {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
			               	</a>
		             	</div>
		           	{/foreach}
		     	</section>
		   	{/block}
		</div>
	{/if}
	
	<div id="product-extra">
		{foreach from=$product.extraContent item=extra key=extraKey}
		    <h4 class="title-info-product">{$extra.title}</h4>
		   	<div class="{$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
		       {$extra.content nofilter}
		   	</div>
	   	{/foreach}
   	</div>
</div>
{/block}
{block name='product_accessories'}
  {if $accessories}
    <section class="product-accessories clearfix">
      <h3 class="h5 products-section-title">{l s='You might also like' d='Shop.Theme.Catalog'}</h3>
      <div class="products">
        <div class="owl-row {if isset($productClassWidget)} {$productClassWidget}{/if}">
          <div id="category-products2">
            {foreach from=$accessories item="product_accessory"}
              <div class="item{if $smarty.foreach.mypLoop.index == 0} first{/if}">
                {block name='product_miniature'}
                  {if isset($productProfileDefault) && $productProfileDefault}
                      
                      {hook h='displayLeoProfileProduct' product=$product_accessory profile=$productProfileDefault}
                  {else}
                      {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
                  {/if}
                {/block}
              </div>
            {/foreach}
          </div>
        </div>
      </div>
    </section>
  {/if}
{/block}

<script type="text/javascript">

  products_list_functions.push(
    function(){
      $('#category-products2').owlCarousel({
        {if isset($IS_RTL) && $IS_RTL}
          direction:'rtl',
        {else}
          direction:'ltr',
        {/if}
        items : 4,
        itemsCustom : false,
        itemsDesktop : [1200, 4],
        itemsDesktopSmall : [992, 3],
        itemsTablet : [768, 2],
        itemsTabletSmall : false,
        itemsMobile : [480, 1],
        singleItem : false,         // true : show only 1 item
        itemsScaleUp : false,
        slideSpeed : 200,  //  change speed when drag and drop a item
        paginationSpeed :800, // change speed when go next page

        autoPlay : false,   // time to show each item
        stopOnHover : false,
        navigation : true,
        navigationText : ["&lsaquo;", "&rsaquo;"],

        scrollPerPage :true,
        responsive :true,
        
        pagination : false,
        paginationNumbers : false,
        
        addClassActive : true,
        
        mouseDrag : true,
        touchDrag : true,

      });
    }
  ); 
  
</script>
{block name='product_footer'}
	{hook h='displayFooterProduct' product=$product category=$category}
{/block}{hook h='displayApSC' sc_key=sc2145270903}
                            </div></div>
{block name='page_footer_container'}
	  <footer class="page-footer">
	    {block name='page_footer'}
	    	<!-- Footer content -->
	    {/block}
	  </footer>
	{/block}
</section>

