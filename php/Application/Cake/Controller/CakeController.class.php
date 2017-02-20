<?php
namespace Cake\Controller;
use Think\Controller;

class CakeController extends Controller {

	public function index(){
		//数据库两种写法：第一种框架方法 第二种类似传统 两种效果一样
		$info=M("cake_types")->select();
		//$info=M("test")->query("select * from qw_test");
		$this->assign("htmlinfo",$info);//传值到html页面   htmlinfo是html里面的读取名称 后面是 上面sql数据 是一个数组
		$this->display();//显示html页面
	}

	//将cake类型名数组转换位值
	private function typeNamesToTypeBits($type_names)
    {
        $g_cake_types_str=array("type_man","type_woman","type_child","type_fruit","type_fantang","type_shouyan","type_shouyan",
        "type_photo","type_factory","type_flower","type_love","type_caihui","type_tilamisu","type_tiandian");//定义成全局
        $bits=0;
        foreach($type_names as $type_name)
        {
            for($i=0;$i<count($g_cake_types_str);$i++)
            {
                if($type_name==$g_cake_types_str[$i])
                {
                    $bits=$bits|(1<<i);
                }
            }
        }
        return $bits;
    }
    //将cake类型id数组转换位值
    private function typeIdsToTypeBits($type_ids)
    {
        $bits=0;
        foreach($type_ids as $type_id)
        {
            $bits=$bits|(1<<$type_id);
        }
        return $bits;
    }

//根据蛋糕类型的位标志查询蛋糕
//M("表名")
	private function queryCakes($type_id_bits)
    {
        //global $g_cake_types_str;
        $g_cake_types_str=array("type_man","type_woman","type_child","type_fruit","type_fantang","type_shouyan","type_shouyan",
            "type_photo","type_factory","type_flower","type_love","type_caihui","type_tilamisu","type_tiandian");
        $index=0;
        $where_str="";
        do
        {
            if(($type_id_bits & 0x01)==0x01)
            {
                $where_str=$g_cake_types_str[$index] ."=true ";
                $type_id_bits=$type_id_bits>>1;
                $index++;
                break;
            }
            $type_id_bits=$type_id_bits>>1;
            $index++;
        }while( $index<count($g_cake_types_str));

        while( $index<count($g_cake_types_str))
        {
            if(($type_id_bits & 0x01)==0x01)
            {
                $where_str=$where_str." and " . $g_cake_types_str[$index] ."=true ";
                break;
            }
            $type_id_bits=$type_id_bits>>1;
            $index++;
        };
        //echo $where_str."<br>";
        return M("cake_images")->where($where_str)->select();
    }

    private function queryCakeDetails($cake_id)
    {
        return M("cake_detail")->where("cake_id=$cake_id")->select();
    }


	//搜索照片名的集合，显示蛋糕图片集
    public function collect(){
        $cake_id=1;
        if(null!=(I("cakeid")))
        {
            $cake_id=I("cakeid");
        }
        //echo $cake_id.'<br>';
        $cake_images=$this->queryCakes($cake_id);
        $this->assign("cakeinfo",$cake_images);//传值到html页面   htmlinfo是html里面的读取名称 后面是 上面sql数据 是一个数组
        $this->display();//显示html页面
    }


    public function detail(){
        $cake_id=1;
        if(null!=(I("cakeid")))
        {
            $cake_id=I("cakeid");
        }
        $cake_details=$this->queryCakeDetails($cake_id);
        $this->assign("cakedetail",$cake_details);//传值到html页面
        $cakeinfo=M("cake_images")->where("id=$cake_id")->find();
        $this->assign("cakeinfo",$cakeinfo);
        $this->display();//显示html页面
    }
	
	
	
	
	public function test(){
		/*
		文件名是什么  View 里面就要创建 一样的 html页面   这个 就是   Login_test.html   	
		$this->display() 用这个显示
		 
		 */
		echo "qw";//直接在页面上打印出qw 
	}
	
	public function other(){
		/*
		 * 也可以作为方法
		 * 	$this->display() 不要用
		 */
		$this->test();//调用类的方法
	}
	
	
}
