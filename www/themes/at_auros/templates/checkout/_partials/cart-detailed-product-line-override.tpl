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
{if isset($dimension_data)}
  {foreach from=$dimension_data item="ddata"}
    {if ($ddata.0.id_product == $product.id_product)}
      {foreach from=$customization_added_to_cart item="cdata"}
        {if ($cdata.0.id_customization == $product.id_customization)}
          {$dimension_calc_type = $ddata.0.displayquantity}
          {$dimension_text = $cdata.0.value}
          {$dimension_quantity = $cdata.0.total_dimension}
          {if ($dimension_quantity == 0)}{$dimension_quantity = 1}{/if}
          {$dimension_unit = $cdata.0.unittype_module}
          {$product_price = $product.price|regex_replace:'/[^0-9,.]+/':''}
          {$currency = $product.price|regex_replace:'/[A-Za-z0-9.,]+/':''}
          {$unit_price = $product_price|floatval / $dimension_quantity|floatval}
        {/if}
      {/foreach}
    {/if}
  {/foreach}
{/if}
<div class="product-line-grid row">
  <!--  product line left content: image-->
  <div class="product-line-grid-left col-md-3 col-xs-4">
    <span class="product-image media-middle">
      {if $product.cover}
        <img src="{$product.cover.bySize.cart_default.url|escape:'quotes':'UTF-8'}"
          alt="{$product.name|escape:'quotes':'UTF-8'}">
      {else}
        <img src="{$urls.no_picture_image.bySize.cart_default.url|escape:'htmlall':'UTF-8'}" />
      {/if}
    </span>
  </div>
  <!--  product line body: label, discounts, price, attributes, customizations -->
  <div class="product-line-grid-body col-md-4 col-xs-8">
    <div class="product-line-info">
      <a class="label" href="{$product.url|escape:'htmlall':'UTF-8'}"
        data-id_customization="{$product.id_customization|intval}">{$product.name|escape:'quotes':'UTF-8'}</a>
    </div>
    <div class="product-line-info product-price h5 {if $product.has_discount}has-discount{/if}">
      {if $product.has_discount}
        <div class="product-discount">
          <span class="regular-price">{$product.regular_price|escape:'htmlall':'UTF-8'}</span>
          {if $product.discount_type === 'percentage'}
            <span class="discount discount-percentage">
              -{$product.discount_percentage_absolute|escape:'htmlall':'UTF-8'}
            </span>
          {else}
            <span class="discount discount-amount">
              -{$product.discount_to_display|escape:'htmlall':'UTF-8'}
            </span>
          {/if}
        </div>
      {/if}
      <div class="current-price">
        {if isset($dimension_data)}
          {if !isset($dimension_quantity)}{$dimension_quantity = 1}{/if}
          {assign var=currency value=Context::getContext()->currency}
          {if isset($use_taxes)}
            <span
              class="price">{Tools::displayPrice($product.price_wt/$dimension_quantity*(1+$product.rate/100),$currency)|escape:'htmlall':'UTF-8'}</span>
          {else}
            <span
              class="price">{if ($dimension_quantity != 1)}{Tools::displayPrice($product.price_wt,$currency)|escape:'htmlall':'UTF-8'}{else}{Tools::displayPrice($product.price_wt|floatval/$dimension_quantity,$currency)}{/if}</span>
          {/if}
        {else}
          <span class="price">{$product.price|escape:'htmlall':'UTF-8'}</span>
        {/if}
        {if $product.unit_price_full}
          {* MEG Venture *}
          {* {if !isset($dimension_data)}
            <div class="unit-price-cart">{$product.unit_price_full|escape:'htmlall':'UTF-8'}</div>
          {else}
            <div class="unit-price-cart">
              {assign var=currency value=Context::getContext()->currency}
              {assign var="unit_price" value=$product.price_wt/$dimension_quantity}
              {Tools::displayPrice($unit_price,$currency)} / {$dimension_unit|escape:'htmlall':'UTF-8'}
            </div>
          {/if} *}
          {* MEG Venture *}
        {/if}
      </div>
    </div>
    <br />
    {foreach from=$product.attributes key="attribute" item="value"}
      <div class="product-line-info">
        <span class="label">{$attribute|escape:'htmlall':'UTF-8'}:</span>
        <span class="value">{$value|escape:'htmlall':'UTF-8'}</span>
      </div>
    {/foreach}
  </div>
  <!--  product line right content: actions (quantity, delete), price -->
  <div class="product-line-grid-right product-line-actions col-md-5 col-xs-12">
    <div class="row">
      <div class="col-xs-4 hidden-md-up"></div>
      <div class="col-md-10 col-xs-6">
        <div class="row">
          <div class="spinner spinner-success col-md-6 col-xs-6"><img src="/img/loadingAnimation.gif"></div>
          <div class="col-md-5 col-xs-6 col-sp-12 qty">
            {if !empty($product.is_gift)}
              <span class="gift-quantity">{$product.quantity|intval|escape:'htmlall':'UTF-8'}</span>
            {else}
              <input class="js-cart-line-product-quantity" style="font-size: 14px;padding:0;"
                data-down-url="{$product.down_quantity_url|escape:'htmlall':'UTF-8'}"
                data-up-url="{$product.up_quantity_url|escape:'htmlall':'UTF-8'}"
                data-update-url="{$product.update_quantity_url|escape:'htmlall':'UTF-8'}"
                data-product-id="{$product.id_product|intval}"
                unique-product-id="{$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}"
                type="text"
                data-dimension-value="{if ((isset($dimension_text)) && (($dimension_calc_type == 'decimalok') || ($dimension_calc_type == 'calcvisible')))}{$dimension_quantity|escape:'htmlall':'UTF-8'}{else}{$product.quantity|intval|escape:'htmlall':'UTF-8'}{/if}"
                value="{if ((isset($dimension_text)) && (($dimension_calc_type == 'decimalok') || ($dimension_calc_type == 'calcvisible')))}{$dimension_quantity|escape:'htmlall':'UTF-8'}{else}{$product.quantity|intval|escape:'htmlall':'UTF-8'}{/if}"
                name="product-quantity-spin"
                aria-label="{l s='%productName% product quantity field' sprintf=['%productName%' => $product.name] d='Shop.Theme.Checkout'}" />
              {if ((isset($dimension_text)) && (($dimension_calc_type == 'decimalok') || ($dimension_calc_type == 'calcvisible')))}
                <div class="input-group-append" style="height: 40px;line-height: 40px;margin-left: 55px;">
                  <span class="input-group-text small-text text-muted">{$dimension_unit|escape:'htmlall':'UTF-8'}</span>
                </div>
              {/if}
            {/if}
          </div>
          <div class="col-md-7 col-xs-2 col-sp-12 price">
            <span class="product-price">
              <strong>
                {if !empty($product.is_gift)}
                  <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
                {else}
                  {$product.total|escape:'htmlall':'UTF-8'}
                {/if}
              </strong>
            </span>
          </div>
        </div>
      </div>
      <div class="col-md-2 col-xs-2 text-xs-right">
        <div class="cart-line-product-actions">
          <a class="remove-from-cart" rel="nofollow" href="{$product.remove_from_cart_url|escape:'htmlall':'UTF-8'}"
            data-link-action="delete-from-cart" data-id-product="{$product.id_product|intval}"
            data-id-product-attribute="{$product.id_product_attribute|intval}"
            data-id-customization="{$product.id_customization|intval}">
            {if !isset($product.is_gift) || !$product.is_gift}
              <i class="material-icons float-xs-left">delete</i>
            {/if}
          </a>
          {block name='hook_cart_extra_product_actions'}
            {hook h='displayCartExtraProductActions' product=$product}
          {/block}
        </div>
      </div>
    </div>
  </div>
  <div class="clearfix"></div>
  {if is_array($product.customizations) && $product.customizations|count}
    <br>
    {block name='cart_detailed_product_line_customization'}
      {foreach from=$product.customizations item="customization"}
        {foreach from=$customization.fields item="field"}
          {assign var="dimension_text" value=" "|explode:$field.text}
          <div class="alert medium-alert alert-info">
            <p style="float:left;">{$field.label|escape:'htmlall':'UTF-8'}&nbsp;</p>
            <div class="value">
              {if $field.type == 'text'}
                {if (int)$field.id_module}
                  {$field.text nofilter}
                {else}
                  {$field.text|escape:'htmlall':'UTF-8'}
                {/if}
              {elseif $field.type == 'image'}
                <img src="{$field.image.small.url|escape:'htmlall':'UTF-8'}">
              {/if}
            </div>
          </div>
        {/foreach}
      {/foreach}
    {/block}
  {/if}
