package nslm2.modules.footstones.newerGuideModules
{
   import game.ui.commons.comps.others.NewerGuideCommonRenderUI;
   import com.mz.core.interFace.ICannotDispose;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comps2d.others.ClickToNextButton;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.components.comp2d.BlackRim;
   import flash.geom.Point;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import morn.core.utils.StringUtils;
   import flash.display.DisplayObjectContainer;
   import nslm2.modules.foundations.FloatBubbleUtil;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.greensock.TweenLite;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.SoundMgr;
   
   public class NewerGuideArrow extends NewerGuideCommonRenderUI implements ICannotDispose
   {
      
      public static const ARROW_LENGTH:int = 90;
      
      public static const BG_WHITE_HEIGHT:int = 55;
      
      public static const BG_WHITE_WIDTH:int = 50;
       
      
      private var floatEff:FloatUpDownEffCtrl;
      
      private var _avatarBmc:BmcSpriteSheet;
      
      private var _fingerBmc:BmcSpriteSheet;
      
      private var clickToNext:ClickToNextButton;
      
      public var txt_oriX:int;
      
      public var txt_oriY:int;
      
      public var newerGuideModule:nslm2.modules.footstones.newerGuideModules.NewerGuideModule;
      
      private var _mouseRim:BlackRim;
      
      private var _talkRim:BlackRim;
      
      private var _talkArr:Array;
      
      private var _rim:BlackRim;
      
      private var _lastTexiaoSoundUrl:String;
      
      private var _lastParsedId:int;
      
      public function NewerGuideArrow()
      {
         _talkArr = [];
         super();
         this.txt_oriX = this.txt_content.x;
         this.txt_oriY = this.txt_content.y;
         this.visible = false;
         floatEff = new FloatUpDownEffCtrl().config(0.9).init(img_arrow,NaN,6,8);
         this.parts.push(new FloatUpDownEffCtrl().config(0.9).init(img_arrow,NaN,6,8));
         floatEff.pause();
      }
      
      public function check_init_clickToNext() : void
      {
         if(clickToNext == null && ClientConfig.firstBattle != 1)
         {
            clickToNext = new ClickToNextButton();
            this.addChild(clickToNext);
         }
      }
      
      public function check_init_fingerBmc() : void
      {
         if(_fingerBmc == null && ClientConfig.firstBattle != 1)
         {
            _fingerBmc = new BmcSpriteSheet();
            _fingerBmc.setAnchor(0.5,0.5);
            _fingerBmc.init(6000005,1,"all",true);
            this.addChild(_fingerBmc);
         }
      }
      
      public function check_init_avatarBmc() : void
      {
         if(_avatarBmc == null && ClientConfig.firstBattle != 1)
         {
            _avatarBmc = new BmcSpriteSheet();
            _avatarBmc.setAnchor(0.5,0.5);
            _avatarBmc.init(6000004,1,"all",true);
            this.img_dialog.addChild(_avatarBmc);
         }
      }
      
      public function set rim(param1:BlackRim) : void
      {
         _rim = param1;
         _mouseRim = BlackRim.clone(rim);
         _mouseRim.mouseEnabled = false;
         _mouseRim.fileColor = 0;
         _mouseRim.fileAlpha = 0.6;
         _mouseRim.draw();
         this.addChildAt(_mouseRim,0);
      }
      
      public function get rim() : BlackRim
      {
         return _rim;
      }
      
      public function get talkRim() : BlackRim
      {
         return _talkRim;
      }
      
      public function set talkRim(param1:BlackRim) : void
      {
         _talkRim = param1;
         _talkRim.addEventListener("click",stage_click);
      }
      
      public function get mouseRim() : BlackRim
      {
         return _mouseRim;
      }
      
      private function talkOffsetPoint(param1:StcGuideVo) : Point
      {
         var _loc2_:* = null;
         if(StringUtils.isNull(param1.offset))
         {
            return new Point(0,0);
         }
         _loc2_ = param1.offset.split(",");
         return new Point(_loc2_[0],_loc2_[1]);
      }
      
      public function changePosition(param1:Point, param2:Point, param3:StcGuideVo) : void
      {
         var _loc4_:Array = !!StringUtils.isNull(param3.guide_position)?[]:param3.guide_position.split(",");
         if(isNaN(Number(_loc4_[0])) == false)
         {
            param1.x = param1.x + Number(_loc4_[0]);
         }
         if(isNaN(Number(_loc4_[1])) == false)
         {
            param1.y = param1.y + Number(_loc4_[1]);
         }
         switch(int(param3.direction) - 1)
         {
            case 0:
               param1.x = param1.x + param2.x;
               param1.y = param1.y + param2.y / 2;
               break;
            default:
               param1.x = param1.x + param2.x / 2;
               param1.y = param1.y;
               break;
            case 2:
            default:
               param1.x = param1.x + param2.x / 2;
               param1.y = param1.y + param2.y;
               break;
            case 4:
               param1.x = param1.x;
               param1.y = param1.y + param2.y / 2;
         }
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function show(param1:DisplayObjectContainer, param2:Point, param3:Point, param4:StcGuideVo, param5:Boolean) : void
      {
         var _loc11_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc12_:* = null;
         FloatBubbleUtil.showOrHideBubble(false,param4.is_unlock);
         var _loc13_:Array = !!StringUtils.isNull(param4.guide_position)?[]:param4.guide_position.split(",");
         if(isNaN(Number(_loc13_[0])) == false)
         {
            param2.x = param2.x + Number(_loc13_[0]);
         }
         if(isNaN(Number(_loc13_[1])) == false)
         {
            param2.y = param2.y + Number(_loc13_[1]);
         }
         if(StringUtils.isNull(param4.comp_id) == false)
         {
            this.box_arrow.visible = true;
         }
         else
         {
            this.box_arrow.visible = false;
         }
         if(this.box_arrow.visible)
         {
            floatEff.play();
            _loc10_ = new Point();
            switch(int(param4.direction) - 1)
            {
               case 0:
                  param2.x = param2.x + param3.x;
                  param2.y = param2.y + param3.y / 2;
                  _loc9_ = 90;
                  _loc10_.x = -param3.x / 2;
                  break;
               default:
                  param2.x = param2.x + param3.x / 2;
                  param2.y = param2.y;
                  _loc9_ = 0;
                  _loc10_.y = param3.y / 2;
                  break;
               case 2:
               default:
                  param2.x = param2.x + param3.x / 2;
                  param2.y = param2.y + param3.y;
                  _loc9_ = 180;
                  _loc10_.y = -param3.y / 2;
                  break;
               case 4:
                  param2.x = param2.x;
                  param2.y = param2.y + param3.y / 2;
                  _loc9_ = -90;
                  _loc10_.x = param3.x / 2;
            }
            this.check_init_fingerBmc();
            if(_fingerBmc)
            {
               if(NGConsts.NG_FILTER_NOT_SHOW_EFFECT.indexOf(param4.checkId) == -1 && param4.id != 99804)
               {
                  this._fingerBmc.visible = true;
                  this._fingerBmc.play();
                  this._fingerBmc.x = _loc10_.x;
                  this._fingerBmc.y = _loc10_.y + 4;
               }
               else
               {
                  this._fingerBmc.visible = false;
                  this._fingerBmc.stop();
               }
            }
            _loc11_ = param2;
            this.box_arrow.rotation = _loc9_;
         }
         else
         {
            _loc11_ = new Point(param1.width / 2,param1.height / 2);
            if(_fingerBmc)
            {
               this._fingerBmc.visible = false;
               this._fingerBmc.stop();
            }
         }
         moveDcToParent(param1);
         _talkRim.visible = false;
         var _loc6_:Point = DisplayUtils.localToTarget(ModuleMgr.ins.topEffectLayer,this,new Point(0,0));
         if(param4.is_unlock == 0)
         {
            _mouseRim.x = _loc6_.x - (_loc11_.x - this.x);
            _mouseRim.y = _loc6_.y - (_loc11_.y - this.y);
            _mouseRim.visible = true;
         }
         else
         {
            _mouseRim.visible = false;
         }
         this.visible = true;
         this.x = _loc11_.x;
         this.y = _loc11_.y;
         if(StringUtils.isNull(param4.talk) == false)
         {
            parseTalkArr(param4);
            showTalk();
            _loc7_ = new Point();
            if(this.box_arrow.visible)
            {
               switch(int(param4.direction) - 1)
               {
                  case 0:
                     _loc7_.x = 90 - 50;
                     _loc7_.y = -this.box_txt.height / 2;
                     break;
                  default:
                     _loc7_.x = -this.box_txt.width / 2;
                     _loc7_.y = -this.box_txt.height - 90 + 55;
                     break;
                  case 2:
                  default:
                     _loc7_.x = -this.box_txt.width / 2;
                     _loc7_.y = 90 - 55;
                     break;
                  case 4:
                     _loc7_.x = -this.box_txt.width - 90 + 50;
                     _loc7_.y = -this.box_txt.height / 2;
               }
            }
            else
            {
               _loc7_.x = -this.box_txt.width / 2;
               _loc7_.y = -this.box_txt.height;
            }
            _loc8_ = talkOffsetPoint(param4);
            this.box_txt.x = _loc7_.x + _loc8_.x;
            this.box_txt.y = _loc7_.y + _loc8_.y;
            _loc12_ = new Point();
            if(!(int(param4.talk_position) - 5))
            {
               this.txt_bg.scaleX = -1;
               this.txt_bg.x = this.box_txt.width;
               _loc12_.x = this.box_txt.x;
               _loc12_.y = this.box_txt.y + this.box_txt.height - 42;
            }
            else
            {
               this.txt_bg.scaleX = 1;
               this.txt_bg.x = 0;
               _loc12_.x = this.box_txt.x + this.box_txt.width;
               _loc12_.y = this.box_txt.y + this.box_txt.height - 42;
            }
            this.check_init_avatarBmc();
            if(_avatarBmc != null)
            {
               _avatarBmc.visible = true;
               _avatarBmc.play();
            }
            this.img_dialog.x = _loc12_.x;
            this.img_dialog.y = _loc12_.y;
            if(StringUtils.isNull(param4.talk) == false)
            {
               _talkRim.visible = true;
            }
            else
            {
               _talkRim.visible = false;
            }
         }
         else
         {
            this.box_txt.visible = false;
            if(_avatarBmc)
            {
               _avatarBmc.visible = false;
               _avatarBmc.stop();
            }
            _talkRim.visible = false;
         }
         if(_talkArr.length > 0 || StringUtils.isNull(param4.comp_id) == true)
         {
            this.check_init_clickToNext();
            if(clickToNext != null)
            {
               clickToNext.visible = true;
               this.clickToNext.x = this.box_txt.x + this.box_txt.width / 2 - this.clickToNext.width / 2;
               this.clickToNext.y = this.box_txt.y + this.box_txt.height - 50;
               this.txt_bg.height = this.box_txt.height + 30;
            }
         }
         else
         {
            allTalkComplete();
         }
      }
      
      public function hide(param1:Boolean = true) : void
      {
         FloatBubbleUtil.showOrHideBubble(true,true);
         moveDcToParent(this.newerGuideModule);
         TweenLite.killTweensOf(this);
         this.visible = false;
         if(_fingerBmc)
         {
            this._fingerBmc.visible = false;
            this._fingerBmc.stop();
         }
         if(_avatarBmc)
         {
            this._avatarBmc.visible = false;
            this._avatarBmc.stop();
         }
         _talkRim.visible = false;
         this.box_arrow.visible = false;
         floatEff.pause();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         .super.visible = param1;
      }
      
      private function stage_click(param1:MouseEvent) : void
      {
         showNextTalk();
      }
      
      private function showNextTalk() : void
      {
         if(_talkArr.length > 0)
         {
            showTalk();
         }
         else
         {
            allTalkComplete();
         }
      }
      
      private function allTalkComplete() : void
      {
         this.box_arrow.visible = true;
         this.rim.mouseEnabled = true;
         _talkRim.visible = false;
         if(clickToNext)
         {
            clickToNext.visible = false;
         }
         ObserverMgr.ins.sendNotice("msg_ng_talk_cpl");
      }
      
      private function showTalk() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         if(_talkArr.length > 0)
         {
            _loc2_ = _talkArr.shift();
            this.box_txt.visible = true;
            this.txt_content.text = LocaleMgr.ins.getStr(_loc2_);
            _loc3_ = UrlLib.newerGuideSpeakUrl(_loc2_);
            SoundMgr.ins.clearTexiao(_lastTexiaoSoundUrl);
            _lastTexiaoSoundUrl = _loc3_;
            SoundMgr.ins.playTexiaoSound(_loc3_);
            _loc1_ = this.txt_content.textWidth + 4;
            _loc4_ = this.txt_content.textHeight + 0;
            this.box_txt.width = Math.max(165,_loc1_ + txt_oriX * 2);
            this.box_txt.height = Math.max(64,_loc4_ + txt_oriY * 2);
            this.txt_bg.width = this.box_txt.width;
            this.txt_bg.height = this.box_txt.height;
            this.txt_content.x = (this.box_txt.width - _loc1_) / 2;
            this.txt_content.y = (this.box_txt.height - _loc4_) / 2;
            this.rim.mouseEnabled = false;
            if(clickToNext != null && clickToNext.visible)
            {
               this.clickToNext.x = this.box_txt.x + this.box_txt.width / 2 - this.clickToNext.width / 2;
               this.clickToNext.y = this.box_txt.y + this.box_txt.height - 50;
               this.txt_bg.height = this.box_txt.height + 30;
            }
         }
      }
      
      private function moveDcToParent(param1:DisplayObjectContainer) : void
      {
         if(this.parent == param1 || param1 == null)
         {
            return;
         }
         var _loc3_:DisplayObjectContainer = this.parent || this.newerGuideModule;
         var _loc2_:Point = DisplayUtils.localToTarget(_loc3_,param1,new Point(this.x,this.y));
         param1.addChild(this);
         this.x = _loc2_.x;
         this.y = _loc2_.y;
      }
      
      private function parseTalkArr(param1:StcGuideVo) : void
      {
         _talkArr = [];
         if(_lastParsedId != param1.id)
         {
            _lastParsedId = param1.id;
            if(param1.talk.indexOf("|") != -1)
            {
               _talkArr = param1.talk.split("|");
            }
            else
            {
               _talkArr.push(param1.talk);
            }
         }
      }
      
      override public function dispose() : void
      {
      }
      
      public function disposeHandler() : void
      {
         NGUtil.setNotShow();
         FloatBubbleUtil.showOrHideBubble(true,true);
      }
   }
}
