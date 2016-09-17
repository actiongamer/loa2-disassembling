package nslm2.modules.dungeons
{
   import game.ui.dungeonScene.HeadPortraitRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.fightPlayer.UnitVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.battles.battle.BattleEvent;
   import com.mz.core.configs.EnvConfig;
   import morn.core.components.Label;
   import flash.geom.Rectangle;
   import com.greensock.TweenLite;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.foundations.setting.model.SettingModel;
   import nslm2.modules.battles.battle.HPTween;
   import morn.customs.FilterLib;
   import nslm2.modules.battles.battle.GameObjectManager;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import flash.events.MouseEvent;
   import com.mz.core.event.MzEvent;
   import flash.events.Event;
   import nslm2.common.compsEffects.MaskProgressBar;
   
   public class HeadPortraitRender extends HeadPortraitRenderUI
   {
       
      
      private var _rageEff:BmcSpriteSheet;
      
      private var _hpLowEff:BmcSpriteSheet;
      
      private var _rageFull:Boolean = false;
      
      private var _hpBurnEff:BmcSpriteSheet;
      
      private var _onGuide:Boolean = false;
      
      public function HeadPortraitRender()
      {
         super();
         var _loc1_:MaskProgressBar = new MaskProgressBar(this.bar_hp);
         this.parts.push(_loc1_);
         _loc1_ = new MaskProgressBar(this.bar_angry);
         this.parts.push(_loc1_);
         this.img_rim.addEventListener("click",img_onClick);
         this.toolTip = hpRageTipFunc;
      }
      
      private function hpRageTipFunc() : String
      {
         return LocaleMgr.ins.getStr(1201) + "：" + int(vo.hp) + "/" + vo.hp_max + "\n" + LocaleMgr.ins.getStr(41300102) + "：" + vo.rage + "/1000";
      }
      
      public function get vo() : UnitVo
      {
         return this.dataSource as UnitVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         .super.dataSource = param1;
         if(vo)
         {
            if(vo.isMajor)
            {
               if(ClientConfig.firstBattle == 1)
               {
                  _loc3_ = 3;
               }
               else if(vo.serVo)
               {
                  _loc3_ = MilitaryModel.ins.getPlayerQuality(vo.serVo.avatar[2]);
               }
               else
               {
                  _loc3_ = 3;
               }
            }
            else
            {
               _loc3_ = vo.stcNpcVo.quality;
            }
            _loc2_ = _loc3_ - 3;
            this.img_rim.value = Math.min(Math.max(0,_loc2_),4);
            _loc5_ = (vo.stcNpcVo.tupo - 1) / 3;
            _loc4_ = (vo.stcNpcVo.tupo - 1) % 3;
            _loc6_ = 0;
            while(_loc6_ < 3)
            {
               if(_loc6_ <= _loc4_)
               {
                  this["bo" + _loc6_].visible = true;
                  this["bo" + _loc6_].value = _loc5_;
               }
               else
               {
                  this["bo" + _loc6_].visible = false;
               }
               _loc6_++;
            }
            this.vo.addEventListener("valueChange",value_onChange);
            this.vo.addEventListener("FIGHT_ADD_KILL_RAGE",onAddKillRage);
            this.img_icon.url = UrlLib.headIcon(this.vo.stcNpcVo.head_id);
            this.refreshState();
         }
      }
      
      public function onBeginGuideCheck() : Boolean
      {
         var _loc1_:Number = this.vo.rage / this.vo.stcNpcVo.max_rage;
         if(_loc1_ >= 1 && needGuide())
         {
            doGuide();
            return true;
         }
         return false;
      }
      
      protected function onAddKillRage(param1:BattleEvent) : void
      {
         if(EnvConfig.ins.hideForBS)
         {
            floatMsg(LocaleMgr.ins.getStr(999000102,[param1.data]));
         }
         else
         {
            floatMsg(LocaleMgr.ins.getStr(999000103,[param1.data]));
         }
      }
      
      private function floatMsg(param1:String) : void
      {
         var _loc3_:Label = new Label();
         _loc3_.isHtml = true;
         _loc3_.align = "center";
         _loc3_.font = "Microsoft YaHei,微软雅黑";
         _loc3_.size = 24;
         _loc3_.color = 16046112;
         _loc3_.labelFilterKind = "黑色1像素描边";
         _loc3_.text = param1;
         var _loc2_:Rectangle = this.getRect(this.stage);
         _loc3_.x = -10 + _loc2_.x;
         _loc3_.y = 30 + _loc2_.y;
         _loc3_.mouseEvent = false;
         this.stage.addChild(_loc3_);
         TweenLite.to(_loc3_,2,{
            "y":0 + _loc2_.y,
            "alpha":0,
            "onComplete":_loc3_.dispose,
            "delay":0.5
         });
      }
      
      protected function onRFireBtn(param1:BattleEvent) : void
      {
      }
      
      private function showRageEff(param1:Boolean) : void
      {
         if(param1)
         {
            if(_rageEff == null)
            {
               _rageEff = new BmcSpriteSheet();
               _rageEff.init(10011,1,"all",true);
               _rageEff.y = 93;
               _rageEff.x = -8;
               addChild(_rageEff);
            }
         }
         else if(_rageEff)
         {
            _rageEff.dispose();
            _rageEff = null;
         }
      }
      
      private function showHpLowEff(param1:Boolean) : void
      {
         if(param1)
         {
            if(_hpLowEff == null)
            {
               _hpLowEff = new BmcSpriteSheet();
               _hpLowEff.init(10010,1,"all",true);
               _hpLowEff.y = 9;
               _hpLowEff.x = -5;
               _hpLowEff.visible = SettingModel.ins.deathFlash == 0;
               addChild(_hpLowEff);
            }
         }
         else if(_hpLowEff)
         {
            _hpLowEff.dispose();
            _hpLowEff = null;
         }
      }
      
      public function get rageFull() : Boolean
      {
         return _rageFull;
      }
      
      public function get isDie() : Boolean
      {
         return vo.hp <= 0;
      }
      
      public function refreshState() : void
      {
         new HPTween(bar_hp.bar);
         bar_hp.value = this.vo.hp / this.vo.hp_max;
         var _loc1_:Number = this.vo.rage / this.vo.stcNpcVo.max_rage;
         if(_loc1_ < 1)
         {
            _loc1_ = _loc1_ * 0.9;
            showRageEff(false);
            showBurnEff(false);
            _rageFull = false;
         }
         else
         {
            showRageEff(true);
            if(!_rageFull)
            {
               _rageFull = true;
               whenRageFull();
            }
         }
         bar_angry.value = _loc1_;
         if(bar_hp.value > 0 && bar_hp.value < 0.2)
         {
            showHpLowEff(true);
         }
         else
         {
            showHpLowEff(false);
         }
         if(bar_hp.value <= 0)
         {
            this.filters = FilterLib.ins.getFilterArr(402);
         }
         else
         {
            this.filters = [];
         }
      }
      
      private function whenRageFull() : void
      {
         this.img_rim.buttonMode = !GameObjectManager.Instance.autoFire;
         this.img_rim.mouseEnabled = !GameObjectManager.Instance.autoFire;
         playFuryEff();
         if(needGuide())
         {
            doGuide();
         }
      }
      
      private function playFuryEff() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = -55;
         _loc1_.y = -50;
         _loc1_.init(10012,1,"all",false,1,0,FuryEnd);
         addChild(_loc1_);
      }
      
      private function playFireEff() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = -37;
         _loc1_.y = -45;
         _loc1_.init(10014,1,"all",false);
         addChild(_loc1_);
      }
      
      private function FuryEnd() : void
      {
         if(_rageFull)
         {
            showBurnEff(true);
         }
         else
         {
            showBurnEff(false);
         }
      }
      
      private function showBurnEff(param1:Boolean) : void
      {
         if(param1)
         {
            if(_hpBurnEff == null)
            {
               _hpBurnEff = new BmcSpriteSheet();
               _hpBurnEff.init(10013,1,"all",true);
               _hpBurnEff.y = -26;
               _hpBurnEff.x = -17;
               addChild(_hpBurnEff);
            }
         }
         else if(_hpBurnEff)
         {
            _hpBurnEff.dispose();
            _hpBurnEff = null;
         }
      }
      
      private function doGuide() : void
      {
         _onGuide = true;
         if(ClientConfig.firstBattle == 1)
         {
            GameObjectManager.Instance.pause(true);
         }
      }
      
      private function needGuide() : Boolean
      {
         if(PlayerModel.ins.level > 5)
         {
            return false;
         }
         var _loc1_:Boolean = GameObjectManager.Instance.isDefenAllDead();
         if(_loc1_)
         {
            return false;
         }
         return NGUtil.checkModuleShow(40255,this);
      }
      
      override public function dispose() : void
      {
         if(this.vo)
         {
            this.vo.removeEventListener("valueChange",value_onChange);
            this.vo.removeEventListener("FIGHT_REFRESH_FIRE_BTN",onRFireBtn);
            this.vo.removeEventListener("FIGHT_ADD_KILL_RAGE",onAddKillRage);
         }
         super.dispose();
      }
      
      public function checkMouseState() : void
      {
         if(_rageFull)
         {
            this.img_rim.buttonMode = !GameObjectManager.Instance.autoFire;
            this.img_rim.mouseEnabled = !GameObjectManager.Instance.autoFire;
         }
      }
      
      public function img_onClick(param1:MouseEvent = null) : void
      {
         if(!_rageFull)
         {
            return;
         }
         if(_onGuide)
         {
            _onGuide = false;
            GameObjectManager.Instance.pause(false);
         }
         playFireEff();
         this.dispatchEvent(new MzEvent("renderClick",this,true));
      }
      
      public function autoFire() : void
      {
         if(!_rageFull)
         {
            return;
         }
         this.dispatchEvent(new MzEvent("renderClick",this,true));
      }
      
      private function value_onChange(param1:Event) : void
      {
         if(param1.currentTarget != this.vo || this.isDisposed)
         {
            param1.currentTarget.removeEventListener("valueChange",value_onChange);
            param1.currentTarget.removeEventListener("FIGHT_REFRESH_FIRE_BTN",onRFireBtn);
            param1.currentTarget.removeEventListener("FIGHT_ADD_KILL_RAGE",onAddKillRage);
         }
         this.refreshState();
      }
   }
}
