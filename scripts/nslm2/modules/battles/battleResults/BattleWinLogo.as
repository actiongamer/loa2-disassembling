package nslm2.modules.battles.battleResults
{
   import flash.display.Sprite;
   import flash.display.MovieClip;
   import game.ui.battleResults.BattleWinWordUI;
   import game.ui.battleResults.BattleCompleteWordUI;
   import com.mz.core.configs.ClientConfig;
   import nslm2.mgrs.SoundMgr;
   import com.greensock.TimelineLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import flash.display.DisplayObject;
   import com.greensock.TweenLite;
   import com.greensock.easing.Elastic;
   import nslm2.common.compsEffects.ScaleTweenEff;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Image;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   
   public class BattleWinLogo extends Sprite
   {
       
      
      private var _mc:MovieClip;
      
      private var _img_win:BattleWinWordUI;
      
      private var _img_Complete:BattleCompleteWordUI;
      
      public var endFunc:Function;
      
      private var _bg:Sprite;
      
      private var _isComplete:Boolean;
      
      private var _starNum:int;
      
      private var _sword8_l:BmcSpriteSheet;
      
      private var _sword8_r:BmcSpriteSheet;
      
      private var _wing_l:BmcSpriteSheet;
      
      private var _wing_r:BmcSpriteSheet;
      
      public function BattleWinLogo(param1:Sprite, param2:Boolean = false)
      {
         var _loc3_:int = 0;
         super();
         _mc = ResMgr.ins.getRes("effect2d/battle/dgWinLogo.swf");
         _mc.gotoAndStop(1);
         var _loc4_:int = 0;
         _mc.y = _loc4_;
         _mc.x = _loc4_;
         this.addChild(_mc);
         _loc3_ = 0;
         while(_loc3_ < 3)
         {
            _mc["star" + _loc3_].visible = false;
            _mc["star_bg" + _loc3_].visible = false;
            _loc3_++;
         }
         _isComplete = param2;
         _bg = param1;
      }
      
      public function setStar(param1:int = -1) : void
      {
         var _loc2_:int = 0;
         _starNum = param1;
         if(_starNum > -1)
         {
            _loc2_ = 0;
            while(_loc2_ < 3)
            {
               _mc["star_bg" + _loc2_].visible = true;
               _loc2_++;
            }
         }
      }
      
      private function drawBg(param1:uint) : void
      {
         _bg.graphics.clear();
         _bg.graphics.beginFill(param1,1);
         _bg.graphics.drawRect(0,0,ClientConfig.SCENE_FIXED_W,ClientConfig.SCENE_FIXED_H);
         _bg.graphics.endFill();
         _bg.alpha = 0;
      }
      
      public function play() : void
      {
         if(ClientConfig.firstBattle)
         {
            firstBattlePlay();
            return;
         }
         SoundMgr.ins.playTexiaoSound("battle/win");
         SoundMgr.ins.closeBack(true);
         _mc.gotoAndStop(1);
         var _loc1_:TimelineLite = new TimelineLite();
         var _loc2_:* = 0;
         _loc1_.add(TweenMax.to(_mc,0.7,{
            "frame":17,
            "ease":Linear.easeNone
         }),_loc2_);
         _loc1_.call(show_sword8,null,_loc2_ + 0.7);
         _loc1_.call(show_sword24,null,_loc2_ + 0.5);
         _loc1_.call(show_lizi,null,_loc2_ + 1.3);
         _loc1_.call(drawBg,[0],_loc2_);
         _loc1_.to(_bg,0.4,{"alpha":0.5},_loc2_ + 0.1);
         _loc1_.call(show_wing,null,_loc2_ + 1.1);
         _loc1_.call(show_wing_eff,null,_loc2_ + 1.2);
         _loc1_.call(showWinTxt,null,_loc2_ + 1);
         if(_starNum >= 1)
         {
            _loc1_.call(showStar,[0],1.8 + _loc2_);
         }
         if(_starNum >= 2)
         {
            _loc1_.call(showStar,[1],"+=0.2");
         }
         if(_starNum >= 3)
         {
            _loc1_.call(showStar,[2],"+=0.2");
         }
         _loc1_.to(this,0.2,{
            "scaleX":0.6,
            "scaleY":0.6,
            "y":100,
            "ease":Linear.easeNone
         },"+=0.2");
         _loc1_.call(endFunc,null,"+=0.2");
      }
      
      private function firstBattlePlay() : void
      {
         SoundMgr.ins.playTexiaoSound("battle/win");
         SoundMgr.ins.closeBack(true);
         _mc.gotoAndStop(1);
         var _loc1_:TimelineLite = new TimelineLite();
         var _loc2_:* = 0;
         _loc1_.add(TweenMax.to(_mc,0.4,{
            "frame":17,
            "ease":Linear.easeNone
         }),_loc2_);
         _loc1_.call(drawBg,[0],_loc2_);
         _loc1_.to(_bg,0.4,{"alpha":0.5},_loc2_ + 0.1);
         _loc1_.call(first_show_wing,null,_loc2_ + 0.8);
         _loc1_.call(showWinTxt,null,_loc2_ + 0.9);
         if(_starNum >= 1)
         {
            _loc1_.call(showStar,[0],1.2 + _loc2_);
         }
         if(_starNum >= 2)
         {
            _loc1_.call(showStar,[1],"+=0.1");
         }
         if(_starNum >= 3)
         {
            _loc1_.call(showStar,[2],"+=0.2");
         }
         _loc1_.to(this,0.2,{
            "scaleX":0.6,
            "scaleY":0.6,
            "y":100,
            "ease":Linear.easeNone
         },"+=0.2");
         _loc1_.call(endFunc,null,"+=0.2");
      }
      
      private function showStar(param1:int) : void
      {
         var _loc2_:DisplayObject = _mc["star" + param1];
         _loc2_.visible = true;
         TweenLite.from(_loc2_,0.2,{
            "scaleX":3,
            "scaleY":3,
            "ease":Elastic.easeOut
         });
         SoundMgr.ins.playTexiaoSound("battle/star");
      }
      
      private function showWinTxt() : void
      {
         var _loc2_:int = -130;
         var _loc1_:int = -135;
         if(!_isComplete)
         {
            _img_win = new BattleWinWordUI();
            _img_win.x = _loc2_;
            _img_win.y = _loc1_;
            _img_win.img_light.blendMode = "add";
            new ScaleTweenEff().init(_img_win,ClientConfig.firstBattle == 1?0.2:0.5,2,1,Elastic.easeInOut,false);
            addChild(_img_win);
         }
         else
         {
            _img_Complete = new BattleCompleteWordUI();
            _img_Complete.x = _loc2_;
            _img_Complete.y = _loc1_;
            _img_Complete.img_light.blendMode = "add";
            new ScaleTweenEff().init(_img_Complete,0.5,2,1,Elastic.easeInOut,false);
            addChild(_img_Complete);
         }
      }
      
      private function show_sword24() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = -200;
         _loc1_.y = -200;
         _loc1_.init(4020,1,"all",false);
         addChild(_loc1_);
         _loc1_ = new BmcSpriteSheet();
         _loc1_.x = 200;
         _loc1_.y = -200;
         _loc1_.scaleX = _loc1_.scaleX * -1;
         _loc1_.init(4020,1,"all",false);
         addChild(_loc1_);
      }
      
      private function show_sword8() : void
      {
         _sword8_l = new BmcSpriteSheet();
         _sword8_l.x = -175;
         _sword8_l.y = -165;
         _sword8_l.init(4021,1,"all",true);
         addChild(_sword8_l);
         _sword8_r = new BmcSpriteSheet();
         _sword8_r.x = 175;
         _sword8_r.y = -165;
         _sword8_r.scaleX = _sword8_r.scaleX * -1;
         _sword8_r.init(4021,1,"all",true);
         addChild(_sword8_r);
      }
      
      private function first_show_wing() : void
      {
         var _loc1_:Image = new Image();
         _loc1_.url = "effect2d/battle/wingPic.png";
         _loc1_.smoothing = true;
         _loc1_.x = -376;
         _loc1_.y = -276;
         addChildAt(_loc1_,0);
         _loc1_ = new Image();
         _loc1_.url = "effect2d/battle/wingPic.png";
         _loc1_.smoothing = true;
         _loc1_.x = 376;
         _loc1_.y = -276;
         _loc1_.scaleX = _loc1_.scaleX * -1;
         addChildAt(_loc1_,0);
      }
      
      private function show_wing() : void
      {
         _wing_l = new BmcSpriteSheet();
         _wing_l.x = -376;
         _wing_l.y = -276;
         _wing_l.init(4022,1,"all",false,1,0,null,false);
         addChildAt(_wing_l,0);
         _wing_r = new BmcSpriteSheet();
         _wing_r.x = 376;
         _wing_r.y = -276;
         _wing_r.scaleX = _wing_r.scaleX * -1;
         _wing_r.init(4022,1,"all",false,1,0,null,false);
         addChildAt(_wing_r,0);
      }
      
      private function show_lizi() : void
      {
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.x = -465;
         _loc2_.y = -306;
         _loc2_.init(4002,1,"all",false,1,0,null,true);
         addChildAt(_loc2_,1);
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = 465;
         _loc1_.y = -306;
         _loc1_.scaleX = _loc1_.scaleX * -1;
         _loc1_.init(4002,1,"all",false,1,0,null,true);
         addChildAt(_loc1_,1);
      }
      
      private function show_wing_eff() : void
      {
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.x = -565;
         _loc2_.y = -406;
         var _loc3_:int = 2;
         _loc2_.scaleY = _loc3_;
         _loc2_.scaleX = _loc3_;
         _loc2_.init(4023,1,"all",false,1,0,null,true);
         addChildAt(_loc2_,1);
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = 565;
         _loc1_.y = -406;
         _loc3_ = 2;
         _loc1_.scaleY = _loc3_;
         _loc1_.scaleX = _loc3_;
         _loc1_.scaleX = _loc1_.scaleX * -1;
         _loc1_.init(4023,1,"all",false,1,0,null,true);
         addChildAt(_loc1_,1);
      }
      
      public function dispose() : void
      {
         if(_sword8_l)
         {
            _sword8_l.dispose();
         }
         if(_sword8_r)
         {
            _sword8_r.dispose();
         }
         if(_wing_l)
         {
            _wing_l.dispose();
         }
         if(_wing_r)
         {
            _wing_r.dispose();
         }
         if(_img_win)
         {
            _img_win.dispose();
         }
         if(_img_Complete)
         {
            _img_Complete.dispose();
         }
         DisplayUtils.removeSelf(this);
      }
   }
}
