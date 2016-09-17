package nslm2.modules.cultivates.fashion
{
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.fashion.panels.FashionPanel;
   import nslm2.modules.cultivates.fashion.panels.FashionAccPanel;
   import nslm2.modules.cultivates.fashion.panels.FashionAccMakePanel;
   import nslm2.modules.cultivates.fashion.panels.FashionAccRefreshPanel;
   import com.mz.core.utils.DictHash;
   import nslm2.modules.cultivates.fashion.vos.FashionInfoSubConfigVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class FashionConsts
   {
      
      public static const SPECIAL_SKILL_KIND:uint = 1;
      
      public static const PUTOFF:int = 0;
      
      public static const PUTON:int = 1;
      
      public static const EVT_CLOTH_SELECT:String = "evtClothSelect";
      
      public static const EVT_WING_SELECT:String = "evtWingSelect";
      
      public static const EVT_ACC_SELECT:String = "evtAccSelect";
      
      public static const EVT_NOR_SKILL_SELECT:String = "evtNorSkillSelect";
      
      public static const EVT_SPE_SKILL_SELECT:String = "evtSpeSkillSelect";
      
      public static const EVT_FASHION_USING_CHANGE:String = "evtFashionUsingChange";
      
      public static const EVT_SKILL_USING_CHANGE:String = "evtSkillUsingChange";
      
      public static const EVT_ACTIVATE_CPL:String = "evtActivateCpl";
      
      public static const EVT_REFRESH_ACC_LIST:String = "evt_refresh_acc_list";
      
      public static const ERROR:String = "ERROR";
      
      public static const OK:String = "OK";
      
      public static const INACTIVATE:int = 0;
      
      public static const HAS_ACTIVATED:int = 1;
      
      public static const AVATAR_X:int = -119;
      
      public static const AVATAR_Y:int = -150;
      
      public static const subId_fashion:int = 30200;
      
      public static const subId_fashionAcc:int = 31220;
      
      public static const subId_fashionMake:int = 31200;
      
      public static const subId_fashionRefresh:int = 31230;
      
      public static const PANEL_ARR:Array = [FashionPanel,FashionAccPanel,FashionAccMakePanel,FashionAccRefreshPanel];
      
      public static const ID_ARR:Array = [30200,31220,31200,31230];
      
      private static var _ins:nslm2.modules.cultivates.fashion.FashionConsts;
       
      
      private var IMG_YJBG:String = "png.uiFashion.img_yjBg";
      
      private var IMG_BG:String = "png.uiFashion.img_bg";
      
      public var configLib:DictHash;
      
      public function FashionConsts()
      {
         configLib = new DictHash();
         super();
         configLib.put(30200,new FashionInfoSubConfigVo(30200,LocaleMgr.ins.getStr(31200004),true,false,IMG_BG));
         configLib.put(31220,new FashionInfoSubConfigVo(31220,LocaleMgr.ins.getStr(31200005),true,false,IMG_BG));
         configLib.put(31200,new FashionInfoSubConfigVo(31200,LocaleMgr.ins.getStr(31200002),false,true,IMG_YJBG));
         configLib.put(31230,new FashionInfoSubConfigVo(31230,LocaleMgr.ins.getStr(31200003),false,true,IMG_YJBG));
      }
      
      public static function get showIdArr() : Array
      {
         var _loc1_:Array = [30200];
         if(FuncOpenAutoCtrl.checkOpen(31200))
         {
            _loc1_ = _loc1_.concat([31220,31200,31230]);
         }
         return _loc1_;
      }
      
      public static function get ins() : nslm2.modules.cultivates.fashion.FashionConsts
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.fashion.FashionConsts();
         }
         return _ins;
      }
      
      public function getVo(param1:int) : FashionInfoSubConfigVo
      {
         return configLib.getValue(param1);
      }
   }
}
