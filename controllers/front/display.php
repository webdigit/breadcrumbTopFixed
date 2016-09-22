<?php
class wddisplayspecificproductsdisplayModuleFrontController extends ModuleFrontController
{
  public function initContent()
  {
    parent::initContent();
    
    $category = new Category(12, (int)Context::getContext()->language->id);
    $nb = 100;
    $this->context->smarty->assign(
    		array(
    				'products' => $category->getProductsWithAuction((int)Context::getContext()->language->id, 1, ($nb ? $nb : 100), 'position'),
    				'homeSize' => Image::getSize(ImageType::getFormatedName('home')),
    		)
    );
    
    $this->setTemplate('display.tpl');
  }
  
  public function _cacheProducts()
  {
  	if (!isset(WdDisplaySpecificProducts::$cache_products))
  	{
  		//$category = new Category(Context::getContext()->shop->getCategory(), (int)Context::getContext()->language->id);
  		$category = new Category(12, (int)Context::getContext()->language->id);
  		$nb = 3;
  		WdDisplaySpecificProducts::$cache_products = $category->getProductsWithAuction((int)Context::getContext()->language->id, 1, ($nb ? $nb : 3), 'position');
  			
  	}
  
  	if (WdDisplaySpecificProducts::$cache_products === false || empty(WdDisplaySpecificProducts::$cache_products))
  		return false;
  }
}