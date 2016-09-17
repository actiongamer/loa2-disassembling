package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanRewardPanelUI;
   import com.mz.core.interFace.IObserver;
   import flash.display.MovieClip;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.alerts.AlertMsgVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.nets.sockets.ServerEngine;
   import com.mz.core.utils.DisplayUtils;
   import com.greensock.TweenLite;
   import proto.ShenYuanReceiveBoxRes;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import morn.core.components.Label;
   import proto.ShenYuanGetMysteriBoxRes;
   import com.greensock.TimelineLite;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import com.greensock.easing.Elastic;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.vos.StcNvshendianRandomjiangliVo;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.common.ui.components.comps2d.others.TreasureBoxBaseRender;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import flash.display.Sprite;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import flash.geom.Point;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.common.ctrls.ProgressBarCtrl;
   import com.mz.core.configs.EnvConfig;
   
   public class ShenYuanRewardPanel extends ShenYuanRewardPanelUI implements IObserver
   {
       
      
      private var _smc:MovieClip;
      
      private var activityDoubleTip:ActivityDoubleTip;
      
      private var _onGet:Boolean = false;
      
      private var upDownEffCtl:FloatUpDownEffCtrl;
      
      private var glowEffCtl:GlowFilterBreathCtrl;
      
      public var txt_daibi:Label;
      
      private var luckParam:Array;
      
      private var _bg:Sprite;
      
      public function ShenYuanRewardPanel()
      {
         super();
         MornExpandUtil.setCenter(this);
         MornExpandUtil.addHandlerForBtnAll(this,clickHandler);
         this.btn_secret_get.toolTip = LocaleMgr.ins.getStr(41500027);
         _smc = ResMgr.ins.getRes("effect2d/shenyuan/secretBoxEff.swf");
         _smc.gotoAndStop(1);
         _smc.x = 80;
         _smc.y = 60;
         this.con_secret.addChild(_smc);
         this.parts.push(new ProgressBarCtrl(this.bar_luck));
         ObserverMgr.ins.regObserver(this);
         TreasureBoxBaseRender(this.btn_box0).treasureType = 1;
         TreasureBoxBaseRender(this.btn_box1).treasureType = 2;
         TreasureBoxBaseRender(this.btn_box0).btn_reward.clickHandler = onBtnBox0;
         TreasureBoxBaseRender(this.btn_box1).btn_reward.clickHandler = onBtnBox1;
         this.txt_firstBuy.visible = EnvConfig.ins.showQQModule && ShenYuanModel.ins.boxOpenNum == 0;
      }
      
      private function onBtnBox0() : void
      {
         ModuleMgr.ins.showModule(41505,{
            "luckParam":luckParam,
            "type":0
         });
      }
      
      private function onBtnBox1() : void
      {
         ModuleMgr.ins.showModule(41505,{
            "luckParam":luckParam,
            "type":1
         });
      }
      
      private function clickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_normal_get !== _loc2_)
         {
            if(this.btn_secret_get !== _loc2_)
            {
               if(this.btn_quit === _loc2_)
               {
                  closePanel();
               }
            }
            else
            {
               AlertUtil.comfirm(new ShenYuanBuyBox(),clickYesHandler);
            }
         }
         else
         {
            getNormalBoxRet();
         }
      }
      
      private function clickYesHandler() : void
      {
         this.txt_firstBuy.visible = false;
      }
      
      private function getSecretBox() : void
      {
         if(PlayerModel.ins.diamond < ShenYuanModel.ins.secretChestPrice)
         {
            ObserverMgr.ins.sendNotice("floatMsgCenter",new AlertMsgVo(LocaleMgr.ins.getStr(999000520)));
            return;
         }
         ServerEngine.ins.send(6075,null,nextSecretBox);
      }
      
      private function closePanel() : void
      {
         ObserverMgr.ins.sendNotice("SHENYUAN_BUY_CHEST_COMPLETE");
         if(_bg)
         {
            DisplayUtils.removeSelf(_bg);
         }
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      private function getNormalBoxRet() : void
      {
         getReward();
      }
      
      private function getReward() : void
      {
         if(_onGet)
         {
            return;
         }
         _onGet = true;
         ServerEngine.ins.send(6086,null,after_server_recevie);
         TweenLite.delayedCall(0.5,gotoSecret);
      }
      
      private function after_server_recevie(param1:ShenYuanReceiveBoxRes) : void
      {
         _onGet = false;
         var _loc2_:Array = WealthUtil.rewardArrToWealthVoArr(param1.reward);
         FloatUtil.showGetItemsDisplayPanel(_loc2_,null,getTxtDaibi);
         ShenYuanModel.ins.luckValue = param1.luckValue;
         refreshLuckyValue();
      }
      
      private function getTxtDaibi() : Label
      {
         return null;
      }
      
      private function closeReward() : void
      {
      }
      
      public function getFocusNotices() : Array
      {
         return ["SHENYUAN_REFRESH_LUCK_VALUE","SHENYUAN_OPEN_DIAMOND_BOX"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("SHENYUAN_REFRESH_LUCK_VALUE" !== _loc3_)
         {
            if("SHENYUAN_OPEN_DIAMOND_BOX" === _loc3_)
            {
               nextSecretBox(param2 as ShenYuanGetMysteriBoxRes);
            }
         }
         else
         {
            refreshLuckyValue();
         }
      }
      
      private function gotoSecret() : void
      {
         var d:Number = 0;
         var tl:TimelineLite = new TimelineLite();
         tl.call(new ScaleTweenEff().init,[btn_normal_get,0.5,0.1,0.5,Elastic.easeIn,true],d);
         tl.call(function():void
         {
            con_nomal.visible = false;
         },null,d + 0.5);
         tl.call(function():void
         {
            con_secret.visible = true;
         },null,d + 0.5);
         tl.call(init,[1,ShenYuanModel.ins.crtFloor]);
         reqSecretDiamond();
      }
      
      private function nextSecretBox(param1:ShenYuanGetMysteriBoxRes) : void
      {
         this.btn_quit.disabled = true;
         this.btn_secret_get.disabled = true;
         _smc.gotoAndPlay(51);
         TweenLite.delayedCall(1.8,FloatUtil.showGetItemsDisplayPanel,[WealthUtil.rewardArrToWealthVoArr(param1.reward)]);
         TweenLite.delayedCall(3.3,resetSecretBox);
         reqSecretDiamond();
         ShenYuanModel.ins.luckValue = param1.luckValue;
         refreshLuckyValue();
      }
      
      private function resetSecretBox() : void
      {
         this.btn_quit.disabled = false;
         this.btn_secret_get.disabled = false;
         _smc.gotoAndStop(50);
      }
      
      public function init(param1:int, param2:int = 0) : void
      {
         type = param1;
         layer = param2;
         var d:Number = 0.5;
         drawBg();
         var str:String = DefindConsts.nvshendian_jifen_drop;
         var arr:Array = str.split("|");
         luckParam = [];
         luckParam = luckParam.concat(arr[0].split(":"));
         luckParam = luckParam.concat(arr[1].split(":"));
         var i:int = 0;
         while(i < luckParam.length)
         {
            luckParam[i] = int(luckParam[i]);
            i = Number(i) + 1;
         }
         if(type == 0)
         {
            if(ActivityModel.ins.have(1023))
            {
               if(!activityDoubleTip)
               {
                  activityDoubleTip = new ActivityDoubleTip();
               }
               this.btn_normal_get.addChild(activityDoubleTip);
               activityDoubleTip.x = 10;
               activityDoubleTip.y = 30;
            }
            else if(activityDoubleTip)
            {
               activityDoubleTip.dispose();
            }
            var tl:TimelineLite = new TimelineLite();
            btn_normal_get.scale = 1;
            btn_normal_get.alpha = 1;
            btn_normal_get.visible = false;
            btn_normal_get.x = 149;
            btn_normal_get.y = 178;
            tl.call(new ScaleTweenEff().init,[btn_normal_get,0.5,0.1,0.5,Elastic.easeOut],d);
            tl.call(playBoxEff,null,d + 0.2);
            tl.call(function():void
            {
               upDownEffCtl = new FloatUpDownEffCtrl().init(btn_normal_get,NaN,2,2);
            },null,d + 0.5);
            tl.call(function():void
            {
               glowEffCtl = new GlowFilterBreathCtrl(FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(7))).addHandler(breath_cb).set_duration(1);
            },null,d + 0.5);
            tl.from(box_title,0.3,{"alpha":0});
            this.con_nomal.visible = true;
            this.con_secret.visible = false;
         }
         else if(type == 1)
         {
            if(ActivityModel.ins.have(1023))
            {
               if(!activityDoubleTip)
               {
                  activityDoubleTip = new ActivityDoubleTip();
               }
               this.addChild(activityDoubleTip);
               activityDoubleTip.x = 290;
               activityDoubleTip.y = 260;
            }
            else if(activityDoubleTip)
            {
               activityDoubleTip.dispose();
            }
            if(upDownEffCtl)
            {
               upDownEffCtl.dispose();
            }
            if(glowEffCtl)
            {
               glowEffCtl.dispose();
            }
            this.con_secret.visible = true;
            this.con_nomal.visible = false;
            this._smc.gotoAndPlay(1);
            refreshLuckyValue();
            this.txt_half.text = luckParam[0];
            this.txt_full.text = luckParam[2];
            this.txt_half.x = this.bar_luck.width * luckParam[0] / luckParam[2] - (this.txt_half.width >> 1);
            this.btn_box0.x = this.bar_luck.width * luckParam[0] / luckParam[2] - (this.btn_box0.width >> 1);
            var hisStar:int = ShenYuanModel.ins.hisTopStar;
            var vos:DictHash = StcMgr.ins.getNvshendianRandomjiangliTable();
            var _loc5_:int = 0;
            var _loc4_:* = vos.array;
            for each(vo in vos.array)
            {
               var starLimit:Array = vo.allstar.split(":");
               if(!(hisStar >= int(starLimit[0]) && hisStar <= int(starLimit[1])))
               {
                  continue;
               }
               break;
            }
            showListItems(vo.show_reward);
         }
      }
      
      private function refreshLuckyValue() : void
      {
         this.txt_curr.text = ShenYuanModel.ins.luckValue + "/" + luckParam[2];
         this.bar_luck.value = ShenYuanModel.ins.luckValue / luckParam[2];
         if(ShenYuanModel.ins.luckValue >= luckParam[0])
         {
            TreasureBoxBaseRender(this.btn_box0).dataSource = new TreasureBoxVo(null,2);
         }
         else
         {
            TreasureBoxBaseRender(this.btn_box0).dataSource = new TreasureBoxVo(null,1);
         }
         if(ShenYuanModel.ins.luckValue >= luckParam[2])
         {
            TreasureBoxBaseRender(this.btn_box1).dataSource = new TreasureBoxVo(null,2);
         }
         else
         {
            TreasureBoxBaseRender(this.btn_box1).dataSource = new TreasureBoxVo(null,1);
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
      
      private function breath_cb(param1:Array) : void
      {
         this.btn_normal_get.filters = param1;
      }
      
      private function playBoxEff() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.setAnchor(0.5,0.5);
         _loc1_.init(4150004,1,"all",false,1,0,null,true);
         var _loc2_:Point = btn_normal_get.localToGlobal(new Point(btn_normal_get.width / 2,btn_normal_get.height / 2));
         _loc2_ = con_nomal.globalToLocal(_loc2_);
         _loc1_.x = _loc2_.x;
         _loc1_.y = _loc2_.y;
         con_nomal.addChild(_loc1_);
      }
      
      private function showListItems(param1:String) : void
      {
         var _loc2_:Array = WealthUtil.costStrToArr(param1);
         list_items.repeatX = _loc2_.length;
         list_items.centerX = 0;
         this.list_items.dataSource = _loc2_;
      }
      
      private function reqSecretDiamond() : void
      {
      }
      
      public function passFloor() : void
      {
         if(con_nomal.visible)
         {
            clickHandler(btn_normal_get);
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         if(_bg)
         {
            DisplayUtils.removeSelf(_bg);
         }
         if(upDownEffCtl)
         {
            upDownEffCtl.dispose();
         }
         if(glowEffCtl)
         {
            glowEffCtl.dispose();
         }
         super.dispose();
      }
   }
}
