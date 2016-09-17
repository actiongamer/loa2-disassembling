package nslm2.modules.funnies.newYears.valentine2016
{
   import game.ui.newYears.valentine2016s.Valentine2016ModuleUI;
   import flash.display.Sprite;
   import nslm2.modules.funnies.newYears.valentine2016.service.ValentineService;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DictHash;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import game.ui.commons.icons.WealthRenderS9UI;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ValentineShopInfoRes;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import nslm2.modules.funnies.newYears.valentine2016.vo.ValentineSaleVo;
   import proto.ValentineShopInfoRes.Shop;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcValentineBuyVo;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.npcFuncLists.FuncOpenTimeVo;
   import nslm2.utils.ServerTimer;
   
   public class Valentine2016Module extends Valentine2016ModuleUI
   {
       
      
      private var _status:int = 0;
      
      private const STATUS_MENU:int = 0;
      
      private const STATUS_EVENT1:int = 1;
      
      private const STATUS_EVENT2:int = 2;
      
      private var buyArr:Array;
      
      private var btn_title1:Sprite;
      
      private var btn_title2:Sprite;
      
      private var valentineService:ValentineService;
      
      private var _eff1:BmcSpriteSheet;
      
      private var _effCount:int = 0;
      
      private var _curEffId:int = 0;
      
      private var postionDict:DictHash;
      
      public function Valentine2016Module()
      {
         buyArr = [];
         super();
      }
      
      public function get pageBar() : PageBarS2
      {
         return this.pageBarUI as PageBarS2;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         img_angel1.skin = UrlLib.getValentineImg("img_angel1");
         img_angel2.skin = UrlLib.getValentineImg("img_angel2");
         img_angel3.skin = UrlLib.getValentineImg("img_angel3");
         img_eventTitle1.skin = UrlLib.getValentineImg("img_eventTitle1");
         img_eventTitle2.skin = UrlLib.getValentineImg("img_eventTitle2");
         img_person.skin = UrlLib.getValentineImg("img_person");
         img_saleBg.skin = UrlLib.getValentineImg("img_saleBg");
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
         this.box_eventTitle1.mask = this.mask_render1;
         this.box_eventTitle2.mask = this.mask_render2;
         this.box_event1.visible = false;
         this.box_event2.visible = false;
         this.img_saleBg.visible = false;
         btn_title1 = new Sprite();
         btn_title1.graphics.lineStyle(null,16777215);
         btn_title1.graphics.beginFill(0);
         btn_title1.graphics.lineTo(0,498);
         btn_title1.graphics.lineTo(455,498);
         btn_title1.graphics.lineTo(315,0);
         btn_title1.graphics.endFill();
         btn_title1.x = this.box_event1.x + 15;
         btn_title1.y = this.box_event1.y + 6;
         btn_title1.buttonMode = true;
         btn_title1.alpha = 0;
         btn_title1.addEventListener("click",clickEvent1Handler);
         addChild(btn_title1);
         btn_title2 = new Sprite();
         btn_title2.graphics.lineStyle(null,16777215);
         btn_title2.graphics.beginFill(0);
         btn_title2.graphics.lineTo(140,498);
         btn_title2.graphics.lineTo(451,498);
         btn_title2.graphics.lineTo(451,0);
         btn_title2.graphics.endFill();
         btn_title2.x = this.box_event1.x + 316 + 15;
         btn_title2.y = this.box_event1.y + 6;
         btn_title2.buttonMode = true;
         btn_title2.alpha = 0;
         btn_title2.addEventListener("click",clickEvent2Handler);
         addChild(btn_title2);
         this.btn_close.addEventListener("click",btnCloseHandler);
         postionDict = new DictHash();
         postionDict.put(128000,[138,139]);
         postionDict.put(122000,[407,97]);
         postionDict.put(101400,[700,117]);
         this.label_flower1.text = LocaleMgr.ins.getStr(13320006);
         this.label_flower2.text = LocaleMgr.ins.getStr(13320007);
         this.label_flower3.text = LocaleMgr.ins.getStr(13320008);
         valentineService = ValentineService.ins;
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            this["render_flower" + (_loc2_ + 1)].dataSource = WealthUtil.createItemVo(valentineService.dict.getValue(valentineService.angelArr[_loc2_]),1);
            (this["render_flower" + (_loc2_ + 1)] as WealthRenderS9UI).txt_name.visible = false;
            (this["render_flower" + (_loc2_ + 1)] as WealthRenderS9UI).txt_num.visible = false;
            _loc2_++;
         }
         super.preShowCpl();
      }
      
      public function showEff() : void
      {
         if(!_eff1)
         {
            _eff1 = new BmcSpriteSheet();
            _eff1.init(60000002,1,"all",false,1,0,showEff);
            _eff1.x = postionDict.getValue(_curEffId)[0];
            _eff1.y = postionDict.getValue(_curEffId)[1];
            this.addChild(_eff1);
         }
         else if(_effCount == 2)
         {
            _effCount = 0;
            _eff1.dispose();
            _eff1 = null;
         }
         else
         {
            _eff1.init(60000002,1,"all",false,1,0,showEff);
            _effCount = Number(_effCount) + 1;
         }
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         if(ValentineService.ins.getOpenStatus() == false)
         {
            AlertUtil.floadFuncTimeIsNotOpen(this.moduleId);
            ObserverMgr.ins.sendNotice("updateIconBar");
            ModuleMgr.ins.closeModule(this.moduleId);
            return;
         }
         ServerEngine.ins.send(6252,null,infoCplHandler);
      }
      
      private function infoCplHandler(param1:ValentineShopInfoRes) : void
      {
         if(param1)
         {
            buyArr = param1.shop;
         }
         super.moduleServerCpl();
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_give1 !== _loc2_)
         {
            if(this.btn_give2 !== _loc2_)
            {
               if(this.btn_give3 === _loc2_)
               {
                  ModuleMgr.ins.showModule(13321,101400,this.moduleId);
               }
            }
            else
            {
               ModuleMgr.ins.showModule(13321,122000,this.moduleId);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(13321,128000,this.moduleId);
         }
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(_status)
         {
            backTween();
            TweenLite.to(this.box_event1,0.4,{"alpha":0});
            TweenLite.to(this.box_event2,0.4,{
               "alpha":0,
               "onComplete":hideAll
            });
            TweenLite.to(this.img_saleBg,0.4,{"alpha":0});
         }
         else
         {
            ModuleMgr.ins.closeModule(this.moduleId);
         }
      }
      
      private function hideAll() : void
      {
         this.box_event1.visible = false;
         this.box_event2.visible = false;
         this.img_saleBg.visible = false;
      }
      
      protected function debugClick(param1:MouseEvent) : void
      {
      }
      
      private function clickEvent1Handler(param1:MouseEvent) : void
      {
         btn_title1.mouseEnabled = false;
         btn_title2.mouseEnabled = false;
         _status = 1;
         selectTween();
         this.box_event1.visible = true;
         this.box_event1.alpha = 1;
         TweenLite.from(this.box_event1,0.4,{"alpha":0});
      }
      
      override public function getFocusNotices() : Array
      {
         return ["show_eff","refresh_buy_list"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc5_:Boolean = false;
         var _loc4_:* = null;
         var _loc7_:* = param1;
         if("show_eff" !== _loc7_)
         {
            if("refresh_buy_list" === _loc7_)
            {
               _loc5_ = false;
               if((param2 as ValentineSaleVo).isHalfPrice)
               {
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
         }
         else
         {
            _curEffId = param2 as int;
            showEff();
         }
      }
      
      private function refreshBuyList() : void
      {
         var _loc5_:* = null;
         var _loc4_:Array = StcMgr.ins.getVoArrByColumnValue("static_valentine_buy","day",today());
         var _loc2_:Array = [];
         var _loc9_:int = 0;
         var _loc8_:* = _loc4_;
         for each(var _loc3_ in _loc4_)
         {
            _loc5_ = new ValentineSaleVo();
            _loc5_.id = _loc3_.id;
            _loc5_.day = _loc3_.day;
            _loc5_.giveid = _loc3_.giveid;
            _loc5_.shopid = _loc3_.shopid;
            _loc5_.isHalfPrice = true;
            var _loc7_:int = 0;
            var _loc6_:* = buyArr;
            for each(var _loc1_ in buyArr)
            {
               if(_loc1_.id == _loc5_.shopid)
               {
                  _loc5_.curBuyTimes = _loc1_.num;
               }
            }
            _loc2_.push(_loc5_);
         }
         this.list_sales.dataSource = _loc2_;
      }
      
      private function clickEvent2Handler(param1:MouseEvent) : void
      {
         btn_title1.mouseEnabled = false;
         btn_title2.mouseEnabled = false;
         _status = 2;
         selectTween();
         this.box_event2.visible = true;
         this.box_event2.alpha = 1;
         this.img_saleBg.visible = true;
         this.img_saleBg.alpha = 1;
         TweenLite.from(this.box_event2,0.4,{"alpha":0});
         TweenLite.from(this.img_saleBg,0.4,{"alpha":0});
         refreshBuyList();
         this.pageBar.bindList(this.list_sales);
      }
      
      private function today() : int
      {
         var _loc1_:FuncOpenTimeVo = NpcFuncService.ins.getOpenTimeVo(13320);
         return (ServerTimer.ins.second - _loc1_.startTime) / 60 / 60 / 24 + 1;
      }
      
      private function selectTween() : void
      {
         TweenLite.to(this.box_eventTitle1,0.4,{"x":-455});
         TweenLite.to(this.box_eventTitle2,0.4,{"x":812});
      }
      
      private function backTween() : void
      {
         TweenLite.to(this.box_eventTitle1,0.4,{"x":16});
         TweenLite.to(this.box_eventTitle2,0.4,{"x":343});
         btn_title1.mouseEnabled = true;
         btn_title2.mouseEnabled = true;
         _status = 0;
      }
   }
}
