{**
 *  PrestaShop.
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
<div id="js-product-list-header">
    {if $listing.pagination.items_shown_from == 1}
        <div class="block-category card card-block">
            <div class="block-category-inner">
                {if !empty($category.image.large.url)}
                    <div class="category-cover">
                        <picture>
                            {if !empty($category.image.large.sources.avif)}<source srcset="{$category.image.large.sources.avif}" type="image/avif">{/if}
                            {if !empty($category.image.large.sources.webp)}<source srcset="{$category.image.large.sources.webp}" type="image/webp">{/if}
                            <img src="{$category.image.large.url}" alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}" loading="lazy">
                        </picture>
                    </div>
                {/if}
                {if $category.description}
                    <div id="category-text" class="text-muted">
                        <h2 class="h1">{$category.name}</h2>
			<div id="category-description" class="text-muted">{$category.description nofilter}</div>
		    </div>
                {/if}
            </div>
        </div>
    {/if}
</div>
