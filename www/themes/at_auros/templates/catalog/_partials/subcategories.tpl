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
 * @copyright  PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{if !empty($subcategories)}
  {if isset($LEO_SUBCATEGORY) && $LEO_SUBCATEGORY && ((isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories)) }
    <div id="subcategories">
      <div class="row subcategories-list">
        {foreach from=$subcategories item=subcategory}
          <div class="subcategory-block subcategories-list col-xl-4 col-lg-4 col-md-6 col-sm-6 col-xs-6 col-sp-12">
            <div class="subcategory-image">
               <a href="{$subcategory.url}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
                {if !empty($subcategory.image.large.url)}
                   <img
                    class="img-fluid"
                    src="{$subcategory.image.large.url}"
                    alt="{$subcategory.name|escape:'html':'UTF-8'}"
                    loading="lazy"
                    width="{$subcategory.image.large.width}"
                    height="{$subcategory.image.large.height}"/>                
		    {/if}
              </a>
            </div>
            <div class="subcategory-meta">
              <h5><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</a></h5> 
              {if $subcategory.description}
				<div class="subcategory-description cat_desc">{$subcategory.description|strip_tags|truncate:120:'...'|escape:'html':'UTF-8' nofilter}</div>
			  {/if}  
            </div>
          </div>
        {/foreach}
      </div>
    </div>
  {/if}
{/if}
