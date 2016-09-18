package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanBuyBuffPanelUI;
   import flash.events.MouseEvent;
   import morn.core.components.Button;
   import flash.display.Sprite;
   import com.mz.core.configs.ClientConfig;
   import proto.ShenYuanBuff;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import proto.ShenYuanBuyBuffReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.ShenYuanBuyBuffRes;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import com.greensock.TweenLite;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.DisplayUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class ShenYuanBuyBuffPanel extends ShenYuanBuyBuffPanelUI
   {
       
      
      private var _buffs:Array;
      
      private var _bg:Sprite;
      
      private var _index:int;
      
      public function ShenYuanBuyBuffPanel()
      {
         super();
         MornExpandUtil.setCenter(this);
         MornExpandUtil.addHandlerForBtnAll(this,clickHandle);
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000518);
      }
      
      override public function btnCloseHandler(param1:MouseEvent = null) : void
      {
         closePanel();
      }
      
      private function clickHandle(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_buy_0 !== _loc2_)
         {
            if(this.btn_buy_1 !== _loc2_)
            {
               if(this.btn_buy_2 === _loc2_)
               {
                  confirmBtnClicked(2);
               }
            }
            else
            {
               confirmBtnClicked(1);
            }
         }
         else
         {
            confirmBtnClicked(0);
         }
      }
      
      private function drawBg() : void
      {
         if(!_bg)
         {
            _bg = new Sprite();
         }
         this.parent.addChildAt(_bg,0);
         _bg.graphics.clear();
         _bg.graphics.beginFill(0,0.3);
         _bg.graphics.drawRect(0,0,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         _bg.graphics.endFill();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _buffs = param1 as Array;
         _loc4_ = 0;
         while(_loc4_ < 3)
         {
            _loc2_ = _buffs[_loc4_];
            this["price_" + _loc4_].text = _loc2_.jiage;
            this["img_buy_" + _loc4_].visible = _loc2_.buy;
            _loc3_ = StcMgr.ins.getBuffVo(_loc2_.id);
            this["txt_buff_desc" + _loc4_].text = LocaleMgr.ins.getStr(_loc3_.desc) + " +" + (_loc2_.param * 100).toFixed() + "%";
            this["txt_buff_name" + _loc4_].text = LocaleMgr.ins.getStr(_loc3_.name);
            this["icon_buff" + _loc4_].url = UrlLib.towerBuffIcon(_loc3_.icon_id);
            Button(this["btn_buy_" + _loc4_]).disabled = _loc2_.buy;
            if(_loc2_.buy)
            {
               Button(this["btn_buy_" + _loc4_]).label = LocaleMgr.ins.getStr(41500039);
            }
            else
            {
               Button(this["btn_buy_" + _loc4_]).label = LocaleMgr.ins.getStr(41500038);
            }
            _loc4_++;
         }
      }
      
      private function confirmBtnClicked(param1:int) : void
      {
         var _loc2_:ShenYuanBuff = _buffs[param1];
         if(_loc2_.jiage > ShenYuanModel.ins.crtStarCnt)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000519)));
            return;
         }
         var _loc3_:ShenYuanBuyBuffReq = new ShenYuanBuyBuffReq();
         _loc3_.id = _loc2_.id;
         _loc3_.param = _loc2_.param;
         _index = param1;
         ServerEngine.ins.send(6083,_loc3_,buyBuffSuccess);
      }
      
      private function buyBuffSuccess(param1:ShenYuanBuyBuffRes) : void
      {
         ShenYuanBuff(_buffs[_index]).buy = true;
         this["img_buy_" + _index].visible = true;
         new ScaleTweenEff().init(this["img_buy_" + _index],0.3,2,1,Elastic.easeIn);
         Button(this["btn_buy_" + _index]).disabled = true;
         Button(this["btn_buy_" + _index]).label = LocaleMgr.ins.getStr(41500039);
         ShenYuanModel.ins.crtStarCnt = param1.nowstar;
         this.txt_starNum.text = ShenYuanModel.ins.crtStarCnt + "";
         ShenYuanModel.ins.buffArr = param1.buff;
         TweenLite.delayedCall(0.4,ObserverMgr.ins.sendNotice,["SHENYUAN_BUY_ONE_BUFF",this["icon_buff" + _index]]);
         ObserverMgr.ins.sendNotice("SHENYUAN_STAR_NUM_CHG");
      }
      
      private function closePanel() : void
      {
         if(canBuy())
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(41500111),comfirmClose);
            return;
         }
         comfirmClose();
      }
      
      private function canBuy() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _buffs.length)
         {
            _loc1_ = _buffs[_loc2_];
            if(!_loc1_.buy && ShenYuanModel.ins.crtStarCnt >= _loc1_.jiage)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function comfirmClose() : void
      {
         ObserverMgr.ins.sendNotice("shenyuan_buy_buff_complete");
         if(_bg)
         {
            DisplayUtils.removeSelf(_bg);
         }
         DisplayUtils.removeSelf(this);
      }
      
      public function init() : void
      {
         this.txt_starNum.text = ShenYuanModel.ins.crtStarCnt + "";
         this.alpha = 1;
         var _loc1_:int = 1;
         this.scaleY = _loc1_;
         this.scaleX = _loc1_;
         this.visible = true;
         new ScaleTweenEff().init(this,0.3,0.3,0.5);
         drawBg();
      }
      
      override public function dispose() : void
      {
         if(_bg)
         {
            DisplayUtils.removeSelf(_bg);
         }
         super.dispose();
      }
   }
}
