package nslm2.modules.foundations.dailyTask.render
{
   import game.ui.dailyTaskModules.ResBackRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcSourceRetrivalVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.display.Sprite;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.model.PlayerModel;
   import proto.RetrivalRewardReq;
   import nslm2.nets.sockets.ServerEngine;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.dailyTask.view.ResourceBackView;
   import morn.customs.expands.MornExpandUtil;
   
   public class ResBackRender extends ResBackRenderUI
   {
       
      
      private var vo:StcSourceRetrivalVo;
      
      private var _wealthvo:WealthVo;
      
      private var maxnum:int;
      
      private var mask:Sprite;
      
      private var kind:int = 0;
      
      private var goldStr:String;
      
      private var diamStr:String;
      
      public function ResBackRender()
      {
         super();
         this.img_icon_gold.skin = UrlLib.itemMiniIcon(1);
         this.img_icon_diamond.skin = UrlLib.itemMiniIcon(3);
         this.btn_gold.label = LocaleMgr.ins.getStr(109000021);
         this.btn_diamond.label = LocaleMgr.ins.getStr(109000022);
         MornExpandUtil.addHandlerForBtnAll(this,onClick);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         .super.dataSource = param1;
         if(param1)
         {
            if(param1.reward.length <= 0)
            {
               setInitView(param1.key,param1.curNum,param1.maxNum);
               return;
            }
            _loc7_ = param1.key;
            _loc2_ = param1.reward;
            _loc3_ = param1.curNum;
            maxnum = param1.maxNum;
            _loc6_ = WealthUtil.rewardArrToWealthVoArr(_loc2_);
            this.vo = StcMgr.ins.getSourceRetrivalVo(dataSource.key);
            if(_loc6_.length > 0)
            {
               _wealthvo = _loc6_[0];
               goldStr = " " + Math.round(vo.gold_per * _wealthvo.showCount * maxnum) + " " + _wealthvo.showName;
               diamStr = " " + Math.round(vo.diamond_per * _wealthvo.showCount * maxnum) + " " + _wealthvo.showName;
               _loc5_ = "X" + Math.round(vo.gold_per * _wealthvo.showCount * maxnum);
               _loc4_ = "X" + Math.round(vo.diamond_per * _wealthvo.showCount * maxnum);
               this.img_icon_1.skin = _wealthvo.iconUrl();
               this.img_icon_1.mouseEnabled = true;
               this.img_icon_1.toolTip = _wealthvo;
               this.img_icon_2.skin = _wealthvo.iconUrl();
               this.img_icon_2.mouseEnabled = true;
               this.img_icon_2.toolTip = _wealthvo;
            }
            this.img_func.skin = UrlLib.funcResBackIcon(_loc7_);
            this.label_0.text = LocaleMgr.ins.getStr(9000000 + _loc7_);
            if(_loc3_ == 0)
            {
               this.txt_prog.text = maxnum + "/" + maxnum;
            }
            else
            {
               this.txt_prog.text = "0/" + maxnum;
            }
            this.txt_title.text = LocaleMgr.ins.getStr(109000007);
            this.txt_info_1.text = LocaleMgr.ins.getStr(109000010);
            this.txt_info_2.text = LocaleMgr.ins.getStr(109000011);
            this.txt_count_1.text = _loc5_;
            this.txt_count_2.text = _loc4_;
            if(param1.curNum > 0)
            {
               drawMask();
               this.img_back.visible = true;
            }
         }
      }
      
      private function setInitView(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:* = param1;
         var _loc6_:* = param2;
         var _loc5_:* = param3;
         this.img_func.skin = UrlLib.funcResBackIcon(_loc4_);
         this.label_0.text = LocaleMgr.ins.getStr(9000000 + _loc4_);
         this.txt_prog.text = _loc6_ + "/" + _loc5_;
         this.txt_title.text = LocaleMgr.ins.getStr(109000007);
         this.txt_info_1.text = LocaleMgr.ins.getStr(109000046);
         this.txt_info_2.text = "";
         this.txt_count_1.text = "";
         this.txt_count_2.text = "";
         this.btn_gold.disabled = true;
         this.btn_diamond.disabled = true;
         drawMask();
      }
      
      private function drawMask() : void
      {
         if(!mask)
         {
            mask = new Sprite();
            mask.graphics.beginFill(3355443,0.5);
            mask.graphics.drawRoundRect(img_bg0.x,img_bg0.y,img_bg0.width,img_bg0.height,5,5);
            mask.graphics.endFill();
         }
         this.addChild(mask);
      }
      
      private function onClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = param1;
         if(this.btn_gold !== _loc3_)
         {
            if(this.btn_diamond === _loc3_)
            {
               AlertUtil.comfirm(LocaleMgr.ins.getStr(109000043,[getDiamPrice(),vo.diamond_per * 100 + "%",diamStr]),diamgoNext,null,null);
            }
         }
         else
         {
            AlertUtil.comfirm(LocaleMgr.ins.getStr(109000042,[getGoldPrice(),vo.gold_per * 100 + "%",goldStr]),goldgoNext,null,null);
         }
      }
      
      private function getGoldPrice() : int
      {
         var _loc1_:WealthVo = WealthVo.parseCostStr(vo.gold_price);
         return _loc1_.count * maxnum;
      }
      
      private function getDiamPrice() : int
      {
         var _loc1_:WealthVo = WealthVo.parseCostStr(vo.diamond_price);
         return _loc1_.count * maxnum;
      }
      
      private function goldgoNext() : void
      {
         var _loc1_:* = null;
         if(PlayerModel.ins.gold < getGoldPrice())
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300004040));
         }
         else
         {
            _loc1_ = new RetrivalRewardReq();
            _loc1_.id = vo.id;
            _loc1_.kind = 1;
            kind = _loc1_.kind;
            ServerEngine.ins.send(5371,_loc1_,onRewardRet);
         }
      }
      
      private function diamgoNext() : void
      {
         var _loc1_:* = null;
         if(PlayerModel.ins.diamond < getDiamPrice())
         {
            AlertUtil.float(LocaleMgr.ins.getStr(300004041));
         }
         else
         {
            _loc1_ = new RetrivalRewardReq();
            _loc1_.id = vo.id;
            _loc1_.kind = 2;
            kind = _loc1_.kind;
            ServerEngine.ins.send(5371,_loc1_,onRewardRet);
         }
      }
      
      private function onRewardRet() : void
      {
         if(kind == 1)
         {
            _wealthvo.count = _wealthvo.count * (vo.gold_per * maxnum);
         }
         else
         {
            _wealthvo.count = _wealthvo.count * (vo.diamond_per * maxnum);
         }
         TweenLite.delayedCall(0.8,FloatUtil.showGetItemsDisplayPanel,[[_wealthvo]]);
         ObserverMgr.ins.sendNotice(ResourceBackView.OPT_RESOURCE_BACK_REFRESH_LIST);
      }
   }
}
