<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-present http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\model\AuthAccessModel;
use app\admin\model\EcomModel;
use app\admin\model\RoleUserModel;
use cmf\controller\AdminBaseController;
use think\facade\Cache;
use tree\Tree;
use app\admin\model\AdminMenuModel;

class EcomController extends AdminBaseController
{

    public function index()
    {

        if (!empty($content)) {
            return $content;
        }

        $params=$this->request->param();
        if(key_exists('page', $params))
            $curpage = $params['page'];
        else
            $curpage = 1;

        $where = array();
        if(key_exists('ModelID', $params))
            if(strcmp($params['ModelID'], 'All') != 0)
                $where['ModelID'] = [$params['ModelID']];
            else {
                $where['ModelID'] = [1, 2];
            }
        else {
            $where['ModelID'] = [1, 2];
        }

        $prod = EcomModel::where($where)
            ->order("ProductModelSize")
            ->paginate(20);

        $page = $prod->render();


        $this->assign("curpage", $curpage);
        $this->assign("page", $page);
        $this->assign("prod", $prod);
        return $this->fetch();
    }
}


    