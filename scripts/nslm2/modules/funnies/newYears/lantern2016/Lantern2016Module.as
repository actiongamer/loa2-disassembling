package nslm2.modules.funnies.newYears.lantern2016
{
   import game.ui.newYears.lantern2016s.Lantern2016ModuleUI;
   import nslm2.modules.funnies.newYears.lantern2016.service.LanternService;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.LanternShopInfoRes;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.LanternShopInfoRes.Shop;
   import nslm2.modules.funnies.newYears.valentine2016.vo.ValentineSaleVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.FuncOpenTimeVo;
   import nslm2.utils.ServerTimer;
   
   public class Lantern2016Module extends Lantern2016ModuleUI
   {
       
      
      private var buyArr:Array;
      
      public function Lantern2016Module()
      {
         buyArr = [];
         super();
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(LanternService.ins.getOpenStatus() == false)
         {
            AlertUtil.floadFuncTimeIsNotOpen(this.moduleId);
            ObserverMgr.ins.sendNotice("updateIconBar");
            ModuleMgr.ins.closeModule(this.moduleId);
            return;
         }
         ServerEngine.ins.send(6258,null,infoCplHandler);
      }
      
      private function infoCplHandler(param1:LanternShopInfoRes) : void
      {
         if(param1)
         {
            buyArr = param1.shop;
         }
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         img_bg.skin = UrlLib.getLanternImg("img_bg");
         img_person.skin = UrlLib.getLanternImg("img_person");
         img_back.skin = UrlLib.getLanternImg("img_back");
         img_title.skin = UrlLib.getLanternImg("img_title");
         refreshBuyList();
         this.btn_close.clickHandler = close;
         this.label_title.text = LocaleMgr.ins.getStr(13330001);
         super.preShowCpl();
      }
      
      private function close() : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override public function getFocusNotices() : Array
      {
         return ["refresh_buy_list"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:Boolean = false;
         var _loc4_:* = null;
         var _loc7_:* = param1;
         if("refresh_buy_list" === _loc7_)
         {
            _loc5_ = false;
            _loc7_ = 0;
            var _loc6_:* = buyArr;
            for each(var _loc3_ in buyArr)
            {
               if(_loc3_.id == (param2 as ValentineSaleVo).shopid)
               {
                  _loc3_.num = (param2 as ValentineSaleVo).curBuyTimes;
                  _loc5_ = true;
               }
            }
            if(!_loc5_)
            {
               _loc4_ = new Shop();
               _loc4_.id = (param2 as ValentineSaleVo).shopid;
               _loc4_.num = (param2 as ValentineSaleVo).curBuyTimes;
               buyArr.push(_loc4_);
            }
            refreshBuyList();
         }
      }
      
      private function today() : int
      {
         var _loc1_:FuncOpenTimeVo = NpcFuncService.ins.getOpenTimeVo(13330);
         return (ServerTimer.ins.second - _loc1_.startTime) / 60 / 60 / 24 + 1;
      }
      
      private function refreshBuyList() : void
      {
      }
   }
}
