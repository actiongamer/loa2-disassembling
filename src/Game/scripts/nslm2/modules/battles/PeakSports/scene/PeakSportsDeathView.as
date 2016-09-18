package nslm2.modules.battles.PeakSports.scene
{
   import game.ui.peakSports.peakSportsScene.panel.PeakSportsDeathViewUI;
   import nslm2.common.ui.components.comps2d.TextCDCtrl;
   import flash.events.Event;
   import com.greensock.TimelineLite;
   import morn.core.components.Image;
   import flash.display.DisplayObjectContainer;
   import com.greensock.easing.BounceOut;
   import com.greensock.easing.Quad;
   import com.greensock.easing.Linear;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import com.greensock.TweenLite;
   
   public class PeakSportsDeathView extends PeakSportsDeathViewUI
   {
       
      
      private var _textCDCtrl:TextCDCtrl;
      
      public function PeakSportsDeathView()
      {
         super();
         init();
         this.addEventListener("addedToStage",addToStage);
         this.addEventListener("removedFromStage",removeFromStage);
      }
      
      private function init() : void
      {
         resizeHandle(null);
         this.light1.mask = lightMask1;
         this.light2.mask = lightMask2;
         reset();
      }
      
      protected function addToStage(param1:Event) : void
      {
         event = param1;
         App.stage.addEventListener("resize",resizeHandle);
         reset();
         var timeLineLite:TimelineLite = new TimelineLite();
         timeLineLite.to(triangle,0.3,{
            "alpha":1,
            "onUpdate":function():*
            {
               var /*UnknownSlot*/:* = function(param1:Image, param2:DisplayObjectContainer):void
               {
                  param1.x = param2.width - param1.width >> 1;
               };
               return function(param1:Image, param2:DisplayObjectContainer):void
               {
                  param1.x = param2.width - param1.width >> 1;
               };
            }(),
            "onUpdateParams":[triangle,this],
            "ease":BounceOut.ease
         });
         var timeLineLite1:TimelineLite = new TimelineLite();
         timeLineLite1.to(leftBar,0.5,{
            "x":-13,
            "alpha":1,
            "ease":BounceOut.ease
         });
         timeLineLite1.to(lightMask1,0.2,{
            "y":light1.y,
            "ease":Quad.easeInOut
         });
         timeLineLite1.to(lightMask2,0.1,{
            "y":light2.y,
            "ease":Quad.easeInOut
         });
         timeLineLite1.to(titleTxt,0.5,{
            "scale":1,
            "height":82,
            "y":206,
            "alpha":1,
            "ease":BounceOut.ease
         });
         timeLineLite1.call(function():*
         {
            var /*UnknownSlot*/:* = function():void
            {
               if(_textCDCtrl)
               {
                  _textCDCtrl.stop();
                  _textCDCtrl.dispose();
                  _textCDCtrl = null;
               }
               _textCDCtrl = new TextCDCtrl(timeTxt,textCDFormat,textCDCpl);
               _textCDCtrl.start(8);
            };
            return function():void
            {
               if(_textCDCtrl)
               {
                  _textCDCtrl.stop();
                  _textCDCtrl.dispose();
                  _textCDCtrl = null;
               }
               _textCDCtrl = new TextCDCtrl(timeTxt,textCDFormat,textCDCpl);
               _textCDCtrl.start(8);
            };
         }());
         timeLineLite1.to(timeTxt,0.2,{
            "alpha":1,
            "ease":Linear.ease
         });
         var timeLineLite2:TimelineLite = new TimelineLite();
         timeLineLite2.to(rightBar,0.5,{
            "x":599,
            "alpha":1,
            "ease":BounceOut.ease
         });
      }
      
      protected function resizeHandle(param1:Event) : void
      {
         maskImage.width = App.stage.width;
         maskImage.height = App.stage.height;
         maskImage.x = this.width - maskImage.width >> 1;
         maskImage.y = this.height - maskImage.height >> 1;
         itemBox.x = this.width - itemBox.width >> 1;
         itemBox.y = this.height - itemBox.height >> 1;
      }
      
      protected function removeFromStage(param1:Event) : void
      {
         App.stage.removeEventListener("resize",resizeHandle);
      }
      
      private function textCDFormat(param1:int) : String
      {
         param1 = param1 < 0?0:param1;
         return LocaleMgr.ins.getStr(999600041) + TimeUtils.hisColonAddZero2(param1);
      }
      
      private function textCDCpl() : void
      {
         outEffect();
      }
      
      public function outEffect() : void
      {
         if(_textCDCtrl)
         {
            _textCDCtrl.stop();
            _textCDCtrl.dispose();
            _textCDCtrl = null;
         }
         TweenLite.to(triangle,0.3,{
            "alpha":0,
            "ease":Linear.ease
         });
         TweenLite.to(lightMask1,0.1,{
            "y":light1.y - light1.height,
            "ease":Quad.easeInOut
         });
         TweenLite.to(lightMask2,0.1,{
            "y":light2.y - light2.height,
            "ease":Quad.easeInOut
         });
         TweenLite.to(titleTxt,0.3,{
            "alpha":0,
            "ease":BounceOut.ease
         });
         TweenLite.to(timeTxt,0.3,{
            "alpha":0,
            "ease":Linear.ease
         });
         var timeLineLite1:TimelineLite = new TimelineLite();
         timeLineLite1.to(leftBar,0.5,{
            "x":-13 - leftBar.width,
            "alpha":0,
            "ease":Linear.ease
         });
         var timeLineLite2:TimelineLite = new TimelineLite();
         timeLineLite2.to(rightBar,0.5,{
            "x":599 + rightBar.width,
            "alpha":0,
            "ease":Linear.ease
         });
         timeLineLite2.call(function():*
         {
            var /*UnknownSlot*/:* = function(param1:DisplayObjectContainer):void
            {
               if(param1 && param1.parent)
               {
                  param1.parent.removeChild(param1);
               }
            };
            return function(param1:DisplayObjectContainer):void
            {
               if(param1 && param1.parent)
               {
                  param1.parent.removeChild(param1);
               }
            };
         }(),[this]);
      }
      
      private function reset() : void
      {
         triangle.alpha = 0;
         lightMask1.y = light1.y - light1.height;
         lightMask2.y = light2.y - light2.height;
         titleTxt.scale = 1.3;
         titleTxt.height = 100;
         titleTxt.y = 190;
         titleTxt.alpha = 0;
         leftBar.alpha = 0;
         leftBar.x = -13 - leftBar.width;
         rightBar.alpha = 0;
         rightBar.x = 599 + rightBar.width;
         timeTxt.alpha = 0;
      }
   }
}