</div>
{if isset($dimension_text)}
  <style>
    @media only screen and (max-width: 600px) {
      .bootstrap-touchspin input.form-control {
        width: 2rem;
      }
    }
  </style>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript">
    var id_product = {$product.id_product|intval};
    $.ajax({
      type: "POST",
      data: {
        id_product: id_product
      },
      url: "/index.php?fc=module&module=squaremeter&controller=getdimensiondata",
      dataType: "json",
      async: false,
      success: function(data) {
        window['results' + id_product] = data;
        //console.table(window['results'+id_product]);
      },
      error: function(jqXHR, exception) {
        console.log(jqXHR);
      }
    });
    if (typeof(window['results' + id_product]) !== 'undefined' && window['results' + id_product].length > 0) {
      window['displayquantity' + id_product] = window['results' + id_product][0]['displayquantity'];
      if (window['results' + id_product][0]) {
        if (window['results' + id_product][0]['step_width'])
          window['stepvalue' + id_product] = window['results' + id_product][0]['step_width'];
        else
          window['stepvalue' + id_product] = window['results' + id_product][0]['step'];
        if (!window['stepvalue' + id_product])
          window['stepvalue' + id_product] = 1;
        switch (window['results' + id_product][0]['calculationtype']) {
          case "weight":
            if (window['results' + id_product][0]['minweight'])
              window['minvalue' + id_product] = window['results' + id_product][0]['minweight'];
            else
              window['minvalue' + id_product] = '';
            if (window['results' + id_product][0]['maxweight'])
              window['maxvalue' + id_product] = window['results' + id_product][0]['maxweight'];
            else
              window['maxvalue' + id_product] = '';
            break;
          default:
            if (window['results' + id_product][0]['minwidth'])
              window['minvalue' + id_product] = window['results' + id_product][0]['minwidth'];
            else
              window['minvalue' + id_product] = '';
            if (window['results' + id_product][0]['maxwidth'])
              window['maxvalue' + id_product] = window['results' + id_product][0]['maxwidth'];
            else
              window['maxvalue' + id_product] = '';
            break;
        }
        $("[unique-product-id={$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}]").attr('min', parseFloat(window['minvalue'+id_product]));
        $("[unique-product-id={$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}]").attr('max', parseFloat(window['maxvalue'+id_product]));
        $("[unique-product-id={$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}]").attr('step', parseFloat(window['stepvalue'+id_product]));
      }
    }
    $(document).ready(function() {
      var id_product = {$product.id_product|intval};
      if ((window['displayquantity' + id_product] == "decimalok") ||
        (window['displayquantity' + id_product] == "dimensionedunit") ||
        (window['displayquantity' + id_product] == "calcvisible")) {
        var currentquantity = Number($("[unique-product-id={$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}]").val());
        window["q" + "{$product.id_product|intval}-" + "{$product.id_product_attribute|intval}-" + "{$product.id_customization|intval}"] = currentquantity;
        {if (($dimension_calc_type == 'decimalok') || ($dimension_calc_type == 'calcvisible'))}
          $(document).on('click', '.js-increase-product-quantity, .js-decrease-product-quantity', function(event) {
            $('.spinner-success').show();
            $('.qty').hide();
          });
        {/if}
        $(document).on('click', '.remove-from-cart:not(.js-decrease-product-quantity)', function(event) {
          if (!event.isTrigger) {
            $.ajax({
              type: "POST",
              data: {
                id_product: $(this).data("id-product"),
                id_product_attribute: $(this).data("id-product-attribute"),
                id_customization: $(this).data("id-customization"),
              },
              url: "/index.php?fc=module&module=squaremeter&controller=deletecart",
              dataType: "json",
              async: false,
              success: function(data) {
                // results = data;
              },
              error: function(jqXHR, exception) {
                console.log(jqXHR);
              }
            });
          }
        });
        $(window).bind("load", function() {
          $("[unique-product-id={$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}]").val(parseFloat(window["q" + "{$product.id_product|intval}-" + "{$product.id_product_attribute|intval}-" + "{$product.id_customization|intval}"]).toFixed({Configuration::get('squaremeter_numofdecimal')|escape:'htmlall':'UTF-8'}));
        });
        {if (($dimension_calc_type == 'decimalok') || ($dimension_calc_type == 'calcvisible'))}
          setInterval(function() {
            $('.spinner-success').hide(500);
            $('.qty').show(500);
          }, 2000);
          prestashop.on('updatedCart', function(event) {
            // $('.spinner-success').show();
            // $('.qty').hide();
            setTimeout('$("[unique-product-id={$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}]").val(Number($("[unique-product-id={$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}]").data("dimension-value")).toFixed({Configuration::get("squaremeter_numofdecimal")|escape:"htmlall":"UTF-8"}))', 500);
            // $('.spinner-success').hide(500);
            // $('.qty').show(500);
            minmaxdisable_{$product.id_product|intval}_{$product.id_product_attribute|intval}();
          });
        {/if}
        setTimeout(function() {
          $("[unique-product-id={$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}]").val(parseFloat(window["q" + "{$product.id_product|intval}-" + "{$product.id_product_attribute|intval}-" + "{$product.id_customization|intval}"]).toFixed({Configuration::get('squaremeter_numofdecimal')|escape:'htmlall':'UTF-8'}));
        }, 100); // delay of 100 milliseconds
      }
      setTimeout(function() {
        minmaxdisable_{$product.id_product|intval}_{$product.id_product_attribute|intval}();
      }, 1000); // delay of 1000 milliseconds
    });
    function minmaxdisable_{$product.id_product|intval}_{$product.id_product_attribute|intval}() {
    var uniqueProductId = "{$product.id_product|intval}-{$product.id_product_attribute|intval}-{$product.id_customization|intval}";
    var uniqueProductIdSelector = "[unique-product-id=" + uniqueProductId + "]";
    var $uniqueProductElement = $(uniqueProductIdSelector);
    var productValue = parseFloat($uniqueProductElement.val());

    var minvalue = parseFloat($uniqueProductElement.attr('min'));
    var maxvalue = parseFloat($uniqueProductElement.attr('max'));

    var isMin = productValue === minvalue;
    var isMax = productValue === maxvalue;

    $uniqueProductElement.nextAll().find('.js-decrease-product-quantity').first().prop('disabled', isMin);
    $uniqueProductElement.nextAll().find('.js-increase-product-quantity').first().prop('disabled', isMax);
    }
  </script>
{/if}
<style>
  .spinner-success {
    display: none;
  }

  .spinner-success>img {
    width: 100px;
  }
</style>