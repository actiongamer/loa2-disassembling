package nslm2.modules.scenes.shenYuans.comp
{
   import game.ui.shenYuans.ShenYuanSelectMonsterUI;
   import morn.core.components.Button;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcGroupVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.scenes.shenYuans.model.ShenYuanModel;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.customs.FilterLib;
   import flash.display.Sprite;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   
   public class ShenYuanSelectMonster extends ShenYuanSelectMonsterUI
   {
       
      
      private var _bg:Sprite;
      
      public function ShenYuanSelectMonster()
      {
         var _loc1_:* = null;
         super();
         MornExpandUtil.setCenter(this);
         MornExpandUtil.addHandlerForBtnAll(this,clickHandle);
         var _loc2_:* = false;
         btn_buzhen2.visible = _loc2_;
         _loc2_ = _loc2_;
         btn_buzhen1.visible = _loc2_;
         btn_buzhen0.visible = _loc2_;
         if(ActivityModel.ins.have(1011))
         {
            _loc1_ = new ActivityDoubleTip(LocaleMgr.ins.getStr(999000445),LocaleMgr.ins.getStr(999000394));
            this.addChild(_loc1_);
            _loc1_.x = 644;
            _loc1_.y = 4;
         }
      }
      
      private function clickHandle(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_close !== _loc2_)
         {
            if(this.btn_fight0 !== _loc2_)
            {
               if(this.btn_fight1 !== _loc2_)
               {
                  if(this.btn_fight2 === _loc2_)
                  {
                     ObserverMgr.ins.sendNotice("SHENYUAN_FIGHT_MONSTER",2);
                     closePanel();
                  }
               }
               else
               {
                  ObserverMgr.ins.sendNotice("SHENYUAN_FIGHT_MONSTER",1);
                  closePanel();
               }
            }
            else
            {
               ObserverMgr.ins.sendNotice("SHENYUAN_FIGHT_MONSTER",0);
               closePanel();
            }
         }
         else
         {
            closePanel();
         }
      }
      
      private function closePanel() : void
      {
         var _loc1_:int = 0;
         if(_bg)
         {
            DisplayUtils.removeSelf(_bg);
         }
         DisplayUtils.removeSelf(this);
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            this["box" + _loc1_].toolTip = null;
            _loc1_++;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc7_:int = 0;
         var _loc6_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc2_:Number = NaN;
         .super.dataSource = param1;
         var _loc3_:Array = param1 as Array;
         lockMonster(0);
         lockMonster(1);
         lockMonster(2);
         _loc7_ = 0;
         while(_loc7_ < 3)
         {
            _loc6_ = StcMgr.ins.getNpcGroupVo(_loc3_[_loc7_].id);
            _loc4_ = LocaleMgr.ins.getStr(_loc6_.name);
            this["name" + _loc7_].text = _loc4_;
            this["txt_star" + _loc7_].text = LocaleMgr.ins.getStr(41500102,[_loc7_ + 1]);
            _loc5_ = ShenYuanModel.ins.crtFloor * 10 + _loc7_ + 1;
            _loc2_ = StcMgr.ins.getNvshendianMonsterVo(_loc5_).btlpower;
            this["txt_power" + _loc7_].text = LocaleMgr.ins.getStr(41500100) + _loc2_;
            this["face" + _loc7_].url = UrlLib.shenyuanMonster(_loc6_.head_id + "");
            this["box" + _loc7_].toolTip = LocaleMgr.ins.getStr(_loc6_.permanent_dialogue);
            lockMonster(_loc7_,_loc3_[_loc7_].locked);
            _loc7_++;
         }
      }
      
      private function lockMonster(param1:int = 0, param2:Boolean = false) : void
      {
         this["box" + param1].filters = !!param2?FilterLib.ins.getFilterArr(402):null;
         this["lock" + param1].visible = param2;
         this["btn_fight" + param1].disabled = param2;
      }
      
      private function calcPower(param1:int, param2:Number) : Number
      {
         var _loc5_:Array = StcMgr.ins.getNpcGroupVo(param1).formation_group.split("|");
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc6_:* = _loc5_;
         for each(var _loc3_ in _loc5_)
         {
            if(_loc3_ > 0)
            {
               _loc4_ = _loc4_ + StcMgr.ins.getNpcVo(_loc3_).combat_power;
            }
         }
         return Math.round(_loc4_ * param2);
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
      
      override public function dispose() : void
      {
         if(_bg)
         {
            DisplayUtils.removeSelf(_bg);
         }
         super.dispose();
      }
      
      public function init() : void
      {
         this.alpha = 1;
         var _loc1_:int = 1;
         this.scaleY = _loc1_;
         this.scaleX = _loc1_;
         this.visible = true;
         this.txt_desc.text = LocaleMgr.ins.getStr(41500101);
         new ScaleTweenEff().init(this,0.3,0.3,0,null);
         this.txt_times.text = LocaleMgr.ins.getStr(41500110,[ShenYuanModel.ins.canRevive]);
         drawBg();
      }
   }
}
