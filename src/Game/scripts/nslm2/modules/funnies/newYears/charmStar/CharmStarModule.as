package nslm2.modules.funnies.newYears.charmStar
{
   import game.ui.newYears.charmStar.CharmStarModuleUI;
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarModel;
   import nslm2.modules.funnies.newYears.charmStar.control.CharmStarControl;
   import nslm2.modules.funnies.newYears.charmStar.view.CharmRankView;
   import nslm2.modules.funnies.newYears.charmStar.view.CharmShopView;
   import flash.display.Sprite;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import proto.CharmRankShopInfoRes;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import proto.CharmRankShopDetailRes;
   import proto.CharmRankRankDetailRes;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.utils.RTools;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   
   public class CharmStarModule extends CharmStarModuleUI
   {
       
      
      private const STATUS_MENU:int = 0;
      
      private const STATUS_EVENT1:int = 1;
      
      private const STATUS_EVENT2:int = 2;
      
      private var _status:int = 0;
      
      private var _model:CharmStarModel;
      
      private var _control:CharmStarControl;
      
      private var _rankView:CharmRankView;
      
      private var _shopView:CharmShopView;
      
      private var btn_title1:Sprite;
      
      private var btn_title2:Sprite;
      
      private var timeObj:Object;
      
      private var _sendCount:int;
      
      public function CharmStarModule()
      {
         super();
         init();
      }
      
      public function get model() : CharmStarModel
      {
         return _model;
      }
      
      private function init() : void
      {
         _model = new CharmStarModel();
         _control = new CharmStarControl(_model);
         _rankView = new CharmRankView(rankView,_model,_control);
         _shopView = new CharmShopView(shopView,_model,_control);
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         _sendCount = 0;
         if(_control.isOpenTimeOne() == false)
         {
            AlertUtil.floadFuncTimeIsExpire(moduleId);
            ObserverMgr.ins.sendNotice("updateIconBar");
            ModuleMgr.ins.closeModule(moduleId);
            return;
         }
         ServerEngine.ins.send(10014,null,shopCplHandler);
         ServerEngine.ins.send(10015,null,shopPropList);
         ServerEngine.ins.send(10016,null,rankDeta);
      }
      
      private function shopCplHandler(param1:CharmRankShopInfoRes) : void
      {
         res = param1;
         if(res)
         {
            _model.shopInfoArr = res.shop;
         }
         img_eventTitle1.url = res.panelImg;
         img_eventTitle2.url = res.shopImg;
         Log.info("图片1的路径：" + res.panelImg);
         Log.info("图片2的路径：" + res.shopImg);
         timeObj = App.timer.doOnce(10000,function():void
         {
            if(img_eventTitle1.bitmapData == null && img_eventTitle2.bitmapData == null)
            {
               img_eventTitle1.skin = UrlLib.getValentineImg("img_eventTitle1");
               img_eventTitle2.skin = UrlLib.getValentineImg("img_eventTitle2");
               App.timer.clearTimer(timeObj);
               timeObj = null;
            }
         });
      }
      
      private function shopPropList(param1:CharmRankShopDetailRes) : void
      {
         if(param1 && param1.all)
         {
            _model.shopPropArr = param1.all;
         }
         sendEnd();
      }
      
      private function rankDeta(param1:CharmRankRankDetailRes) : void
      {
         if(param1)
         {
            _model.rankRewordArr = param1.all.sortOn("id");
         }
         sendEnd();
      }
      
      private function sendEnd() : void
      {
         _sendCount = Number(_sendCount) + 1;
         if(_sendCount == 2)
         {
            super.moduleServerStart(null);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         charmSatrBox.mask = mask_render3;
         box_eventTitle1.mask = mask_render1;
         box_eventTitle2.mask = mask_render2;
         charmStarTimeTxt.text = LocaleMgr.ins.getStr(350010023) + TimeUtils.getFullTimeStrCN(NpcFuncService.ins.getOpenTimeVo(13400).startTime,true,true,RTools.cl(false,true)) + "——" + TimeUtils.getFullTimeStrCN(NpcFuncService.ins.getOpenTimeVo(13400).endTime,true,true,RTools.cl(false,true));
         titleTxt1.text = LocaleMgr.ins.getStr(999003110);
         titleTxt2.text = LocaleMgr.ins.getStr(999003111);
         btn_title1 = new Sprite();
         btn_title1.graphics.lineStyle(null,16711680);
         btn_title1.graphics.beginFill(0);
         btn_title1.graphics.lineTo(0,498);
         btn_title1.graphics.lineTo(455,498);
         btn_title1.graphics.lineTo(315,0);
         btn_title1.graphics.endFill();
         btn_title1.x = _rankView.x + 2;
         btn_title1.y = _rankView.y;
         btn_title1.buttonMode = true;
         btn_title1.alpha = 0;
         btn_title1.addEventListener("click",clickEvent1Handler);
         this.addChild(btn_title1);
         btn_title2 = new Sprite();
         btn_title2.graphics.lineStyle(null,16777215);
         btn_title2.graphics.beginFill(0,1);
         btn_title2.graphics.lineTo(140,498);
         btn_title2.graphics.lineTo(451,498);
         btn_title2.graphics.lineTo(451,0);
         btn_title2.graphics.endFill();
         btn_title2.x = _rankView.x + 318;
         btn_title2.y = _rankView.y;
         btn_title2.buttonMode = true;
         btn_title2.alpha = 0;
         btn_title2.addEventListener("click",clickEvent2Handler);
         this.addChild(btn_title2);
         closeBtn.addEventListener("click",btnCloseHandler);
         hideAll();
         _control.reqCharmRankStunner();
      }
      
      private function clickEvent1Handler(param1:MouseEvent) : void
      {
         btn_title1.mouseEnabled = false;
         btn_title2.mouseEnabled = false;
         _status = 1;
         selectTween();
         this.addChildAt(_rankView,_rankView.childIndex);
         _rankView.alpha = 1;
         TweenLite.from(_rankView,0.4,{"alpha":0});
      }
      
      private function clickEvent2Handler(param1:MouseEvent) : void
      {
         btn_title1.mouseEnabled = false;
         btn_title2.mouseEnabled = false;
         _status = 2;
         selectTween();
         this.addChildAt(_shopView,_shopView.childIndex);
         _shopView.alpha = 1;
         TweenLite.from(_shopView,0.4,{"alpha":0});
      }
      
      private function selectTween() : void
      {
         hideAll();
         TweenLite.to(charmSatrBox,0.4,{"y":7});
         TweenLite.to(box_eventTitle1,0.4,{"x":-387});
         TweenLite.to(box_eventTitle2,0.4,{"x":981});
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         if(_status)
         {
            backTween();
            TweenLite.to(_rankView,0.4,{"alpha":0});
            TweenLite.to(_shopView,0.4,{
               "alpha":0,
               "onComplete":hideAll
            });
         }
         else
         {
            ModuleMgr.ins.closeModule(moduleId);
         }
      }
      
      private function backTween() : void
      {
         TweenLite.to(charmSatrBox,0.4,{"y":52});
         TweenLite.to(box_eventTitle1,0.4,{"x":95});
         TweenLite.to(box_eventTitle2,0.4,{"x":422});
         btn_title1.mouseEnabled = true;
         btn_title2.mouseEnabled = true;
         _status = 0;
      }
      
      private function hideAll() : void
      {
         _rankView.parent && _rankView.parent.removeChild(_rankView);
      }
   }
}
