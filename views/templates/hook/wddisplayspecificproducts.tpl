<!-- Block wddisplayspecificproducts -->
<div id="wddisplayspecificproducts" class="main_page_products block">
  <!--<h4>Enchères actuelles</h4>-->
  <div class="block_content">
    {if isset($products) AND $products}
			{assign var='nbItemsPerLine' value=6}
            {assign var='nbItemsPerLineTablet' value=2}
			{assign var='nbLi' value=$products|@count}
			{math equation="nbLi/nbItemsPerLine" nbLi=$nbLi nbItemsPerLine=$nbItemsPerLine assign=nbLines}
            {math equation="nbLi/nbItemsPerLineTablet" nbLi=$nbLi nbItemsPerLineTablet=$nbItemsPerLineTablet assign=nbLinesTablet}
			<ul class="row">
			{foreach from=$products item=product name=homeWdDisplaySpecificProducts}
				{math equation="(total%perLine)" total=$smarty.foreach.homeWdDisplaySpecificProducts.total perLine=$nbItemsPerLine assign=totModulo}
                {math equation="(total%perLineT)" total=$smarty.foreach.homeWdDisplaySpecificProducts.total perLineT=$nbItemsPerLineTablet assign=totModuloTablet}
				{if $totModulo == 0}{assign var='totModulo' value=$nbItemsPerLine}{/if}
                {if $totModuloTablet == 0}{assign var='totModuloTablet' value=$nbItemsPerLineTablet}{/if}
				<li class="ajax_block_product col-xs-12 col-sm-6 col-md-4 {if $smarty.foreach.homeWdDisplaySpecificProducts.iteration%$nbItemsPerLine == 0}last_item_of_line{elseif $smarty.foreach.homeWdDisplaySpecificProducts.iteration%$nbItemsPerLine == 1} first_item_of_line {/if} {if $smarty.foreach.homeWdDisplaySpecificProducts.iteration > ($smarty.foreach.homeWdDisplaySpecificProducts.total - $totModulo)}last_line{/if} {if $smarty.foreach.homeWdDisplaySpecificProducts.iteration%$nbItemsPerLineTablet == 0}last_item_of_tablet_line{elseif $smarty.foreach.homeWdDisplaySpecificProducts.iteration%$nbItemsPerLineTablet == 1}first_item_of_tablet_line{/if} {if $smarty.foreach.homeWdDisplaySpecificProducts.iteration > ($smarty.foreach.homeWdDisplaySpecificProducts.total - $totModuloTablet)}last_tablet_line{/if}">
                <div class="inner_content clearfix">
                {if isset($product.new) && $product.new == 1}<div class="new-box"><span class="before"></span><span class="after"></span><span class="new">{l s='New' mod='homefeatured'}</span></div>{/if}
					<div class="product_image"><a href="{$product.link|escape:'html'}" title="{$product.name|escape:html:'UTF-8'}" class="product_image"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{$product.name|escape:html:'UTF-8'}" /></a>
                    
                    <div class="product_content">
						{if $product.show_price AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
							<p class="price_container">
								<span class="price">
									{if !$priceDisplay}
										{convertPrice price=$product.price}
									{else}
										{convertPrice price=$product.price_tax_exc}
									{/if}
								</span>
							</p>
						{else}
							<p class="price_container">
								<span class="price"><i class="fa fa-gavel"></i>
									{if !$priceDisplay}
										{convertPrice price=$product.price}
									{else}
										{convertPrice price=$product.price_tax_exc}
									{/if}
								</span>
							</p>
						{/if}

						

						{if ($product.id_product_attribute == 0 OR (isset($add_prod_display) AND ($add_prod_display == 1))) AND $product.available_for_order AND !isset($restricted_country_mode) AND $product.minimal_quantity == 1 AND $product.customizable != 2 AND !$PS_CATALOG_MODE}
							{if ($product.quantity > 0 OR $product.allow_oosp)}
							<a class="exclusive btn btn-default ajax_add_to_cart_button " rel="ajax_id_product_{$product.id_product}" href="{$link->getPageLink('cart')|escape:'html'}?qty=1&amp;id_product={$product.id_product}&amp;token={$static_token}&amp;add" title="{l s='Add to cart' mod='homefeatured'}"><span></span></a>
							{else}
							<span class="exclusive btn btn-default disabled">{l s='Add to cart' mod='homefeatured'}</span>
							{/if}
						{else}
							{if $auction_is_installed}
								<div align="center" class="end_time">
									{include file=$smarty.const._PS_MODULE_DIR_|cat:'advauction/views/templates/front/product-list.tpl' product=$product}
								</div>
							{else}
								<div style="height:23px;"></div>
							{/if}
						{/if}
						{if $auction_is_installed}
							{*<div align="center"><a class="button btn btn-default" href="{$product.link|escape:'html'}" title="{l s='View' mod='homefeatured'}"><i class="fa fa-info-circle"></i></a></div>*}
						{else}
							<a class="button btn btn-default" href="{$product.link|escape:'html'}" title="{l s='View' mod='homefeatured'}"></a>
						{/if}
                        
					</div>
                    </div>
					{*<h5><a class="product_link" href="{$product.link|escape:'html'}" title="{$product.name|truncate:50:'...'|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h5>
					<p class="product_desc">{$product.description_short|strip_tags|truncate:65:'...'}</p>*}
					
                    </div>
				</li>
			{/foreach}
			</ul>
	{else}
		<p>{l s='No featured products' mod='homefeatured'}</p>
	{/if}
  </div>
</div>
<!-- /Block wddisplayspecificproducts -->