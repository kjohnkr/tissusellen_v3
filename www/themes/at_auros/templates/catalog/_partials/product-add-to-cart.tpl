{**
 *  PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
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
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div class="product-add-to-cart js-product-add-to-cart">
  {if !$configuration.is_catalog}
    {block name='product_quantity'}
      <div class="product-quantity clearfix {if $product.unity}unit-product{/if}">
        <span class="control-label">{l s='Quantity' d='Shop.Theme.Catalog'}</span>
        <div class="p-cartwapper">
          <div class="qty clearfix">
            <input
            type="number"
              name="qty"
              id="quantity_wanted"
              inputmode="numeric"
              pattern="[0-9]*"
              {if $product.quantity_wanted}
                value="{$product.quantity_wanted}"
                min="{$product.minimal_quantity}"
              {else}
                value="1"
                min="1"
              {/if}
              class="input-group"
              aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
            >
            {if $product.unity}
              <button class="qty-shortcut btn btn-warning" data-qty="10">1M</button>
              <button class="qty-shortcut btn btn-warning" data-qty="20">2M</button>
            {/if}
          </div>

          <div class="add">
            <button
              class="btn btn-primary add-to-cart"
              data-button-action="add-to-cart"
              type="submit"
              {if !$product.add_to_cart_url}
                disabled
              {/if}
            >
              <i class="icon-Ico_Cart"></i>
              {l s='Add to cart' d='Shop.Theme.Actions'}
            </button>
              <div class="leo-compare-wishlist-button">
              {hook h='displayProductActions' product=$product}
              {hook h='displayLeoWishlistButton' product=$product}
              {* {hook h='displayLeoCompareButton' product=$product} *}
              <div class="compare">
                <a class="btn-product btn" href="{$urls.pages.contact}?csId={$product.id}&csName={$product.name}" title="{l s='Check stocks description' d='Shop.Theme.Global'}">
                  <span class="leo-compare-bt-content">
                    <i class="ti-reload"></i>
                    <span>{l s='Check stocks' d='Shop.Theme.Global'}</span>
                  </span>
                </a>
              </div>
            </div>
          </div> 

        </div>
        
        {block name='product_minimal_quantity'}
          <div class="product-minimal-quantity js-product-minimal-quantity">
            {if $product.minimal_quantity > 1}
              {l
              s='The minimum purchase order quantity for the product is %quantity%.'
              d='Shop.Theme.Checkout'
              sprintf=['%quantity%' => $product.minimal_quantity]
              }
            {/if}
          </div>
        {/block}

        <div class="mt-2">
          <a class="product-faq-anchor" href="#product-faq-anchor"><i class="icon-Ico_Support"></i> Tranches de 10 cm ? Laize ? Délais de livraison ? Toutes les réponses ici</a>
        </div>

        {block name='product_availability'}
          <span id="product-availability" class="js-product-availability">
            {if $product.show_availability && $product.availability_message}
              {if $product.availability == 'available'}
                <i class="material-icons rtl-no-flip product-available">&#xE5CA;</i>
              {elseif $product.availability == 'last_remaining_items'}
                <i class="material-icons product-last-items">&#xE002;</i>
              {else}
                <i class="material-icons product-unavailable">&#xE14B;</i>
              {/if}
              {$product.availability_message}
            {/if}
          </span>
        {/block}

      </div>
    {/block}

  {/if}
</div>
