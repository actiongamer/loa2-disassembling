package nslm2.modules.battles.battle
{
   import game.ui.fightPlayers.FightStar2UI;
   import morn.core.components.Component;
   import com.greensock.TimelineLite;
   import com.mz.core.mgrs.UIMgr;
   import flash.display.DisplayObjectContainer;
   import morn.customs.components.FadeView;
   
   public class FightStartEff2 extends FightStar2UI
   {
       
      
      private var _compFunc:Function;
      
      private var _head:Component;
      
      public function FightStartEff2(param1:Function, param2:Component)
      {
         super();
         _compFunc = param1;
         _head = param2;
      }
      
      public function go() : void
      {
         this.img_starCon.visible = false;
         var _loc1_:TimelineLite = new TimelineLite();
         var _loc2_:* = 0.2;
         _loc1_.call(_star,null,_loc2_);
         _loc1_.from(this.img_star,0.2,{
            "scaleX":1.5,
            "scaleY":1.5
         },_loc2_);
         _loc1_.to(this.img_starC,0.3,{
            "scaleX":3,
            "scaleY":3,
            "alpha":0
         },_loc2_ + 0.2);
         _loc1_.call(over,null,"+=.1");
      }
      
      private function _star() : void
      {
         this.commitMeasure();
         var _loc1_:DisplayObjectContainer = UIMgr.layer2D;
         _loc1_.addChild(this);
         img_ready.visible = false;
         img_readyC.visible = false;
         img_bg.visible = false;
         this.img_star.visible = true;
         img_starCon.visible = true;
      }
      
      private function invisibleReady() : void
      {
         this.img_readyCon.visible = false;
      }
      
      private function over() : void
      {
         var _loc1_:* = undefined;
         if(this.isDisposed)
         {
            return;
         }
         if(_head && _head.isDisposed == false)
         {
            _loc1_ = _head.parent.parent;
            if(_loc1_.visible == false)
            {
               _loc1_.visible = true;
               if(_loc1_ is FadeView)
               {
                  _loc1_.fadeIn(0.2,40300);
               }
            }
         }
         if(_compFunc is Function)
         {
            _compFunc();
         }
         this.dispose();
      }
   }
}
