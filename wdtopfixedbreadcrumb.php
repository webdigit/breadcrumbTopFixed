<?php
if (!defined('_PS_VERSION_'))
	exit;

class wdTopFixedBreadcrumb extends Module
{
	protected static $cache_products;
	
	public function __construct()
	{
		$this->name = 'wdtopfixedbreadcrumb';
		$this->tab = 'front_office_features';
		$this->version = 1.1;
		$this->author = 'Jean Christophe Van Achter';
		$this->need_instance = 0;
		$this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);		
		parent::__construct();
	
		$this->displayName = $this->l('WD Top Fixed BreadCrumb');
		$this->description = $this->l('Displays BreadCrumb & Menu fixed to the top when out of view.');
		$this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
		
		if (!Configuration::get('wdtopfixedbreadcrumb'))
			$this->warning = $this->l('No name provided');
	}
	
	public function install()
	{
		$success = (
				parent::install() &&
				$this->registerHook('header')
				);
	
		if ($success)
		{
			//
		}
		return $success;
	}
	
	public function uninstall()
	{
		return parent::uninstall();
	}
	
	public function hookDisplayHeader()
	{
		$this->context->controller->addCSS($this->_path.'css/wdtopfixedbreadcrumb.css', 'all');
		$this->context->controller->addJS($this->_path.'js/jquery.appear.js');
		$this->context->controller->addJS($this->_path.'js/wdtopfixedbreadcrumb.js');
	}
	
}