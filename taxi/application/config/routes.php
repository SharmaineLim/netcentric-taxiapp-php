<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/

//$route[''] = "";

$route['subcategory/update/(:any)'] = "references/subcategory/update/$1";
$route['subcategory/create'] = "references/subcategory/create";
$route['subcategory/(:any)'] = "references/subcategory";
$route['subcategory'] = "references/subcategory";

$route['category/update/(:any)'] = "references/category/update/$1";
$route['category/create'] = "references/category/create";
$route['category/(:any)'] = "references/category";
$route['category'] = "references/category";

$route['level/update/(:any)'] = "references/level/update/$1";
$route['level/create'] = "references/level/create";
$route['level/(:any)'] = "references/level/";
$route['level'] = "references/level";

$route['account/update/(:any)'] = "account/update/$1";
$route['account/create'] = "account/create";
$route['account/(:any)'] = "account";
$route['account'] = "account";

$route['comment/update/(:any)'] = "comment/update/$1";
$route['comment/create'] = "comment/create";
$route['comment/(:any)'] = "comment";
$route['comment'] = "comment";

$route['report/update/(:any)'] = "report/update/$1";
$route['report/create'] = "report/create";
$route['report/(:any)'] = "report";
$route['report'] = "report";

$route['taxi/update/(:any)'] = "taxi/update/$1";
$route['taxi/create'] = "taxi/create";
$route['taxi/(:any)'] = "taxi";
$route['taxi'] = "taxi";

$route['home/(:any)'] = "home";
$route['home'] = "home";
$route['default_controller'] = "home";

//$route['404_override'] = '';


/* End of file routes.php */
/* Location: ./application/config/routes.php */